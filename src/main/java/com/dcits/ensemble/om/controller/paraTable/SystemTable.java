package com.dcits.ensemble.om.controller.paraTable;
import com.dcits.ensemble.om.controller.model.Result;
import com.dcits.ensemble.om.controller.model.ResultUtils;
import com.dcits.ensemble.om.model.dbmodel.MbProdType;
import com.dcits.ensemble.om.model.dbmodel.system.*;
import com.dcits.ensemble.om.repository.base.SystemTableRepositoryImpl;
import com.dcits.ensemble.om.repository.prodFactory.MbProdTypeRepository;
import com.dcits.ensemble.om.repository.system.*;
import com.dcits.ensemble.om.repository.tables.OmTableListRepository;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Array;
import java.util.*;

import com.dcits.ensemble.om.util.ResourcesUtils;
/**
 * Created by jiajt on 2018/11/21.
 */
@Api(value = "/getSysTable", tags = "获取用户，菜单，角色，权限表信息")
@Controller
public class SystemTable {
    @Resource
    private OmMenuRepository omMenuRepository;
    @Resource
    private OmRoleRepository omRoleRepository;
    @Resource
    private OmUserRepository omUserRepository;
    @Resource
    private OmMenuRoleRepository omMenuRoleRepository;
    @Resource
    private OmUserRoleRepository omUserRoleRepository;
    @Resource
    private OmProdPermDefRepository omProdPermDefRepository;
    @Resource
    private OmParamPermDefRepository omParamPermDefRepository;
    @Resource
    private OmTableListRepository omTableListRepository;
    @Resource
    private SystemTableRepositoryImpl systemTableRepositoryImpl;
    @Resource
    private OmSystemOrgRepository omSystemOrgRepository;
    @Resource
    private OmModuleOrgRepository omModuleOrgRepository;
    @Resource
    private OmUserCollectRepository omUserCollectRepository;
    @Resource
    private MbProdTypeRepository mbProdTypeRepository;

    @ApiOperation(value = "系统表信息", notes = "获取用户，菜单，角色，权限表信息")
    @RequestMapping("/getSysTable")
    @ResponseBody
    public Result getSysTable(HttpServletResponse response, @RequestParam(value = "tableName", required = true) String tableName) {
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        //1.根据表名获取参数列信息
        if("OM_MENU".equals(tableName)) {
            responseMap.put("columnInfo", omMenuRepository.findAll());
        }
        if("OM_ROLE".equals(tableName)) {
            responseMap.put("columnInfo", omRoleRepository.findAll());
        }
        if("OM_USER".equals(tableName)) {
            responseMap.put("columnInfo", omUserRepository.findAll());
        }
        if("OM_MENU_ROLE".equals(tableName)) {
            responseMap.put("columnInfo", omMenuRoleRepository.findAll());
        }
        if("OM_USER_ROLE".equals(tableName)) {
            responseMap.put("columnInfo", omUserRoleRepository.findAll());
        }
        if("OM_PROD_PERM_DEF".equals(tableName)) {
            responseMap.put("columnInfo", omProdPermDefRepository.findAll());
        }
        if("OM_PARAM_PERM_DEF".equals(tableName)) {
            responseMap.put("columnInfo", omParamPermDefRepository.findAll());
        }
        if("OM_TABLE_LIST".equals(tableName)) {
            responseMap.put("columnInfo", omTableListRepository.findAll());
        }
        if("OM_SYSTEM_ORG".equals(tableName)) {
            responseMap.put("columnInfo", omSystemOrgRepository.findAll());
        }
        if("OM_MODULE_ORG".equals(tableName)) {
            responseMap.put("columnInfo", omModuleOrgRepository.findAll());
        }
        return ResultUtils.success(responseMap);
    }


    /*
     * 用户，菜单，角色，权限表信息保存
     * */
    @RequestMapping("/saveSysTable")
    @ResponseBody
    public Result saveTable(HttpServletResponse response, @RequestBody Map map) {
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        String userName = (String) map.get("userName");
        String tableName = (String) map.get("tableName");
        String  keySet =  map.get("keySet").toString();
        List list = (List) map.get("data");

        //获取最新数据
        for(int i=0; i<list.size(); i++) {
            Map dataMap = (Map)list.get(i);
            Map data = new HashMap();
            //删除数据时候 上送数据newData为空  oldData为原始数据
            if("D".equals(dataMap.get("optType").toString())){
                data = (Map) dataMap.get("oldData");
            }else{
                data = (Map) dataMap.get("newData");
            }

            //获取主键对象
            JSONObject pkValue=new JSONObject();
            for(int j=0;j<keySet.split(",").length;j++){
                pkValue.put(keySet.split(",")[j].toString(),data.get(ResourcesUtils.underline2Camel(keySet.split(",")[j].toString())));
            }
            //更具数据操作状态  进行数据处理
            if("I".equals(dataMap.get("optType").toString())){
                systemTableRepositoryImpl.insertTable(tableName,data);
            }
            if("D".equals(dataMap.get("optType").toString())){
                systemTableRepositoryImpl.deleteTable(tableName,data,pkValue);
            }
            if("U".equals(dataMap.get("optType").toString())){
                systemTableRepositoryImpl.updateTable(tableName,data,pkValue);
            }
        }
        return ResultUtils.success();
    }

