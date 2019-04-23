package com.dcits.ensemble.om.model.dbmodel.tables;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
@Getter
@Setter
public class MbPartAttrKeysClass implements Serializable {
    private String partType;
    private String attrKey;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MbPartAttrKeysClass that = (MbPartAttrKeysClass) o;

        if (partType != null ? !partType.equals(that.partType) : that.partType != null) return false;
        return !(attrKey != null ? !attrKey.equals(that.attrKey) : that.attrKey != null);
    }

    @Override
    public int hashCode() {
        int result = partType != null ? partType.hashCode() : 0;
        result = 31 * result + (attrKey != null ? attrKey.hashCode() : 0);
        return result;
    }
}
