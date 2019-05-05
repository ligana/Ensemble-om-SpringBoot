package com.dcits.ensemble.om.model.dbmodel.system;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "OmEnvOrg")
@Getter
@Setter
public class OmEnvOrg implements Serializable {

    public OmEnvOrg () {};


    public OmEnvOrg(String envId, String envDesc, String systemId, String url, String serviceCode, String messageCode, String messageType, String operator, String time) {
        this.envId = envId;
        this.envDesc = envDesc;
        this.systemId = systemId;
        this.url = url;
        this.serviceCode = serviceCode;
        this.messageCode = messageCode;
        this.messageType = messageType;
        this.operator = operator;
        this.time = time;
    }


    @Id
    @Column(name = "env_id")
    private String envId;
    @Column(name = "env_desc")
    private String envDesc;
    @Column(name = "system_id")
    private String systemId;
    @Column(name = "url")
    private String url;
    @Column(name = "service_code")
    private String serviceCode;
    @Column(name = "message_code")
    private String messageCode;
    @Column(name = "message_type")
    private String messageType;
    @Column(name = "operator")
    private String operator;
    @Column(name = "time")
    private String time;


    @Override
    public String toString() {
        return "OmEnvOrg{" +
                "envId='" + envId + '\'' +
                ", envDesc='" + envDesc + '\'' +
                ", systemId='" + systemId + '\'' +
                ", url='" + url + '\'' +
                ", serviceCode='" + serviceCode + '\'' +
                ", messageCode='" + messageCode + '\'' +
                ", messageType='" + messageType + '\'' +
                ", operator='" + operator + '\'' +
                ", time='" + time + '\'' +
                '}';
    }
}
