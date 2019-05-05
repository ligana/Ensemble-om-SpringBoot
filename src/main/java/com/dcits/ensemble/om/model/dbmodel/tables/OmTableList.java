package com.dcits.ensemble.om.model.dbmodel.tables;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by ligan on 2018/11/8.
 */
@Entity
@Table(name = "om_table_list")
@Getter
@Setter
public class OmTableList {
    public OmTableList(String tableName, String tableDesc, String system, String parameter,String searchColumn,String eidtColumns,String loadModel,String loadPath) {
        this.tableName = tableName;
        this.tableDesc = tableDesc;
        this.system = system;
        this.parameter = parameter;
        this.searchColumn = searchColumn;
        this.eidtColumns = eidtColumns;
        this.loadModel = loadModel;
        this.loadPath = loadPath;
    }
    public OmTableList() {

    }
    @Id
    @Column(name="table_name")
    private String tableName;
    @Column(name="table_desc")
    private String tableDesc;
    @Column(name="system")
    private String system;
    @Column(name="parameter")
    private String parameter;
    @Column(name="search_column")
    private String searchColumn;
    @Column(name="eidt_columns")
    private String eidtColumns;
    @Column(name="load_model")
    private String loadModel;
    @Column(name="load_path")
    private String loadPath;

    @Override
    public String toString() {
        return "OmTableList{" +
                "tableName='" + tableName + '\'' +
                ", tableDesc='" + tableDesc + '\'' +
                ", system='" + system + '\'' +
                ", parameter='" + parameter + '\'' +
                ", searchColumn='" + searchColumn + '\'' +
                ", eidtColumns='" + eidtColumns + '\'' +
                ", loadModel='" + loadModel + '\'' +
                ", loadPath='" + loadPath + '\'' +

                '}';
    }
}
