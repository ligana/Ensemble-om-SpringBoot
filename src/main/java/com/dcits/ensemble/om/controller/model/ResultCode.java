package com.dcits.ensemble.om.controller.model;

import lombok.Data;

/**
 * @Author chengliang
 * @Description //TODO
 * @Date 2018-09-04 17:38
 * @Version 1.0
 **/
public enum ResultCode {
    SUCCESS("000000", "请求成功"),
    WARN("999999", "网络异常，请稍后重试");

    private String code;
    private String msg;

    ResultCode() {
    }

    ResultCode(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public String getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }}
