package com.dcits.ensemble.om.controller.prodFactory;

import com.dcits.ensemble.om.controller.model.Result;
import com.dcits.ensemble.om.controller.model.ResultUtils;
import com.dcits.ensemble.om.model.dbmodel.*;
import com.dcits.ensemble.om.model.prodFactory.MbProdInfo;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessMainFlowRepository;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessRecordHistRepository;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessRelationHistRepository;
import com.dcits.ensemble.om.repository.prodFactory.MbProdDefineRepository;
import com.dcits.ensemble.om.repository.prodFactory.MbProdTypeRepository;
import com.dcits.ensemble.om.service.paraFlow.ParaDifferenceManagement;
import com.dcits.ensemble.om.service.prodFactory.MbProdInfoService;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProdDiffController {

    @Resource
    private MbProdInfoService mbProdInfoService;
    @Resource
    private OmProcessRecordHistRepository omProcessRecordHistRepository;
    @Resource
    private MbProdTypeRepository mbProdTypeRepository;
    @Resource
    private ParaDifferenceManagement paraDifferenceManagement;
    @Resource
    private OmProcessMainFlowRepository omProcessMainFlowRepository;
    @Resource
    private OmProcessRelationHistRepository omProcessRelationHistRepository;
    @Resource
    MbProdDefineRepository mbProdDefineRepository;
    @RequestMapping("/getProdDiff")
    public
    @ResponseBody Result getProdDiff(HttpServletResponse response, @RequestBody Map map) {
        //Map map = requestBean.getBody();
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        String mainSeqNo = (String)map.get("mainSeqNo");

        Map omProcessRecordHistList = paraDifferenceManagement.getDiffByMainSeqNo(mainSeqNo);
        String prodType = (String)omProcessRecordHistList.get("prodType");
        MbProdInfo mbProdInfo = mbProdInfoService.getProdInfo(prodType);

        //基础产品时候  获取基础产品影响的产品
        MbProdType mbProdType = mbProdTypeRepository.findByProdType(prodType);
        if(mbProdType != null) {
            String isBase = mbProdTypeRepository.findByProdType(prodType).getProdRange();
            HashMap resMap = new HashMap();
            if ("B".equals(isBase)) {
                HashMap baseEffectProd = new HashMap();
                OmProcessMainFlow omProcessMainFlow = omProcessMainFlowRepository.findByMainSeqNo(mainSeqNo);
                List<OmProcessRelationHist> omProcessRelationHistList = omProcessRelationHistRepository.findByMainSeqNoAndDtlSeqNo(mainSeqNo, omProcessMainFlow.getDtlSeqNo().toString());
                for (OmProcessRelationHist omProcessRelationHist : omProcessRelationHistList) {
                    List<OmProcessRecordHist> omProcessRecordHists = omProcessRecordHistRepository.findByRecSeqNo(omProcessRelationHist.getRecSeqNo());
                    for (OmProcessRecordHist omProcessRecordHist : omProcessRecordHists) {
                        //获取受影响产品类型
                        JSONObject pkValueJson = JSONObject.fromObject(omProcessRecordHist.getPkAndValue());
                        for (Object key : pkValueJson.keySet()) {
                            if (key.equals("PROD_TYPE")) {
                                baseEffectProd.put(pkValueJson.get(key), pkValueJson.get(key));
                            }
                            if (key.equals("EVENT_TYPE")) {
                                baseEffectProd.put(pkValueJson.get(key).toString().split("_")[1], pkValueJson.get(key).toString().split("_")[1]);
                            }
                        }
                    }
                }
                if (baseEffectProd.size() > 0) {
                    JSONObject pkValueJsonP = JSONObject.fromObject(baseEffectProd);
                    for (Object key : pkValueJsonP.keySet()) {
                        resMap.put(key, mbProdTypeRepository.findByProdType(pkValueJsonP.get(key).toString()));
                    }
                }
            }
            if (resMap.size() > 0) {
                responseMap.put("baseEffectProd", resMap);
            }
            responseMap.put("prodDefine", mbProdInfo.getProdDefines());
            responseMap.put("mbProdCharge", mbProdInfo.getMbProdCharge());
            responseMap.put("mbProdType", mbProdInfo.getProdType());

            //组装事件
            responseMap.put("prodEvent", mbProdInfoService.assembleEvent(mbProdInfo.getMbEventInfos()));
        }
        if (omProcessRecordHistList != null)
            responseMap.put("diff", omProcessRecordHistList);
        responseMap.put("prodType", omProcessRecordHistList.get("prodType"));

        return ResultUtils.success(responseMap);
    }


    //产品发布时，通过交易主单号获取产品所属模块信息
    @RequestMapping("/getModuleByFlowCode")
    @ResponseBody
    public Result getModule(HttpServletResponse response, @RequestParam(value = "code", required = true) String code) {
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        List<OmProcessRecordHist> omProcessRecordHists = omProcessRecordHistRepository.findByMainSeqNo(code);
        String sourceModule = "";
        for(OmProcessRecordHist omProcessRecordHist: omProcessRecordHists){
            //获取差异数据中prodType
            if(omProcessRecordHist.getTableName().equals("MB_PROD_TYPE")){
                String str= null;
                try {
                    str = new String(omProcessRecordHist.getDmlData(),"utf-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                JSONObject newValue = JSONObject.fromObject(str);
                if(newValue.get("sourceModule") != null){
                    sourceModule = newValue.get("sourceModule").toString();
                }
                break;
            }
        }
        responseMap.put("SOURCE_MODULE",sourceModule);
        return ResultUtils.success(responseMap);
    }
}