TRUNCATE TABLE mb_acct_linkman_type;
INSERT INTO mb_acct_linkman_type (LINKMAN_TYPE, LINKMAN_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('01', '热线验证联系人', 'DCITS', NULL, NULL);
INSERT INTO mb_acct_linkman_type (LINKMAN_TYPE, LINKMAN_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('02', '对账有权人', 'DCITS', NULL, NULL);
INSERT INTO mb_acct_linkman_type (LINKMAN_TYPE, LINKMAN_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('03', '金融交易经办人', 'DCITS', NULL, NULL);
INSERT INTO mb_acct_linkman_type (LINKMAN_TYPE, LINKMAN_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('04', '企业法人', 'DCITS', NULL, NULL);

COMMIT;