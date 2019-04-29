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