    /*
     * 通过用户  获取用户所能访问的菜单信息
     * */
    @RequestMapping("/getSysInfoByUser")
    @ResponseBody
    public Result getSysInfoByUser(HttpServletResponse response, @RequestParam(value = "userId", required = true) String userId) {
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        String parentUserId = userId;
        List<OmMenu> omMenus = new ArrayList<>();
        List<OmRole> omRoles = new ArrayList<>();
        List<OmUser> omUser = new ArrayList<>();
        List<OmMenuRole> omMenuRoles = new ArrayList<>();
        List<OmUserRole> omUserRoles1 = new ArrayList<>();

        String userLevel = omUserRepository.findByUserId(userId).getUserLevel();
        if("1".equals(userLevel)){
            //系统管理员登录
            omMenus = omMenuRepository.findAll();
            omRoles = omRoleRepository.findAll();
            omMenuRoles = omMenuRoleRepository.findAll();
            omUserRoles1 = omUserRoleRepository.findAll();
            omUser = omUserRepository.findAll();
            responseMap.put("columnInfo", omMenus);
            responseMap.put("roleInfo", omRoles);
            responseMap.put("userInfo", omUser);
            responseMap.put("menuRoleInfo", omMenuRoles);
            responseMap.put("userRoleInfo", omUserRoles1);

        }
        else {
            //获取用户所管理的所有用户信息
            List<OmUser> omUsers = omUserRepository.findByParentUserId(parentUserId);
            omUser = omUsers;
            //获取所有用户的角色信息
            if (omUsers.size() > 0) {
                for (int i = 0; i < omUsers.size(); i++) {
                    OmUserRole omUserRoles = omUserRoleRepository.findByUserId(omUsers.get(i).getUserId());
                    omUserRoles1.add(omUserRoles);
                    if (omUserRoles != null) {
                        //组装角色信息
                        omRoles.add(omRoleRepository.findByRoleId(omUserRoles.getRoleId()));
                        //通过角色获取菜单信息
                        List<OmMenuRole> omMenuRole = omMenuRoleRepository.findByRoleId(omUserRoles.getRoleId());
                        for (int j = 0; j < omMenuRole.size(); j++) {
                            //组装角色菜单信息
                            omMenuRoles.add(omMenuRole.get(j));
                            //获取菜单信息
                            OmMenu omMenu = omMenuRepository.findByMenuId(omMenuRole.get(j).getMenuId());
                            if (omMenu != null) {
                                //去重
                                Boolean flag = false;
                                for(int k=0;k<omMenus.size();k++){
                                    if(omMenus.get(k).getMenuSeqNo().equals(omMenu.getMenuSeqNo())){
                                        flag = true;
                                        break;
                                    }
                                }
                                if(!flag){
                                    omMenus.add(omMenu);
                                }
                            }
                        }
                    }
                }
                responseMap.put("columnInfo", omMenus);
                responseMap.put("roleInfo", omRoles);
                responseMap.put("userInfo", omUser);
                responseMap.put("menuRoleInfo", omMenuRoles);
                responseMap.put("userRoleInfo", omUserRoles1);


            } else {
                responseMap.put("columnInfo", null);
                responseMap.put("roleInfo", null);
                responseMap.put("userInfo", null);
                responseMap.put("menuRole", null);
                responseMap.put("menuRoleInfo", null);
                responseMap.put("userRoleInfo", null);
            }
        }
        return ResultUtils.success(responseMap);
    }

