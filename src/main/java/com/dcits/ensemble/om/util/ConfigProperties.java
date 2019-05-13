package com.dcits.ensemble.om.util;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @ClassName: Properties
 * @Description: java类作用描述
 * @Author: liyuq
 * @CreateDate: 2019/4/23 15:58
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Component
@Data
public class ConfigProperties {
    @Value("${pf.isadapter}")
    private Boolean isAdapter;

    @Value("${pf.file.path}")
    private String filePath;

}
