package com.dcits.ensemble.om.exception;

import com.dcits.ensemble.om.controller.model.Result;
import com.dcits.ensemble.om.controller.model.ResultCode;
import com.dcits.ensemble.om.controller.model.ResultUtils;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.exception.DataException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.persistence.PersistenceException;

/**
 * @ClassName: OmControllerAdvice
 * @Description: java类作用描述
 * @Author: liyuq
 * @CreateDate: 2019/5/6 10:48
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@ControllerAdvice
@Slf4j
public class OmControllerAdvice {

    /**
     * 数据异常
     * @param ex
     * @return
     */
    @ResponseBody
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(value = PersistenceException.class)
    public Result dataErrorHandler(DataException ex) {
        if (log.isInfoEnabled()) {
            ex.printStackTrace();
        }
        ResultCode resultCode = ResultCode.WARN;
        resultCode.setCode(String.valueOf(ex.getErrorCode()));
        resultCode.setMsg(ex.getSQLException().getMessage());
        return ResultUtils.warn(resultCode);
}


    /**
     * 拦截捕捉自定义异常 omException.class
     * @param ex
     * @return
     */
    @ResponseBody
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(value = BusinessException.class)
    public Result omErrorHandler(BusinessException ex) {
        if(log.isInfoEnabled()){
            ex.printStackTrace();
        }
        ResultCode resultCode = ResultCode.WARN;
        resultCode.setCode(ex.getErrorCode());
        resultCode.setMsg(ex.getErrorMessage());
        return ResultUtils.warn(resultCode);
    }
    /**
     * 全局异常捕捉处理
     * @param ex
     * @return
     */
    @ResponseBody
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(value = Exception.class)
    public Result errorHandler(Exception ex) {
        if(log.isInfoEnabled()){
            ex.printStackTrace();
        }
        ResultCode resultCode = ResultCode.WARN;
        return ResultUtils.warn(resultCode);
    }




}
