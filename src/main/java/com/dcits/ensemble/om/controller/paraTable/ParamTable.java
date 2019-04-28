package com.dcits.ensemble.om.controller.paraTable;

import com.dcits.ensemble.om.controller.model.Result;
import com.dcits.ensemble.om.controller.model.ResultUtils;
import com.dcits.ensemble.om.model.dbmodel.OmProcessMainFlow;
import com.dcits.ensemble.om.repository.base.SystemTableRepositoryImpl;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessMainFlowRepository;
import com.dcits.ensemble.om.repository.tables.OmTableListRepository;
import com.dcits.ensemble.om.service.paraFlow.DifferenceTableInfo;
import com.dcits.ensemble.om.service.paraFlow.FlowManagement;
import com.dcits.ensemble.om.service.paraTable.ParamTableService;
import com.dcits.ensemble.om.repository.prodFactory.MbAttrClassRepository;
import com.dcits.ensemble.om.repository.prodFactory.FmCompanyRepository;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(value = "/getParamTable", tags = "单表模块")
@Controller
public class ParamTable {
    @Resource
    private OmProcessMainFlowRepository omProcessMainFlowRepository;
    @Resource
    private FlowManagement flowManagement;
    @Resource
    private DifferenceTableInfo differenceTableInfo;
    @Resource
    private ParamTableService paramTableService;
    @Resource
    private OmTableListRepository omTableListRepository;
    @Resource
    private MbAttrClassRepository mbAttrClassRepository;
    @Resource
    private FmCompanyRepository fmCompanyRepository;
    @Resource
    private SystemTableRepositoryImpl systemTableRepositoryImpl;
    @ApiOperation(value = "单表信息", notes = "获取单表信息")
    @RequestMapping("/getTableInfo")
    @ResponseBody
    public Result getTableInfo(HttpServletResponse response, @RequestParam(value = "tableName", required = true) String tableName) {
        //Map map = requestBean.getBody();
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        //1.根据表名获取参数列信息
        responseMap.put("columnTwo",paramTableService.getTableColumnTwo(tableName));
        responseMap.put("columnHeard",paramTableService.getTableColumnHeard(tableName));
        responseMap.put("column",paramTableService.getTableColumn(tableName));
        responseMap.put("columnInfo",paramTableService.getTableInfo(tableName));
        //2.根据参数列信息及表名差数据库获取数据信息
        //3.将得到的信息分为两个对象集合传到前端
        //获取表定义信息
        responseMap.put("tableDesc",paramTableService.getTableDesc(tableName));
        //4.根据表名获取该表的检索条件
        responseMap.put("search",omTableListRepository.findByTableName(tableName));
        return ResultUtils.success(responseMap);
    }
    @RequestMapping("/getTableInfoDesc")
    @ResponseBody
    public Result getTableInfoDesc (HttpServletResponse response, @RequestParam(value = "tableName", required = true) String tableName) {
        //Map map = requestBean.getBody();
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        //获取表定义信息
       responseMap.put("tableDesc",paramTableService.getTableDesc(tableName));
        return ResultUtils.success(responseMap);
    }
    /**
     * 保存、
     * 单表的保存操作
     *
     * @param response
     */
    @RequestMapping("/saveTable")
    @ResponseBody
    public Result saveTable(HttpServletResponse response, @RequestBody Map map) {
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        String userName = (String) map.get("userName");
        String tableName= (String) map.get("tableName");
        String tableDesc= (String) map.get("tableDesc");
        List list= (List) map.get("data");
        String seqNo = "";
        Boolean flag = false;
        String option = (String) map.get("option");
        //根据option设置交易状态  保存1 提交2
        List<OmProcessMainFlow> omProcessMainFlowList = omProcessMainFlowRepository.findByUserIdAndDispose(userName, "N");
        //无单号，1.申请单号 2.新增记录差异信息 3.根据操作类型更新交易状态
        for(OmProcessMainFlow omProcessMainFlow:omProcessMainFlowList){
            //存在保存未提交  驳回未提交的时候  不重新生成单号
            if("1".equals(omProcessMainFlow.getStatus()) || "6".equals(omProcessMainFlow.getStatus())){
                seqNo = omProcessMainFlow.getMainSeqNo();
                if("6".equals(omProcessMainFlow.getStatus())) {
                    flowManagement.onlyUpdateDel(omProcessMainFlow,userName);
                }
                flag = true;
                break;
            }
        }
        if(!flag){
            //不存在待提交的流程时候  重新申请新的单号
            seqNo = flowManagement.appNoByTable(userName, tableName, "Y","1");
        }
        //记录操作流程
        //有单号，1.获取操作信息（操作序号） 2.组合表中生成新的子单号 3.将子单号信息存入差异信息表
        differenceTableInfo.insertTableDifferenceInfo(list, seqNo,tableName,tableDesc,"1");
        return ResultUtils.success();
    }

