package com.dcits.ensemble.om.util;

import com.alibaba.fastjson.JSONObject;
import com.dcits.ensemble.om.controller.model.ResultCode;
import com.dcits.ensemble.om.controller.model.ResultUtils;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.InputStreamRequestEntity;
import org.apache.commons.httpclient.methods.PostMethod;
import org.springframework.http.MediaType;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * @Auther: 刘亚栋
 * @Date: 2019/4/2 15:39
 * @Description:
 */
public class HttpAdapter {

    /**
     * 发送报文
     * @param url
     * @param requestEntity
     * @return
     */
    public static String doPostMsg(String url, JSONObject requestEntity) {
        String str = JSONObject.toJSONString(requestEntity);
        ByteArrayInputStream bais = null;
        try {
            bais = new ByteArrayInputStream(
                    str.getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        PostMethod pm = null;
        HttpClient hc = new HttpClient();
        pm = new PostMethod(url);
        // hc.getHttpConnectionManager().getParams().setConnectionTimeout(5 * 1000);
        pm.getParams().setSoTimeout(60 * 1000);
        pm.setRequestEntity(new InputStreamRequestEntity(bais));
        pm.setRequestHeader("Content-Type", String.valueOf(MediaType.APPLICATION_JSON_UTF8));
        String out ="";
        try {
            int status = hc.executeMethod(pm);
            if (status != 200) {
                ResultUtils.warn(ResultCode.WARN, "返回异常!");
            } else {
                byte[] b_out = pm.getResponseBody();
                out = new String(b_out, "UTF-8");
            }
        } catch (IOException e) {
            e.printStackTrace();
            ResultUtils.warn(ResultCode.WARN, "调用异常!");
        }
        return out;
    }
}
