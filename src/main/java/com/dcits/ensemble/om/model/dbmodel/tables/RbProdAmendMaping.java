package com.dcits.ensemble.om.model.dbmodel.tables;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "rb_prod_amend_maping")
@Getter
@Setter
public class RbProdAmendMaping implements Serializable {

    public RbProdAmendMaping() {}

    public RbProdAmendMaping(String prodType, String amendProdType) {
        this.prodType = prodType;
        this.amendProdType = amendProdType;
    }

    @Id
    @Column(name="prod_type")
    private String prodType;
    @Column(name="amend_prod_type")
    private String amendProdType;

    @Override
    public String toString() {
        return "MbProdAmendMaping{" +
                "prodType='" + prodType + '\'' +
                ", amendProdType='" + amendProdType + '\'' +
                '}';
    }
}
