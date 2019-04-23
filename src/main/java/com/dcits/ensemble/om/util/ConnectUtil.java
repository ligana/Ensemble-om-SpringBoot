package com.dcits.ensemble.om.util;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dcits.ensemble.om.controller.model.CoreServiceModel;

/**
 * @Auther: 刘亚栋
 * @Date: 2019/4/2 15:36
 * @Description:
 */
public class ConnectUtil {

    /**
     * 生成系统头
     *
     * @param request
     * @return
     */
    public static JSONObject getSysHeadForPublish(CoreServiceModel request) {
        JSONObject sysHeadMsg = new JSONObject();
        //头部数据
        sysHeadMsg.put("authFlag", "N");
        sysHeadMsg.put("branchId", "1001");
        sysHeadMsg.put("destBranchNo", "1");
        sysHeadMsg.put("messageCode", request.getMessageCode());
        sysHeadMsg.put("messageType", request.getMessageType());
        sysHeadMsg.put("serviceCode", request.getServiceCode());
        sysHeadMsg.put("moduleId", request.getModule());
        //sysHeadMsg.put("COMPANY", request.getParameter("legalentity"));
        sysHeadMsg.put("programId", "3280");
        sysHeadMsg.put("seqNo", "28F10E4234266510150526903");
        sysHeadMsg.put("serverId", "127.0.0.1");
        sysHeadMsg.put("sourceBranchNo", "1");
        sysHeadMsg.put("sourceType", request.getSourceType());
        sysHeadMsg.put("tranDate", request.getTranDate());
        sysHeadMsg.put("tranMode", "ONLINE");
        sysHeadMsg.put("tranTimestamp", "150526903");
        sysHeadMsg.put("userId", "SZS0119");
        sysHeadMsg.put("userLang", "CHINESE");
        sysHeadMsg.put("wsId", "05");
        sysHeadMsg.put("sceneId", "01");
        if (request.getClientNo()!=null && !request.equals("")){
            sysHeadMsg.put("clientNo",request.getClientNo());
        }
        return sysHeadMsg;
    }

    /**
     * 发送报文到核心
     *
     * @param sysHead
     * @param bodyMsg
     * @return
     */
    public static JSONObject postToGalaxyCore(JSONObject sysHead, JSONObject bodyMsg,String url) {
        JSONObject requestEntity = new JSONObject();
        requestEntity.putAll(bodyMsg);
        requestEntity.put("sysHead", sysHead);
        System.out.println(requestEntity.toString());
        
        String resp = HttpAdapter.doPostMsg(url, requestEntity);
        JSONObject respon = JSONObject.parseObject(resp);
        System.out.println("respon："+respon);
        JSONObject head = (JSONObject) respon.get("sysHead");
        if (head.get("retStatus").toString().equals("F")) {
            if (head.get("messageType").toString().equals("1200") && head.get("messageCode").toString().equals("9101")) {
                JSONObject result = new JSONObject();
                result.put("status", "F");
                return result;
            }
            String msg = ((JSONObject) ((JSONArray) head.get("ret")).get(0)).get("retMsg").toString();
            System.out.println(msg);
        }
        return (JSONObject) respon.get("body");

    }


}
