TRUNCATE TABLE fm_restraint_type;
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('001', 'AS', '终止账户所有金融操作', 'Y', 'Y', NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('002', 'BH', '账户余额止付', 'Y', 'Y', NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('003', 'FH', '账户资金圈存（系统用）', 'N', 'N', NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('004', 'AH', '有权机关金额冻结', 'Y', 'Y', NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, '3');
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('005', 'AS', '有权机关不收不付冻结', 'Y', 'Y', NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, '3');
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('006', 'BH', '有权机关只收不付冻结', 'Y', 'Y', NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, '3');
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('007', 'SD', '有权机关只付不收冻结', 'Y', 'Y', NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, '3');
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('008', 'AS', '临时冻结(48小时)', 'Y', 'Y', NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, '2');
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('009', 'MD', '不允许现金存入', 'Y', 'Y', NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('010', 'MW', '不允许现金支取', 'Y', 'Y', NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('011', 'TW', '不允许转出', 'Y', 'Y', NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('012', 'TD', '不允许转入', 'Y', 'Y', NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('014', 'SD', '停止存入交易', 'Y', 'Y', NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('015', 'SW', '临时户验资户到期只收不付', 'N', 'Y', NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('016', 'OW', '挂失专用止付', 'N', 'N', NULL, NULL, 'Y', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('017', 'FH', '账户余额止付(存款证明专用)', 'N', 'N', NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('018', 'CO', '仅允许现金业务', 'Y', 'Y', NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('019', 'HA', '账户保留余额', 'N', 'N', NULL, NULL, 'Y', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('020', 'SW', '暂停结算(只收不付)', 'Y', 'Y', NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('021', 'AS', '对公人民币结算户未核准账户不允许使用', 'N', 'N', NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('022', 'SW', '对公人民币结算户新开户三日内停止借记(系统用)', 'N', 'Y', NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('023', 'SW', '账户未年检止付', 'Y', 'Y', NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('024', 'SW', '六个月内未发生交易暂停非柜面业务', 'N', 'Y', NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('025', 'SW', '存单质押止付', 'Y', 'Y', NULL, NULL, 'N', 'Z', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('027', 'FH', '保函保证金冻结(系统用)', 'N', 'N', NULL, NULL, 'Y', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('029', 'DC', '大额存单存单认购余额冻结专用', 'N', 'N', NULL, NULL, 'Y', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('030', 'FH', '理财资金冻结', 'N', 'N', NULL, NULL, 'N', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('032', 'FH', '账户余额止付（贷款专用）', 'N', 'N', NULL, NULL, 'Y', 'N', NULL, NULL, NULL, '-1');
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('099', 'BH', '证件到期止付', 'N', 'Y', NULL, NULL, 'Y', 'N', NULL, NULL, NULL, NULL);
INSERT INTO fm_restraint_type (RESTRAINT_TYPE, RESTRAINT_CLASS, RESTRAINT_DESC, MANUAL_RES_FLAG, MANUAL_UNRES_FLAG, EOD_IMPOUND_FALG, STOP_WTD_FALG, SYSTEM_USE_FLAG, AH_BU, COMPANY, TRAN_TIMESTAMP, TRAN_TIME, RES_PRIORITY) VALUES ('033', 'AS', '客户非面签III类户终止所有金融交易', 'N', 'N', NULL, NULL, 'Y', 'N', NULL, NULL, NULL, NULL);

COMMIT;