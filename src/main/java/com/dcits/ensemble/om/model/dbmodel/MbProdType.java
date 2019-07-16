package com.dcits.ensemble.om.model.dbmodel;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

/**
 * Created by ligan on 2018/8/14.
 */
@Entity
@Table(name = "mb_prod_type")
@Getter
@Setter
public class MbProdType {
    public MbProdType(String prodType, String prodRange, String prodDesc, String prodRateDesc, String prodClass, String prodGroup, String baseProdType,String status,String sourceModule,String prodAbbr) {
        this.prodType = prodType;
        this.prodRange = prodRange;
        this.prodDesc = prodDesc;
        this.prodRateDesc = prodRateDesc;
        this.prodClass = prodClass;
        this.prodGroup = prodGroup;
        this.baseProdType = baseProdType;
        this.status = status;
        this.sourceModule = sourceModule;
        this.prodAbbr = prodAbbr;
    }
    public MbProdType() {
    }
    @Id
    @Column(name="prod_type")
    private String prodType;
    @Column(name="prod_desc")
    private String prodDesc;
    @Column(name="prod_rateDesc")
    private String prodRateDesc;
    @Column(name="prod_abbr")
    private String prodAbbr;
    @Column(name="prod_class")
    private String prodClass;
    @Column(name="prod_group")
    private String prodGroup;
    @Column(name="prod_range")
    private String prodRange;
    @Column(name="base_prodType")
    private String baseProdType;
    @Column(name="status")
    private String status;
    @Column(name="sourceModule")
    private String sourceModule;
    @Override
    public String toString() {
        return "MbProdType{" +
                "prodType='" + prodType + '\'' +
                ", prodDesc='" + prodDesc + '\'' +
                ", prodRateDesc='" + prodRateDesc + '\'' +
                ", prodAbbr='" + prodAbbr + '\'' +
                ", prodClass='" + prodClass + '\'' +
                ", prodGroup='" + prodGroup + '\'' +
                ", prodRange='" + prodRange + '\'' +
                ", baseProdType='" + baseProdType + '\'' +
                ", status='" + status + '\'' +
                ", sourceModule='" + sourceModule + '\'' +
                '}';
    }
}
