package com.dcits.ensemble.om.repository.tables;

import com.dcits.ensemble.om.model.dbmodel.tables.RbProdCharge;
import com.dcits.ensemble.om.model.dbmodel.tables.RbProdChargeKeysClass;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * Created by jiajt on 2018/9/18.
 */
public interface RbProdChargeRepository extends JpaRepository<RbProdCharge, RbProdChargeKeysClass>,JpaSpecificationExecutor<RbProdCharge> {
    List<RbProdCharge> findByProdType(String prodType);
}
