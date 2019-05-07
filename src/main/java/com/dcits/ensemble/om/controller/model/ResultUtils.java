package com.dcits.ensemble.om.controller.model;

import com.dcits.ensemble.om.exception.BusinessException;

/**
 * @Author chengliang
 * @Description //TODO
 * @Date 2018-09-04 17:42
 * @Version 1.0
 **/
public class ResultUtils {

    public static Result success(Object data) {
        return new Result<>(ResultCode.SUCCESS, data);
    }
    public static Result success(){
        return new Result<>(ResultCode.SUCCESS);
    }
    public static Result warn(ResultCode resultCode, String msg) {
        return new Result<>(resultCode, msg);
    }

    public static Result warn(ResultCode resultCode) {
        return new Result(resultCode);
    }
    public static Result warn(String Code) {
       throw  new BusinessException(Code);
    }
    public static Result warn(String Code,String...msg) {
        throw new BusinessException(Code,msg);
    }
}
