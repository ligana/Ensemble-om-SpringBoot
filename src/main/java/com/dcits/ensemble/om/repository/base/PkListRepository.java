package com.dcits.ensemble.om.repository.base;

import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ligan on 2018/9/28.
 */
@Service
public class PkListRepository {
    @PersistenceContext
    private EntityManager em;
    @SuppressWarnings("unchecked")
    public List<Map> getPkList(String tableName,String column,String columnDesc){
        String dataSql = "select "+column+" as \"key\","+columnDesc+" as \"value\" from "+tableName+" where 1 = 1";
        Query dataQuery = em.createNativeQuery(dataSql);
        dataQuery.unwrap(SQLQuery.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Map> dataList = dataQuery.getResultList();
        return dataList;
    }
    public List<Map> getAll(String tableName){
        String dataSql = "select * from "+tableName+"";
        Query queryAll = em.createNativeQuery(dataSql);
        queryAll.unwrap(SQLQuery.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Map> resultList = queryAll.getResultList();
        return resultList;
    }
}
