package com.dcits.ensemble.om.exception;

import lombok.Data;
import org.springframework.core.io.ClassPathResource;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;

/**
 * @ClassName: BusinessException
 * @Description: 异常处理
 * @Author: liyuq
 * @CreateDate: 2019/5/6 10:34
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Data
public class BusinessException extends  RuntimeException {
    private static final long serialVersionUID = 123333212566L;
    private String errorCode;
    private String errorMessage;
    private static  Properties ps ;
    static {
        ps = new Properties();
        ClassPathResource cp = new ClassPathResource("config/om_errorCode_zh_CN.properties");
        try {
            ps.load(new InputStreamReader(cp.getInputStream(),"UTF-8"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public BusinessException(String errorCode, String...errorMessage) {
        this.errorCode = errorCode;
        StringBuffer str = new StringBuffer();
        String msg = ps.getProperty(errorCode);
        if(msg!=null){
            for(String msg1 : errorMessage){
                int a = msg.indexOf("{}");
                if(a!=-1) {
                    String b = msg.substring(0, a + 1);
                    str.append(b).append(msg1);
                    msg = msg.substring(a + 1);
                }
            }
            str.append(msg) ;
            this.errorMessage = String.valueOf(str);
        }else if(errorMessage.length==1){
            this.errorMessage = errorMessage[0];
        }else {
            throw new BusinessException("OM1003");
        }

    }
    public BusinessException(String Code) {
        this.errorCode = Code;
        String msg =  ps.getProperty(errorCode);
       if(msg==null){
           msg = "错误未定义!";
       }
        this.errorMessage = msg;

    }
}
