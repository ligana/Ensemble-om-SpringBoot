package com.dcits.ensemble.om.controller.prodFactory;

import com.dcits.ensemble.om.controller.model.Result;
import com.dcits.ensemble.om.controller.model.ResultUtils;
import com.dcits.ensemble.om.service.prodFactory.MbPartAttrService;
import io.swagger.annotations.Api;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Api(value = "/findByPartType", tags = "指标参数关系")
@Controller
public class MbPartAttrController {
    @Resource
    private MbPartAttrService mbPartAttrService;

    @RequestMapping("/findByPartType")
    @ResponseBody
    Result findByPartType(HttpServletResponse response, @RequestBody Map map) {
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        String partType = (String) map.get("partType");
        responseMap.put("partAttrList",mbPartAttrService.findByPartType(partType));
        return ResultUtils.success(responseMap);
    }
}
