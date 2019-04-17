package com.dcits.ensemble.om.repository.tables;


import com.dcits.ensemble.om.model.dbmodel.OmPageClassificationKeysClass;
import com.dcits.ensemble.om.model.dbmodel.OmProdPageDefine;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @ClassName: OmProdPageDefineRepository
 * @Description: java类作用描述
 * @Author: liyuq
 * @CreateDate: 2019/4/16 16:54
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
public interface OmProdPageDefineRepository extends JpaRepository<OmProdPageDefine, OmPageClassificationKeysClass>, JpaSpecificationExecutor<OmProdPageDefine> {
}
