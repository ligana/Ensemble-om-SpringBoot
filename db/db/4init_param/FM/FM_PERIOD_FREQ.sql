TRUNCATE TABLE fm_period_freq;
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('1D', '每日，节假日顺延', 'Y', '1', 'D', '1', 'L', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('1M', '票据提示付款期', 'Y', '1', 'M', '30', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('1Y', '一年，节假日顺延', 'Y', '1', 'Y', '360', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('2M', '票据提示付款期', 'Y', '2', 'M', '60', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('3D', '三天，节假日顺延', 'Y', '3', 'D', '3', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('3M', '按季结息顺延', 'Y', '3', 'M', '90', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('6M', '六个月，节假日顺延', 'Y', '6', 'M', '180', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('7D', '七天，节假日顺延', 'Y', '7', 'D', '7', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('D0', '0天垫款专用', 'N', '0', 'D', '0', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('D1', '每日，节假日不顺延', 'N', '1', 'D', '1', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('D7', '7天，节假日不顺延', 'N', '7', 'D', '7', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('M1', '一个月，节假日不顺延', 'N', '1', 'M', '30', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('M2', '两个月，节假日不顺延', 'N', '2', 'M', '60', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('M3', '三个月，节假日不顺延', 'N', '3', 'M', '90', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('M6', '六个月，节假日不顺延', 'N', '6', 'M', '180', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('MF', '月初（不顺延）', 'N', '1', 'M', '30', 'F', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('ML', '月末（不顺延）', 'N', '1', 'M', '30', 'L', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('QL', '季度末(不顺延)', 'N', '3', 'M', '90', 'L', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('W2', '2周，节假日不顺延', 'N', '14', 'D', '14', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('W3', '3周，节假日不顺延', 'N', '21', 'D', '21', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('X1', '旬末，节假日不顺延', 'N', '10', 'D', '10', 'L', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('Y1', '一年，节假日不顺延', 'N', '1', 'Y', '360', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('Y2', '二年，节假日不顺延', 'N', '2', 'Y', '720', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('Y3', '三年，节假日不顺延', 'N', '3', 'Y', '1080', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('Y4', '四年，节假日不顺延', 'N', '4', 'Y', '1440', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('Y5', '五年，节假日不顺延', 'N', '5', 'Y', '1800', 'A', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('ZD', '最大频率', 'N', '99', 'M', '2970', 'F', NULL, NULL, 'N', NULL, NULL, NULL);
INSERT INTO fm_period_freq (PERIOD_FREQ, PERIOD_FREQ_DESC, FORCE_WORK_DAY, ADD_NO, DAY_MTH, DAY_NUM, FIRST_LAST, PRIOR_DAYS, CLIENT_SPREAD, HALF_MONTH, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('YL', '年末(不顺延)', 'N', '1', 'Y', '360', 'L', NULL, NULL, 'N', NULL, NULL, NULL);

COMMIT;
