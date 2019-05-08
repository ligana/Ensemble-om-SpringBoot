package com.dcits.ensemble.om.repository.tables;

import com.dcits.ensemble.om.model.dbmodel.tables.OmTableList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * Created by jiajt on 2018/9/18.
 */
public interface OmTableListRepository extends JpaRepository<OmTableList,Long>,JpaSpecificationExecutor<OmTableList> {
    List<OmTableList> findBySystem(String system);
    List<OmTableList> findByLoadModel(String loadModel);
    OmTableList findByTableName(String tableName);
}
