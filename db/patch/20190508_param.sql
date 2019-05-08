/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50516
Source Host           : 127.0.0.1:3306
Source Database       : ensemble-om-tj

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2019-05-08 15:08:03
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
INSERT INTO `om_menu` VALUES ('3', '11', '', '1', '2', 'A', 'widgets', 'userIndexFlow', '我的工作台');
INSERT INTO `om_menu` VALUES ('4', '12', '', '1', '2', 'A', 'widgets', 'prodWindow', '产品展示');
INSERT INTO `om_menu` VALUES ('5', '13', '', '1', '2', 'A', 'widgets', 'prodCmbs', '产品目录');
INSERT INTO `om_menu` VALUES ('6', '14', '', '1', '2', 'A', 'favorite_border', 'collectProduct', '我收藏的产品');
INSERT INTO `om_menu` VALUES ('7', '3', '', '', '1', 'A', '', null, '产品工厂');
INSERT INTO `om_menu` VALUES ('8', '30', '', '3', '2', 'A', 'account_balance', null, '存款产品');
INSERT INTO `om_menu` VALUES ('25', '31', ' ', '3', '2', 'A', 'account_balance', '', '内部账产品');
INSERT INTO `om_menu` VALUES ('36', '4', '', '', '1', 'A', 'account_balance', null, '参数工厂');
INSERT INTO `om_menu` VALUES ('37', '40', '', '4', '2', 'A', 'view_list', null, '参数管理');
INSERT INTO `om_menu` VALUES ('38', '401', 'RB', '40', '3', 'A', null, 'paramManageRb', '存款系统参数');
INSERT INTO `om_menu` VALUES ('39', '402', 'PF', '40', '3', 'A', null, 'paramManagePf', '产品利率参数');
INSERT INTO `om_menu` VALUES ('40', '403', 'AC', '40', '3', 'A', null, 'paramManageAc', '核算系统参数');
INSERT INTO `om_menu` VALUES ('41', '41', '', '4', '2', 'A', 'view_list', null, '交易管理');
INSERT INTO `om_menu` VALUES ('42', '411', '', '41', '3', 'A', '', 'systemManage', '交易系统管理');
INSERT INTO `om_menu` VALUES ('44', '413', '', '41', '3', 'A', null, 'tableListManage', '交易属性管理');
INSERT INTO `om_menu` VALUES ('45', '414', '', '41', '3', 'A', null, 'tableColumnManage', '元数据管理');
INSERT INTO `om_menu` VALUES ('46', '42', '', '4', '2', 'A', 'view_list', null, '部件管理');
INSERT INTO `om_menu` VALUES ('47', '421', ' ', '42', '3', 'A', null, 'MbPartClass', '部件分类管理');
INSERT INTO `om_menu` VALUES ('48', '422', ' ', '42', '3', 'A', null, 'MbPartType', '部件属性管理');
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
INSERT INTO `om_menu` VALUES ('89', '404', 'CIF', '40', '3', 'A', null, 'paramManageCif', '客户系统参数');
INSERT INTO `om_menu` VALUES ('90', '405', 'BO', '40', '3', 'A', null, 'paramManageBo', '运营系统参数');
INSERT INTO `om_menu` VALUES ('91', '406', 'CM', '40', '3', 'A', null, 'paramManageCm', '公共参数');

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
INSERT INTO `om_menu_role` VALUES ('1', '404', '40');
INSERT INTO `om_menu_role` VALUES ('1', '405', '40');
INSERT INTO `om_menu_role` VALUES ('1', '406', '40');
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
  `LOAD_MODEL` varchar(10) DEFAULT NULL,
  `LOAD_PATH` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of om_table_list
