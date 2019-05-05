/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : om

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 05/05/2019 18:25:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for om_table_list
-- ----------------------------
DROP TABLE IF EXISTS `om_table_list`;
CREATE TABLE `om_table_list`  (
  `TABLE_NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TABLE_DESC` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SYSTEM` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PARAMETER` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SEARCH_COLUMN` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EIDT_COLUMNS` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单表可见参数',
  `LOAD_MODEL` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LOAD_PATH` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of om_table_list
-- ----------------------------
INSERT INTO `om_table_list` VALUES ('AC_SUBJECT', '会计科目表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('BATCH_AC_SUBJECT', '会计科目表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_BUSINESS', '行业代码表 ', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CATEGORY_TYPE', '客户类型-细分类表', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_1', '客户分类1', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_2', '客户分类2', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_3', '客户分类3', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_4', '客户分类4', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_5', '客户分类5', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLASS_LEVEL', '参数表', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLIENT_NATURE_DEF', '客户属性定义', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLIENT_STATUS', '客户状态', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLIENT_TAXPAYER', '纳税人类型码值表', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CLIENT_TYPE', '客户类型-大类表', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CONTACT_TYPE', '联系类型', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_CR_RATING', '信用等级表', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_DOCUMENT_EXP', '证件到期管理表', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_DOCUMENT_TYPE', '证件类型', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_EDUCATION', '教育程度', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_INDUSTRY', '通用行业代码', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_MERCHANT_TYPE_DEF', '商户类型定义表', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_OCCUPATION', '职业分类表', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_QUALIFICATION', '职称定义表', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_RELATION_TYPE', '客户关系类型', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_RESIDENT_TYPE', '居住类型表', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_RESTRAINT_TYPE', '账户限制类型定义表', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('CIF_SALUTATION', '称呼类型表', 'CIF', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_BANK', '外部金融机构定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_BRANCH', '机构信息表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_CCY_HOLIDAY', '币种节假日定义 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_CHANNEL', '渠道类型 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_CITY', '城市代码 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_COMPANY', '法人定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_COUNTRY', '国家代码 国家的基本信息表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_CURRENCY', '币种基本信息表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_DEFAULT_RATE_TYPE', '公共汇率类型定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_DEPARTMENT', '部门信息表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_DIST_CODE', '地区代码 此表作为静态参数表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_EXTERNAL_BRANCH', '外部金融机构分行表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_GAP_TYPE', '敞口类型定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_LOC_HOLIDAY', '地区节假日 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_MODULE', '模块说明表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_PARAMETER', '公共业务参数表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_PERIOD_FREQ', '周期频率表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_PROFIT_CENTRE', '利润中心 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_REGION', '区域代码 地区基本信息 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_SEQ_TYPE', '序列类型定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_STATE', '省、州信息表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_STRUCTURE_ATTR', '结构属性定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_STRUCTURE_CONV', '结构转化规则定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_STRUCTURE_DIGIT_POS', '结构数字校验位定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_STRUCTURE_PARAM', '结构参数定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_STRUCTURE_TYPE', '结构类型定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_SUB_BRANCH_TBL', '分行定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('FM_SYSTEM', '系统业务参数表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_ACCOUNTING', '分录定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_ACCT_TYPE', '总账产品定义 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_ADJUST_DEF', '损益结转定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_AMOUNT_MAPPING', '金额映射表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_AMOUNT_TYPE', '金额类型表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_BRANCH', '机构信息表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_CCY_CTRL_ACCT_TBL', '汇兑损益重估科目定义 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_CCY_RATE', '核算同步利率市场化汇率表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_CCY_RULE', '币种规则表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_CODE_TRANSFER_DEF', '科目划转定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_CURRENCY_SEQNO_DEF', '币种序号定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_CUSTOM_RULE', '自定义规则表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_EVENT_MAPPING', '事件类型映射表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_EVENT_TYPE', '事件类型表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_IRL_CCY_RATE', '汇率牌价表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_IRL_DUAD_CCY_RATE', '货币对汇率牌价表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_IRL_EXCHANGE_TYPE', '汇率类型表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_NOGEN_RULE', '免于生成分录规则表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_PROD_ACCOUNTING', '产品科目表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_PROD_CODE_MAPPING', '产品科目映射表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_PROD_MAPPING', '产品映射表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_PROD_RULE', '产品分录规则表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_CCY', '准备金缴存币种信息表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_GAT_BRANCH', '准备金缴存配置表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_OUT_PAY_TYPE', '对外缴存准备金定义 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_PAY_CCY', '缴存范围定义 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_PAY_SUBJECT', '科目范围定义 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_PAY_TYPE', '对内准备金缴存定义 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_SUBJECT', '缴存科目定义 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_RESERVE_TYPE', '准备金缴存类型定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_REVAL_PARAM', '汇兑损益重估参数定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_SYSTEM', '总帐系统参数表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_TAXRATE_DEFINE', '增值税税率类型定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('GL_TRAN_MAPPING', '交易映射表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('MB_PRICE_FEE_DEFINE', '价税分离范围定义表 ', 'AC', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_ACCT_CLOSE_REASON', '账户销户原因定义表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_ACCT_LINKMAN_TYPE', '账户联系人类型表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_ACCT_NATURE_DEF', '账户属性定义 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_ACCT_NATURE_RESTRAINTS', '账户属性与账户限制关联配置 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_AMT_CALC_TYPE', '金额计算类型定义表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_ANNUAL_SURVEY', '账户年检管理表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_AVAILBAL_CALC_TYPE', '可用余额计算类型定义表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_CASH_ITEM', '现金项目定义 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_CERTIFICATE_TYPE', '产权证明种类 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_CLEAN_PARAMETER', '账户清理参数表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_DEP_WTD_TRAN_TYPE', '存入支取交易类型定义表', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_EXCHANGE_TRAN_TYPE', '结售汇交易类型  ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_FILE_DIR', '核心文件路径配置表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_FILE_TABLE_DEF', '根据配置属性生成数据文件 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_FIN_AGRT_TYPE', '活期理财协议表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_FUND_TRAN_CTL', '账户类别交易控制表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_LINK_CONDITION', '链接条件定义表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_OPEN_CTL', '开户数量控制表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_PARAMETER', '存款参数表  ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_PASSWORD_TYPE', '密码类型参数表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_PCP_GROUP_DEF', '资金池账户组定义表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_PCP_PARAMETER', '资金池参数表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_PROD_AMEND_MAPING', '产品变更映射表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_PROD_CHARGE', '产品类型费用类型关联表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_PURPOSE', '资金用途 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_REASON_CODE', '原因代码 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_RENEWAL_TYPE', '定期产品比例定义表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_RESTRAINT_TYPE', '账户限制类型定义表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_SETTLE_ACCT_CLASS', '结算账户分类定义表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_SETTLE_ACCT_MAPPING', '结算账户分类映射表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_SETTLE_TRAN_MAPPING', '结算交易类型映射表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_STAGE_INFO', '期次信息表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_STAGE_INT', '期次管理利率信息表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_STAT_AMT_DEFINE', '账户统计金额定义表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_TRAN_CONTROL', '交易控制表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_TRAN_DEF', '交易类型定义表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_TRAN_LIMIT_DEF', '限额定义表 ', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');
INSERT INTO `om_table_list` VALUES ('RB_TRAN_PURPOSE', '交易目的表', 'RB', 'busi', '', 'ALL', 'P', 'tableInfo');

SET FOREIGN_KEY_CHECKS = 1;
