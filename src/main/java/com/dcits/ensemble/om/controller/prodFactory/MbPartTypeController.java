package com.dcits.ensemble.om.controller.prodFactory;

import com.dcits.ensemble.om.controller.model.Result;
import com.dcits.ensemble.om.controller.model.ResultUtils;
import com.dcits.ensemble.om.service.prodFactory.MbPartTypeService;
import io.swagger.annotations.Api;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName MbAttrTypeController
 * @Author xiaopan
 * @Date 2019/4/18 14:13
 * @Description TODO
 * @Version 1.0
 **/
@Api(value = "/QueryAll", tags = "指标分类")
@Controller
public class MbPartTypeController {


    @Resource
    private MbPartTypeService mbPartTypeService;

    @RequestMapping("/QueryAll")
    @ResponseBody
    public Result QueryAll(HttpServletResponse response){
        response.setHeader("Content-Type","application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        responseMap.put("PartTypeInfo",mbPartTypeService.QueryAll());
        return ResultUtils.success(responseMap);
    }
}