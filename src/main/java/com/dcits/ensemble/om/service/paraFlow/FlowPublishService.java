package com.dcits.ensemble.om.service.paraFlow;

import com.dcits.ensemble.om.controller.model.CoreServiceModel;
import com.dcits.ensemble.om.controller.model.ResultUtils;
import com.dcits.ensemble.om.model.dbmodel.OmProcessMainFlow;
import com.dcits.ensemble.om.model.dbmodel.OmProcessRecordHist;
import com.dcits.ensemble.om.model.dbmodel.OmProcessRelationHist;
import com.dcits.ensemble.om.model.dbmodel.system.OmEnvOrg;
import com.dcits.ensemble.om.model.dbmodel.tables.OmTableList;
import com.dcits.ensemble.om.repository.base.BaseTableRepositoryImpl;
import com.dcits.ensemble.om.repository.base.PkListRepository;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessMainFlowRepository;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessRecordHistRepository;
import com.dcits.ensemble.om.repository.paraFlow.OmProcessRelationHistRepository;
import com.dcits.ensemble.om.repository.prodFactory.MbFactoryRoute;
import com.dcits.ensemble.om.repository.prodFactory.OmEnvOrgRepository;
import com.dcits.ensemble.om.repository.tables.OmTableListRepository;
import com.dcits.ensemble.om.util.ConfigProperties;
import com.dcits.ensemble.om.util.ConnectUtil;
import com.dcits.ensemble.om.util.DateUtils;
import com.dcits.ensemble.om.util.FilesUtiles;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

/**
 * Created by ligan on 2018/9/13.
 */
@Service
@Slf4j
public class FlowPublishService {

    @Autowired
    ConfigProperties configProperties;
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
    @Resource
    PkListRepository pkListRepository;

    @Transactional
    public String publishSave(String mainSeqNo, Boolean flag) {
        OmProcessMainFlow omProcessMainFlow = omProcessMainFlowRepository.findByMainSeqNo(mainSeqNo);
        List<OmProcessRelationHist> omProcessRelationHistList = omProcessRelationHistRepository.findByMainSeqNoAndDtlSeqNo(mainSeqNo, omProcessMainFlow.getDtlSeqNo().toString());
        StringBuffer pushSql = new StringBuffer();
        for (OmProcessRelationHist omProcessRelationHist : omProcessRelationHistList) {
            Boolean isProd = omProcessRelationHist.getTranId().equals("MB_PROD_TYPE");
            pushSql.append(save(omProcessRelationHist.getRecSeqNo(), flag, isProd));
        }
        return pushSql.toString();
    }