    /*
     * 通过用户  获取用户所能访问的菜单信息
     * */
    @RequestMapping("/getSysUserInfoByUser")
    @ResponseBody
    public Result getSysUserInfoByUser(HttpServletResponse response, @RequestParam(value = "userId", required = true,defaultValue = "") String userId) {
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        List<OmMenu> omMenus = new ArrayList<>();
        List<OmRole> omRoles = new ArrayList<>();
        List<OmUser> omUser = new ArrayList<>();
        List<OmMenuRole> omMenuRoles = new ArrayList<>();
        List<OmUserRole> omUserRoles1 = new ArrayList<>();
        OmUser omUsers = omUserRepository.findByUserId(userId);
        List<OmUser> omUserList = new ArrayList();
        omUserList.add(omUsers);
        //获取用户的角色信息
        if (omUsers != null) {
            OmUserRole omUserRoles = omUserRoleRepository.findByUserId(omUsers.getUserId());
            omUserRoles1.add(omUserRoles);
            if (omUserRoles != null) {
                //组装角色信息
                omRoles.add(omRoleRepository.findByRoleId(omUserRoles.getRoleId()));
                //通过角色获取菜单信息
                List<OmMenuRole> omMenuRole = omMenuRoleRepository.findByRoleId(omUserRoles.getRoleId());
                for (int j = 0; j < omMenuRole.size(); j++) {
                    //组装角色菜单信息
                    omMenuRoles.add(omMenuRole.get(j));
                    //获取菜单信息
                    OmMenu omMenu = omMenuRepository.findByMenuId(omMenuRole.get(j).getMenuId());
                    if (omMenu != null) {
                        //去重
                        Boolean flag = false;
                        for(int k=0;k<omMenus.size();k++){
                            if(omMenus.get(k).getMenuSeqNo().equals(omMenu.getMenuSeqNo())){
                                flag = true;
                                break;
                            }
                        }
                        if(!flag){
                            omMenus.add(omMenu);
                        }
                    }
                }
            }
            responseMap.put("columnInfo", omMenus);
            responseMap.put("roleInfo", omRoles);
            responseMap.put("userInfo", omUserList);
            responseMap.put("menuRoleInfo", omMenuRoles);
            responseMap.put("userRoleInfo", omUserRoles1);


        } else {
            responseMap.put("columnInfo", null);
            responseMap.put("roleInfo", null);
            responseMap.put("userInfo", null);
            responseMap.put("menuRole", null);
            responseMap.put("menuRoleInfo", null);
            responseMap.put("userRoleInfo", null);
        }

        return ResultUtils.success(responseMap);
    }

    /*
     * 通过用户id获取用户收藏的产品信息
     * */
    @RequestMapping("/getUserCollectByUserId")
    @ResponseBody
    public Result getUserCollectByUserId(HttpServletResponse response, @RequestParam(value = "userId", required = true) String userId) {
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        Map responseMap = new HashMap<>();
        List<OmUserCollect> collectList = omUserCollectRepository.findByUserId(userId);
        for(int index=0; index<collectList.size(); index++){
            MbProdType mbProdType = mbProdTypeRepository.findByProdType(collectList.get(index).getProdType());
            String prodStatus = "";
            if(mbProdType.equals(null)){
                prodStatus = "D";//产品不存在
            }else {
                prodStatus = mbProdType.getStatus();
            }
            collectList.get(index).setCollectStatus(prodStatus);
        }
        responseMap.put("collectList",collectList);
        return ResultUtils.success(responseMap);
    }

    /*
     * 用户，菜单，角色，权限表信息保存
     * */
    @RequestMapping("/saveRoleMenuTable")
    @ResponseBody
    public Result saveRoleMenuTable(HttpServletResponse response, @RequestBody Map map){
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        List<Map> addList = (List) map.get("add");
        List<Map> deleteList = (List) map.get("delete");
        if(deleteList.size() != 0){
            for(Map delete : deleteList){
                JSONObject pkValue = new JSONObject();
                pkValue.put("ROLE_ID", delete.get("roleId"));
                pkValue.put("MENU_ID", delete.get("menuId"));
                systemTableRepositoryImpl.deleteTable("OM_MENU_ROLE", delete, pkValue);
            }
        }
        for(Map add : addList){
            systemTableRepositoryImpl.insertTable("OM_MENU_ROLE", add);
        }
        return ResultUtils.success();
    }

    /*
     * 用户收藏产品保存修改提交
     * */
    @RequestMapping("/saveCollectProd")
    @ResponseBody
    public Result saveCollectProd(HttpServletResponse response, @RequestBody Map map) {
        response.setHeader("Content-Type", "application/json;charset=UTF-8");
        String optType = (String) map.get("optType");
        String date = ResourcesUtils.getDate();
        map.put("collectStatus","A");
        map.put("collectDate",date);
        map.remove("optType");
        if ("I".equals(optType)) {
            //新增收藏产品信息
            systemTableRepositoryImpl.insertTable("OM_USER_COLLECT", map);
        }
        if ("D".equals(optType)) {
            JSONObject pkValue = new JSONObject();
            pkValue.put("USER_ID", map.get("userId"));
            pkValue.put("PROD_TYPE", map.get("prodType"));
            systemTableRepositoryImpl.deleteTable("OM_USER_COLLECT", map, pkValue);
        }
        return ResultUtils.success();
    }

}