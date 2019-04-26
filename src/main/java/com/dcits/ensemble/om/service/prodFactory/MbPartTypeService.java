package com.dcits.ensemble.om.service.prodFactory;

import com.dcits.ensemble.om.model.dbmodel.MbAttrClass;
import com.dcits.ensemble.om.model.dbmodel.MbAttrType;
import com.dcits.ensemble.om.model.dbmodel.tables.MbPartType;
import com.dcits.ensemble.om.repository.prodFactory.MbAttrTypeRepository;
import com.dcits.ensemble.om.repository.prodFactory.MbPartTypeRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName MbAttrTypeService
 * @Author xiaopan
 * @Date 2019/4/18 14:16
 * @Description TODO
 * @Version 1.0
 **/
@Service
public class MbPartTypeService {

    @Resource
    private MbPartTypeRepository mbPartTypeRepository;

    public List<MbPartType> QueryAll(){
        List<MbPartType> mbPartTypeRepositoryAll = mbPartTypeRepository.findAll();
        return mbPartTypeRepositoryAll;
    }

    public String getPartDesc(String partType){
        MbPartType mbPartType = mbPartTypeRepository.findByPartType(partType);
        if(!mbPartType.equals(null)){
            return mbPartType.getPartDesc();
        }
        return partType;
    }
}
