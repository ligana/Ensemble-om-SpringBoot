package com.dcits.ensemble.om.model.dbmodel;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * @ClassName: OmProdPageDefineKeysClass
 * @Description: java类作用描述
 * @Author: liyuq
 * @CreateDate: 2019/4/16 17:28
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Setter
@Getter
public class OmProdPageDefineKeysClass implements Serializable {
    private String pageCode;
    private String pageClass;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OmProdPageDefineKeysClass that = (OmProdPageDefineKeysClass) o;


        if (pageCode != null ? !pageCode.equals(that.pageCode) : that.pageCode != null) return false;
        return !(pageClass != null ? !pageClass.equals(that.pageClass) : that.pageClass != null);

    }

    @Override
    public int hashCode() {
        int result = pageCode != null ? pageCode.hashCode() : 0;
        result = 31 * result + (pageClass != null ? pageClass.hashCode() : 0);
        return result;
    }
}
