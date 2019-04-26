/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50643
 Source Host           : localhost:3306
 Source Schema         : om

 Target Server Type    : MySQL
 Target Server Version : 50643
 File Encoding         : 65001

 Date: 26/04/2019 10:03:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for om_prod_page_define
-- ----------------------------
DROP TABLE IF EXISTS `om_prod_page_define`;
CREATE TABLE `om_prod_page_define`  (
  `PAGE_CLASS` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '页签分类',
  `PAGE_CLASS_DESC` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '页签分类描述',
  `PAGE_CODE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '页签key',
  `PAGE_DESC` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '页签描述',
  `REMARKS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `PAGE_NUM` int(5) NULL DEFAULT NULL COMMENT '标签位置',
  PRIMARY KEY (`PAGE_CLASS`, `PAGE_CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '页签信息定义表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of om_prod_page_define
-- ----------------------------
INSERT INTO `om_prod_page_define` VALUES ('CLGROUPPROD', '贷款组合产品', 'ACCT', '账户信息', NULL, 3);
INSERT INTO `om_prod_page_define` VALUES ('CLGROUPPROD', '贷款组合产品', 'AMEND', '变更信息', NULL, 14);
INSERT INTO `om_prod_page_define` VALUES ('CLGROUPPROD', '贷款组合产品', 'APPLY', '适用范围', NULL, 4);
INSERT INTO `om_prod_page_define` VALUES ('CLGROUPPROD', '贷款组合产品', 'BASE', '产品信息', NULL, 2);
INSERT INTO `om_prod_page_define` VALUES ('CLGROUPPROD', '贷款组合产品', 'CLACCOUNTI', '核算信息', NULL, 15);
INSERT INTO `om_prod_page_define` VALUES ('CLGROUPPROD', '贷款组合产品', 'CONTROL', '控制信息', NULL, 5);
INSERT INTO `om_prod_page_define` VALUES ('CLGROUPPROD', '贷款组合产品', 'DESC', '基本描述', NULL, 1);
INSERT INTO `om_prod_page_define` VALUES ('CLGROUPPROD', '贷款组合产品', 'DISC', '贴息定义', '', 10);
INSERT INTO `om_prod_page_define` VALUES ('CLGROUPPROD', '贷款组合产品', 'DRW', '放款定义', NULL, 9);
INSERT INTO `om_prod_page_define` VALUES ('CLGROUPPROD', '贷款组合产品', 'DUE', '到期定义', NULL, 12);
INSERT INTO `om_prod_page_define` VALUES ('CLGROUPPROD', '贷款组合产品', 'GROUP', '关联产品', NULL, 6);
INSERT INTO `om_prod_page_define` VALUES ('CLGROUPPROD', '贷款组合产品', 'INT', '利息信息', NULL, 7);
INSERT INTO `om_prod_page_define` VALUES ('CLGROUPPROD', '贷款组合产品', 'OPEN', '开户定义', NULL, 8);
INSERT INTO `om_prod_page_define` VALUES ('CLGROUPPROD', '贷款组合产品', 'RATEINFO', '利率信息', NULL, 13);
INSERT INTO `om_prod_page_define` VALUES ('CLGROUPPROD', '贷款组合产品', 'REC', '还款定义', NULL, 11);
INSERT INTO `om_prod_page_define` VALUES ('CLPRODPUBLISH', '贷款非组合产品', 'ACCT', '账户信息', NULL, 3);
INSERT INTO `om_prod_page_define` VALUES ('CLPRODPUBLISH', '贷款非组合产品', 'AMEND', '变更信息', NULL, 13);
INSERT INTO `om_prod_page_define` VALUES ('CLPRODPUBLISH', '贷款非组合产品', 'APPLY', '适用范围', NULL, 4);
INSERT INTO `om_prod_page_define` VALUES ('CLPRODPUBLISH', '贷款非组合产品', 'BASE', '产品信息', NULL, 2);
INSERT INTO `om_prod_page_define` VALUES ('CLPRODPUBLISH', '贷款非组合产品', 'CLACCOUNTI', '核算信息', NULL, 14);
INSERT INTO `om_prod_page_define` VALUES ('CLPRODPUBLISH', '贷款非组合产品', 'CONTROL', '控制信息', NULL, 5);
INSERT INTO `om_prod_page_define` VALUES ('CLPRODPUBLISH', '贷款非组合产品', 'DESC', '基本描述', NULL, 1);
INSERT INTO `om_prod_page_define` VALUES ('CLPRODPUBLISH', '贷款非组合产品', 'DISC', '贴息定义', '', 9);
INSERT INTO `om_prod_page_define` VALUES ('CLPRODPUBLISH', '贷款非组合产品', 'DRW', '放款定义', NULL, 8);
INSERT INTO `om_prod_page_define` VALUES ('CLPRODPUBLISH', '贷款非组合产品', 'DUE', '到期定义', NULL, 11);
INSERT INTO `om_prod_page_define` VALUES ('CLPRODPUBLISH', '贷款非组合产品', 'INT', '利息信息', NULL, 6);
INSERT INTO `om_prod_page_define` VALUES ('CLPRODPUBLISH', '贷款非组合产品', 'OPEN', '开户定义', NULL, 7);
INSERT INTO `om_prod_page_define` VALUES ('CLPRODPUBLISH', '贷款非组合产品', 'RATEINFO', '利率信息', NULL, 12);
INSERT INTO `om_prod_page_define` VALUES ('CLPRODPUBLISH', '贷款非组合产品', 'REC', '还款定义', NULL, 10);
INSERT INTO `om_prod_page_define` VALUES ('GLPRODPUBLISH', '内部账产品', 'ACCOUNTING', '核算信息', NULL, 11);
INSERT INTO `om_prod_page_define` VALUES ('GLPRODPUBLISH', '内部账产品', 'APPLY', '适用范围', NULL, 4);
INSERT INTO `om_prod_page_define` VALUES ('GLPRODPUBLISH', '内部账产品', 'BASE', '产品信息', NULL, 2);
INSERT INTO `om_prod_page_define` VALUES ('GLPRODPUBLISH', '内部账产品', 'CLOSE', '销户定义', NULL, 7);
INSERT INTO `om_prod_page_define` VALUES ('GLPRODPUBLISH', '内部账产品', 'CONTROL', '控制信息', NULL, 3);
INSERT INTO `om_prod_page_define` VALUES ('GLPRODPUBLISH', '内部账产品', 'CRET', '贷记事件', NULL, 8);
INSERT INTO `om_prod_page_define` VALUES ('GLPRODPUBLISH', '内部账产品', 'DEBT', '借记事件', NULL, 9);
INSERT INTO `om_prod_page_define` VALUES ('GLPRODPUBLISH', '内部账产品', 'DESC', '基本描述', NULL, 1);
INSERT INTO `om_prod_page_define` VALUES ('GLPRODPUBLISH', '内部账产品', 'INT', '利息信息', NULL, 5);
INSERT INTO `om_prod_page_define` VALUES ('GLPRODPUBLISH', '内部账产品', 'OPEN', '开户定义', NULL, 6);
INSERT INTO `om_prod_page_define` VALUES ('GLPRODPUBLISH', '内部账产品', 'RATEINFO', '利率信息', NULL, 10);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODFIXED', '期次产品', 'ACCOUNTING', '核算信息', NULL, 12);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODFIXED', '期次产品', 'APPLY', '适用范围', NULL, 4);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODFIXED', '期次产品', 'BASE', '产品信息', NULL, 2);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODFIXED', '期次产品', 'CHARGE', '收费定义', NULL, 10);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODFIXED', '期次产品', 'CLOSE', '销户定义', NULL, 9);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODFIXED', '期次产品', 'CONTROL', '控制信息', NULL, 3);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODFIXED', '期次产品', 'CRET', '存入定义', NULL, 7);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODFIXED', '期次产品', 'DEBT', '支取定义', NULL, 8);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODFIXED', '期次产品', 'DESC', '基本描述', NULL, 1);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODFIXED', '期次产品', 'INT', '利率信息', NULL, 5);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODFIXED', '期次产品', 'OPEN', '开户定义', NULL, 6);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODFIXED', '期次产品', 'RATEINFO', '利率信息', NULL, 11);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODFIXED', '期次产品', 'STAGE', '期次信息', NULL, 13);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODGROUP', '组合产品（一本通类）', 'APPLY', '适用范围', NULL, 4);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODGROUP', '组合产品（一本通类）', 'BASE', '产品信息', NULL, 2);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODGROUP', '组合产品（一本通类）', 'CLOSE', '销户定义', NULL, 7);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODGROUP', '组合产品（一本通类）', 'CONTROL', '控制信息', NULL, 3);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODGROUP', '组合产品（一本通类）', 'DESC', '基本描述', NULL, 1);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODGROUP', '组合产品（一本通类）', 'GROUP', '关联产品', NULL, 5);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODGROUP', '组合产品（一本通类）', 'OPEN', '开户定义', NULL, 6);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODNOTT', '默认活期产品', 'ACCOUNTING', '核算信息', NULL, 13);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODNOTT', '默认活期产品', 'APPLY', '适用范围', NULL, 3);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODNOTT', '默认活期产品', 'BASE', '产品信息', NULL, 2);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODNOTT', '默认活期产品', 'CHARGE', '收费定义', NULL, 11);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODNOTT', '默认活期产品', 'CLOSE', '销户定义', NULL, 10);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODNOTT', '默认活期产品', 'CONTROL', '控制信息', NULL, 4);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODNOTT', '默认活期产品', 'CRET', '存入定义', NULL, 8);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODNOTT', '默认活期产品', 'DEBT', '支取定义', NULL, 9);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODNOTT', '默认活期产品', 'DESC', '基本描述', NULL, 1);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODNOTT', '默认活期产品', 'INT', '利息信息', NULL, 5);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODNOTT', '默认活期产品', 'OPEN', '开户定义', NULL, 7);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODNOTT', '默认活期产品', 'RATEINFO', '利率信息', NULL, 12);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODNOTT', '默认活期产品', 'SHIFT', '形态转移', NULL, 6);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODPCP', '协议存款（资金池）', 'APPLY', '适用范围', NULL, 3);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODPCP', '协议存款（资金池）', 'BASE', '产品信息', NULL, 2);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODPCP', '协议存款（资金池）', 'DESC', '基本描述', NULL, 1);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODPCP', '协议存款（资金池）', 'LIMIT', '额度/限额', NULL, 7);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODPCP', '协议存款（资金池）', 'PRICE', '定价信息', NULL, 6);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODPCP', '协议存款（资金池）', 'PROD', '产品定义', NULL, 4);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODPCP', '协议存款（资金池）', 'RULE', '规则定义', NULL, 5);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODT', '定期产品', 'ACCOUNTING', '核算信息', NULL, 12);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODT', '定期产品', 'APPLY', '适用范围', NULL, 3);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODT', '定期产品', 'BASE', '产品信息', NULL, 2);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODT', '定期产品', 'CHARGE', '收费定义', NULL, 10);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODT', '定期产品', 'CLOSE', '销户定义', NULL, 9);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODT', '定期产品', 'CONTROL', '控制信息', NULL, 4);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODT', '定期产品', 'CRET', '存入定义', NULL, 7);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODT', '定期产品', 'DEBT', '支取定义', NULL, 8);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODT', '定期产品', 'DESC', '基本描述', NULL, 1);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODT', '定期产品', 'INT', '利息信息', NULL, 5);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODT', '定期产品', 'OPEN', '开户定义', NULL, 6);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODT', '定期产品', 'RATEINFO', '利率信息', NULL, 11);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODYHT', '协议产品（YHT一户通）', 'APPLY', '适用范围', NULL, 3);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODYHT', '协议产品（YHT一户通）', 'BASE', '产品信息', NULL, 2);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODYHT', '协议产品（YHT一户通）', 'CLOSE', '销户定义', NULL, 7);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODYHT', '协议产品（YHT一户通）', 'CONTROL', '控制信息', NULL, 4);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODYHT', '协议产品（YHT一户通）', 'DESC', '基本描述', NULL, 1);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODYHT', '协议产品（YHT一户通）', 'INT', '利息信息', NULL, 5);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODYHT', '协议产品（YHT一户通）', 'OPEN', '开户定义', NULL, 6);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODZJZY', '协议存款（资金转移类）', 'APPLY', '适用范围', NULL, 3);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODZJZY', '协议存款（资金转移类）', 'BASE', '产品信息', NULL, 2);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODZJZY', '协议存款（资金转移类）', 'DESC', '基本描述', NULL, 1);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODZJZY', '协议存款（资金转移类）', 'IN', '转回定义', NULL, 5);
INSERT INTO `om_prod_page_define` VALUES ('RBPRODZJZY', '协议存款（资金转移类）', 'OUT', '转出定义', NULL, 4);

SET FOREIGN_KEY_CHECKS = 1;
