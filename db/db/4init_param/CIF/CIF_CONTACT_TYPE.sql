TRUNCATE TABLE cif_contact_type;
INSERT INTO cif_contact_type (CONTACT_TYPE, CONTACT_TYPE_DESC, ROUTE, SWIFT_ID, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('01', '营业地址', 'COLLECT', NULL, NULL, NULL, NULL);
INSERT INTO cif_contact_type (CONTACT_TYPE, CONTACT_TYPE_DESC, ROUTE, SWIFT_ID, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('02', '办公地址', 'COLLECT', NULL, NULL, NULL, NULL);
INSERT INTO cif_contact_type (CONTACT_TYPE, CONTACT_TYPE_DESC, ROUTE, SWIFT_ID, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('03', '生产地址', 'COLLECT', NULL, NULL, NULL, NULL);
INSERT INTO cif_contact_type (CONTACT_TYPE, CONTACT_TYPE_DESC, ROUTE, SWIFT_ID, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('04', '其他1', 'COLLECT', NULL, NULL, NULL, NULL);
INSERT INTO cif_contact_type (CONTACT_TYPE, CONTACT_TYPE_DESC, ROUTE, SWIFT_ID, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('05', '其他2', 'COLLECT', NULL, NULL, NULL, NULL);
INSERT INTO cif_contact_type (CONTACT_TYPE, CONTACT_TYPE_DESC, ROUTE, SWIFT_ID, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('06', '其他3', 'COLLECT', NULL, NULL, NULL, NULL);
INSERT INTO cif_contact_type (CONTACT_TYPE, CONTACT_TYPE_DESC, ROUTE, SWIFT_ID, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('11', '家庭联系信息', 'COLLECT', NULL, NULL, NULL, NULL);
INSERT INTO cif_contact_type (CONTACT_TYPE, CONTACT_TYPE_DESC, ROUTE, SWIFT_ID, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('12', '单位联系信息', 'COLLECT', NULL, NULL, NULL, NULL);
INSERT INTO cif_contact_type (CONTACT_TYPE, CONTACT_TYPE_DESC, ROUTE, SWIFT_ID, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('13', '移动联系信息1', 'PHONE', NULL, NULL, NULL, NULL);
INSERT INTO cif_contact_type (CONTACT_TYPE, CONTACT_TYPE_DESC, ROUTE, SWIFT_ID, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('14', '移动联系信息2', 'PHONE', NULL, NULL, NULL, NULL);
INSERT INTO cif_contact_type (CONTACT_TYPE, CONTACT_TYPE_DESC, ROUTE, SWIFT_ID, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('15', '电子邮箱信息', 'EMAIL1', NULL, NULL, NULL, NULL);
INSERT INTO cif_contact_type (CONTACT_TYPE, CONTACT_TYPE_DESC, ROUTE, SWIFT_ID, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('16', '传真信息', 'FAX', NULL, NULL, NULL, NULL);
INSERT INTO cif_contact_type (CONTACT_TYPE, CONTACT_TYPE_DESC, ROUTE, SWIFT_ID, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('17', '对账单邮寄地址', 'POSTAL', NULL, NULL, NULL, NULL);
INSERT INTO cif_contact_type (CONTACT_TYPE, CONTACT_TYPE_DESC, ROUTE, SWIFT_ID, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('POS', '邮寄', 'POSTAL', NULL, NULL, NULL, NULL);

COMMIT;
