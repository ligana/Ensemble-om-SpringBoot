package com.dcits.ensemble.om.controller.paraTable;

import com.dcits.ensemble.om.controller.model.Result;
import com.dcits.ensemble.om.controller.model.ResultUtils;
import com.dcits.ensemble.om.model.dbmodel.MbProdDefine;
import com.dcits.ensemble.om.model.dbmodel.OmProdPageDefine;
import com.dcits.ensemble.om.repository.tables.OmProdPageDefineRepository;
import com.dcits.ensemble.om.service.paraTable.OmProdPageDefineService;
import io.swagger.annotations.Api;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: OmProdPageDefineController
 * @Description: java类作用描述
 * @Author: liyuq
 * @CreateDate: 2019/4/16 16:50
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 */
@Api(value = "/getPageDefine", tags = "标签模块")
@Controller
@Slf4j
public class OmProdPageDefineController {

    @Autowired
    OmProdPageDefineService omProdPageDefineService;
    @RequestMapping("/getProdPageDefine")
    @ResponseBody
    public Result getProdPageDefine(HttpServletResponse response, @RequestParam(value = "pageClass",required = false) String pageClass){
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        String key = "";
        if(!"".equals(pageClass.trim())&&null!=pageClass){
            log.info("pageClass:"+pageClass );
            key = pageClass ;
        }
        List<OmProdPageDefine> list = omProdPageDefineService.getOmProdPageDefineByPageClass(key);
       return ResultUtils.success(list);
    }
}
