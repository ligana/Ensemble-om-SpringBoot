package com.dcits.ensemble.om.repository.prodFactory;

import com.dcits.ensemble.om.model.dbmodel.system.OmEnvOrg;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;
public interface OmEnvOrgRepository extends JpaRepository<OmEnvOrg,Long>, JpaSpecificationExecutor<OmEnvOrg> {
    OmEnvOrg findByEnvId(String envId);

    OmEnvOrg findBySystemId(String systemId);

}
