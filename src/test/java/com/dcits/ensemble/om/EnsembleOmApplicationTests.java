package com.dcits.ensemble.om;

import com.dcits.ensemble.om.model.dbmodel.OmProdPageDefine;
import com.dcits.ensemble.om.repository.tables.OmProdPageDefineRepository;
import com.dcits.ensemble.om.table.DbTables;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Sort;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class EnsembleOmApplicationTests {
@Autowired
    OmProdPageDefineRepository omProdPageDefineRepository;
    @Autowired
    private DbTables dbTables;

    @Test
    public void contextLoads() {
    }

    @Test
    public void test(){
        Assert.assertNotNull(dbTables);
    }

    @Test
    public  void  tes(){
        Sort sort =new Sort(Sort.Direction.ASC,"pageNum");

        OmProdPageDefine params= new OmProdPageDefine();
        params.setPageClass("CLPRODPUBLISH");
        Example<OmProdPageDefine> example = Example.of(params);
        List<OmProdPageDefine> list = omProdPageDefineRepository.findAll(example,sort);
        System.out.println(list.size());
        System.out.println(list);
    }
}
