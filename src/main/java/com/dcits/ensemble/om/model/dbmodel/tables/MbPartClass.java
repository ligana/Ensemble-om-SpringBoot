package com.dcits.ensemble.om.model.dbmodel.tables;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * @ClassName MbPartClass
 * @Author xiaopan
 * @Date 2019/4/18 17:39
 * @Description TODO
 * @Version 1.0
 **/
@Entity
@Table(name = "mb_part_class")
@Getter
@Setter
public class MbPartClass implements Serializable {


    public MbPartClass() {
    }

    public MbPartClass(String partClass, String partClassDesc, String partClassLevel, String parentPartClass, String company, String tranTimestamp, String tranTime) {
        this.partClass = partClass;
        this.partClassDesc = partClassDesc;
        this.partClassLevel = partClassLevel;
        this.parentPartClass = parentPartClass;
        this.company = company;
        this.tranTimestamp = tranTimestamp;
        this.tranTime = tranTime;
    }

    @Id
    @Column(name="part_class")
    private String partClass;
    @Column(name="part_class_desc")
    private String partClassDesc;
    @Column(name="part_class_level")
    private String partClassLevel;
    @Column(name="parent_part_class")
    private String parentPartClass;
    @Column(name ="company")
    private String company;
    @Column(name ="tran_timestamp")
    private String tranTimestamp;
    @Column(name ="tran_time")
    private String tranTime;

    @Override
    public String toString() {
        return "MbPartClass{" +
                "partClass='" + partClass + '\'' +
                ", partClassDesc='" + partClassDesc + '\'' +
                ", partClassLevel='" + partClassLevel + '\'' +
                ", parentPartClass='" + parentPartClass + '\'' +
                ", company='" + company + '\'' +
                ", tranTimestamp='" + tranTimestamp + '\'' +
                ", tranTime='" + tranTime + '\'' +
                '}';
    }
}
