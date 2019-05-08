package com.dcits.ensemble.om.repository.system;

import com.dcits.ensemble.om.model.dbmodel.FmSystem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface FmSystemRepository extends JpaRepository<FmSystem,String>,JpaSpecificationExecutor<FmSystem> {
    @Query("select s.runDate from FmSystem s  where s.company = :company")
    public String findDate(@Param("company") String company);
}
