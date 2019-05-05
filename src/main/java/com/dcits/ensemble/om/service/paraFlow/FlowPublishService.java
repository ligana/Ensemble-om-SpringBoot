package com.dcits.ensemble.om.service.paraFlow;

import com.dcits.ensemble.om.controller.model.CoreServiceModel;
import com.dcits.ensemble.om.model.dbmodel.OmProcessMainFlow;
import com.dcits.ensemble.om.model.dbmodel.OmProcessRecordHist;
import com.dcits.ensemble.om.model.dbmodel.OmProcessRelationHist;
import com.dcits.ensemble.om.model.dbmodel.system.OmEnvOrg;
import com.dcits.ensemble.om.model.dbmodel.tables.OmTableList;
import com.dcits.ensemble.om.repository.base.BaseTableRepositoryImpl;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessMainFlowRepository;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessRecordHistRepository;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessRelationHistRepository;
import com.dcits.ensemble.om.repository.prodFactory.MbFactoryRoute;
import com.dcits.ensemble.om.repository.prodFactory.OmEnvOrgRepository;
import com.dcits.ensemble.om.repository.tables.OmTableListRepository;
import com.dcits.ensemble.om.util.AdapterProperties;
import com.dcits.ensemble.om.util.ConnectUtil;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

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
    @Resource
    private OmTableListRepository omTableListRepository;
    @Resource
    private OmEnvOrgRepository omEnvOrgRepository;
    public String publishSave(String mainSeqNo,Boolean flag){
        OmProcessMainFlow omProcessMainFlow = omProcessMainFlowRepository.findByMainSeqNo(mainSeqNo);
        List<OmProcessRelationHist> omProcessRelationHistList=omProcessRelationHistRepository.findByMainSeqNoAndDtlSeqNo(mainSeqNo, omProcessMainFlow.getDtlSeqNo().toString());
        StringBuffer pushSql= new StringBuffer();
        for(OmProcessRelationHist omProcessRelationHist:omProcessRelationHistList){
            Boolean isProd = omProcessRelationHist.getTranId().equals("MB_PROD_TYPE");
            pushSql.append(save(omProcessRelationHist.getRecSeqNo(),flag,isProd));
        }
        return pushSql.toString();
    }

    public StringBuffer save(String recSeqNo,Boolean flag,Boolean isProd){
        List<OmProcessRecordHist> omProcessRecordHists=  omProcessRecordHistRepository.findByRecSeqNo(recSeqNo);
        StringBuffer pushSql=new StringBuffer();
        String tablename= null;
        for(OmProcessRecordHist omProcessRecordHist:omProcessRecordHists){
            JSONObject myJson = ParaDifferenceManagement.getJsonByBolb(omProcessRecordHist.getDmlData());
            if("I".equals(omProcessRecordHist.getDmlType())) {
                pushSql.append(baseTableRepositoryImpl.insertTable(omProcessRecordHist.getTableName(), myJson, flag));
            }else if("U".equals(omProcessRecordHist.getDmlType())) {
                pushSql.append(baseTableRepositoryImpl.updateTable(omProcessRecordHist.getTableName(), myJson, omProcessRecordHist.getPkAndValue(),flag));
            }else if("D".equals(omProcessRecordHist.getDmlType())){
                //参数删除
                pushSql.append(baseTableRepositoryImpl.deleteTable(omProcessRecordHist.getTableName(), myJson, omProcessRecordHist.getPkAndValue(),flag));
            }
            tablename = omProcessRecordHist.getTableName();
        }
        if(adapterProperties.getIsAdapter()){
            OmEnvOrg omEnvOrg = null;
            String systemId = null ;
            if(isProd){
                systemId = MbFactoryRoute.map.get(tablename);
            }else {
                OmTableList omTableList= omTableListRepository.findByTableName(tablename);
                systemId =omTableList.getSystem();
            }
            omEnvOrg = omEnvOrgRepository.findBySystemId(systemId);
            HttpAdapterPf(omProcessRecordHists,omEnvOrg);
        }
        return pushSql;
    }


    public void  HttpAdapterPf(List<OmProcessRecordHist> omProcessRecordHists,OmEnvOrg omEnvOrg){
        com.alibaba.fastjson.JSONObject jsonObject = new com.alibaba.fastjson.JSONObject();
        com.alibaba.fastjson.JSONObject body = new com.alibaba.fastjson.JSONObject();
        body.put("models",omProcessRecordHists);
        CoreServiceModel coreServiceModel = new CoreServiceModel();
        coreServiceModel.setServiceCode(omEnvOrg.getServiceCode());
        coreServiceModel.setMessageType(omEnvOrg.getMessageType());
        coreServiceModel.setMessageCode(omEnvOrg.getMessageCode());
        com.alibaba.fastjson.JSONObject sysHead = ConnectUtil.getSysHeadForPublish(coreServiceModel);
        com.alibaba.fastjson.JSONObject result =  ConnectUtil.postToGalaxyCore(sysHead,body,omEnvOrg.getUrl());
    }

}
