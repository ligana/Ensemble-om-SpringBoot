package com.dcits.ensemble.om.model.dbmodel;


import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * Created by ligan on 2018/8/14.
 */
@Getter
@Setter
public class MbProdDefineKeysClass implements Serializable {
    private String prodType;
    private String eventType;
    private String assembleType;
    private String assembleId;
    private String attrType;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MbProdDefineKeysClass that = (MbProdDefineKeysClass) o;

        if (prodType != null ? !prodType.equals(that.prodType) : that.prodType != null) return false;
        if (eventType != null ? !eventType.equals(that.eventType) : that.eventType != null) return false;
        if (assembleType != null ? !assembleType.equals(that.assembleType) : that.assembleType != null) return false;
        if (assembleId != null ? !assembleId.equals(that.assembleId) : that.assembleId != null) return false;
        return !(attrType != null ? !attrType.equals(that.attrType) : that.attrType != null);

    }

    @Override
    public int hashCode() {
        int result = prodType != null ? prodType.hashCode() : 0;
        result = 31 * result + (eventType != null ? eventType.hashCode() : 0);
        result = 31 * result + (assembleType != null ? assembleType.hashCode() : 0);
        result = 31 * result + (assembleId != null ? assembleId.hashCode() : 0);
        result = 31 * result + (attrType != null ? attrType.hashCode() : 0);
        return result;
    }
}
