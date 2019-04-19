package com.dcits.ensemble.om.service.prodFactory;

import com.dcits.ensemble.om.model.dbmodel.MbAttrClass;
import com.dcits.ensemble.om.model.dbmodel.system.OmEnvOrg;
import com.dcits.ensemble.om.model.dbmodel.tables.MbPartClass;
import com.dcits.ensemble.om.repository.prodFactory.MbAttrClassRepository;
import com.dcits.ensemble.om.repository.prodFactory.MbPartClassRepository;
import org.hibernate.annotations.Source;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName MbAttrClassService
 * @Author xiaopan
 * @Date 2019/4/17 15:49
 * @Description TODO
 * @Version 1.0
 **/
@Service
public class MbPartClassService {

    @Resource
    private MbPartClassRepository mbPartClassRepository;


    public List<MbPartClass> findAll(){
        List<MbPartClass> mbPartClassRepositoryAll = mbPartClassRepository.findAll();
        return mbPartClassRepositoryAll;
    }
}
