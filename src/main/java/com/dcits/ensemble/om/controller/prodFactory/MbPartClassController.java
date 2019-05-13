package com.dcits.ensemble.om.controller.prodFactory;

import com.dcits.ensemble.om.controller.model.Result;
import com.dcits.ensemble.om.controller.model.ResultUtils;
import com.dcits.ensemble.om.model.dbmodel.tables.MbPartClass;
import com.dcits.ensemble.om.service.prodFactory.MbPartClassService;
import io.swagger.annotations.Api;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName MbAttrClassController
 * @Author xiaopan
 * @Date 2019/4/17 15:36
 * @Description TODO
 * @Version 1.0
 **/

@Api(value = "/findAll", tags = "指标分类")
@Controller
public class MbPartClassController {
    @Resource
    private MbPartClassService mbPartClassService;

    @RequestMapping("/findAll")
    @ResponseBody
    public Result findAll(HttpServletResponse response){
        response.setHeader("Content-Type","application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        responseMap.put("MB_PART_CLASS",mbPartClassService.findAllTable("MB_PART_CLASS"));
        return ResultUtils.success(responseMap);
    }
}
