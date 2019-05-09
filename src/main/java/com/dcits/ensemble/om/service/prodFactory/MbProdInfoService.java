package com.dcits.ensemble.om.service.prodFactory;

import com.dcits.ensemble.om.model.dbmodel.*;
import com.dcits.ensemble.om.model.prodFactory.IrlProdIntInfo;
import com.dcits.ensemble.om.model.prodFactory.MbColumnInfo;
import com.dcits.ensemble.om.model.prodFactory.MbEventInfo;
import com.dcits.ensemble.om.model.prodFactory.MbProdInfo;
import com.dcits.ensemble.om.repository.prodFactory.*;
import com.dcits.ensemble.om.repository.tables.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * Created by ligan on 2018/8/23.
 */
@Service
public class MbProdInfoService {
    @Autowired
    private MbProdTypeRepository mbProdTypeRepository;
    @Resource
    private MbProdDefineRepository mbProdDefineRepository;
    @Autowired
    private MbEventTypeRepository mbEventTypeRepository;
    @Autowired
    private MbEventAttrRepository mbEventAttrRepository;
    @Autowired
    private MbEventPartRepository mbEventPartRepository;
    @Autowired
    private GlProdAccountingRepository glProdAccountingRepository;
    @Autowired
    private IrlProdIntRepository irlProdIntRepository;
    @Autowired
    private RbProdChargeRepository rbProdChargeRepository;
    @Autowired
    private GlProdMappingRepository glProdMappingRepository;
    @Autowired
    private IrlAmtSplitRepository irlAmtSplitRepository;
    @Autowired
    private IrlPeriSplitRepository irlPeriSplitRepository;
    @Autowired
    private IrlIntTypeRepository irlIntTypeRepository;
    @Autowired
    private IrlIntRateRepository irlIntRateRepository;
    @Autowired
    private IrlIntMatrixRepository irlIntMatrixRepository;
    @Autowired
    private GlProdCodeMappingRepository glProdCodeMappingRepository;
    @Autowired
    private IrlBasisRateRepository irlBasisRateRepository;
    @Autowired
    private IrlProdTypeRepository irlProdTypeRepository;
    @Autowired
    private RbProdAmendMapingRepository rbProdAmendMapingRepository;
    @Autowired
    private MbProdGroupRepository mbProdGroupRepository;
    @Resource
    private MbAttrInfoService mbAttrInfoService;
    public MbProdInfo getProdInfo(String prodType){
        MbProdInfo mbProdInfo=new MbProdInfo();
        MbProdType mbProdType=mbProdTypeRepository.findByProdType(prodType);
        if(mbProdType != null) {
            mbProdInfo.setProdType(mbProdType);
            Map<String, MbProdDefine> mbProdDefineMap = new LinkedHashMap<>();
            List<MbProdDefine> mbProdDefineLists = new ArrayList<>();
            List<MbProdDefine> mbProdDefineListPart = new ArrayList<>();
            String baseType = mbProdType.getBaseProdType();
            String prodRange = mbProdType.getProdRange();
            List<MbProdDefine> mbProdDefineGroupList = new ArrayList<>();
            if (baseType != null) {
                List<MbProdDefine> mbProdDefineBaseList = mbProdDefineRepository.findByProdTypeAndAssembleTypeOrderByPageCodePageSeqNoAsc(baseType, "ATTR");
                if (mbProdDefineBaseList != null) {
                    mbProdDefineGroupList.addAll(mbProdDefineBaseList);
                }
            }
            List<MbProdDefine> mbProdDefineList = mbProdDefineRepository.findByProdTypeOrderByPageCodePageSeqNoAsc(prodType);
            if (mbProdDefineList != null) {
                //衍合基础产品与可售产品参数
                mbProdDefineGroupList.addAll(mbProdDefineList);
            }
            for (MbProdDefine mbProdDefine : mbProdDefineGroupList) {
                if (mbProdDefine.getProdType().equals(baseType)) {
                    //参数取自基础产品
                    if("V".equals(mbProdDefine.getOptionPermissions())||"E".equals(mbProdDefine.getOptionPermissions()))
                    {
                        continue;
                    }
                    mbProdDefine.setGroup("BASE");
                    mbProdDefine.setProdType(prodType);
                } else if (!mbProdDefine.getProdType().equals(baseType) && !prodRange.equals("B")) {
                    //参数取自可售产品
                    mbProdDefine.setGroup("SOLD");
                }
                //mbProdDefinsMap为原始处理方式 测试成功之后  删除
                if("ATTR".equals(mbProdDefine.getAssembleType())) {
                    mbProdDefineMap.put(mbProdDefine.getAssembleId()+"-"+mbProdDefine.getEventType(), mbProdDefine);
                }
                if("PART".equals(mbProdDefine.getAssembleType())){
                    mbProdDefineListPart.add(mbProdDefine);
                }
                //tj
                mbProdDefineLists.add(mbProdDefine);
            }
            //指标处理
            for (MbProdDefine mbProdDefine : mbProdDefineListPart) {
                mbProdDefineMap.put(mbProdDefine.getAssembleId()+"-"+mbProdDefine.getAttrKey()+"-"+mbProdDefine.getEventType(), mbProdDefine);
            }
            mbProdInfo.setProdDefines(mbProdDefineMap);
            mbProdInfo.setMbProdDefine(mbProdDefineLists);
            //对参数进行排序 先参数 后指标

            //获取单表数据
            mbProdInfo = getProdTablesInfo(mbProdInfo,prodType);

        }
        return mbProdInfo;
    }
    //获取产品附带单表信息
    public MbProdInfo getProdTablesInfo(MbProdInfo mbProdInfos,String prodTypes){
        MbProdInfo mbProdInfo = mbProdInfos;
        String prodType = prodTypes;
        //获取核算相关参数
        mbProdInfo.setGlProdAccounting(glProdAccountingRepository.findByProdType(prodType));
        mbProdInfo.setGlProdCodeMappings(glProdCodeMappingRepository.findByProdType(prodType));
        //获取利率相关参数
        mbProdInfo.setIrlProdInt(irlProdIntRepository.findByProdType(prodType));
        IrlProdIntInfo irlProdIntInfo = new IrlProdIntInfo();
        irlProdIntInfo.setIrlPeriSplitList(irlPeriSplitRepository.findAll());
        irlProdIntInfo.setIrlAmtSplitList(irlAmtSplitRepository.findAll());
        irlProdIntInfo.setIrlIntTypeList(irlIntTypeRepository.findAll());
        irlProdIntInfo.setIrlIntRateList(irlIntRateRepository.findAll());
        mbProdInfo.setIrlBasisRateList(irlBasisRateRepository.findAll());
        mbProdInfo.setIrlProdIntInfos(irlProdIntInfo);
        mbProdInfo.setIrlIntMatrices(irlIntMatrixRepository.findAll());
        //获取收费定义相关参数
        mbProdInfo.setRbProdCharge(rbProdChargeRepository.findByProdType(prodType));
        //获取产品映射参数
        mbProdInfo.setGlProdMappings(glProdMappingRepository.findByProdType(prodType));
        //获取定价工厂产品信息
        mbProdInfo.setIrlProdTypes(irlProdTypeRepository.findByProdType(prodType));
        //获取产品变更信息表参数
        mbProdInfo.setRbProdAmendMaping(rbProdAmendMapingRepository.findByProdType(prodType));
        //获取组合信息
        mbProdInfo.setMbProdGroup(mbProdGroupRepository.findByProdType(prodType));
        return mbProdInfo;
    }
    //保存产品所有属性(只有发布时生效)
    public void rodInfo(MbProdInfo mbProdInfo){
        MbProdType mbProdType=mbProdInfo.getProdType();
        Map<String,MbEventInfo> mbEventInfoList=mbProdInfo.getMbEventInfos();
        Map<String,MbProdDefine> mbProdDefineList=mbProdInfo.getProdDefines();
        mbProdTypeRepository.saveAndFlush(mbProdType);
        for(Map.Entry<String, MbProdDefine> entry: mbProdDefineList.entrySet()){
            mbProdDefineRepository.saveAndFlush(entry.getValue());
        }
        saveEventInfo(mbEventInfoList);
    }
    //保存事件
    public void saveEventInfo(Map<String,MbEventInfo> mbEventInfoList){
/*        for(MbEventInfo mbEventInfo:mbEventInfoList){
            mbEventTypeRepository.saveAndFlush(mbEventInfo.getMbEventType());
            Map<String,MbEventAttr> mbEventAttrList=mbEventInfo.getMbEventAttrs();
            Map<String,MbEventPart> mbEventPartList=mbEventInfo.getMbEventParts();
            for(MbEventAttr mbEventAttr :mbEventAttrList){
                mbEventAttrRepository.saveAndFlush(mbEventAttr);
            }
            for(MbEventPart mbEventPart:mbEventPartList){
                mbEventPartRepository.saveAndFlush(mbEventPart);
            }
        }*/
    }
    private Map<String,MbEventInfo> getMbEventInfo(String prodRange,String prodType,String baseType){
        Map<String,MbEventInfo> eventInfos=new HashMap<>();
        List<MbProdDefine> mbProdDefineEvent=mbProdDefineRepository.findByProdTypeAndAssembleTypeOrderByPageCodePageSeqNoAsc(prodType, "EVENT");
        for(MbProdDefine mbProdDefine: mbProdDefineEvent){
            MbEventInfo eventInfo= new MbEventInfo();
            Map<String,MbEventAttr> mbEventAttrMap=new LinkedHashMap<>();
            String eventKey=mbProdDefine.getAssembleId();
            String baseEventKey= eventKey.split("_")[0]+ "_"+baseType;
            eventInfo.setMbEventType(mbEventTypeRepository.findByEventType(mbProdDefine.getAssembleId()));
            List<MbEventAttr> mbEventAttrGroupList=new ArrayList<>();
            List<MbEventAttr> mbEventAttrList=mbEventAttrRepository.findByEventTypeOrderByPageCodePageSeqNoAsc(eventKey);
            List<MbEventAttr> mbEventBaseAttrList=mbEventAttrRepository.findByEventTypeOrderByPageCodePageSeqNoAsc(baseEventKey);
            mbEventAttrGroupList.addAll(mbEventBaseAttrList);
            mbEventAttrGroupList.addAll(mbEventAttrList);
            for(MbEventAttr mbEventAttr:mbEventAttrGroupList){
                if(mbEventAttr.getEventType().equals(baseEventKey)){
                    if("V".equals(mbEventAttr.getOptionPermissions())||"E".equals(mbEventAttr.getOptionPermissions()))
                    {
                        continue;
                    }
                    mbEventAttr.setEventType(eventKey);
                    mbEventAttr.setGroup("BASE");
                }else if (!mbEventAttr.getEventType().equals(baseEventKey) && !prodRange.equals("B")){
                    mbEventAttr.setGroup("SOLD");
                }
                mbEventAttrMap.put(mbEventAttr.getAssembleId(),mbEventAttr);
            }
            eventInfo.setMbEventAttrs(mbEventAttrMap);
            eventInfo.setMbEventParts(getMbEventPart(prodRange,eventKey,baseEventKey));
            eventInfos.put(mbProdDefine.getAssembleId(), eventInfo);
        }
        return eventInfos;
    }
    private Map<String,Map> getMbEventPart(String prodRange,String eventType,String baseEventKey){
        List<MbEventAttr> mbEventAttrs=mbEventAttrRepository.findByEventTypeOrderByPageCodePageSeqNoAsc(eventType);
        Map<String,Map> mapMap=new HashMap<>();
        for(MbEventAttr mbEventAttr:mbEventAttrs){
            Map<String,MbEventPart>  mbEventParts=new HashMap<>();
            List<MbEventPart> mbEventPartGroupList=new ArrayList<>();
           List<MbEventPart> mbEventPartList=mbEventPartRepository.findByEventTypeAndAssembleId(eventType, mbEventAttr.getAssembleId());
           List<MbEventPart> mbEventPartBaseList=mbEventPartRepository.findByEventTypeAndAssembleId(baseEventKey, mbEventAttr.getAssembleId());
            mbEventPartGroupList.addAll(mbEventPartBaseList);
            mbEventPartGroupList.addAll(mbEventPartList);
            for(MbEventPart mbEventPart:mbEventPartGroupList){
                if(mbEventPart.getEventType().equals(baseEventKey)) {
                    mbEventPart.setEventType(eventType);
                    mbEventPart.setGroup("BASE");
                }else if(!mbEventPart.getEventType().equals(baseEventKey) && !prodRange.equals("B")){
                    mbEventPart.setGroup("SOLD");
                }
                mbEventParts.put(mbEventPart.getAttrKey(),mbEventPart);
            }
            mapMap.put(mbEventAttr.getAssembleId(), mbEventParts);
        }
        return mapMap;
    }
    //组装事件
    public Map<String,Map> assembleEvent(Map<String,MbEventInfo> mbEventInfos){
        Map<String,Map> mbEventInfoList=new HashMap<>();
        for(Object key:mbEventInfos.keySet()){
            Map<String,Map> mbEvent=new HashMap<>();
            MbEventInfo mbEventInfo=mbEventInfos.get(key);
            Map<String,MbEventAttr> mbEventAttrMap= mbEventInfo.getMbEventAttrs();
            for(Object keyAttr:mbEventAttrMap.keySet()){
                MbEventAttr mbEventAttr=mbEventAttrMap.get(keyAttr);
                Map attr=new HashMap<>();
                Map map = new HashMap();
                map.put("attrValue",mbEventAttr.getAttrValue());
                map.put("optionPermissions",mbEventAttr.getOptionPermissions());
                attr.put(mbEventAttr.getAssembleId(),map);
                mbEvent.putAll(attr);
            }
            Map<String,Map> mbEventParts=mbEventInfo.getMbEventParts();
            for(Object keyPart:mbEventParts.keySet()){
                mbEvent.putAll(partToAttr(mbEventParts.get(keyPart)));
            }
            mbEventInfoList.put((String)key,mbEvent);
        }
        return mbEventInfoList;
    }
    //提取指标下的参数
    private Map<String,Map> partToAttr(Map map){
        Map attr=new HashMap<>();
        for(Object keyPart:map.keySet()){
            MbEventPart mbEventPart=(MbEventPart)map.get(keyPart);
            attr.put(keyPart,mbEventPart.getAttrValue());
        }
        return attr;
    }
    //修改DEFINE表中参数的位置信息
    public void updateColumn(Map column,String prodType){
        mbProdDefineRepository.updatePageSeq((Integer)column.get("pageSeqNo"),prodType,(String)column.get("key"),(String)column.get("pageCode"));
    }
    //修改Event表中参数的位置信息
    public void updateColumnEvent(Map column,String eventType){
        mbEventAttrRepository.updatePageSeq((Integer)column.get("pageSeqNo"),eventType,(String)column.get("key"),(String)column.get("pageCode"));
    }
    //获取子产品与基础产品不相同的产品集合
    public List findChildDiffInfo(String baseProdType,String value,String assembleId){
        List<MbProdType> prodTypeList=mbProdTypeRepository.findByBaseProdType(baseProdType);
        Map responseMap = new HashMap<>();
        List responseList = new ArrayList<>();
        for(MbProdType mbProdType:prodTypeList){
            MbProdDefine mbProdDefine=mbProdDefineRepository.findByProdTypeAndAssembleId(mbProdType.getProdType(),assembleId);
            if(mbProdDefine!=null&&!value.equals(mbProdDefine.getAttrValue())){
                responseMap.put("prodType",mbProdType.getProdType());
                responseMap.put("baseValue",value);
                responseMap.put("soldValue",mbProdDefine.getAttrValue());
                responseList.add(responseMap);
            }
        }
        return responseList;
    }
    //组织参数的备选数据
    public void assembleColumnInfo(MbProdInfo mbProdInfo){
       Map assembleColumnList=new HashMap();
       Map mbProdDefines=mbProdInfo.getProdDefines();
       //完成对产品参数的组装
       for(Object key:mbProdDefines.keySet()){
           MbColumnInfo assembleColumn=mbAttrInfoService.getColumnInfo((String)key);
           if(assembleColumn!=null)
           assembleColumnList.put(key,assembleColumn);
       }
       //完成对事件的组装
        //tj改造去除原事件参数表
//        Map mbProdEvents=mbProdInfo.getMbEventInfos();
//       for(Object key:mbProdEvents.keySet()){
//           MbColumnInfo assembleColumn=mbAttrInfoService.getColumnInfo((String)key);
//           if(assembleColumn!=null)
//           assembleColumnList.put(key,assembleColumn);
//       }
        mbProdInfo.setMbColumnInfo(assembleColumnList);
    }

