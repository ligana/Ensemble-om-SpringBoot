TRUNCATE TABLE mb_guaranty_style;
INSERT INTO mb_guaranty_style (GUARANTY_STYLE, GUARANTY_STYLE_DESC, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('C101', '信用', NULL, NULL);
INSERT INTO mb_guaranty_style (GUARANTY_STYLE, GUARANTY_STYLE_DESC, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('C102', '保证', NULL, NULL);
INSERT INTO mb_guaranty_style (GUARANTY_STYLE, GUARANTY_STYLE_DESC, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('C103', '质押', NULL, NULL);
INSERT INTO mb_guaranty_style (GUARANTY_STYLE, GUARANTY_STYLE_DESC, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('C104', '抵押', NULL, NULL);
INSERT INTO mb_guaranty_style (GUARANTY_STYLE, GUARANTY_STYLE_DESC, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('C105', '组合担保', NULL, NULL);

COMMIT;
