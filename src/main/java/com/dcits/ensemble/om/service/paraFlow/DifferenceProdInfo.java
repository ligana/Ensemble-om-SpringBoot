package com.dcits.ensemble.om.service.paraFlow;

import com.alibaba.fastjson.JSONObject;
import com.dcits.ensemble.om.model.dbmodel.MbEventAttr;
import com.dcits.ensemble.om.model.dbmodel.MbProdDefine;
import com.dcits.ensemble.om.model.dbmodel.MbProdType;
import com.dcits.ensemble.om.model.dbmodel.OmProcessRecordHist;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessRecordHistRepository;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessDetailHistRepository;
import com.dcits.ensemble.om.repository.prodFactory.MbEventAttrRepository;
import com.dcits.ensemble.om.repository.prodFactory.MbProdDefineRepository;
import com.dcits.ensemble.om.repository.prodFactory.MbProdTypeRepository;
import com.dcits.ensemble.om.util.ResourcesUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by ligan on 2018/8/27.
 */
@Service
public class DifferenceProdInfo {
    @Autowired
    private MbProdTypeRepository mbProdTypeRepository;
    @Resource
    private OmProcessRecordHistRepository omProcessRecordHistRepository;
    @Resource
    private OmProcessDetailHistRepository omProcessDetailHistRepository;
    @Resource
    private ProcessCombManagement processCombManagement;
    @Resource
    private MbProdDefineRepository mbProdDefineRepository;
    @Resource
    private MbEventAttrRepository mbEventAttrRepository;
    private String optionType;
    private String prodType;
    private String prodDesc;
    private String eventType;
    private String eventTypeNo;
    private String eventPartNo;
    private String eventAttrNo;
    //记录产品流程信息
    @Transactional(rollbackFor = Exception.class)
   public void insertProdDifferenceInfo(Map mbProdInfo,String reqNo){
       String operatorNo= omProcessDetailHistRepository.findBySeqNoMax(reqNo)==null?"1": omProcessDetailHistRepository.findBySeqNoMax(reqNo);
       //1判断上送数据是否有修改操作
       //2记录组合表信息（被修改的表）
       //3变更信息以blob形式存入表
          //产品
       this.optionType=(String)mbProdInfo.get("optionType");
       prodTran((Map) mbProdInfo.get("prodType"), reqNo, operatorNo);

       //产品参数
       prodDefineTran(ResourcesUtils.getMap(mbProdInfo.get("prodDefines")), reqNo, operatorNo);
       Map eventInfo=(Map) mbProdInfo.get("mbEventInfos");
       if(eventInfo==null){
           return;
       }
       eventTypeNo=null;
       eventPartNo=null;
       eventAttrNo=null;
       for (Object key : eventInfo.keySet()) {
           Map<String,Map> eventOne=(Map)eventInfo.get(key);
           String eventType=(String)key;
           //如果操作类型为复制则事件名字以新的产品类型为名
           if("I".equals(this.optionType)){
               eventType=  eventType.substring(0,eventType.indexOf("_")+1)+this.prodType;
           }
           this.eventType=eventType;
           eventTypeTran(ResourcesUtils.getMap(eventOne.get("mbEventType")), reqNo, operatorNo);
           eventAttrTran(ResourcesUtils.getMap(eventOne.get("mbEventAttrs")), reqNo, operatorNo);
           eventPartTran(ResourcesUtils.getMap(eventOne.get("mbEventParts")), reqNo, operatorNo);
       }
       //费用信息
       mbProdCharge((List)mbProdInfo.get("mbProdCharge"), reqNo, operatorNo);
       //核算信息
       glProdAccounting((List)mbProdInfo.get("glProdAccounting"), reqNo, operatorNo);
       glProdCodeMapping((List)mbProdInfo.get("glProdCodeMappings"), reqNo, operatorNo);
       //产品映射(0115屏蔽对产品映射处理)
       glProdMapping((List)mbProdInfo.get("glProdMappings"), reqNo, operatorNo);
       irlProdType((List)mbProdInfo.get("irlProdTypes"), reqNo, operatorNo);
       //利率信息
       irlProdInt((List)mbProdInfo.get("irlProdInt"), reqNo, operatorNo);
       irlIntMatrix((List)mbProdInfo.get("irlIntMatrices"), reqNo, operatorNo);
       intBasisRate((List)mbProdInfo.get("irlBasisRateList"), reqNo, operatorNo);
       //产品变更信息
       mbProdAmendMaping((List)mbProdInfo.get("mbProdAmendMaping"), reqNo, operatorNo);
       //组合
        mbProdGroup((List)mbProdInfo.get("mbProdGroup"), reqNo, operatorNo);
       //参数状态
       optionPermTran(mbProdInfo,reqNo,operatorNo);
   }
    //irlIntMatrix
    public void mbProdGroup(List prodMap,String seqNo,String operatorNo){
        String accountingNo=processCombManagement.saveCombInfo(seqNo, operatorNo,this.prodType,this.prodDesc, "0");
        for(Object key:prodMap){
            Map<String,Object> mbProdGroup=(Map)key;
            String operateType=(String)mbProdGroup.get("optType");
            mbProdGroup.put("tableName","MB_PROD_GROUP");
            Map<String, Object> data;
            if("I".equals(operateType)) {
                data = (Map) mbProdGroup.get("newData");
            }else{
                data = (Map) mbProdGroup.get("oldData");
            }
            JSONObject keyValue = new JSONObject();
            keyValue.put("PROD_TYPE",data.get("prodType"));
            keyValue.put("PROD_SUB_TYPE",data.get("prodSubType"));
            saveProdParaDifference(accountingNo, mbProdGroup, keyValue, seqNo);
        }
    }
    //irlIntMatrix
    public void irlIntMatrix(List prodMap,String seqNo,String operatorNo){
        String accountingNo=processCombManagement.saveCombInfo(seqNo, operatorNo,this.prodType,this.prodDesc, "0");
        for(Object key:prodMap){
            Map<String,Object> irlIntMatrix=(Map)key;
            String operateType=(String)irlIntMatrix.get("optType");
            irlIntMatrix.put("tableName","IRL_INT_MATRIX");
            Map<String, Object> data;
            if("I".equals(operateType)) {
                data = (Map) irlIntMatrix.get("newData");
            }else{
                data = (Map) irlIntMatrix.get("oldData");
            }
            JSONObject keyValue = new JSONObject();
            keyValue.put("MATRIX_NO",data.get("matrixNo"));
            saveProdParaDifference(accountingNo, irlIntMatrix, keyValue, seqNo);
        }
    }
    //intBasisRate
    public void intBasisRate(List prodMap,String seqNo,String operatorNo){
        String accountingNo=processCombManagement.saveCombInfo(seqNo, operatorNo,this.prodType,this.prodDesc, "0");;
        for(Object key:prodMap){
            Map<String,Object> intBasisRate=(Map)key;
            String operateType=(String)intBasisRate.get("optType");
            intBasisRate.put("tableName","IRL_BASIS_RATE");
            Map<String, Object> data;
            if("I".equals(operateType)) {
                data = (Map) intBasisRate.get("newData");
            }else{
                data = (Map) intBasisRate.get("oldData");
            }
            JSONObject keyValue = new JSONObject();
            keyValue.put("INT_BASIS",data.get("intBasis"));
            keyValue.put("CCY",data.get("ccy"));
            keyValue.put("EFFECT_DATE",data.get("effectDate"));
            saveProdParaDifference(accountingNo, intBasisRate, keyValue, seqNo);
        }
    }
    //glProdCodeMapping
    public void glProdCodeMapping(List prodMap,String seqNo,String operatorNo){
        String accountingNo=processCombManagement.saveCombInfo(seqNo, operatorNo,this.prodType,this.prodDesc, "0");;
        for(Object key:prodMap){
            Map<String,Object> glProdCodeMapping=(Map)key;
            String operateType=(String)glProdCodeMapping.get("optType");
            glProdCodeMapping.put("tableName","GL_PROD_CODE_MAPPING");
            Map<String, Object> data;
            if("I".equals(operateType)) {
                data = (Map) glProdCodeMapping.get("newData");
            }else{
                data = (Map) glProdCodeMapping.get("oldData");
            }
            JSONObject keyValue = new JSONObject();
            keyValue.put("PROD_TYPE",data.get("prodType"));
            keyValue.put("STATUS",data.get("status"));
            keyValue.put("AMT_TYPE",data.get("amtType"));
            saveProdParaDifference(accountingNo, glProdCodeMapping, keyValue, seqNo);
        }
    }
    //IrlProdInt
    public void mbProdAmendMaping(List prodMap,String seqNo,String operatorNo){
        String accountingNo=processCombManagement.saveCombInfo(seqNo, operatorNo,this.prodType,this.prodDesc, "0");;
        for(Object key:prodMap){
            Map<String,Object> mbProdAmendMaping=(Map)key;
            String operateType=(String)mbProdAmendMaping.get("optType");
            mbProdAmendMaping.put("tableName","MB_PROD_AMEND_MAPING");
            Map<String, Object> data;
            if("I".equals(operateType)) {
                data = (Map) mbProdAmendMaping.get("newData");
            }else{
                data = (Map) mbProdAmendMaping.get("oldData");
            }
            JSONObject keyValue = new JSONObject();
            keyValue.put("PROD_TYPE",data.get("prodType"));
            saveProdParaDifference(accountingNo, mbProdAmendMaping, keyValue, seqNo);
        }
    }
    //IrlProdInt
    public void irlProdInt(List prodMap,String seqNo,String operatorNo){
        String accountingNo=processCombManagement.saveCombInfo(seqNo, operatorNo,this.prodType,this.prodDesc, "0");;
        for(Object key:prodMap){
            Map<String,Object> irlProdInt=(Map)key;
            String operateType=(String)irlProdInt.get("optType");
            irlProdInt.put("tableName","IRL_PROD_INT");
            Map<String, Object> data;
            if("I".equals(operateType)) {
                data = (Map) irlProdInt.get("newData");
            }else{
                data = (Map) irlProdInt.get("oldData");
            }
            JSONObject keyValue = new JSONObject();
            keyValue.put("PROD_TYPE",data.get("prodType"));
            keyValue.put("EVENT_TYPE",data.get("eventType"));
            keyValue.put("INT_CLASS",data.get("intClass"));
            keyValue.put("SPLIT_ID",data.get("splitId"));
            keyValue.put("RULEID",data.get("ruleid"));
            saveProdParaDifference(accountingNo, irlProdInt, keyValue, seqNo);
        }
    }
    public void irlProdType(List prodMap,String seqNo,String operatorNo){
        String accountingNo=processCombManagement.saveCombInfo(seqNo, operatorNo,this.prodType,this.prodDesc, "0");;
        for(Object key:prodMap){
            Map<String,Object> irlProdType=(Map)key;
            String operateType=(String)irlProdType.get("optType");
            irlProdType.put("tableName","IRL_PROD_TYPE");
            Map<String, Object> data;
            if("I".equals(operateType)) {
                data = (Map) irlProdType.get("newData");
            }else{
                data = (Map) irlProdType.get("oldData");
            }
            JSONObject keyValue = new JSONObject();
            keyValue.put("PROD_TYPE",data.get("prodType"));
            saveProdParaDifference(accountingNo, irlProdType, keyValue, seqNo);
        }
    }

