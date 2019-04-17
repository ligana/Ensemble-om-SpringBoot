package com.dcits.ensemble.om.model.dbmodel;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @ClassName: OmProdPageDefine
 * @Description: java类作用描述
 * @Author: liyuq
 * @CreateDate: 2019/4/16 16:35
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Entity
@Table(name = "om_prod_page_define")
@Getter
@Setter
@IdClass(OmProdPageDefineKeysClass.class)
public class OmProdPageDefine implements Serializable {
    public  OmProdPageDefine(){

    }

    public OmProdPageDefine(String pageClass, String pageClassDesc, String pageCode, String text, String remarks, String pageNum) {
        this.pageClass = pageClass;
        this.pageClassDesc = pageClassDesc;
        this.pageCode = pageCode;
        this.text = text;
        this.remarks = remarks;
        this.pageNum = pageNum;
    }

    @Id
    @Column(name="page_class")
    private String pageClass;
    @Column(name="page_class_desc")
    private String pageClassDesc;
    @Id
    @Column(name="page_code")
    private String pageCode;
    @Column(name="page_desc")
    private String text;
    @Column(name="remarks")
    private String remarks;
    @Column(name="page_num")
    private String pageNum;

    @Override
    public String toString() {
        return "OmProdPageDefine{" +
                "pageClass='" + pageClass + '\'' +
                ", pageClassDesc='" + pageClassDesc + '\'' +
                ", pageCode='" + pageCode + '\'' +
                ", text='" + text + '\'' +
                ", remarks='" + remarks + '\'' +
                ", pageNum='" + pageNum + '\'' +
                '}';
    }
}
