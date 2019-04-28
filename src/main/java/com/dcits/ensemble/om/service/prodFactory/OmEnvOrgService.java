package com.dcits.ensemble.om.service.prodFactory;

import com.dcits.ensemble.om.model.dbmodel.system.OmEnvOrg;
import com.dcits.ensemble.om.repository.system.OmEnvOrgRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OmEnvOrgService {

    @Resource
    private OmEnvOrgRepository omEnvOrgRepository;

    public OmEnvOrg getEnvInfoByEnvId(String envId){
        String envIds = envId;
        OmEnvOrg omEnvOrg = omEnvOrgRepository.findByEnvId(envIds);
        return omEnvOrg;
    }

    /**
     * @Author XiaoPan
     * @Description //查询全部环境列表
     * @Date 2019/4/11 9:53
     * @Param []
     * @return java.util.List<com.dcits.ensemble.om.model.dbmodel.system.OmEnvOrg>
    **/
    public List<OmEnvOrg> findAll(){
        List<OmEnvOrg> omEnvOrgList = omEnvOrgRepository.findAll();
        return omEnvOrgList;
    }
}