    //glProdMapping
    public void glProdMapping(List prodMap,String seqNo,String operatorNo){
        String accountingNo=processCombManagement.saveCombInfo(seqNo, operatorNo,this.prodType,this.prodDesc, "0");;
        for(Object key:prodMap){
            Map<String,Object> mapping=(Map)key;
            String operateType=(String)mapping.get("optType");
            mapping.put("tableName","GL_PROD_MAPPING");
            Map<String, Object> data;
            if("I".equals(operateType)) {
                data = (Map) mapping.get("newData");
            }else{
                data = (Map) mapping.get("oldData");
            }
            JSONObject keyValue = new JSONObject();
            keyValue.put("MAPPING_TYPE",data.get("mappingType"));
            keyValue.put("PROD_TYPE",data.get("prodType"));
            saveProdParaDifference(accountingNo, mapping, keyValue, seqNo);
        }
    }

   //GlProdAccounting
    public void glProdAccounting(List prodMap,String seqNo,String operatorNo){
        String accountingNo=processCombManagement.saveCombInfo(seqNo, operatorNo,this.prodType,this.prodDesc, "0");;
        for(Object key:prodMap){
            Map<String,Object> accounting=(Map)key;
            String operateType=(String)accounting.get("optType");
            accounting.put("tableName","GL_PROD_ACCOUNTING");
            Map<String, Object> data;
            if("I".equals(operateType)) {
                data = (Map) accounting.get("newData");
            }else{
                data = (Map) accounting.get("oldData");
            }
            JSONObject keyValue = new JSONObject();
            keyValue.put("PROD_TYPE",this.prodType);
            keyValue.put("ACCOUNTING_STATUS",data.get("accountingStatus"));
            saveProdParaDifference(accountingNo, accounting, keyValue, seqNo);
        }
    }

