package com.dcits.ensemble.om.repository.prodFactory;

import com.dcits.ensemble.om.model.dbmodel.tables.MbPartAttr;

import com.dcits.ensemble.om.model.dbmodel.tables.MbPartAttrKeysClass;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface MbPartAttrRepository extends JpaRepository<MbPartAttr, MbPartAttrKeysClass>, JpaSpecificationExecutor<MbPartAttr> {
    List<MbPartAttr> findByPartType(String partType);
    List<MbPartAttr> findAll();
}