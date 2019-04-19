package com.dcits.ensemble.om.repository.prodFactory;

import com.dcits.ensemble.om.model.dbmodel.FmCompany;
import com.dcits.ensemble.om.model.dbmodel.tables.MbPartClass;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * @ClassName MbPartClassRepository
 * @Author xiaopan
 * @Date 2019/4/18 17:32
 * @Description TODO
 * @Version 1.0
 **/
public interface MbPartClassRepository extends JpaRepository<MbPartClass,Long>,JpaSpecificationExecutor<MbPartClass> {
    List<MbPartClass> findAll();
}