    //mbProdCharge
    public void mbProdCharge(List prodMap,String seqNo,String operatorNo){
        String accountingNo=processCombManagement.saveCombInfo(seqNo, operatorNo,this.prodType,this.prodDesc, "0");;
        for(Object key:prodMap){
            Map<String,Object> charge=(Map)key;
            String operateType=(String)charge.get("optType");
            charge.put("tableName","MB_PROD_CHARGE");
            Map<String, Object> data;
            if("I".equals(operateType)) {
                data = (Map) charge.get("newData");
            }else{
                data = (Map) charge.get("oldData");
            }
            JSONObject keyValue = new JSONObject();
            keyValue.put("PROD_TYPE",this.prodType);
            keyValue.put("FEE_TYPE",data.get("feeType"));
            saveProdParaDifference(accountingNo, charge, keyValue, seqNo);
        }
    }
    //事件指标
    public void eventPartTran(Map prodMap,String seqNo,String operatorNo){
            if(prodMap.size()>0) {
                //记录组合
                this.eventPartNo = this.eventPartNo==null?processCombManagement.saveCombInfo(seqNo, operatorNo,this.prodType,this.prodDesc, "0"):this.eventPartNo;
                JSONObject keyValue = new JSONObject();
                keyValue.put("EVENT_TYPE", this.eventType);
                for(Object key:prodMap.keySet()) {
                    Map<String, Object> eventOne = (Map) prodMap.get(key);
                    keyValue.put("ASSEMBLE_ID", key);
                        for(Object keyAttr:eventOne.keySet()) {

                            Map<String, Object> eventAttr = (Map) eventOne.get(keyAttr);
                            eventAttr.put("tableName", "MB_EVENT_PART");
                            eventAttr.put("optType", this.optionType);
                            Map<String,Object> newData=(Map)eventAttr.get("newData");
                            keyValue.put("ATTR_KEY", keyAttr);
                            saveProdParaDifference(this.eventPartNo, eventAttr, keyValue, seqNo);
                        }
                    }
        }
    }
    //事件参数
    public void eventAttrTran(Map prodMap,String seqNo,String operatorNo){
            if(prodMap.size()>0) {
                //记录组合
                this.eventAttrNo = this.eventAttrNo==null?processCombManagement.saveCombInfo(seqNo, operatorNo,this.prodType,this.prodDesc, "0"):this.eventAttrNo;
                JSONObject keyValue = new JSONObject();
                keyValue.put("EVENT_TYPE",this.eventType);
                for(Object key:prodMap.keySet()) {
                    Map<String,Object> eventOne=(Map)prodMap.get(key);
                    Map<String,Object> newData=(Map)eventOne.get("newData");
                    if(eventOne.size()>0) {
                        keyValue.put("SEQ_NO", newData.get("seqNo"));
                        eventOne.put("tableName", "MB_EVENT_ATTR");
                        eventOne.put("optType", eventOne.get("optionType"));
                        saveProdParaDifference(this.eventAttrNo, eventOne, keyValue, seqNo);
                    }
                }
            }
    }
    //事件类型
    public void eventTypeTran(Map prodMap,String seqNo,String operatorNo){
            if(prodMap.size()>0) {
                //记录组合
               this.eventTypeNo = this.eventTypeNo==null?processCombManagement.saveCombInfo(seqNo, operatorNo,this.prodType,this.prodDesc, "0"):this.eventTypeNo;
                prodMap.put("tableName", "MB_EVENT_TYPE");
                prodMap.put("optType", this.optionType);
                JSONObject keyValue = new JSONObject();
                keyValue.put("EVENT_TYPE", this.eventType);
                saveProdParaDifference(this.eventTypeNo, prodMap, keyValue, seqNo);
            }
    }
    //参数状态处理
    public void optionPermTran(Map mbProdInfo,String seqNo,String operatorNo){
        Map optPermMap = ResourcesUtils.getMap(mbProdInfo.get("optionPermissions"));
        if(!optPermMap.isEmpty()){
            //获取继承与该基础产品的可售产品
            String baseProdType = this.prodType;
            List<MbProdType> prodTypeList=mbProdTypeRepository.findByBaseProdType(baseProdType);
            String subSeqNo = processCombManagement.saveCombInfo(seqNo, operatorNo,this.prodType,this.prodDesc, "0");
            BigDecimal defineIndex = new BigDecimal("1");
            BigDecimal attrIndex = new BigDecimal("1");
            for(Object attrKey : optPermMap.keySet()){
                Map attrOptPerm = (Map) optPermMap.get(attrKey);
                String assembleId = attrOptPerm.get("key").toString();
                if(attrOptPerm.get("optPerm").equals("D") || attrOptPerm.get("optPerm").equals("DALL")){
                    //删除mbProdDefine表参数
                    if("MB_PROD_DEFINE".equals(attrOptPerm.get("tableName").toString())){
                        for(MbProdType mbProdType:prodTypeList) {
                            JSONObject keyValue = new JSONObject();
                            MbProdDefine mbProdDefine = mbProdDefineRepository.findByProdTypeAndAssembleId(mbProdType.getProdType(), assembleId);
                            //向omProcessRecordHist插入
                            if(mbProdDefine != null) {
                                Map define = (Map) ResourcesUtils.getMap(mbProdInfo.get("prodDefines")).get(assembleId);
                                keyValue.put("PROD_TYPE", mbProdDefine.getProdType());
//                                keyValue.put("SEQ_NO", mbProdDefine.getSeqNo());
                                define.put("tableName", "MB_PROD_DEFINE");
                                define.put("optType", "D");
                                this.prodType = mbProdDefine.getProdType();
                                saveProdParaDifference(subSeqNo, define, keyValue, seqNo);
                            }
                        }
                    }
                    //删除mbEventAttr表参数
                    if("MB_EVENT_ATTR".equals(attrOptPerm.get("tableName".toString()))){
                        String eventType =  attrOptPerm.get("eventType").toString();
                        for(MbProdType mbProdType:prodTypeList){
                            JSONObject keyValue = new JSONObject();
                            String newEventType = eventType.split("_")[0]+"_"+mbProdType.getProdType().toString();
                            MbEventAttr mbEventAttr = mbEventAttrRepository.findByEventTypeAndAssembleId(newEventType,assembleId);
                            if(mbEventAttr != null) {
                                Map infos = ResourcesUtils.getMap(mbProdInfo.get("mbEventInfos"));
                                Map event = ResourcesUtils.getMap(infos.get(eventType));
                                Map eventAttrs = ResourcesUtils.getMap(event.get("mbEventAttrs"));
                                Map attr = ResourcesUtils.getMap(eventAttrs.get(attrOptPerm.get("key").toString()));
                                Map newData = (Map) attr.get("newData");
                                newData.put("eventType", newEventType);
                                newData.put("seqNo", mbEventAttr.getSeqNo());
                                attr.put("newData", newData);
                                attr.put("tableName", "MB_EVENT_ATTR");
                                attr.put("optType", "D");
                                keyValue.put("EVENT_TYPE", newEventType);
                                keyValue.put("SEQ_NO", mbEventAttr.getSeqNo());
                                this.eventType = newEventType;
                                saveProdParaDifference(subSeqNo, attr, keyValue, seqNo);
                            }
                        }
                    }
                }
                if(attrOptPerm.get("optPerm").equals("DALL")){
                    //删除基础产品
                    if("MB_PROD_DEFINE".equals(attrOptPerm.get("tableName").toString())) {
                        JSONObject keyValue = new JSONObject();
                        Map define = (Map) ResourcesUtils.getMap(mbProdInfo.get("prodDefines")).get(assembleId);
                        Map newData = (Map) define.get("newData");
                        keyValue.put("PROD_TYPE", baseProdType);
                        keyValue.put("SEQ_NO", newData.get("seqNo"));
                        define.put("tableName", "MB_PROD_DEFINE");
                        define.put("optType", "D");
                        saveProdParaDifference(subSeqNo, define, keyValue, seqNo);
                    }
                    if("MB_EVENT_ATTR".equals(attrOptPerm.get("tableName").toString())){
                        String eventType =  attrOptPerm.get("eventType").toString();
                        JSONObject keyValue = new JSONObject();
                        Map infos =  ResourcesUtils.getMap(mbProdInfo.get("mbEventInfos"));
                        Map event =  ResourcesUtils.getMap(infos.get(eventType));
                        Map eventAttrs = ResourcesUtils.getMap(event.get("mbEventAttrs"));
                        Map attr = ResourcesUtils.getMap(eventAttrs.get(attrOptPerm.get("key").toString()));
                        Map newData = (Map) attr.get("newData");
                        keyValue.put("EVENT_TYPE", eventType);
                        keyValue.put("SEQ_NO", newData.get("seqNo"));
                        attr.put("tableName","MB_EVENT_ATTR");
                        attr.put("optType","D");
                        saveProdParaDifference(subSeqNo, attr, keyValue, seqNo);
                    }
                }
                if(attrOptPerm.get("optPerm").equals("I")) {
                    //可售产品增加参数
                    if ("MB_PROD_DEFINE".equals(attrOptPerm.get("tableName").toString())) {
                        for(MbProdType mbProdType:prodTypeList) {
                            JSONObject keyValue = new JSONObject();
                            //获取新增参数的seqNo
                            BigDecimal maxSeqNo = new BigDecimal(getMaxSeqNo(mbProdType.getProdType(),"MB_PROD_DEFINE"));
                            String newSeqNo = maxSeqNo.add(defineIndex).toString();
                            Map define = (Map) ResourcesUtils.getMap(mbProdInfo.get("prodDefines")).get(assembleId);
                            Map newData = (Map) define.get("newData");
                            //获取新增参数的pageSeqNo
                            BigDecimal maxPageSeqNo = new BigDecimal(getMaxPageSeqNo(mbProdType.getProdType(),"MB_PROD_DEFINE",newData.get("pageCode").toString()));
                            String newPageSeqNo = maxPageSeqNo.add(defineIndex).toString();
                            //重新组装插入数据参数
                            newData.put("prodType",mbProdType.getProdType());
                            newData.put("seqNo",newSeqNo);
                            newData.put("pageSeqNo",newPageSeqNo);
                            newData.put("optionPermissions",null);
                            define.put("newData",newData);
                            define.put("tableName", "MB_PROD_DEFINE");
                            define.put("optType", "I");
                            keyValue.put("PROD_TYPE", mbProdType.getProdType());
                            keyValue.put("SEQ_NO", newSeqNo);
                            this.prodType = mbProdType.getProdType();
                            saveProdParaDifference(subSeqNo, define, keyValue, seqNo);
                        }
                        defineIndex = defineIndex.add(BigDecimal.ONE);
                    }
                    if ("MB_EVENT_ATTR".equals(attrOptPerm.get("tableName").toString())) {
                        String eventType =  attrOptPerm.get("eventType").toString();
                        for(MbProdType mbProdType:prodTypeList) {
                            String newEventType = eventType.split("_")[0]+"_"+mbProdType.getProdType().toString();
                            JSONObject keyValue = new JSONObject();
                            //获取新增参数的seqNo
                            BigDecimal maxSeqNo = new BigDecimal(getMaxSeqNo(newEventType,"MB_EVENT_ATTR"));
                            String newSeqNo = maxSeqNo.add(attrIndex).toString(); //attrIndex初始化为1 后+1递增
                            Map infos =  ResourcesUtils.getMap(mbProdInfo.get("mbEventInfos"));
                            Map event =  ResourcesUtils.getMap(infos.get(eventType));
                            Map eventAttrs = ResourcesUtils.getMap(event.get("mbEventAttrs"));
                            Map attr = ResourcesUtils.getMap(eventAttrs.get(attrOptPerm.get("key").toString()));
                            Map newData = (Map) attr.get("newData");
                            //获取新增参数的pageSeqNo
                            BigDecimal maxPageSeqNo = new BigDecimal(getMaxPageSeqNo(newEventType,"MB_EVENT_ATTR",newData.get("pageCode").toString()));
                            String newPageSeqNo = maxPageSeqNo.add(attrIndex).toString();
                            //重新组装插入数据参数
                            newData.put("eventType",newEventType);
                            newData.put("seqNo",newSeqNo);
                            newData.put("pageSeqNo",newPageSeqNo);
                            newData.put("optionPermissions",null);
                            attr.put("newData",newData);
                            attr.put("tableName", "MB_EVENT_ATTR");
                            attr.put("optType", "I");
                            keyValue.put("EVENT_TYPE", newEventType);
                            keyValue.put("SEQ_NO", newSeqNo);
                            this.eventType = newEventType;
                            saveProdParaDifference(subSeqNo, attr, keyValue, seqNo);
                        }
                        attrIndex = attrIndex.add(BigDecimal.ONE);
                    }
                }
            }
        }
    }
    //获取同一pageCode下最大pageSeqNo
    public String getMaxPageSeqNo(String key,String table,String pageCode){
        String maxPageSeqNo = "";
        if("MB_PROD_DEFINE".equals(table)){
            List<MbProdDefine> mbProdDefines = mbProdDefineRepository.findByProdTypeAndPageCode(key,pageCode);
            if(mbProdDefines.size()>0) {
                int pageSeqNo = mbProdDefines.get(0).getPageSeqNo();
                for (int i = 1; i < mbProdDefines.size(); i++) {
                    if (pageSeqNo < mbProdDefines.get(i).getPageSeqNo()) {
                        pageSeqNo = mbProdDefines.get(i).getPageSeqNo();
                    }
                }
                maxPageSeqNo = pageSeqNo + "";
            }
        }
        if("MB_EVENT_ATTR".equals(table)){
            List<MbEventAttr> mbEventAttrs = mbEventAttrRepository.findByEventTypeOrderByPageCodePageSeqNoAsc(key);
            if(mbEventAttrs.size()>0) {
                int pageSeqNo = mbEventAttrs.get(0).getPageSeqNo();
                for (int i = 1; i < mbEventAttrs.size(); i++) {
                    if (pageSeqNo < mbEventAttrs.get(i).getPageSeqNo()) {
                        pageSeqNo = mbEventAttrs.get(i).getPageSeqNo();
                    }
                }
                maxPageSeqNo = pageSeqNo + "";
            }
        }
        if("".equals(maxPageSeqNo)){
            //无参数时候 return 0
            return "0";
        }else {
            return maxPageSeqNo;
        }
    }
    //获取最大SeqNo
    public String getMaxSeqNo (String key,String table){
        String maxSeqNo = "";
        if("MB_EVENT_ATTR".equals(table)){
            List<MbEventAttr> mbEventAttrs = mbEventAttrRepository.findByEventTypeOrderByPageCodePageSeqNoAsc(key);
            if(mbEventAttrs.size()>0) {
                int seqNo = Integer.parseInt(mbEventAttrs.get(0).getSeqNo());
                for (int i = 1; i < mbEventAttrs.size(); i++) {
                    if (seqNo < Integer.parseInt(mbEventAttrs.get(i).getSeqNo())) {
                        seqNo = Integer.parseInt(mbEventAttrs.get(i).getSeqNo());
                    }
                }
                maxSeqNo = seqNo + "";
            }
        }
        if("MB_PROD_DEFINE".equals(table)){
            List<MbProdDefine> mbProdDefines = mbProdDefineRepository.findByProdType(key);
//            if(mbProdDefines.size()>0) {
//                int seqNo = Integer.parseInt(mbProdDefines.get(0).getSeqNo());
//                for (int i = 1; i < mbProdDefines.size(); i++) {
//                    if (seqNo < Integer.parseInt(mbProdDefines.get(i).getSeqNo())) {
//                        seqNo = Integer.parseInt(mbProdDefines.get(i).getSeqNo());
//                    }
//                }
//                maxSeqNo = seqNo + "";
//            }
        }
        if("".equals(maxSeqNo)){
            //无参数时候 return 0
            return "0";
        }else {
            return maxSeqNo;
        }
    }
    //产品参数
    public void prodDefineTran(Map prodMap,String seqNo,String operatorNo){
            if(prodMap.size()>0) {
                //记录组合
                String subSeqNo = processCombManagement.saveCombInfo(seqNo, operatorNo,this.prodType,this.prodDesc, "0");
                JSONObject keyValue = new JSONObject();
                for (Object key : prodMap.keySet()) {
                    Map define = (Map) prodMap.get(key);
                    Map newData = (Map) define.get("newData");
                    keyValue.put("PROD_TYPE", this.prodType);
                    keyValue.put("SEQ_NO", newData.get("seqNo"));
                    define.put("tableName", "MB_PROD_DEFINE");
                    define.put("optType", define.get("optionType"));
                    saveProdParaDifference(subSeqNo, define, keyValue, seqNo);
                }
            }
    }
    //产品
    public void prodTran(Map prodMap,String seqNo,String operatorNo){
            //记录差异
        if(prodMap.get("newData")!=null ) {
            Map newData=(Map)prodMap.get("newData");
            //产品信息操作类型取自整体option
            prodMap.put("optType", this.optionType);
            if(newData.size()>0) {
                //记录组合
                prodMap.put("tableName", "MB_PROD_TYPE");
                JSONObject keyValue = new JSONObject();
                if(newData.get("prodType")!=null) {
                    keyValue.put("PROD_TYPE", newData.get("prodType"));
                    this.prodType=(String)newData.get("prodType");
                    this.prodDesc=(String)newData.get("prodDesc");
                }else{
                    Map oldData=(Map)prodMap.get("oldData");
                    keyValue.put("PROD_TYPE", oldData.get("prodType"));
                    this.prodDesc=(String)oldData.get("prodDesc");
                }
                String subSeqNo = processCombManagement.saveCombInfo(seqNo, operatorNo,(String)keyValue.get("PROD_TYPE"),this.prodDesc, "0");
                saveProdParaDifference(subSeqNo, prodMap, keyValue, seqNo);
            }else{
                Map oldData=(Map)prodMap.get("oldData");
                this.prodType=(String)oldData.get("prodType");
                this.prodDesc=(String)oldData.get("prodDesc");
            }
        }else{
            Map oldData=(Map)prodMap.get("oldData");
            this.prodType=(String)oldData.get("prodType");
            this.prodDesc=(String)oldData.get("prodDesc");
        }

    }


