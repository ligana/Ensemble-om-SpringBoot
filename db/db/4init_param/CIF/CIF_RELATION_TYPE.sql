TRUNCATE TABLE cif_relation_type;
INSERT INTO cif_relation_type (RELATION_TYPE, RELATION_DESC, COUNTER_REL, EXPOSURE, EQUITY, JOINT_ACCT, AUTHORISED, EMPLOYMENT, RELATIVE, SYMMENTRIC, JOIN_COLLAT, RELATION_TYPE_FLAG, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('BR', '分公司', 'BR', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'Y', '3', 'DCITS', NULL, NULL);
INSERT INTO cif_relation_type (RELATION_TYPE, RELATION_DESC, COUNTER_REL, EXPOSURE, EQUITY, JOINT_ACCT, AUTHORISED, EMPLOYMENT, RELATIVE, SYMMENTRIC, JOIN_COLLAT, RELATION_TYPE_FLAG, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('CH', '子公司', 'CH', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'Y', '3', 'DCITS', NULL, NULL);
INSERT INTO cif_relation_type (RELATION_TYPE, RELATION_DESC, COUNTER_REL, EXPOSURE, EQUITY, JOINT_ACCT, AUTHORISED, EMPLOYMENT, RELATIVE, SYMMENTRIC, JOIN_COLLAT, RELATION_TYPE_FLAG, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('CW', '同事', 'CW', 'Y', 'N', 'Y', 'Y', 'N', 'N', 'N', 'Y', '4', 'DCITS', NULL, NULL);
INSERT INTO cif_relation_type (RELATION_TYPE, RELATION_DESC, COUNTER_REL, EXPOSURE, EQUITY, JOINT_ACCT, AUTHORISED, EMPLOYMENT, RELATIVE, SYMMENTRIC, JOIN_COLLAT, RELATION_TYPE_FLAG, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('EM', '雇主', 'EM', 'N', 'N', 'Y', 'N', 'Y', 'N', 'N', 'N', '4', 'DCITS', NULL, NULL);
INSERT INTO cif_relation_type (RELATION_TYPE, RELATION_DESC, COUNTER_REL, EXPOSURE, EQUITY, JOINT_ACCT, AUTHORISED, EMPLOYMENT, RELATIVE, SYMMENTRIC, JOIN_COLLAT, RELATION_TYPE_FLAG, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('EQ', '等同', 'EQ', 'Y', 'N', 'Y', 'N', 'N', 'N', 'Y', 'Y', '3', 'DCITS', NULL, NULL);
INSERT INTO cif_relation_type (RELATION_TYPE, RELATION_DESC, COUNTER_REL, EXPOSURE, EQUITY, JOINT_ACCT, AUTHORISED, EMPLOYMENT, RELATIVE, SYMMENTRIC, JOIN_COLLAT, RELATION_TYPE_FLAG, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('GR', '担保', 'GR', 'Y', 'N', 'Y', 'N', 'N', 'N', 'N', 'Y', '3', 'DCITS', NULL, NULL);
INSERT INTO cif_relation_type (RELATION_TYPE, RELATION_DESC, COUNTER_REL, EXPOSURE, EQUITY, JOINT_ACCT, AUTHORISED, EMPLOYMENT, RELATIVE, SYMMENTRIC, JOIN_COLLAT, RELATION_TYPE_FLAG, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('GY', '供应商', 'GY', 'N', 'N', 'Y', 'N', 'N', 'N', 'N', 'N', '4', 'DCITS', NULL, NULL);
INSERT INTO cif_relation_type (RELATION_TYPE, RELATION_DESC, COUNTER_REL, EXPOSURE, EQUITY, JOINT_ACCT, AUTHORISED, EMPLOYMENT, RELATIVE, SYMMENTRIC, JOIN_COLLAT, RELATION_TYPE_FLAG, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('HW', '夫妻', 'HW', 'Y', 'N', 'Y', 'N', 'N', 'Y', 'N', 'Y', '1', 'DCITS', NULL, NULL);
INSERT INTO cif_relation_type (RELATION_TYPE, RELATION_DESC, COUNTER_REL, EXPOSURE, EQUITY, JOINT_ACCT, AUTHORISED, EMPLOYMENT, RELATIVE, SYMMENTRIC, JOIN_COLLAT, RELATION_TYPE_FLAG, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('OT', '其他', 'OT', 'Y', 'N', 'Y', 'Y', 'N', 'N', 'N', 'Y', '4', 'DCITS', NULL, NULL);
INSERT INTO cif_relation_type (RELATION_TYPE, RELATION_DESC, COUNTER_REL, EXPOSURE, EQUITY, JOINT_ACCT, AUTHORISED, EMPLOYMENT, RELATIVE, SYMMENTRIC, JOIN_COLLAT, RELATION_TYPE_FLAG, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('PC', '母公司', 'PC', 'Y', 'N', 'Y', 'Y', 'N', 'N', 'N', 'Y', '4', 'DCITS', NULL, NULL);
INSERT INTO cif_relation_type (RELATION_TYPE, RELATION_DESC, COUNTER_REL, EXPOSURE, EQUITY, JOINT_ACCT, AUTHORISED, EMPLOYMENT, RELATIVE, SYMMENTRIC, JOIN_COLLAT, RELATION_TYPE_FLAG, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('PT', '合伙人', 'PT', 'Y', 'N', 'Y', 'Y', 'N', 'N', 'N', 'Y', '4', 'DCITS', NULL, NULL);
INSERT INTO cif_relation_type (RELATION_TYPE, RELATION_DESC, COUNTER_REL, EXPOSURE, EQUITY, JOINT_ACCT, AUTHORISED, EMPLOYMENT, RELATIVE, SYMMENTRIC, JOIN_COLLAT, RELATION_TYPE_FLAG, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('RE', '近亲属', 'RE', 'Y', 'N', 'Y', 'N', 'N', 'Y', 'N', 'Y', '1', 'DCITS', NULL, NULL);
INSERT INTO cif_relation_type (RELATION_TYPE, RELATION_DESC, COUNTER_REL, EXPOSURE, EQUITY, JOINT_ACCT, AUTHORISED, EMPLOYMENT, RELATIVE, SYMMENTRIC, JOIN_COLLAT, RELATION_TYPE_FLAG, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('RL', '远亲属', 'RL', 'Y', 'N', 'Y', 'N', 'N', 'Y', 'N', 'N', '1', 'DCITS', NULL, NULL);
INSERT INTO cif_relation_type (RELATION_TYPE, RELATION_DESC, COUNTER_REL, EXPOSURE, EQUITY, JOINT_ACCT, AUTHORISED, EMPLOYMENT, RELATIVE, SYMMENTRIC, JOIN_COLLAT, RELATION_TYPE_FLAG, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('TR', '托管/监护', 'TR', 'Y', 'N', 'Y', 'Y', 'N', 'N', 'N', 'Y', '4', 'DCITS', NULL, NULL);

COMMIT;