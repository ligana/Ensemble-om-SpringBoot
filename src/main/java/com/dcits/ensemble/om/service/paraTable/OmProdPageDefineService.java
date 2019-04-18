package com.dcits.ensemble.om.service.paraTable;

import com.dcits.ensemble.om.model.dbmodel.OmProdPageDefine;
import com.dcits.ensemble.om.repository.tables.OmProdPageDefineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: OmProdPageDefineService
 * @Description: java类作用描述
 * @Author: liyuq
 * @CreateDate: 2019/4/16 18:07
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Service
public class OmProdPageDefineService {
    @Autowired
    OmProdPageDefineRepository omProdPageDefineRepository;

    public List<OmProdPageDefine> getOmProdPageDefineByPageClass(String pageClass){
          Sort sort = new Sort(Sort.Direction.ASC,"pageNum");
          OmProdPageDefine omProdPageDefine = new OmProdPageDefine();
          omProdPageDefine.setPageClass(pageClass);
          Example example = Example.of(omProdPageDefine);
          List<OmProdPageDefine> list = omProdPageDefineRepository.findAll(example,sort);
          return  list;
    }
}