    //获取元数据需要的参数分类和法人代码
    @RequestMapping("/getTableColumnInfo")
    @ResponseBody
    public Result getTableColumnInfo (HttpServletResponse response) {
        //Map map = requestBean.getBody();
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        responseMap.put("mbAttrClass",mbAttrClassRepository.findAll());
        responseMap.put("fmCompany",fmCompanyRepository.findAll());
        return ResultUtils.success(responseMap);
    }

    @RequestMapping("/saveParam")
    @ResponseBody
    public Result saveParam(HttpServletResponse response, @RequestBody Map map) {
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        String operate = (String) map.get("operate");
        Map mbAttrType = (Map) map.get("mbAttrType");
        //新增数据
        if(operate.equals("add")){
            List<Map> mbAttrValueAdd = (List) map.get("mbAttrValueAdd");
            //attrType表
            systemTableRepositoryImpl.insertTable("MB_ATTR_TYPE", mbAttrType);
            //attrValue表
            if(mbAttrValueAdd.size() != 0){
                for(Map attrValue : mbAttrValueAdd){
                    systemTableRepositoryImpl.insertTable("MB_ATTR_VALUE", attrValue);
                }
            }
        }
        //更新数据
        if(operate.equals("update")){
            //attrType
            JSONObject pkAttr = new JSONObject();
            pkAttr.put("ATTR_KEY", mbAttrType.get("attrKey"));
            systemTableRepositoryImpl.updateTable("MB_ATTR_TYPE", mbAttrType, pkAttr);
            //attrValue
            if(mbAttrType.get("valueMethod").equals("RF")){
                Map mbAttrValueUpdate = (Map) map.get("mbAttrValueUpdate");
                JSONObject pkValue = new JSONObject();
                pkValue.put("ATTR_KEY", mbAttrValueUpdate.get("attrKey"));
                pkValue.put("ATTR_VALUE", mbAttrValueUpdate.get("attrValue"));
                systemTableRepositoryImpl.updateTable("MB_ATTR_Value", mbAttrValueUpdate, pkValue);
            }
            if(mbAttrType.get("valueMethod").equals("VL")){
                Map mbAttrValueUpdate = (Map) map.get("mbAttrValueUpdate");
                List<Map> valueAdd = (List) mbAttrValueUpdate.get("mbAttrValueAdd");
                List<Map> valueUpdate = (List) mbAttrValueUpdate.get("mbAttrValueUpdate");
                List<Map> valueDelete = (List) mbAttrValueUpdate.get("mbAttrValueDelete");
                if(valueAdd.size() != 0){
                    for(Map attrValue : valueAdd){
                        systemTableRepositoryImpl.insertTable("MB_ATTR_VALUE", attrValue);
                    }
                }
                if(valueUpdate.size() != 0){
                    for(Map attrValue : valueUpdate){
                        JSONObject pkValue = new JSONObject();
                        pkValue.put("ATTR_KEY", attrValue.get("attrKey"));
                        pkValue.put("ATTR_VALUE", attrValue.get("attrValue"));
                        systemTableRepositoryImpl.updateTable("MB_ATTR_VALUE", attrValue, pkValue);
                    }
                }
                if(valueDelete.size() != 0){
                    for(Map attrValue : valueDelete){
                        JSONObject pkValue = new JSONObject();
                        pkValue.put("ATTR_KEY", attrValue.get("attrKey"));
                        pkValue.put("ATTR_VALUE", attrValue.get("attrValue"));
                        systemTableRepositoryImpl.deleteTable("MB_ATTR_VALUE", attrValue, pkValue);
                    }
                }
            }
        }
        //删除数据
        if(operate.equals("delete")){
            List<Map> mbAttrValueDelete = (List) map.get("mbAttrValueDelete");
            JSONObject pkAttr = new JSONObject();
            //attrType表
            pkAttr.put("ATTR_KEY", mbAttrType.get("attrKey"));
            systemTableRepositoryImpl.deleteTable("MB_ATTR_TYPE", mbAttrType, pkAttr);
            //attrValue表
            if(mbAttrValueDelete.size() != 0){
                for(Map attrValue : mbAttrValueDelete){
                    JSONObject pkValue = new JSONObject();
                    pkValue.put("ATTR_KEY", attrValue.get("attrKey"));
                    pkValue.put("ATTR_VALUE", attrValue.get("attrValue"));
                    systemTableRepositoryImpl.deleteTable("MB_ATTR_VALUE", attrValue, pkAttr);
                }
            }
        }

        return ResultUtils.success();
    }
}