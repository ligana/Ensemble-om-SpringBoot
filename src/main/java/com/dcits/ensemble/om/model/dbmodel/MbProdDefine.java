package com.dcits.ensemble.om.model.dbmodel;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by ligan on 2018/8/14.
 */
@Entity
@Table(name = "mb_prod_define")
@IdClass(MbProdDefineKeysClass.class)
@Getter
@Setter
public class MbProdDefine implements Serializable {
    public MbProdDefine(){};


    public MbProdDefine(String prodType, String eventType, String assembleType, String assembleId, String attrType, String attrValue, String status, String perEffect, String pageCode, Integer pageSeqNo, String optionPermissions, String company, String tranTime, String tranTimestamp, String group) {
        this.prodType = prodType;
        this.eventType = eventType;
        this.assembleType = assembleType;
        this.assembleId = assembleId;
        this.attrType = attrType;
        this.attrValue = attrValue;
        this.status = status;
        this.perEffect = perEffect;
        this.pageCode = pageCode;
        this.pageSeqNo = pageSeqNo;
        this.optionPermissions = optionPermissions;
        this.company = company;
        this.tranTime = tranTime;
        this.tranTimestamp = tranTimestamp;
        this.group = group;
    }


    @Id
    @Column(name="prod_type")
    private String prodType;
    @Id
    @Column(name="event_type")
    private String eventType;
    @Id
    @Column(name="assemble_type")
    private String assembleType;
    @Id
    @Column(name="assemble_id")
    private String assembleId;
    @Id
    @Column(name="attr_type")
    private String attrType;
    @Column(name="attr_value")
    private String attrValue;
    @Column(name="status")
    private String status;
    @Column(name="per_effect")
    private String perEffect;
    @Column(name="page_code")
    private String pageCode;
    @Column(name="page_seq_no")
    private Integer pageSeqNo;
    @Column(name="option_permissions")
    private String optionPermissions;
    @Column(name="company")
    private String company;
    @Column(name="tran_time")
    private String tranTime;
    @Column(name="tran_timestamp")
    private String tranTimestamp;
    @Transient
    private String group;

    @Override
    public String toString() {
        return "MbProdDefine{" +
                "prodType='" + prodType + '\'' +
                ", eventType='" + eventType + '\'' +
                ", assembleType='" + assembleType + '\'' +
                ", assembleId='" + assembleId + '\'' +
                ", attrType='" + attrType + '\'' +
                ", attrValue='" + attrValue + '\'' +
                ", status='" + status + '\'' +
                ", perEffect='" + perEffect + '\'' +
                ", pageCode='" + pageCode + '\'' +
                ", pageSeqNo=" + pageSeqNo +
                ", optionPermissions='" + optionPermissions + '\'' +
                ", company='" + company + '\'' +
                ", tranTime='" + tranTime + '\'' +
                ", tranTimestamp='" + tranTimestamp + '\'' +
                ", group='" + group + '\'' +
                '}';
    }

}
