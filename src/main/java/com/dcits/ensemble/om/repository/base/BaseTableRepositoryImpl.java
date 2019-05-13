package com.dcits.ensemble.om.repository.base;


import com.dcits.ensemble.om.table.Attr;
import com.dcits.ensemble.om.table.DbTable;
import com.dcits.ensemble.om.util.ResourcesUtils;
import net.sf.json.JSONObject;
import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ligan on 2018/9/12.
 */
@Service
public class BaseTableRepositoryImpl {
    @PersistenceContext
    private EntityManager em;

    @SuppressWarnings("unchecked")
    public List<Map> findAllTable(String tableName) {
        String dataSql = "select * from " + tableName + " where 1 = 1";
        Query dataQuery = em.createNativeQuery(dataSql);
        dataQuery.unwrap(SQLQuery.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List<Map> data = dataQuery.getResultList();
        return data;
    }

    @Modifying
    @Transactional
    public StringBuffer deleteTable(String tableName, JSONObject dataMap, String pkValue, Boolean flag) {
        //删除表参数信息
        String space = " ";
        String equal = "=";
        String mark = "?";
        String and = "and";
        JSONObject pkValueJson = JSONObject.fromObject(pkValue);
        StringBuffer sqlStr = new StringBuffer("delete from " + space + tableName + space + "where");
        StringBuffer reSql = new StringBuffer("delete from " + space + tableName + space + "where");
        for (Object key : pkValueJson.keySet()) {
            Object value = pkValueJson.get(key);
            sqlStr.append(space + key + equal + mark + and);
            reSql.append(space + key + equal + "'" + value + "'" + and);
        }
        sqlStr.delete(sqlStr.length() - 3, sqlStr.length());
        reSql.delete(reSql.length() - 3, reSql.length());

        Query dataQuery = em.createNativeQuery(sqlStr.toString());
        int i = 1;
        for (Object key : pkValueJson.keySet()) {
            Object value = pkValueJson.get(key);
            dataQuery.setParameter(i, value);
            i++;
        }
        if (flag) {
            dataQuery.executeUpdate();
        }
        reSql.append(";");
        reSql.append("\r\n");

        return reSql;
    }

    @Modifying
    @Transactional
    public StringBuffer updateTable(String tableName, JSONObject dataMap, String pkValue, Boolean flag) {
        String space = " ";
        String equal = "=";
        String mark = "?";
        String comm = ",";
        String and = "and";
        JSONObject pkValueJson = JSONObject.fromObject(pkValue);
        StringBuffer sqlStr = new StringBuffer("update" + space);
        StringBuffer reSql = new StringBuffer("update" + space);
        sqlStr.append(tableName + space + "set" + space);
        reSql.append(tableName + space + "set" + space);
        for (Object data : dataMap.keySet()) {
            Object value = dataMap.get(data);
            if (pkValueJson.get(data) == null && value != null && !"null".equals(value.toString())) {
                String columnName = data.toString();
                if (!columnName.equals(columnName.toUpperCase())) {
                    columnName = ResourcesUtils.camelToUnderline(data.toString());
                }
                sqlStr.append(columnName + equal + mark + comm);
                reSql.append(columnName + equal + "'" + value + "'" + comm);
            }
        }
        sqlStr.deleteCharAt(sqlStr.length() - 1);
        reSql.deleteCharAt(reSql.length() - 1);
        sqlStr.append(space + "where");
        reSql.append(space + "where");
        for (Object key : pkValueJson.keySet()) {
            Object value = pkValueJson.get(key);
            sqlStr.append(space + key + equal + mark + and);
            reSql.append(space + key + equal + "'" + value + "'" + and);
        }
        sqlStr.delete(sqlStr.length() - 3, sqlStr.length());
        reSql.delete(reSql.length() - 3, reSql.length());

        Query dataQuery = em.createNativeQuery(sqlStr.toString());
        int i = 1;
        for (Object data : dataMap.keySet()) {
            Object value = dataMap.get(data);
            if (pkValueJson.get(data) == null && value != null && !"null".equals(value.toString())) {
                dataQuery.setParameter(i, value);
                i++;
            }
        }
        for (Object key : pkValueJson.keySet()) {
            Object value = pkValueJson.get(key);
            dataQuery.setParameter(i, value);
            i++;
        }
        if (flag) {
            dataQuery.executeUpdate();
        }
        reSql.append(";");
        reSql.append("\r\n");

        return reSql;
    }

    ;

    @Modifying
    @Transactional
    public StringBuffer insertTable(String tableName, JSONObject dataMap, Boolean flag) {
        String space = " ";
        String left = "(";
        String right = ")";
        String comm = ",";
        StringBuffer sqlStr = new StringBuffer("insert into" + space);
        sqlStr.append(tableName + space);
        sqlStr.append(left);
        int i = 0;
        for (Object data : dataMap.keySet()) {
            String columnName = data.toString();
            if (!columnName.equals(columnName.toUpperCase())) {
                columnName = ResourcesUtils.camelToUnderline(data.toString());
            }
            Object value = dataMap.get(data);
            if (value != null && !"null".equals(value.toString())) {
                sqlStr.append(columnName);
                sqlStr.append(comm);
            }
        }
        sqlStr.deleteCharAt(sqlStr.length() - 1);
        sqlStr.append(right + space + "values" + space + left);
        //落数据库操作
        if (flag) {
            i = 0;
            for (Object data : dataMap.keySet()) {
                Object value = dataMap.get(data);
                if (value != null && !"null".equals(value.toString())) {
                    if (i != 0) {
                        sqlStr.append(comm);
                    }
                    sqlStr.append("?");
                }
                i++;
            }
            sqlStr.append(right);
            if (flag) {
                Query dataQuery = em.createNativeQuery(sqlStr.toString());
                i = 1;
                for (Object data : dataMap.keySet()) {
                    Object value = dataMap.get(data);
                    if (value != null && !"null".equals(value.toString())) {
                        dataQuery.setParameter(i, value);
                        i++;
                    }
                }
                dataQuery.executeUpdate();
            }
        }
        //导出sql数据操作
        if (!flag) {
            int dataSize = 0;
            for (Object data : dataMap.keySet()) {
                Object value = dataMap.get(data);
                if (value != null && !"null".equals(value.toString())) {
                    dataSize++;
                }
            }
            int flags = 1;
            for (Object data : dataMap.keySet()) {
                Object value = dataMap.get(data);
                //sql导出
                if (!flag) {
                    if (value != null && !"null".equals(value.toString())) {
                        sqlStr.append("'");
                        sqlStr.append(value.toString());
                        sqlStr.append("'");
                        if (flags != dataSize) {
                            sqlStr.append(comm);
                        }
                        flags++;
                    }
                }
            }
            sqlStr.append(right);
            sqlStr.append(";");
            sqlStr.append("\r\n");
        }
        return sqlStr;
    }
}
