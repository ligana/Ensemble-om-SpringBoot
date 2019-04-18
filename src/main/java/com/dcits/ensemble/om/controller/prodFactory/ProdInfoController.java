package com.dcits.ensemble.om.controller.prodFactory;

import com.dcits.ensemble.om.controller.model.Result;
import com.dcits.ensemble.om.controller.model.ResultUtils;
import com.dcits.ensemble.om.model.dbmodel.*;
import com.dcits.ensemble.om.model.dbmodel.tables.IrlProdInt;
import com.dcits.ensemble.om.model.dbmodel.tables.OmTableList;
import com.dcits.ensemble.om.model.dbmodel.MbAttrType;
import com.dcits.ensemble.om.model.prodFactory.MbProdInfo;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessDetailHistRepository;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessRecordHistRepository;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessMainFlowRepository;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessRelationHistRepository;
import com.dcits.ensemble.om.repository.prodFactory.MbAttrTypeRepository;
import com.dcits.ensemble.om.repository.prodFactory.MbEventClassRepository;
import com.dcits.ensemble.om.repository.tables.OmTableListRepository;
import com.dcits.ensemble.om.service.paraFlow.DifferenceProdInfo;
import com.dcits.ensemble.om.service.paraFlow.FlowManagement;
import com.dcits.ensemble.om.service.prodFactory.MbAttrInfoService;
import com.dcits.ensemble.om.service.prodFactory.MbProdInfoService;
import io.swagger.annotations.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.lang.Integer.parseInt;

@Api(value = "/getProdInfo", tags = "产品模块")
@Controller
public class ProdInfoController {
    @Resource
    private MbAttrTypeRepository mbAttrTypeRepository;
    @Resource
    private MbProdInfoService mbProdInfoService;
    @Resource
    private FlowManagement flowManagement;
    @Resource
    private OmProcessMainFlowRepository omProcessMainFlowRepository;
    @Resource
    private OmProcessRelationHistRepository omProcessRelationHistRepository;
    @Resource
    private OmProcessRecordHistRepository omProcessRecordHistRepository;
    @Resource
    private OmProcessDetailHistRepository omProcessDetailHistRepository;
    @Resource
    private OmTableListRepository omTableListRepository;
    @Resource
    private DifferenceProdInfo differenceProdInfo;
    @Resource
    private MbAttrInfoService mbAttrInfoService;
    @Resource
    private MbEventClassRepository mbEventClassRepository;
    @ApiOperation(value = "产品信息", notes = "获取产品明细")
    @RequestMapping("/getProdInfo")
    @ResponseBody
    public Result getProdInfo(HttpServletResponse response, @RequestParam(value = "prodType", required = false) String prodType) {
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        if(prodType==null){
            return ResultUtils.success();
        }
        MbProdInfo mbProdInfo = mbProdInfoService.getProdInfo(prodType);
        OmProcessMainFlow omProcessMainFlow = omProcessMainFlowRepository.findByTranId("MbProdType");

        List<IrlProdInt> irlProdInt = mbProdInfo.getIrlProdInt();
        if(irlProdInt != null){
            for(IrlProdInt irl : irlProdInt){
                if(irl.getMinRate() != null){
                    if(irl.getMinRate().equals("0E-8")){
                        irl.setMinRate("0.00000000");
                    }
                }
            }
        }
        //从产品参数表查询参数范围
        mbProdInfoService.assembleColumnInfo(mbProdInfo);
        return ResultUtils.success(mbProdInfo);
    }

