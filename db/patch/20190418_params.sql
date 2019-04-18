/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50516
Source Host           : 127.0.0.1:3306
Source Database       : ensemble-om-tj

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2019-04-18 09:13:38
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
  `ATTR_TYPE` varchar(30) NOT NULL DEFAULT '' COMMENT '参数KEY',
  `ATTR_VALUE` varchar(400) NOT NULL COMMENT '参数值',
  `STATUS` varchar(3) NOT NULL COMMENT '状态',
  `COMPANY` varchar(20) DEFAULT NULL COMMENT '法人代码',
  `TRAN_TIMESTAMP` varchar(17) DEFAULT NULL COMMENT '交易时间戳',
  `TRAN_TIME` decimal(11,0) DEFAULT NULL COMMENT '交易时间',
  `PAGE_CODE` varchar(20) NOT NULL,
  `PAGE_SEQ_NO` int(10) NOT NULL,
  `PER_EFFECT` varchar(10) DEFAULT NULL,
  `OPTION_PERMISSIONS` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`PROD_TYPE`,`EVENT_TYPE`,`ASSEMBLE_TYPE`,`ASSEMBLE_ID`,`ATTR_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品定义表 undefined';
