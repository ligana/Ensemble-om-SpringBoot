package com.dcits.ensemble.om.service.paraFlow;

import com.dcits.ensemble.om.controller.model.CoreServiceModel;
import com.dcits.ensemble.om.model.dbmodel.OmProcessMainFlow;
import com.dcits.ensemble.om.model.dbmodel.OmProcessRecordHist;
import com.dcits.ensemble.om.model.dbmodel.OmProcessRelationHist;
import com.dcits.ensemble.om.repository.base.BaseTableRepositoryImpl;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessMainFlowRepository;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessRecordHistRepository;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessRelationHistRepository;
import com.dcits.ensemble.om.util.AdapterProperties;
import com.dcits.ensemble.om.util.ConnectUtil;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ligan on 2018/9/13.
 */
@Service
public class FlowPublishService {

    @Autowired
    AdapterProperties adapterProperties;
    @Resource
    private OmProcessRelationHistRepository omProcessRelationHistRepository;
    @Resource
    private OmProcessMainFlowRepository omProcessMainFlowRepository;
    @Resource
    private OmProcessRecordHistRepository omProcessRecordHistRepository;
    @Resource
    private BaseTableRepositoryImpl baseTableRepositoryImpl;
    public String publishSave(String mainSeqNo,Boolean flag){
        OmProcessMainFlow omProcessMainFlow = omProcessMainFlowRepository.findByMainSeqNo(mainSeqNo);
        List<OmProcessRelationHist> omProcessRelationHistList=omProcessRelationHistRepository.findByMainSeqNoAndDtlSeqNo(mainSeqNo, omProcessMainFlow.getDtlSeqNo().toString());
        StringBuffer pushSql= new StringBuffer();
        for(OmProcessRelationHist omProcessRelationHist:omProcessRelationHistList){
            pushSql.append(save(omProcessRelationHist.getRecSeqNo(),flag));
        }
        return pushSql.toString();
    }

    public StringBuffer save(String recSeqNo,Boolean flag){
        List<OmProcessRecordHist> omProcessRecordHists=  omProcessRecordHistRepository.findByRecSeqNo(recSeqNo);
        StringBuffer pushSql=new StringBuffer();
        for(OmProcessRecordHist omProcessRecordHist:omProcessRecordHists){
            JSONObject myJson = ParaDifferenceManagement.getJsonByBolb(omProcessRecordHist.getDmlData());
            if("I".equals(omProcessRecordHist.getDmlType()))
                pushSql.append(baseTableRepositoryImpl.insertTable(omProcessRecordHist.getTableName(),myJson,flag));
            else if("U".equals(omProcessRecordHist.getDmlType())) {
                pushSql.append(baseTableRepositoryImpl.updateTable(omProcessRecordHist.getTableName(), myJson, omProcessRecordHist.getPkAndValue(),flag));
            }else if("D".equals(omProcessRecordHist.getDmlType())){
                //参数删除
                pushSql.append(baseTableRepositoryImpl.deleteTable(omProcessRecordHist.getTableName(), myJson, omProcessRecordHist.getPkAndValue(),flag));
            }
        }
        System.out.println(adapterProperties.getURL());
        if(adapterProperties.getISADAPTER()){
            HttpAdapterPf(omProcessRecordHists);
        }
        return pushSql;
    }

    public com.alibaba.fastjson.JSONObject  HttpAdapterPf(List<OmProcessRecordHist> omProcessRecordHists){
        CoreServiceModel coreServiceModel = new CoreServiceModel();
        com.alibaba.fastjson.JSONObject sysHead = ConnectUtil.getSysHeadForPublish(coreServiceModel);
        com.alibaba.fastjson.JSONObject body = new com.alibaba.fastjson.JSONObject();
        body.put("models",omProcessRecordHists);
       com.alibaba.fastjson.JSONObject result =  ConnectUtil.postToGalaxyCore(sysHead,body,adapterProperties.getURL());
       return  result;
    }
}