    /**
     * @deprecated 保存时 以用户为维度 获取改用户所有未处理的流程信息List<OmProcessMainFlow>
     *     判断是否存在保存未提交  驳回未提交的流程
     *     存在： 不发起新的流程 不申请新的单号  新操作更新relation表即可
     *     不存在：发起新的流程  申请新的单号  新单号拥有全流程生命周期
     *     status: 1-保存  2-提交 3-复核 4-发布 6-驳回
     *     dispose: Y-表示该流程已经结束  N-标识该流程在途
     */
    @RequestMapping("/saveProdInfo")
    @ResponseBody
    public Result saveProdInfo(HttpServletResponse response, @RequestBody Map map) {
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        String userName = (String) map.get("userName");
        String seqNo = "";
        String option = (String) map.get("option"); 
        //以用户为维护  获取该用户所有在途流程
        List<OmProcessMainFlow> omProcessMainFlowList = omProcessMainFlowRepository.findByUserIdAndDispose(userName, "N");
        /**获取当前用户所有在途流程  存在“1-保存未提交 || 6-驳回未提交” 的流程时 就以此为主单号  更新relation表
          *如果遍历结束  所有流程均已经提交||没有流程时候 重新发起新的流程
         */
        Boolean flag = false;
        for(OmProcessMainFlow omProcessMainFlow:omProcessMainFlowList){
            if("1".equals(omProcessMainFlow.getStatus()) || "6".equals(omProcessMainFlow.getStatus())){
                seqNo = omProcessMainFlow.getMainSeqNo();
                //判断其前状态，如果为作废则更新批次号并且记录新的操作信息
                if("6".equals(omProcessMainFlow.getStatus())) {
                    flowManagement.onlyUpdateDel(omProcessMainFlow,userName);
                }
                flag = true;
                break;
            }
        }
        if(!flag){
            //不存在待提交的流程  此时发起新的流程
            seqNo = flowManagement.appNoByTable(userName, "MB_PROD_TYPE", "Y","1");
        }

        //记录操作流程
        //有单号，1.获取操作信息（操作序号） 2.组合表中生成新的子单号 3.将子单号信息存入差异信息表
        differenceProdInfo.insertProdDifferenceInfo(map, seqNo);
        Map responseMap = new HashMap<>();
        responseMap.put("mainSeqNo",seqNo);
        return ResultUtils.success(responseMap);
    }
    /**
     * 复核，发布流程处理
     * 通过界面传递的optType(操作类型)3:复核  4:发布
     **/
    @RequestMapping("/tranFlowInfo")
    @ResponseBody
    public Result tranFlowInfo(HttpServletResponse response, @RequestBody Map map) {
        String mainSeqNo = (String)map.get("mainSeqNo");
        String userId = (String)map.get("userId");
        String remark = (String)map.get("remark");
        String isApproved = (String)map.get("isApproved");
       String optType= (String) map.get("optType");

        //只需变更流程信息，登记流程的变动
       flowManagement.updateFlowOnly(mainSeqNo, userId, remark, isApproved, optType);
        return ResultUtils.success();
    }
    /**
     * 界面修改列的位置
     */
    @RequestMapping("/saveColumn")
    @ResponseBody
    public Result saveColumn(HttpServletResponse response, @RequestBody Map map) {
        List<Map> columnList=(List)map.get("column");
        String prodType=(String)map.get("prodType");
        String tags=(String)map.get("tags");
        //判断修改是否为事件修改
        MbEventClass mbEventClass= mbEventClassRepository.findByEventClass(tags);
        if(mbEventClass==null) {
            for (Map column : columnList) {
                mbProdInfoService.updateColumn(column, prodType);
            }
        }else{
            for (Map column : columnList) {
                mbProdInfoService.updateColumnEvent(column, tags+"_"+prodType);
            }
        }
        return ResultUtils.success();
    }
    /**
     * 查询影响子产品的列表
     */
    @RequestMapping("/findChildProd")
    @ResponseBody
    public Result findChildProd(HttpServletResponse response, @RequestBody Map map) {
        String prodType=(String) map.get("prodType");
        String attrValue=(String) map.get("attrValue");
        String attrType=(String) map.get("attrType");
        List responseList= mbProdInfoService.findChildDiffInfo(prodType, attrValue,attrType);
        return ResultUtils.success(responseList);
    }
    /**
     * 获取所有的ATTR参数属性
     */
    @RequestMapping("/getAttrInfo")
    @ResponseBody
    public Result getAttrInfo(HttpServletResponse response) {
        return ResultUtils.success(mbAttrInfoService.getAttrInfo());
    }
    /**
     * 获取某个的ATTR参数的中文描述
     */
    @RequestMapping("/getAttrType")
    @ResponseBody
    public Result getAttrType(HttpServletResponse response) {
        return ResultUtils.success(mbAttrTypeRepository.findAll());
    }
    /**
     * 查询某个产品的历史操作单号，时间，操作人
     */
    @RequestMapping("/findProdHistory")
    @ResponseBody
    public Result findProdHistory(HttpServletResponse response, @RequestParam(value = "tranId", required = true) String tranId) {
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        ArrayList<Map> resMap = new ArrayList<Map>();
        ArrayList<String> seqNos = new ArrayList<String>();
        List<OmProcessRelationHist> omProcessRelations = omProcessRelationHistRepository.findByTranId(tranId);
        for(OmProcessRelationHist omProcessRelation : omProcessRelations){
            String mainSeqNo = omProcessRelation.getMainSeqNo();
            int num = 0;
            if(seqNos.size() != 0){
                for(String seqNo : seqNos){
                    if(mainSeqNo.equals(seqNo)){
                        num++;
                    }
                }
                if(num == 0){
                    seqNos.add(mainSeqNo);
                }
            }else{
                seqNos.add(mainSeqNo);
            }
        }
        for(String seqNo : seqNos){
            Map process = new HashMap<>();
            OmProcessMainFlow omProcessMainFlow = omProcessMainFlowRepository.findByMainSeqNo(seqNo);
            if(parseInt(omProcessMainFlow.getStatus()) == 4){
                process.put("mainSeqNo",seqNo);
                process.put("userId",omProcessMainFlow.getUserId());
                List<OmProcessDetailHist> omProcessDetailHists = omProcessDetailHistRepository.findByMainSeqNo(seqNo);
                for(OmProcessDetailHist omProcessDetailHist : omProcessDetailHists){
                    if(parseInt(omProcessDetailHist.getStatus()) == 4){
                        String time = omProcessDetailHist.getTranTime();
                        process.put("tranTime",time);
                    }
                }
                resMap.add(process);
            }
        }
        responseMap.put("mainSeqNo",resMap);
        return ResultUtils.success(responseMap);
    }
    /**
     * 查询某个产品的某个操作历史差异
     */
    @RequestMapping("/findProdHistoryChange")
    @ResponseBody
    public Result findProdHistoryChange(HttpServletResponse response, @RequestParam(value = "mainSeqNo", required = true) String mainSeqNo) {
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        List<OmProcessRecordHist> omProcessRecordHists = omProcessRecordHistRepository.findByMainSeqNo(mainSeqNo);
        ArrayList<String> tableName = new ArrayList<String>();
        ArrayList<String> pkAndValue = new ArrayList<String>();
        ArrayList<ArrayList<String>> tableNameDesc = new ArrayList<>();
        ArrayList<String[]> dmlData = new ArrayList<>();
        ArrayList<String[]> dmlOldData = new ArrayList<>();
        for(OmProcessRecordHist omProcessRecordHist : omProcessRecordHists){
            tableName.add(omProcessRecordHist.getTableName());
            pkAndValue.add(omProcessRecordHist.getPkAndValue());
            String dml = new String(omProcessRecordHist.getDmlData());
            dml = dml.replace("{","");
            dml = dml.replace("}","");
            dml = dml.replace("\"","");
            String[] dmls = dml.split(",");
            dmlData.add(dmls);
            String dmlOld = new String(omProcessRecordHist.getDmlOldData());
            dmlOld = dmlOld.replace("{","");
            dmlOld = dmlOld.replace("}","");
            dmlOld = dmlOld.replace("\"","");
            String[] dmlOlds = dmlOld.split(",");
            dmlOldData.add(dmlOlds);
        }
        for(String taN : tableName){
            OmTableList omTableList= omTableListRepository.findByTableName(taN);
            ArrayList<String> desc = new ArrayList<>();
            if(omTableList != null){
                desc.add(taN);
                desc.add(omTableList.getTableDesc());
            }
            tableNameDesc.add(desc);
        }
        responseMap.put("tableNameDesc",tableNameDesc);
        responseMap.put("pkAndValue",pkAndValue);
        responseMap.put("dmlData",dmlData);
        responseMap.put("dmlOldData",dmlOldData);
        return ResultUtils.success(responseMap);
    }
}