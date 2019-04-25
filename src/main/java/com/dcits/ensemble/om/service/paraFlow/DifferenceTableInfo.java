package com.dcits.ensemble.om.service.paraFlow;

import com.alibaba.fastjson.JSONObject;
import com.dcits.ensemble.om.model.dbmodel.OmProcessRecordHist;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessDetailHistRepository;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessRecordHistRepository;
import com.dcits.ensemble.om.table.Attr;
import com.dcits.ensemble.om.table.TableDefine;
import com.dcits.ensemble.om.util.ResourcesUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by ligan on 2018/11/15.
 */
@Service
public class DifferenceTableInfo {
    @Resource
    private OmProcessRecordHistRepository omProcessRecordHistRepository;
    @Resource
    private OmProcessDetailHistRepository omProcessDetailHistRepository;
    @Resource
    private ProcessCombManagement processCombManagement;
    //记录产品流程信息
    public void insertTableDifferenceInfo(List mbProdInfoList,String seqNo,String tableName,String tableDesc,String tranType){
        /*
        * 判断是否组合表交易
        * 组合表交易需在此加子表循环操作
        * */

        String operatorNo= omProcessDetailHistRepository.findBySeqNoMax(seqNo)==null?"1": omProcessDetailHistRepository.findBySeqNoMax(seqNo);
         String subSeqNo = processCombManagement.saveCombInfo(seqNo, operatorNo,tableName,tableDesc,tranType);
         for(Object key:mbProdInfoList){
            Map<String,Object> accounting=(Map)key;
            //根据单条数据的操作类型判断具体怎么执行
            insertColumn( accounting,tableName,seqNo,subSeqNo);
        }
     }
    //单表新增操作
    public void insertColumn(Map map,String tableName,String seqNo,String recSeqNo){
        OmProcessRecordHist omProcessRecordHist =new OmProcessRecordHist();
        Map newData= (Map)map.get("newData");
        Map oldData= (Map)map.get("oldData");
        String optType= (String)map.get("optType");

        if(newData.size()==0&&oldData.size()==0){
            return;
        }
        //去除为Null
        Iterator<Map.Entry<Integer, Object>> it = newData.entrySet().iterator();
        while(it.hasNext()){
            Map.Entry<Integer, Object> entry = it.next();
            String value="";
            if(List.class.isInstance(entry.getValue())){
                entry.setValue(StringUtils.join((List) entry.getValue(), ","));
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
        String dataDui= ResourcesUtils.getJsonString(newData);
        String oldDui=ResourcesUtils.getJsonString(oldData);

        //1.获取对象主键
        JSONObject keyValue=new JSONObject();
        List<Attr> columnList= TableDefine.getTable(tableName).getAttr();
        for(Attr column:columnList){
            if("true".equals(column.getP())){
                if("I".equals(optType)){
                    keyValue.put(column.getCode(), newData.get(column.getCode()));
                }
                else{
                    keyValue.put(column.getCode(),oldData.get(column.getCode()));
                }
            }
        }
        //
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

        omProcessRecordHist.setTableName(tableName);
        omProcessRecordHist.setRecSeqNo(recSeqNo);
        omProcessRecordHist.setDmlType(optType);
        omProcessRecordHist.setMainSeqNo(seqNo);
        omProcessRecordHist.setSubSeqNo(getMaxDiffSub(recSeqNo));
        omProcessRecordHistRepository.saveAndFlush(omProcessRecordHist);
    }
    private int getMaxDiffSub(String seqNo){
        String subSeqNo= omProcessRecordHistRepository.findBySubSeqNoMax(seqNo);
        int  intSub=subSeqNo==null?1: 1+Integer.valueOf(subSeqNo);
        return  intSub;
    }
    //通过表名和差异合并得到最新数据
    
}
