package com.dcits.ensemble.om.model.dbmodel.system;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by jiajt on 2018/11/21.
 */
@Entity
@Table(name = "OmMenuRole")
@IdClass(OmMenuRoleClass.class)
@Getter
@Setter
public class OmMenuRole implements Serializable {
    public OmMenuRole () {}

    public OmMenuRole(String roleId, String menuId, String menuParentId) {
        this.roleId = roleId;
        this.menuId = menuId;
        this.menuParentId = menuParentId;
    }

    @Id
    @Column(name="role_id")
    private String roleId;
    @Id
    @Column(name="menu_id")
    private String menuId;
    @Id
    @Column(name="menu_parent_id")
    private String menuParentId;


    @Override
    public String toString() {
        return "OmMenuRole{" +
                "roleId='" + roleId + '\'' +
                ", menuId='" + menuId + '\'' +
                ", menuParentId='" + menuParentId + '\'' +
                '}';
    }
}