    //获取产品基本信息，参数信息  事件信息
    public Map getProdAllInfo(String prodType){
        Map responseMap = new HashMap<>();
        //产品基本信息(mbProdType)
        MbProdType mbProdType = mbProdTypeRepository.findByProdType(prodType);
        //产品对应的基础产品代码
        String baseProdType = mbProdType.getBaseProdType();
        if(mbProdType != null) {
            //组装产品基本信息
            responseMap.put("prodType", mbProdType);
            //基础产品标识
            Boolean isBase = mbProdType.getProdRange().equals("B")?true:false;
            //组装产品参数（mbProdDefine）
            List<MbProdDefine> mbProdDefineList = mbProdDefineRepository.findByProdType(prodType);
            if(!isBase){
                //可售产品时 获取基础产品信息
                if(!baseProdType.isEmpty()) {
                    List<MbProdDefine> baseDefineInfo = mbProdDefineRepository.findByProdType(baseProdType);
                    for (int defineIndex = 0; defineIndex < baseDefineInfo.size(); defineIndex++) {
                        //获取参数状态为不可编辑||不可见参数
                        String optPerm = baseDefineInfo.get(defineIndex).getOptionPermissions();
                        if (!"E".equals(optPerm) && optPerm!=null && optPerm !="") {
                            baseDefineInfo.get(defineIndex).setProdType(prodType);
                            mbProdDefineList.add(baseDefineInfo.get(defineIndex));
                        }
                    }
                }
            }
            responseMap.put("prodDefine", mbProdDefineList);
            //组装产品事件参数(mbEventAttr)
            if (mbProdDefineList != null) {
                for (int index = 0; index < mbProdDefineList.size(); index++) {
                    if (mbProdDefineList.get(index).getAssembleType().equals("EVENT")) {
                        String eventType = mbProdDefineList.get(index).getAssembleId();
                        List<MbEventAttr> mbEventAttrList = mbEventAttrRepository.findByEventType(eventType);
                        if(!isBase){
                            //可售产品时  获取基础产品事件参数
                            if(!baseProdType.isEmpty()) {
                                String baseEventType = eventType.split("_")[0] + "_"+baseProdType;
                                List<MbEventAttr> baseEventList = mbEventAttrRepository.findByEventType(baseEventType);
                                for (int eventIndex = 0; eventIndex < baseEventList.size(); eventIndex++) {
                                    String optPerm = baseEventList.get(eventIndex).getOptionPermissions();
                                    if (!"E".equals(optPerm) && optPerm!=null && optPerm!="") {
                                        baseEventList.get(eventIndex).setEventType(eventType);
                                        mbEventAttrList.add(baseEventList.get(eventIndex));
                                    }
                                }
                            }
                        }
                        responseMap.put(eventType, mbEventAttrList);
                    }
                }
            }
        }
        return  responseMap;
    }
}

