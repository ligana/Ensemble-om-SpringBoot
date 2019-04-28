package com.dcits.ensemble.om.repository.prodFactory;

import com.dcits.ensemble.om.model.dbmodel.tables.MbPartType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * @ClassName MbPartTypeRepository
 * @Author xiaopan
 * @Date 2019/4/18 19:08
 * @Description TODO
 * @Version 1.0
 **/
public interface MbPartTypeRepository extends JpaRepository<MbPartType,Long>,JpaSpecificationExecutor<MbPartType> {
    @Override
    List<MbPartType> findAll();

    MbPartType findByPartType(String partType);
}
