package com.dcits.ensemble.om.repository.tables;


import com.dcits.ensemble.om.model.dbmodel.tables.RbProdAmendMaping;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface RbProdAmendMapingRepository extends JpaRepository<RbProdAmendMaping,Long>, JpaSpecificationExecutor<RbProdAmendMaping> {
    List<RbProdAmendMaping> findByProdType(String prodType);
}