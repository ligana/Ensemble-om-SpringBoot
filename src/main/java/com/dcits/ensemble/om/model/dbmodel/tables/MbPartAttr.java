package com.dcits.ensemble.om.model.dbmodel.tables;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "mb_part_attr")
@IdClass(MbPartAttrKeysClass.class)
@Getter
@Setter
public class MbPartAttr implements Serializable {
    public MbPartAttr() {}

    public MbPartAttr(String partType, String attrKey, String attrValue, String company, String tranTimeStamp, String tranTime) {
        this.partType = partType;
        this.attrKey = attrKey;
        this.attrValue = attrValue;
        this.company = company;
        this.tranTimeStamp = tranTimeStamp;
        this.tranTime = tranTime;
    }

    @Id
    @Column(name="part_type")
    private String partType;
    @Column(name="attr_key")
    private String attrKey;
    @Column(name="attr_value")
    private String attrValue;
    @Column(name ="company")
    private String company;
    @Column(name ="tran_timestamp")
    private String tranTimeStamp;
    @Column(name ="tran_time")
    private String tranTime;


    @Override
    public String toString() {
        return "MbPartAttr{" +
                "partType='" + partType + '\'' +
                ", attrKey='" + attrKey + '\'' +
                ", attrValue='" + attrValue + '\'' +
                ", company='" + company + '\'' +
                ", tranTimeStamp='" + tranTimeStamp + '\'' +
                ", tranTime='" + tranTime + '\'' +
                '}';
    }
}