    public StringBuffer save(String recSeqNo, Boolean flag, Boolean isProd) {
        List<OmProcessRecordHist> omProcessRecordHists = omProcessRecordHistRepository.findByRecSeqNo(recSeqNo);
        StringBuffer pushSql = new StringBuffer();
        StringBuffer filesql = new StringBuffer();
        String tablename = null;
        for (OmProcessRecordHist omProcessRecordHist : omProcessRecordHists) {
            JSONObject myJson = ParaDifferenceManagement.getJsonByBolb(omProcessRecordHist.getDmlData());
            if ("I".equals(omProcessRecordHist.getDmlType())) {
                pushSql.append(baseTableRepositoryImpl.insertTable(omProcessRecordHist.getTableName(), myJson, flag));
                filesql.append(baseTableRepositoryImpl.deleteTable(omProcessRecordHist.getTableName(), myJson, omProcessRecordHist.getPkAndValue(), false));
                filesql.append(baseTableRepositoryImpl.insertTable(omProcessRecordHist.getTableName(), myJson, false));
            } else if ("U".equals(omProcessRecordHist.getDmlType())) {
                pushSql.append(baseTableRepositoryImpl.updateTable(omProcessRecordHist.getTableName(), myJson, omProcessRecordHist.getPkAndValue(), flag));
                filesql.append(baseTableRepositoryImpl.updateTable(omProcessRecordHist.getTableName(), myJson, omProcessRecordHist.getPkAndValue(), false));
            } else if ("D".equals(omProcessRecordHist.getDmlType())) {
                //参数删除
                pushSql.append(baseTableRepositoryImpl.deleteTable(omProcessRecordHist.getTableName(), myJson, omProcessRecordHist.getPkAndValue(), flag));
                filesql.append(baseTableRepositoryImpl.deleteTable(omProcessRecordHist.getTableName(), myJson, omProcessRecordHist.getPkAndValue(), false));
            }
            tablename = omProcessRecordHist.getTableName();
        }
        OmEnvOrg omEnvOrg = null;
        String systemId = null;
        if (isProd) {
            systemId = MbFactoryRoute.map.get(tablename);
            if (systemId == null) {
                throw ResultUtils.warn("OM1001", tablename);
            }
        } else {
            OmTableList omTableList = omTableListRepository.findByTableName(tablename);
            systemId = omTableList.getSystem();
        }
        String[] systemIds = systemId.split(",");
        if (configProperties.getIsAdapter()) {
            for (String sys : systemIds) {
                omEnvOrg = omEnvOrgRepository.findBySystemId(sys);
                if (omEnvOrg == null) {
                    throw ResultUtils.warn("OM1002", sys);
                }
                HttpAdapterPf(omProcessRecordHists, omEnvOrg);
            }
        }
        writeFile(systemIds, filesql, tablename);
        return pushSql;
    }


    public void HttpAdapterPf(List<OmProcessRecordHist> omProcessRecordHists, OmEnvOrg omEnvOrg) {
        if (omEnvOrg == null) {
            throw ResultUtils.warn("OM1004");
        }
        com.alibaba.fastjson.JSONObject jsonObject = new com.alibaba.fastjson.JSONObject();
        com.alibaba.fastjson.JSONObject body = new com.alibaba.fastjson.JSONObject();
        body.put("models", omProcessRecordHists);
        CoreServiceModel coreServiceModel = new CoreServiceModel();
        coreServiceModel.setServiceCode(omEnvOrg.getServiceCode());
        coreServiceModel.setMessageType(omEnvOrg.getMessageType());
        coreServiceModel.setMessageCode(omEnvOrg.getMessageCode());
        com.alibaba.fastjson.JSONObject sysHead = ConnectUtil.getSysHeadForPublish(coreServiceModel);
        com.alibaba.fastjson.JSONObject result = ConnectUtil.postToGalaxyCore(sysHead, body, omEnvOrg.getUrl());
    }

    public void writeFile(String[] systemIds, StringBuffer sql, String tablename) {
        String date = DateUtils.getDateTime(new Date(), DateUtils.PATTERN_DEFAULT_DATE);
        String filename = date + ".sql";
        String path = configProperties.getFilePath();
        for (String systemId : systemIds) {
            String patch = path + systemId + "/NERT";
            FilesUtiles.writeFiles(patch, sql.toString(), filename);
        }
        String filetablename = tablename.toUpperCase() + ".sql";
        for (String systemId : systemIds) {
            String allFilePath = path + systemId + "/NORT";
            Boolean flag = FilesUtiles.isTableFile(allFilePath, filetablename);
            if (flag) {
                FilesUtiles.DeteleFile(allFilePath, filetablename);
            }
            List<Map> list = pkListRepository.getAll(tablename);
            String deletesql = "DELETE FROM " + tablename + ";\r\n";
            FilesUtiles.writeFiles(allFilePath, deletesql, filetablename);
            for (Map map : list) {
                JSONObject json = JSONObject.fromObject(map);
                StringBuffer Json = baseTableRepositoryImpl.insertTable(tablename, json, false);
                FilesUtiles.writeFiles(allFilePath, Json.toString(), filetablename);
            }
        }


    }

}
