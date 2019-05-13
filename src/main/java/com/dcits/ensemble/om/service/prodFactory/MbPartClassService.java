package com.dcits.ensemble.om.service.prodFactory;

import com.dcits.ensemble.om.model.dbmodel.MbAttrClass;
import com.dcits.ensemble.om.model.dbmodel.system.OmEnvOrg;
import com.dcits.ensemble.om.model.dbmodel.tables.MbPartClass;
import com.dcits.ensemble.om.repository.prodFactory.MbAttrClassRepository;
import com.dcits.ensemble.om.repository.prodFactory.MbPartClassRepository;
import org.hibernate.SQLQuery;
import org.hibernate.annotations.Source;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;
import java.util.Map;

/**
 * @ClassName MbAttrClassService
 * @Author xiaopan
 * @Date 2019/4/17 15:49
 * @Description TODO
 * @Version 1.0
 **/
@Service
public class MbPartClassService {
    @PersistenceContext
    private EntityManager em;
    @Resource
    private MbPartClassRepository mbPartClassRepository;


    public List<MbPartClass> findAll(){
        List<MbPartClass> mbPartClassRepositoryAll = mbPartClassRepository.findAll();
        return mbPartClassRepositoryAll;
    }
    public List<Map> findAllTable(String tableName) {
        String dataSql = "select * from " + tableName + " where 1 = 1";
        Query dataQuery = em.createNativeQuery(dataSql);
        dataQuery.unwrap(SQLQuery.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Map> data = dataQuery.getResultList();
        return data;
    }

}