-- ----------------------------
INSERT INTO `om_table_list` VALUES ('AC_BRANCH', '清算规则表', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('AC_SUBJECT', '会计科目表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('BATCH_AC_SUBJECT', '会计科目表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CD_AREA_DEF', '地区参数表', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CD_CARD_BIN', '卡bin参数表', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_BUSINESS', '行业代码表 ', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CATEGORY_TYPE', '客户类型-细分类表', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_1', '客户分类1', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_2', '客户分类2', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_3', '客户分类3', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_4', '客户分类4', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_5', '客户分类5', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_LEVEL', '参数表', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLIENT_NATURE_DEF', '客户属性定义', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLIENT_STATUS', '客户状态', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLIENT_TAXPAYER', '纳税人类型码值表', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLIENT_TYPE', '客户类型-大类表', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CONTACT_TYPE', '联系类型', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CR_RATING', '信用等级表', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_DOCUMENT_EXP', '证件到期管理表', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_DOCUMENT_TYPE', '证件类型', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_EDUCATION', '教育程度', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_INDUSTRY', '通用行业代码', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_MERCHANT_TYPE_DEF', '商户类型定义表', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_OCCUPATION', '职业分类表', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_QUALIFICATION', '职称定义表', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_RELATION_TYPE', '客户关系类型', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_RESIDENT_TYPE', '居住类型表', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_RESTRAINT_TYPE', '账户限制类型定义表', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_SALUTATION', '称呼类型表', 'CIF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_BANK', '外部金融机构定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_BANK_HIERARCHY', '机构层次表', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_BRANCH', '机构信息表 ', 'BO,AC,RB', 'busi', '', 'ALL', 'M', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_BRANCH_CCY', '机构币种定义表', 'RB,BO', 'busi', '', 'ALL', 'M', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_BRANCH_REGION_DEF', '机构自定义区域设置', 'RB,BO', 'busi', '', 'ALL', 'M', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_BRCHSTATUS_DETAIL', '机构登记簿', 'RB,BO', 'busi', '', 'ALL', 'M', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_CCY_HOLIDAY', '币种节假日定义 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_CHANNEL', '渠道类型 ', 'RB,BO', 'busi', '', 'ALL', 'M', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_CITY', '城市代码 ', 'RB,BO', 'busi', '', 'ALL', 'M', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_COMPANY', '法人定义表 ', 'RB,BO', 'busi', '', 'ALL', 'M', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_COUNTER_PARTY', '交易对手定义', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_COUNTRY', '国家代码 国家的基本信息表 ', 'RB,BO', 'busi', '', 'ALL', 'M', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_CURRENCY', '币种基本信息表 ', 'RB,BO', 'busi', '', 'ALL', 'M', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_DEFAULT_RATE_TYPE', '公共汇率类型定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_DEPARTMENT', '部门信息表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_DIST_CODE', '地区代码 此表作为静态参数表 ', 'RB,BO', 'busi', '', 'ALL', 'M', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_EXCHANGE_TRAN_CODE', '结售汇项目编码表', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_EXTERNAL_BRANCH', '外部金融机构分行表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_EX_UNCHANGE_BRANCH', '汇率平盘机构定义', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_FAT_BRANCH', '自贸区结构表', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_FAT_DEF', '自贸区代码定义', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_GAP_PERIOD', '敞口期限信息', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_GAP_TYPE', '敞口类型定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_LOC_HOLIDAY', '地区节假日 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_MODULE', '模块说明表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_NATURE_CLASS', '账户属性值表', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_PARAMETER', '公共业务参数表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_PERIOD_FREQ', '周期频率表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_PROFIT_CENTRE', '利润中心 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_REF_CODE', '系统内部预定义参数表', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_REGION', '区域代码 地区基本信息 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_REGION_CODE_USERDEF', '自定义区域代码定义', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_REGION_TYPE_USERDEF', '自定义区域类型定义', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_SEQ_TYPE', '序列类型定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_SEQ_TYPE_DTL', '序列类型详细信息表', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_SEQ_TYPE_RULE', '序列规则定义表', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_STATE', '省、州信息表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_STRUCTURE_ATTR', '结构属性定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_STRUCTURE_CONV', '结构转化规则定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_STRUCTURE_DIGIT_POS', '结构数字校验位定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_STRUCTURE_PARAM', '结构参数定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_STRUCTURE_TYPE', '结构类型定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_SUB_BRANCH_TBL', '分行定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_SYSTEM', '系统业务参数表 ', 'BO', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_USER', '核心柜员信息表', 'BO', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_ACCOUNTING', '分录定义表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_ACCT_TYPE', '总账产品定义 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_ADJUST_DEF', '损益结转定义表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_AMOUNT_MAPPING', '金额映射表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_AMOUNT_TYPE', '金额类型表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_BRANCH', '机构信息表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_CCY_CTRL_ACCT_TBL', '汇兑损益重估科目定义 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_CCY_RATE', '核算同步利率市场化汇率表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_CCY_RULE', '币种规则表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_CODE_TRANSFER_DEF', '科目划转定义表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_CURRENCY_SEQNO_DEF', '币种序号定义表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_CUSTOM_RULE', '自定义规则表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_EVENT_MAPPING', '事件类型映射表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_EVENT_TYPE', '事件类型表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_IRL_CCY_RATE', '汇率牌价表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_IRL_DUAD_CCY_RATE', '货币对汇率牌价表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_IRL_EXCHANGE_TYPE', '汇率类型表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_NOGEN_RULE', '免于生成分录规则表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_PROD_ACCOUNTING', '产品科目表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_PROD_CODE_MAPPING', '产品科目映射表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_PROD_MAPPING', '产品映射表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_PROD_RULE', '产品分录规则表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_CCY', '准备金缴存币种信息表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_GAT_BRANCH', '准备金缴存配置表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_OUT_PAY_TYPE', '对外缴存准备金定义 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_PAY_CCY', '缴存范围定义 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_PAY_SUBJECT', '科目范围定义 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_PAY_TYPE', '对内准备金缴存定义 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_SUBJECT', '缴存科目定义 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_TYPE', '准备金缴存类型定义表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_REVAL_PARAM', '汇兑损益重估参数定义表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_SYSTEM', '总帐系统参数表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_TAXRATE_DEFINE', '增值税税率类型定义表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_TRAN_MAPPING', '交易映射表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_AMT_EXPRESSION', '金额计算表达式信息表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_AMT_SPLIT', '金额分段参数表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_BASIS_RATE', '基准利率信息表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_CCY_RATE', '汇率牌价表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_DATE_MAPPING', '因子映射表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_DUAD_CCY_RATE', '货币对汇率牌价表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_ELEMENT', '因子表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_ELEMENT_GROUP', '因子分组定义表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_EXCHANGE_TYPE', '汇率类型表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_FEE_CLIENT_TYPE', '费率客户类型关系表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_FEE_ITEM', '费用项目表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_FEE_MAPPING', '费用启用规则表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_FEE_MATRIX', '费率矩阵信息表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_FEE_PROFIT_DISTRIBUTION', '分润规则表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_FEE_RATE', '费率信息表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_FEE_TYPE', '费用类型表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_INT_BASIS', '基准利率类型表', 'AC,PF', 'busi', '', 'ALL', 'M', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_INT_MATRIX', '利率税率阶梯表', 'AC,PF', 'busi', '', 'ALL', 'M', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_INT_RATE', '利率税率信息表', 'AC,PF', 'busi', '', 'ALL', 'M', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_INT_TYPE', '利率税率类型表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_MARKET_FACTOR_INFO', '市场指数信息表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_PERI_SPLIT', '周期分段参数表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_RISK_SETING', '利率风险设置表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_RULE_GROUP', '规则分组定义表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_RULE_MESSAGE', '规则信息表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_SYSTEM', '系统信息表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('IRL_TAXRATE_DEFINE', '税率类型定义表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('MB_ATTR_CLASS', '参数分类定义表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('MB_EVENT_CLASS', '事件分类定义表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('MB_EVENT_DEFAULT_TYPE', '产品基础事件定义表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('MB_PART_CTL', '指标控制表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('MB_PRICE_FEE_DEFINE', '价税分离范围定义表 ', 'AC', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('MB_PROD_CLASS', '产品分类定义表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('MB_PROD_MARKET_AREA', '产品营销地区表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('MB_PROD_MUTUAL', '产品互斥参数表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('MB_PROD_PERFERENCE', '产品利率优惠表', 'PF', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_ACCT_CLOSE_REASON', '账户销户原因定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_ACCT_LINKMAN_TYPE', '账户联系人类型表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_ACCT_NATURE_DEF', '账户属性定义 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_ACCT_NATURE_RESTRAINTS', '账户属性与账户限制关联配置 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_AMT_CALC_TYPE', '金额计算类型定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_ANNUAL_SURVEY', '账户年检管理表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_AVAILBAL_CALC_TYPE', '可用余额计算类型定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_CASH_ITEM', '现金项目定义 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_CERTIFICATE_TYPE', '产权证明种类 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_CLEAN_PARAMETER', '账户清理参数表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_DEP_WTD_TRAN_TYPE', '存入支取交易类型定义表', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_EXCHANGE_TRAN_TYPE', '结售汇交易类型  ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_FILE_DIR', '核心文件路径配置表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_FILE_TABLE_DEF', '根据配置属性生成数据文件 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_FIN_AGRT_TYPE', '活期理财协议表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_FUND_TRAN_CTL', '账户类别交易控制表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_LINK_CONDITION', '链接条件定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_OPEN_CTL', '开户数量控制表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_PARAMETER', '存款参数表  ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_PASSWORD_TYPE', '密码类型参数表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_PCP_GROUP_DEF', '资金池账户组定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_PCP_PARAMETER', '资金池参数表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_PROD_AMEND_MAPING', '产品变更映射表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_PROD_CHARGE', '产品类型费用类型关联表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_PURPOSE', '资金用途 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_REASON_CODE', '原因代码 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_RENEWAL_TYPE', '定期产品比例定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_RESTRAINT_TYPE', '账户限制类型定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_SETTLE_ACCT_CLASS', '结算账户分类定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_SETTLE_ACCT_MAPPING', '结算账户分类映射表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_SETTLE_TRAN_MAPPING', '结算交易类型映射表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_STAGE_INFO', '期次信息表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_STAGE_INT', '期次管理利率信息表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_STAT_AMT_DEFINE', '账户统计金额定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_TRAN_CONTROL', '交易控制表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_TRAN_DEF', '交易类型定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_TRAN_LIMIT_DEF', '限额定义表 ', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_TRAN_PURPOSE', '交易目的表', 'RB', 'busi', '', 'ALL', 'S', 'tableInfo');
