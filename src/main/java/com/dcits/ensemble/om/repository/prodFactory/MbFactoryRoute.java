package com.dcits.ensemble.om.repository.prodFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName: MbFactoryRoute
 * @Description: 产品工厂路由规则定义
 * @Author: liyuq
 * @CreateDate: 2019/5/5 15:08
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
public class MbFactoryRoute {
    public static Map<String,String> map = new HashMap<>();
    static {
        map.put("MB_PROD_TYPE","PF");
        map.put("MB_PROD_DEFINE","PF");
        map.put("MB_EVENT_TYPE","PF");
        map.put("MB_PART_TYPE","PF");
        map.put("MB_PART_CLASS","PF");
        map.put("MB_PART_ATTR","PF");
        map.put("MB_ATTR_CLASS","PF");
        map.put("MB_ATTR_TYPE","PF");
        map.put("MB_PROD_GROUP","PF");
        map.put("MB_PROD_AMEND_MAPPING","RB");
        map.put("MB_PROD_CHARGE","RB");
        map.put("GL_PROD_ACCOUNTING","AC");
        map.put("GL_PROD_CODE_MAPPING","AC");
        map.put("GL_PROD_MAPPING","AC");
        map.put("IRL_PERI_SPLIT","PF");
        map.put("IRL_AMT_SPLIT","PF");
        map.put("IRL_INT_TYPE","PF");
        map.put("IRL_INT_RATE","PF");
        map.put("IRL_PROD_INT","PF");
        map.put("IRL_INT_MATRICES","PF");
        map.put("IRL_PROD_TYPE","PF");
        map.put("IRL_BASE_RATE","PF");
    }
}
