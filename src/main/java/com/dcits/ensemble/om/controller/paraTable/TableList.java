package com.dcits.ensemble.om.controller.paraTable;

import com.dcits.ensemble.om.controller.model.Result;
import com.dcits.ensemble.om.controller.model.ResultUtils;
import com.dcits.ensemble.om.model.dbmodel.tables.OmTableList;
import com.dcits.ensemble.om.repository.tables.OmTableListRepository;
import com.dcits.ensemble.om.util.TableToJson;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ligan on 2018/11/8.
 */
@Api(value = "/getTableList", tags = "表集合")
@Controller
public class TableList {
    @Resource
    private OmTableListRepository omTableListRepository;
    @Resource
    private TableToJson tableToJson;
    @ApiOperation(value = "单表信息", notes = "获取单表信息")
    @RequestMapping("/getTableList")
    @ResponseBody
    public Result getTableList(HttpServletResponse response, @RequestParam(value = "system", required = false) String system) {
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        if("CM".equals(system)){
            responseMap.put("tableList", omTableListRepository.findByLoadModel("M"));
        }
        if(!"CM".equals(system)) {
            responseMap.put("tableList", omTableListRepository.findBySystem(system));
        }
       /* tableToJson.tableToJson();*/
        return ResultUtils.success(responseMap);
    }
}
