/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50516
Source Host           : 127.0.0.1:3306
Source Database       : ensemble-om-tj

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2019-04-29 15:25:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mb_prod_define
-- ----------------------------
DROP TABLE IF EXISTS `mb_prod_define`;
CREATE TABLE `mb_prod_define` (
  `PROD_TYPE` varchar(50) NOT NULL COMMENT '产品类型',
  `EVENT_TYPE` varchar(50) NOT NULL COMMENT '事件类型',
  `ASSEMBLE_TYPE` varchar(20) NOT NULL COMMENT '组装类型',
  `ASSEMBLE_ID` varchar(50) NOT NULL COMMENT '组件ID',
  `ATTR_KEY` varchar(30) NOT NULL DEFAULT '' COMMENT '参数KEY',
  `ATTR_VALUE` varchar(400) NOT NULL COMMENT '参数值',
  `STATUS` varchar(3) NOT NULL COMMENT '状态',
  `COMPANY` varchar(20) DEFAULT NULL COMMENT '法人代码',
  `TRAN_TIMESTAMP` varchar(17) DEFAULT NULL COMMENT '交易时间戳',
  `TRAN_TIME` decimal(11,0) DEFAULT NULL COMMENT '交易时间',
  `PAGE_CODE` varchar(20) NOT NULL,
  `PAGE_SEQ_NO` int(10) NOT NULL,
  `PER_EFFECT` varchar(10) DEFAULT NULL,
  `OPTION_PERMISSIONS` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`PROD_TYPE`,`EVENT_TYPE`,`ASSEMBLE_TYPE`,`ASSEMBLE_ID`,`ATTR_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品定义表 undefined';

-- ----------------------------
-- Records of mb_prod_define
-- ----------------------------
INSERT INTO `mb_prod_define` VALUES ('111001', 'BASE_111001', 'ATTR', 'AMT_CALC_TYPE', 'AMT_CALC_TYPE', '0', 'A', null, null, null, 'CONTROL', '6', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'BASE_111001', 'ATTR', 'AMT_TYPE', 'AMT_TYPE', 'DDA', 'A', null, null, null, 'CONTROL', '5', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'BASE_111001', 'ATTR', 'CD_CUST_GRADE', 'CD_CUST_GRADE', '1', 'A', null, null, null, 'CONTROL', '8', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'BASE_111001', 'ATTR', 'CHECK_SAME_CLIENT', 'CHECK_SAME_CLIENT', 'Y', 'A', null, null, null, 'CONTROL', '7', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'BASE_111001', 'PART', 'DRA_DEP_PA', 'ALL_DEP_FLAG', 'Y', 'A', null, null, null, 'CONTROL', '3', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'BASE_111001', 'PART', 'DRA_DEP_PA', 'ALL_DRA_FLAG', 'Y', 'A', null, null, null, 'CONTROL', '1', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'BASE_111001', 'PART', 'EFFECTIVE_DATE_PA', 'EFFECTIVE_BACK_DATE', '2', 'A', null, null, null, 'CONTROL', '4', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'BASE_111001', 'PART', 'EFFECTIVE_DATE_PA', 'EFFECTIVE_FUTURE_DATE', '2', 'A', null, null, null, 'CONTROL', '2', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_111001', 'ATTR', 'ALLOW_SECUR', 'ALLOW_SECUR', 'Y', 'A', null, null, null, 'OPEN', '16', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_111001', 'PART', 'CHECK_TRAN_LIMIT_PA', 'CHECK_TRAN_LIMIT', 'Y', 'A', null, null, null, 'OPEN', '17', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_111001', 'PART', 'CHECK_TRAN_LIMIT_PA', 'TRAN_LIMIT_AMT', '2', 'A', null, null, null, 'OPEN', '18', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_111001', 'PART', 'CHECK_TRAN_LIMIT_PA', 'TRAN_LIMIT_CCY', 'USD', 'A', null, null, null, 'OPEN', '19', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_111001', 'PART', 'CHECK_TRAN_LIMIT_PA', 'TRAN_LIMIT_TERM', 'M', 'A', null, null, null, 'OPEN', '20', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_RB101', 'ATTR', 'ACCT_CLASS', 'ACCT_CLASS', '1', 'A', null, null, null, 'OPEN', '11', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_RB101', 'ATTR', 'ACCT_EXEC', 'ACCT_EXEC', '', 'A', null, null, null, 'OPEN', '7', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_RB101', 'ATTR', 'BAL_UPD_TYPE', 'BAL_UPD_TYPE', 'T,R', 'A', null, null, null, 'OPEN', '10', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_RB101', 'ATTR', 'CCY', 'CCY', 'CNY,CAD', 'A', null, null, null, 'OPEN', '15', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_RB101', 'ATTR', 'CD_RULE', 'CD_RULE', '1111', 'A', null, null, null, 'OPEN', '6', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_RB101', 'ATTR', 'PROD_END_DATE', 'PROD_END_DATE', '20190401', 'A', null, null, null, 'OPEN', '5', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_RB101', 'PART', 'BAL_PA', 'BAL_TYPE', 'TT,CA', 'A', null, null, null, 'OPEN', '8', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_RB101', 'PART', 'BAL_PA', 'CCY', 'CNY,AUD', 'A', null, null, null, 'OPEN', '9', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_RB101', 'PART', 'CCY_PA', 'CCY', 'CAD,CHF', 'A', null, null, null, 'OPEN', '3', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_RB101', 'PART', 'CCY_PA', 'MULTI_CCY', 'N', 'A', null, null, null, 'OPEN', '4', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_RB101', 'PART', 'CHECK_INIT_AMT_PA', 'CHECK_INIT_AMT', 'N', 'A', null, null, null, 'OPEN', '2', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_RB101', 'PART', 'CHECK_INIT_AMT_PA', 'INIT_AMT', '111', 'A', null, null, null, 'OPEN', '1', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_RB101', 'PART', 'CHECK_PROD_TERM_PA', 'LOAN_MAX_TERM', '1', 'A', null, null, null, 'OPEN', '12', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_RB101', 'PART', 'CHECK_PROD_TERM_PA', 'LOAN_MIN_TERM', '1', 'A', null, null, null, 'OPEN', '13', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('111001', 'OPEN_RB101', 'PART', 'CHECK_PROD_TERM_PA', 'LOAN_TERM_CTR_FLAG', 'N', 'A', null, null, null, 'OPEN', '14', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('RB101', 'OPEN_RB101', 'ATTR', 'ACCT_CLASS', 'ACCT_CLASS', '1', 'A', null, null, null, 'OPEN', '11', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('RB101', 'OPEN_RB101', 'ATTR', 'ACCT_EXEC', 'ACCT_EXEC', '', 'A', null, null, null, 'OPEN', '7', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('RB101', 'OPEN_RB101', 'ATTR', 'BAL_UPD_TYPE', 'BAL_UPD_TYPE', 'T', 'A', null, null, null, 'OPEN', '10', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('RB101', 'OPEN_RB101', 'ATTR', 'CCY', 'CCY', 'CNY', 'A', null, null, null, 'OPEN', '15', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('RB101', 'OPEN_RB101', 'ATTR', 'CD_RULE', 'CD_RULE', '1111', 'A', null, null, null, 'OPEN', '6', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('RB101', 'OPEN_RB101', 'ATTR', 'PROD_END_DATE', 'PROD_END_DATE', '20190430', 'A', null, null, null, 'OPEN', '5', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('RB101', 'OPEN_RB101', 'PART', 'BAL_PA', 'BAL_TYPE', 'TT,CA', 'A', null, null, null, 'OPEN', '8', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('RB101', 'OPEN_RB101', 'PART', 'BAL_PA', 'CCY', 'CNY', 'A', null, null, null, 'OPEN', '9', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('RB101', 'OPEN_RB101', 'PART', 'CCY_PA', 'CCY', 'AUD', 'A', null, null, null, 'OPEN', '3', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('RB101', 'OPEN_RB101', 'PART', 'CCY_PA', 'MULTI_CCY', 'Y', 'A', null, null, null, 'OPEN', '4', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('RB101', 'OPEN_RB101', 'PART', 'CHECK_INIT_AMT_PA', 'CHECK_INIT_AMT', 'Y', 'A', null, null, null, 'OPEN', '2', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('RB101', 'OPEN_RB101', 'PART', 'CHECK_INIT_AMT_PA', 'INIT_AMT', 'www', 'A', null, null, null, 'OPEN', '1', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('RB101', 'OPEN_RB101', 'PART', 'CHECK_PROD_TERM_PA', 'LOAN_MAX_TERM', '', 'A', null, null, null, 'OPEN', '12', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('RB101', 'OPEN_RB101', 'PART', 'CHECK_PROD_TERM_PA', 'LOAN_MIN_TERM', '', 'A', null, null, null, 'OPEN', '13', null, 'E');
INSERT INTO `mb_prod_define` VALUES ('RB101', 'OPEN_RB101', 'PART', 'CHECK_PROD_TERM_PA', 'LOAN_TERM_CTR_FLAG', 'N', 'A', null, null, null, 'OPEN', '14', null, 'E');

/*
Navicat MySQL Data Transfer

Source Server         : zhou
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : ensemble-om

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2019-04-29 17:06:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for om_menu
-- ----------------------------
DROP TABLE IF EXISTS `om_menu`;
CREATE TABLE `om_menu` (
  `menu_seq_no` int(10) NOT NULL COMMENT '菜单编号',
  `menu_id` varchar(30) NOT NULL COMMENT '菜单id',
  `menu_params` varchar(100) NOT NULL COMMENT '菜单名称',
  `menu_parent_id` varchar(30) DEFAULT NULL COMMENT '父级菜单',
  `menu_level` int(1) DEFAULT NULL COMMENT '菜单等级 ',
  `menu_status` varchar(1) DEFAULT NULL COMMENT '菜单状态',
  `menu_icon` varchar(50) DEFAULT NULL COMMENT '菜单图标id',
  `menu_component` varchar(100) DEFAULT NULL COMMENT '菜单url',
  `menu_title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`menu_seq_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单信息定义表';

-- ----------------------------
-- Records of om_menu
-- ----------------------------
INSERT INTO `om_menu` VALUES ('1', '1', '', null, '1', 'A', '', null, 'Apps');
INSERT INTO `om_menu` VALUES ('2', '10', '', '1', '2', 'A', 'home', 'Dashboard', '首页');
INSERT INTO `om_menu` VALUES ('3', '11', '', '1', '2', 'A', 'assistant', 'userIndexFlow', '我的工作台');
INSERT INTO `om_menu` VALUES ('4', '12', '', '1', '2', 'A', 'widgets', 'prodWindow', '产品展示');
INSERT INTO `om_menu` VALUES ('5', '13', '', '1', '2', 'A', 'widgets', 'prodCmbs', '产品目录');
INSERT INTO `om_menu` VALUES ('6', '14', '', '1', '2', 'A', 'favorite_border', 'collectProduct', '我收藏的产品');
INSERT INTO `om_menu` VALUES ('7', '3', '', '', '1', 'A', '', null, '产品工厂');
INSERT INTO `om_menu` VALUES ('8', '30', '', '3', '2', 'A', 'account_balance', null, '存款产品');
INSERT INTO `om_menu` VALUES ('25', '31', ' ', '3', '2', 'A', 'account_balance', '', '内部账产品');
INSERT INTO `om_menu` VALUES ('36', '4', '', '', '1', 'A', 'account_balance', null, '参数工厂');
INSERT INTO `om_menu` VALUES ('37', '40', '', '4', '2', 'A', 'view_list', null, '参数管理');
INSERT INTO `om_menu` VALUES ('38', '401', 'KBS', '40', '3', 'A', null, 'paramManage', '核心参数');
INSERT INTO `om_menu` VALUES ('39', '402', 'GLR', '40', '3', 'A', null, 'paramManage', '核算参数');
INSERT INTO `om_menu` VALUES ('40', '403', 'UP', '40', '3', 'A', null, 'paramManage', '利率参数');
INSERT INTO `om_menu` VALUES ('41', '41', '', '4', '2', 'A', 'view_list', null, '交易管理');
INSERT INTO `om_menu` VALUES ('42', '411', '', '41', '3', 'A', '', 'systemManage', '交易系统管理');
INSERT INTO `om_menu` VALUES ('44', '413', '', '41', '3', 'A', null, 'tableListManage', '交易属性管理');
INSERT INTO `om_menu` VALUES ('45', '414', '', '41', '3', 'A', null, 'tableColumnManage', '元数据管理');
INSERT INTO `om_menu` VALUES ('46', '42', '', '4', '2', 'A', 'view_list', null, '部件管理');
INSERT INTO `om_menu` VALUES ('47', '421', ' ', '42', '3', 'A', null, null, '部件分类管理');
INSERT INTO `om_menu` VALUES ('48', '422', ' ', '42', '3', 'A', null, null, '部件属性管理');
INSERT INTO `om_menu` VALUES ('49', '5', '', '', '1', 'A', '', null, '系统管理');
INSERT INTO `om_menu` VALUES ('50', '50', '', '5', '2', 'A', 'settings', 'environmentManageIndex', '环境管理');
INSERT INTO `om_menu` VALUES ('51', '51', '', '5', '2', 'A', 'settings', 'menuTables', '菜单管理');
INSERT INTO `om_menu` VALUES ('52', '52', '', '5', '2', 'A', 'settings', 'roleTables', '角色管理');
INSERT INTO `om_menu` VALUES ('53', '53', '', '5', '2', 'A', 'settings', 'userTables', '用户管理');
INSERT INTO `om_menu` VALUES ('54', '54', '', '5', '2', 'A', 'settings', 'roleMenuRelationTables', '角色菜单授权');
INSERT INTO `om_menu` VALUES ('55', '55', '', '5', '2', 'A', 'settings', 'userRoleRelationTables', '用户角色授权');
INSERT INTO `om_menu` VALUES ('56', '56', '', '5', '2', 'A', 'settings', 'prodPermTables', '产品工厂权限管理');
INSERT INTO `om_menu` VALUES ('57', '57', '', '5', '2', 'A', 'settings', 'paramPermTables', '参数工厂权限管理');
INSERT INTO `om_menu` VALUES ('58', '301', 'RB101', '30', '3', 'A', null, 'BaseProdForm', '个人人民币活期基础产品');
INSERT INTO `om_menu` VALUES ('59', '302', 'RB102', '30', '3', 'A', null, 'BaseProdForm', '个人外币活期单币种基础产品');
INSERT INTO `om_menu` VALUES ('60', '303', 'RB103', '30', '3', 'A', null, 'BaseProdForm', '个人外币活期多币种基础产品');
INSERT INTO `om_menu` VALUES ('61', '304', 'RB104', '30', '3', 'A', null, 'BaseProdForm', '单位人民币活期基础产品');
INSERT INTO `om_menu` VALUES ('62', '305', 'RB105', '30', '3', 'A', null, 'BaseProdForm', '单位外币活期单币种基础产品');
INSERT INTO `om_menu` VALUES ('63', '306', 'RB106', '30', '3', 'A', null, 'BaseProdForm', '暂记户活期单币种基础产品');
INSERT INTO `om_menu` VALUES ('64', '307', 'RB201', '30', '3', 'A', null, 'BaseProdForm', '个人整存整取定期基础产品');
INSERT INTO `om_menu` VALUES ('65', '308', 'RB202', '30', '3', 'A', null, 'BaseProdForm', '单位整存整取定期基础产品');
INSERT INTO `om_menu` VALUES ('66', '309', 'RB203', '30', '3', 'A', null, 'BaseProdForm', '个人零存整取基础产品');
INSERT INTO `om_menu` VALUES ('67', '3010', 'RB204', '30', '3', 'A', null, 'BaseProdForm', '个人通知存款基础产品');
INSERT INTO `om_menu` VALUES ('68', '3020', 'RB205', '30', '3', 'A', null, 'BaseProdForm', '单位通知存款基础产品');
INSERT INTO `om_menu` VALUES ('69', '3030', 'RB206', '30', '3', 'A', null, 'BaseProdForm', '个人定活两便基础产品');
INSERT INTO `om_menu` VALUES ('70', '3040', 'RB207', '30', '3', 'A', null, 'BaseProdForm', '定期一本通基础产品');
INSERT INTO `om_menu` VALUES ('71', '3050', 'RB208', '30', '3', 'A', null, 'BaseProdForm', '个人教育储蓄基础产品');
INSERT INTO `om_menu` VALUES ('72', '3060', 'RB209', '30', '3', 'A', null, 'BaseProdForm', '个人存本取息基础产品');
INSERT INTO `om_menu` VALUES ('73', '3070', 'RB210', '30', '3', 'A', null, 'BaseProdForm', '单位存本取息基础产品');
INSERT INTO `om_menu` VALUES ('74', '3080', 'RB301', '30', '3', 'A', null, 'BaseProdForm', '个人大额存单基础产品');
INSERT INTO `om_menu` VALUES ('75', '3090', 'RB302', '30', '3', 'A', null, 'BaseProdForm', '单位大额存单基础产品');
INSERT INTO `om_menu` VALUES ('76', '3011', 'RB401', '30', '3', 'A', null, 'BaseProdForm', '个人智能存款基础产品');
INSERT INTO `om_menu` VALUES ('77', '3021', 'RB402', '30', '3', 'A', null, 'BaseProdForm', '单位智能存款基础产品');
INSERT INTO `om_menu` VALUES ('78', '3031', 'RB501', '30', '3', 'A', null, 'BaseProdForm', '结构性存款基础产品');
INSERT INTO `om_menu` VALUES ('80', '3051', 'RB701', '30', '3', 'A', null, 'BaseProdForm', '借记卡基础产品');
INSERT INTO `om_menu` VALUES ('81', '311', 'GL001', '31', '3', 'A', null, 'BaseProdFormGl', '往账活期基础产品');
INSERT INTO `om_menu` VALUES ('82', '312', 'GL002', '31', '3', 'A', null, 'BaseProdFormGl', '往账定期基础产品');
INSERT INTO `om_menu` VALUES ('83', '313', 'GL003', '31', '3', 'A', null, 'BaseProdFormGl', '来账活期基础产品');
INSERT INTO `om_menu` VALUES ('84', '314', 'GL004', '31', '3', 'A', null, 'BaseProdFormGl', '来账定期基础产品');
INSERT INTO `om_menu` VALUES ('85', '315', 'GL005', '31', '3', 'A', null, 'BaseProdFormGl', '内部账基础产品（借方）');
INSERT INTO `om_menu` VALUES ('86', '316', 'GL006', '31', '3', 'A', null, 'BaseProdFormGl', '内部账基础产品（贷方）');
INSERT INTO `om_menu` VALUES ('87', '316', 'GL101', '31', '3', 'A', null, 'BaseProdFormGl', '内部账活期基础产品');
INSERT INTO `om_menu` VALUES ('88', '317', 'GL201', '31', '3', 'A', null, 'BaseProdFormGl', '内部账定期基础产品');

-- ----------------------------
-- Table structure for om_menu_role
-- ----------------------------
DROP TABLE IF EXISTS `om_menu_role`;
CREATE TABLE `om_menu_role` (
  `role_id` varchar(30) NOT NULL COMMENT '角色id',
  `menu_id` varchar(30) NOT NULL COMMENT '菜单id',
  `menu_parent_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单关系表';

-- ----------------------------
-- Records of om_menu_role
-- ----------------------------
INSERT INTO `om_menu_role` VALUES ('1', '1', '');
INSERT INTO `om_menu_role` VALUES ('1', '10', '1');
INSERT INTO `om_menu_role` VALUES ('1', '11', '1');
INSERT INTO `om_menu_role` VALUES ('1', '12', '1');
INSERT INTO `om_menu_role` VALUES ('1', '13', '1');
INSERT INTO `om_menu_role` VALUES ('1', '14', '1');
INSERT INTO `om_menu_role` VALUES ('1', '3', '');
INSERT INTO `om_menu_role` VALUES ('1', '30', '3');
INSERT INTO `om_menu_role` VALUES ('1', '301', '30');
INSERT INTO `om_menu_role` VALUES ('1', '3010', '30');
INSERT INTO `om_menu_role` VALUES ('1', '3011', '30');
INSERT INTO `om_menu_role` VALUES ('1', '302', '30');
INSERT INTO `om_menu_role` VALUES ('1', '3020', '30');
INSERT INTO `om_menu_role` VALUES ('1', '3021', '30');
INSERT INTO `om_menu_role` VALUES ('1', '303', '30');
INSERT INTO `om_menu_role` VALUES ('1', '3030', '30');
INSERT INTO `om_menu_role` VALUES ('1', '3031', '30');
INSERT INTO `om_menu_role` VALUES ('1', '304', '30');
INSERT INTO `om_menu_role` VALUES ('1', '3040', '30');
INSERT INTO `om_menu_role` VALUES ('1', '3041', '30');
INSERT INTO `om_menu_role` VALUES ('1', '305', '30');
INSERT INTO `om_menu_role` VALUES ('1', '3050', '30');
INSERT INTO `om_menu_role` VALUES ('1', '3051', '30');
INSERT INTO `om_menu_role` VALUES ('1', '306', '30');
INSERT INTO `om_menu_role` VALUES ('1', '3060', '30');
INSERT INTO `om_menu_role` VALUES ('1', '307', '30');
INSERT INTO `om_menu_role` VALUES ('1', '3070', '30');
INSERT INTO `om_menu_role` VALUES ('1', '308', '30');
INSERT INTO `om_menu_role` VALUES ('1', '3080', '30');
INSERT INTO `om_menu_role` VALUES ('1', '309', '30');
INSERT INTO `om_menu_role` VALUES ('1', '3090', '30');
INSERT INTO `om_menu_role` VALUES ('1', '31', '3');
INSERT INTO `om_menu_role` VALUES ('1', '311', '31');
INSERT INTO `om_menu_role` VALUES ('1', '312', '31');
INSERT INTO `om_menu_role` VALUES ('1', '313', '31');
INSERT INTO `om_menu_role` VALUES ('1', '314', '31');
INSERT INTO `om_menu_role` VALUES ('1', '4', '');
INSERT INTO `om_menu_role` VALUES ('1', '40', '4');
INSERT INTO `om_menu_role` VALUES ('1', '401', '40');
INSERT INTO `om_menu_role` VALUES ('1', '402', '40');
INSERT INTO `om_menu_role` VALUES ('1', '403', '40');
INSERT INTO `om_menu_role` VALUES ('1', '41', '4');
INSERT INTO `om_menu_role` VALUES ('1', '411', '41');
INSERT INTO `om_menu_role` VALUES ('1', '412', '41');
INSERT INTO `om_menu_role` VALUES ('1', '413', '41');
INSERT INTO `om_menu_role` VALUES ('1', '414', '41');
INSERT INTO `om_menu_role` VALUES ('1', '42', '4');
INSERT INTO `om_menu_role` VALUES ('1', '421', '42');
INSERT INTO `om_menu_role` VALUES ('1', '422', '42');
INSERT INTO `om_menu_role` VALUES ('1', '5', '');
INSERT INTO `om_menu_role` VALUES ('1', '50', '5');
INSERT INTO `om_menu_role` VALUES ('1', '51', '5');
INSERT INTO `om_menu_role` VALUES ('1', '52', '5');
INSERT INTO `om_menu_role` VALUES ('1', '53', '5');
INSERT INTO `om_menu_role` VALUES ('1', '54', '5');
INSERT INTO `om_menu_role` VALUES ('1', '55', '5');
INSERT INTO `om_menu_role` VALUES ('1', '56', '5');
INSERT INTO `om_menu_role` VALUES ('1', '57', '5');
INSERT INTO `om_menu_role` VALUES ('2', '1', '');
INSERT INTO `om_menu_role` VALUES ('2', '10', '1');
INSERT INTO `om_menu_role` VALUES ('2', '11', '1');
INSERT INTO `om_menu_role` VALUES ('2', '4', '');
INSERT INTO `om_menu_role` VALUES ('2', '40', '1');
INSERT INTO `om_menu_role` VALUES ('2', '401', '40');
INSERT INTO `om_menu_role` VALUES ('2', '402', '4');
INSERT INTO `om_menu_role` VALUES ('3', '1', '');
INSERT INTO `om_menu_role` VALUES ('3', '10', '1');
INSERT INTO `om_menu_role` VALUES ('3', '30', '4');
INSERT INTO `om_menu_role` VALUES ('3', '302', '30');
INSERT INTO `om_menu_role` VALUES ('3', '303', '30');
INSERT INTO `om_menu_role` VALUES ('3', '304', '30');
INSERT INTO `om_menu_role` VALUES ('3', '305', '30');
INSERT INTO `om_menu_role` VALUES ('3', '306', '30');
INSERT INTO `om_menu_role` VALUES ('3', '307', '30');
INSERT INTO `om_menu_role` VALUES ('3', '308', '30');
INSERT INTO `om_menu_role` VALUES ('3', '33', '10');
INSERT INTO `om_menu_role` VALUES ('3', '331', '33');
INSERT INTO `om_menu_role` VALUES ('3', '34', '10');
INSERT INTO `om_menu_role` VALUES ('3', '341', '34');
INSERT INTO `om_menu_role` VALUES ('3', '342', '34');
INSERT INTO `om_menu_role` VALUES ('3', '343', '34');
INSERT INTO `om_menu_role` VALUES ('3', '4', '');
INSERT INTO `om_menu_role` VALUES ('3', '40', '4');
INSERT INTO `om_menu_role` VALUES ('3', '401', '40');
INSERT INTO `om_menu_role` VALUES ('3', '402', '40');
INSERT INTO `om_menu_role` VALUES ('6', '1', '');
INSERT INTO `om_menu_role` VALUES ('6', '10', '1');
INSERT INTO `om_menu_role` VALUES ('6', '11', '1');
INSERT INTO `om_menu_role` VALUES ('6', '12', '1');
INSERT INTO `om_menu_role` VALUES ('6', '14', '1');

-- ----------------------------
-- Table structure for om_table_list
-- ----------------------------
DROP TABLE IF EXISTS `om_table_list`;
CREATE TABLE `om_table_list` (
  `TABLE_NAME` varchar(30) NOT NULL,
  `TABLE_DESC` varchar(30) NOT NULL,
  `SYSTEM` varchar(10) NOT NULL,
  `PARAMETER` varchar(10) DEFAULT NULL,
  `SEARCH_COLUMN` varchar(300) DEFAULT NULL,
  `EIDT_COLUMNS` varchar(300) DEFAULT NULL COMMENT '单表可见参数',
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of om_table_list
-- ----------------------------
INSERT INTO `om_table_list` VALUES ('AC_BRANCH', '机构清算层级', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('AC_SUBJECT', '科目定义', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CD_CARD_BIN', '卡BIN', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_CATEGORY_TYPE', '客户细类', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_1', '客户分类1', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_2', '客户分类2', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_3', '客户分类3', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_4', '客户分类4', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_5', '客户分类5', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_LEVEL', '客户等级', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_CLIENT_NATURE_DEF', '客户属性', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_CLIENT_TYPE', '客户类型', 'KBS', 'init', 'CLIENT_TYPE,CLIENT_TYPE_DESC', 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_CONTACT_TYPE', '联系类型', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_CR_RATING', '信用等级', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_DOCUMENT_EXP', '证件到期管理', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_DOCUMENT_TYPE', '证件类型', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_EDUCATION', '教育程度', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_INDUSTRY', '工业代码', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_OCCUPATION', '职业分类', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_QUALIFICATION', '职称定义', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_RELATION_TYPE', '客户关系类型', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_RESIDENT_TYPE', '居住类型', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('CIF_SALUTATION', '称呼类型', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('DC_STAGE_DEFINE', '期次定义表', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('DC_STAGE_INT', '期次管理利率信息表', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_ACCT_EXEC', '客户经理', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_BANK', '银行信息', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_BANK_HIERARCHY', '机构层级', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_BRANCH', '机构信息', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_BRANCH_CCY', '分行经营币种', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_BRANCH_REGION_DEF', '机构自定义区域设置', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_CCY_HOLIDAY', '货币假日', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_CHANNEL', '渠道信息', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_CHARGE_DEFINE', '服务费定义', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_CITY', '城市信息', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_COMPANY', '法人信息', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_COUNTER_PARTY', '交易对手', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_COUNTRY', '国家信息', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_CURRENCY', '币种信息', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_DEPARTMENT', '部门信息', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_DIST_CODE', '地区代码', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_ECON_DIST', '经济特区', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_EXCHANGE_TRAN_CODE', '结售汇项目编码', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_FAKE_COIN_DEF', '劵别信息表', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_FTA_BRANCH', '自贸区结构表', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_LOC_HOLIDAY', '地区假日', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_PASSWORD_FAILURE_TIMES', '密码错误次数参数', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_PERIOD_FREQ', '周期频率', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_PROFIT_CENTRE', '利润中心', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_REF_CODE', '系统内部预定义参数', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_REGION', '区域代码', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_REGION_CODE_USERDEF', '自定义区域代码定义', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_REGION_TYPE_USERDEF', '自定义区域类型定义', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_SEQ_TYPE', '序列类型', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_SEQ_TYPE_DTL', '序列信息', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_SEQ_TYPE_RULE', '序列规则定义', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_SETTLE_METHOD', '结算方式', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_STATE', '省州信息', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_STRUCTURE_DIGIT_POS', '结构位置', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_STRUCTURE_PARAM', '结构参数', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_STRUCTURE_TYPE', '结构类型', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_SUB_BRANCH_TBL', '分行定义', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_SYSTEM', '系统参数', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('FM_USER', '用户', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('GL_ACCOUNTING', '分录定义', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('GL_ACCT_TYPE', '总账账户类型', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('GL_AMOUNT_MAPPING', '金额类型映射', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('GL_AMOUNT_TYPE', '金额类型', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('GL_CCY_CTRL_ACCT_TBL', '损益重估科目', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('GL_CCY_RULE', '币种规则', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('GL_CUSTOM_RULE', '自定义规则', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('GL_EVENT_MAPPING', '事件类型映射', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('GL_EVENT_TYPE', '事件类型', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('GL_PROD_ACCOUNTING', '产品科目', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('GL_PROD_MAPPING', '产品映射', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('GL_PROD_RULE', '产品分录规则', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_OUT_PAY_TYPE', '对外缴存准备金定义', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_PAY_CCY', '缴存范围定义', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('GL_SYSTEM', '核算系统', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('GL_TRAN_MAPPING', '交易映射', 'GLR', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_AMT_EXPRESSION', '金额计算达式信息', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_AMT_SPLIT', '金额分段参数表', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_BASIS_RATE', '基准利率信息', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_CCY_RATE', '汇率牌价', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_DUAD_CCY_RATE', '货币对汇率牌价', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_ELEMENT', '因子', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_ELEMENT_GROUP', '因子分组定义表', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_EXCHANGE_TYPE', '汇率类型', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_FEE_CLIENT_TYPE', '费率客户类型关系', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_FEE_ITEM', '费用项目表', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_FEE_MAPPING', '费用启用规则', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_FEE_MATRIX', '费率矩阵信息', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_FEE_PACKAGE', '费用套餐表', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_FEE_PACKAGE_MAP', '费用套餐费用类型关联表', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_FEE_PROFIT_DISTRIBUTION', '分润规则', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_FEE_RATE', '费率信息', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_FEE_TYPE', '费率类型', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_INT_BASIS', '基准利率类型', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_INT_MATRIX', '利率阶梯信息', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_INT_RATE', '利率信息', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_INT_TYPE', '利率类型', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_MARKET_FACTOR_INFO', '市场指数信息', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_PERI_SPLIT', '周期分段参数', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_PROD_INT', '产品利率信息', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_PROD_TYPE', '产品类型', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_RISK_SETING', '利率风险设置', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_RULE_GROUP', '规则分组定义', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_RULE_MESSAGE', '规则信息', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('IRL_SYSTEM', '系统信息', 'UP', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('LM_TRAN_LIMIT_DEF', '交易限额定义', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('LM_TRAN_LIMIT_LINK', '限额链接', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_ACCOUNTING_STATUS', '核算状态变化规则配置', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_ACCT_CLOSE_REASON', '账户销户原因定义', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_ACCT_LINKMAN_TYPE', '账户联系人类型', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_ACCT_NATURE_DEF', '账户属性定义', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_ACCT_NATURE_RESTRAINTS', '账户属性与账户限制关联配置', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_ANALYSIS1', '分析类型1', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_ANALYSIS2', '分析类型2', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_ANALYSIS3', '分析类型3', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_ANNUAL_SURVEY', '账户年检管理', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_ATTR_TYPE', '参数定义表', 'KBS', 'init', null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_ATTR_VALUE', '参数值定义表', 'KBS', 'init', null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_BRANCH_PROD', '机构产品表', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_CASH_ITEM', '现金项目定义', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_CLEAN_PARAMETER', '账户清理参数表', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_COLLAT_TYPE', '抵押品类型', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_COMMISSION_PARAMETER', '交易代办人参数表', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_EXCHANGE_TRAN_TYPE', '结售汇交易类型', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_FIN_AGRT_TYPE', '活期理财协议', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_OPEN_CTL', '开户数量控制', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_PROD_CHARGE', '收费定义表', 'prod', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_PROD_DEFINE', '产品属性表', 'prod', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_PROD_MUTUAL', '产品互斥参数表', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_PROD_TYPE', '产品定义', 'KBS', 'init', '', 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_PURPOSE', '资金用途', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_REASON_CODE', '原因代码', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_RENEWAL_TYPE', '理财定期账户定义', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_SETTLE_ACCT_MAPPING', '结算账户分类映射', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_SETTLE_BRANCH', '结算机构', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_SETTLE_TRAN_MAPPING', '结算交易类型映射', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_STAGE_INFO', '期次信息表', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_TRAN_CONTROL', '卡交易控制', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('MB_TRAN_DEF', '交易类型定义', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('RC_LIST_CATEGORY', '名单种类定义', 'KBS', null, null, 'ALL');
INSERT INTO `om_table_list` VALUES ('RC_LIST_CHECK_RULE', '名单类型限制规则', 'KBS', null, null, 'ALL');

