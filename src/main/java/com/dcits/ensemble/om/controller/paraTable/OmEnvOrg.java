package com.dcits.ensemble.om.controller.paraTable;

import com.dcits.ensemble.om.controller.model.Result;
import com.dcits.ensemble.om.controller.model.ResultUtils;
import com.dcits.ensemble.om.service.paraTable.OmEnvOrgService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Api(value = "/getEnvInfo", tags = "环境配置信息")
@Controller
public class OmEnvOrg {
    @Resource
    private OmEnvOrgService omEnvOrgService;

    @ApiOperation(value = "环境信息", notes = "通过环境Id获取环境明细信息")
    @RequestMapping("/getEnvInfo")
    @ResponseBody
    public Result getTableInfo(HttpServletResponse response, @RequestParam(value = "envId", required = true) String envId) {
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        responseMap.put("envInfo",omEnvOrgService.getEnvInfoByEnvId(envId));
        return ResultUtils.success(responseMap);
    }

    @ApiOperation(value = "环境信息", notes = "获取环境信息")
    @RequestMapping("/getEnvAll")
    @ResponseBody
    public Result getTableInfoAll(HttpServletResponse response) {
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        responseMap.put("envInfoAll",omEnvOrgService.findAll());
        return ResultUtils.success(responseMap);
    }
}
