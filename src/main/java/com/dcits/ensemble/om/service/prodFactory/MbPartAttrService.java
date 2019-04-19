package com.dcits.ensemble.om.service.prodFactory;

import com.dcits.ensemble.om.model.dbmodel.tables.MbPartAttr;
import com.dcits.ensemble.om.repository.prodFactory.MbPartAttrRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MbPartAttrService {

    @Resource
    private MbPartAttrRepository mbPartAttrRepository;

    public List<MbPartAttr> findByPartType (String partType){
        return mbPartAttrRepository.findByPartType(partType);
    }
}
