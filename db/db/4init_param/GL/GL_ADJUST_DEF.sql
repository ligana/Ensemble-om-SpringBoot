TRUNCATE TABLE gl_adjust_def;
INSERT INTO gl_adjust_def (SEQ_NO, COMPLETE_FLAG, PERIOD_FREQ, FC_ADJUST_FLAG, FX_CODE, ADJUST_DATE, NEXT_ADJUST_DATE, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('1', 'N', 'YL', 'Y', '270', '20181231', '20191231', NULL, NULL);

COMMIT;