    //拿新申请的单号组织操作数据存入paraDifferenceCheckPublish表
    public void saveProdParaDifference(String seqNo,Map map,JSONObject keyValue,String mainSeqNo){
        OmProcessRecordHist omProcessRecordHist =new OmProcessRecordHist();
        Map newData= (Map)map.get("newData");
        Map oldData= (Map)map.get("oldData");
        if(newData.size()==0&&oldData.size()==0){
            return;
        }
        //去除为Null
        Iterator<Map.Entry<Integer, Object>> it = newData.entrySet().iterator();
        while(it.hasNext()){
            Map.Entry<Integer, Object> entry = it.next();
            String value="";
            if(List.class.isInstance(entry.getValue())){
                entry.setValue(StringUtils.join((List)entry.getValue(),","));
            }
            value = String.valueOf(entry.getValue());
            if(value ==null||"null".equals(value)||"NULL".equals(value)){
                it.remove();
            }
        }
        Iterator<Map.Entry<Integer, String>> itOld = oldData.entrySet().iterator();
        while(itOld.hasNext()){
            Map.Entry<Integer, String> entry = itOld.next();
            String value= String.valueOf(entry.getValue());
            if(value ==null||"null".equals(value)||"NULL".equals(value)){
                itOld.remove();
            }
        }
        if(newData.get("prodType")!=null) {
            newData.put("prodType", this.prodType);
        }
        if(newData.get("eventType")!=null && keyValue.size()!=5) {
            newData.put("eventType", this.eventType);
        }
        String dataDui=ResourcesUtils.getJsonString(newData);
        String oldDui=ResourcesUtils.getJsonString(oldData);
        String tableName=(String)map.get("tableName");
        //差异数据表保存的操作类型取自各个参数的optionType
        String optType=(String)map.get("optType");
        byte[] tmpDataDui;
        byte[] tmpOldDui;
        try {
            tmpDataDui =dataDui.getBytes("UTF-8");
            tmpOldDui = oldDui.getBytes("UTF-8");
            omProcessRecordHist.setPkAndValue(keyValue.toString());
            omProcessRecordHist.setDmlData(tmpDataDui);
            omProcessRecordHist.setDmlOldData(tmpOldDui);
        }catch (UnsupportedEncodingException e){
        }
        //1.获取对象主键
        omProcessRecordHist.setTableName(tableName);
        omProcessRecordHist.setRecSeqNo(seqNo);
        omProcessRecordHist.setDmlType(optType);
        omProcessRecordHist.setMainSeqNo(mainSeqNo);
        omProcessRecordHist.setSubSeqNo(getMaxDiffSub(seqNo) );
        omProcessRecordHistRepository.saveAndFlush(omProcessRecordHist);
    }
    //修改操作流程
    public void updateProdDifferenceInfo(Map mbProdInfo,String reqNo){

    }
    //获取DifferenceInfo中subSeq最大数
    private int getMaxDiffSub(String seqNo){
        String subSeqNo= omProcessRecordHistRepository.findBySubSeqNoMax(seqNo);
        int  intSub=subSeqNo==null?1: 1+Integer.valueOf(subSeqNo);
        return  intSub;
    }
}
