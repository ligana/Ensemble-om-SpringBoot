package com.dcits.ensemble.om.repository.prodFactory;

import com.dcits.ensemble.om.model.dbmodel.MbProdDefine;
import com.dcits.ensemble.om.model.dbmodel.MbProdDefineKeysClass;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ligan on 2018/8/14.
 */
public interface MbProdDefineRepository extends JpaRepository<MbProdDefine,MbProdDefineKeysClass> ,JpaSpecificationExecutor<MbProdDefine>{

     @Query("select s from MbProdDefine s  where s.prodType = :prodType and s.assembleType = :assembleType order by s.pageCode,s.pageSeqNo Asc" )
     public List<MbProdDefine> findByProdTypeAndAssembleTypeOrderByPageCodePageSeqNoAsc(@Param("prodType") String prodType,@Param("assembleType") String assembleType);
     @Query("select s from MbProdDefine s  where s.prodType = :prodType order by s.pageCode,s.pageSeqNo Asc" )
     public List<MbProdDefine> findByProdTypeOrderByPageCodePageSeqNoAsc(@Param("prodType") String prodType);


     @Transactional
     @Modifying
     @Query("update MbProdDefine set pageSeqNo=:pageSeqNo where prodType=:prodType and assembleId=:assembleId and pageCode=:pageCode")
     void updatePageSeq(@Param("pageSeqNo") Integer pageSeqNo,@Param("prodType") String prodType,@Param("assembleId") String assembleId,@Param("pageCode") String pageCode);
     public MbProdDefine findByProdTypeAndAssembleId(String prodType,String assembleId);
     public MbProdDefine findByProdTypeAndEventTypeAndAssembleTypeAndAndAssembleIdAndAttrKey(String prodType,String eventType,String assembleType,String assembleId,String attrKey);
     public List<MbProdDefine> findByProdType(String prodType);
     public List<MbProdDefine> findByProdTypeAndPageCode(String prodType,String pageCode);
}
