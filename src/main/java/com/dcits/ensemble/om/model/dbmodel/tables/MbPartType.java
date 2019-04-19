package com.dcits.ensemble.om.model.dbmodel.tables;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * @ClassName MbPartType
 * @Author xiaopan
 * @Date 2019/4/18 19:09
 * @Description TODO
 * @Version 1.0
 **/
@Entity
@Table(name = "mb_part_type")
@Getter
@Setter
public class MbPartType implements Serializable {

    public MbPartType() {
    }

    public MbPartType(String partType, String partDesc, String defaultPart, String partClass, String isStandard, String processMethod, String busiCategory, String status, String company, String tranTimestamp, String tranTime) {
        this.partType = partType;
        this.partDesc = partDesc;
        this.defaultPart = defaultPart;
        this.partClass = partClass;
        this.isStandard = isStandard;
        this.processMethod = processMethod;
        this.busiCategory = busiCategory;
        this.status = status;
        this.company = company;
        this.tranTimestamp = tranTimestamp;
        this.tranTime = tranTime;
    }

    @Id
    @Column(name="part_type")
    private String partType;
    @Column(name="part_desc")
    private String partDesc;
    @Column(name="default_part")
    private String defaultPart;
    @Column(name="part_class")
    private String partClass;
    @Column(name ="is_standard")
    private String isStandard;
    @Column(name ="process_method")
    private String processMethod;
    @Column(name ="busi_category")
    private String busiCategory;
    @Column(name ="status")
    private String status;
    @Column(name ="company")
    private String company;
    @Column(name ="tran_timestamp")
    private String tranTimestamp;
    @Column(name ="tran_time")
    private String tranTime;

    @Override
    public String toString() {
        return "MbPartType{" +
                "partType='" + partType + '\'' +
                ", partDesc='" + partDesc + '\'' +
                ", defaultPart='" + defaultPart + '\'' +
                ", partClass='" + partClass + '\'' +
                ", isStandard='" + isStandard + '\'' +
                ", processMethod='" + processMethod + '\'' +
                ", busiCategory='" + busiCategory + '\'' +
                ", status='" + status + '\'' +
                ", company='" + company + '\'' +
                ", tranTimestamp='" + tranTimestamp + '\'' +
                ", tranTime='" + tranTime + '\'' +
                '}';
    }
}
