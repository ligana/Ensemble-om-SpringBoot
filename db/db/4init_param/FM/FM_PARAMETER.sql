TRUNCATE TABLE fm_parameter;
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('ACCOUNTING_TIER', 'L', '核算状态层级', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('ACCTBALANCE_RES_TYPE', '003', '转账冻结类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('ACCT_NATURE_DEF_VALUE', '3400', '境外机构/个人境内外汇账户', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('ANNUAL_INSPECTION', '023', '账户年检标志', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('APPROVE', '4,5,6,7', '核准类账户', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('APPROVE_RESTRAINT', '022', '核准类账户限制', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('APPROVE_RESTRAINT_PRE', '023', '核准类开户后增加限制', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('APPROVE_RESTRAINT_TERM', '3', '核准类账户限制期限', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('APPROVE_RESTRAINT_TERM_TYPE', 'D', '核准类账户限制期限类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('AUTODEP_OTH_TRAN_TYPE', 'INTD', '利息入第三方账户交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('AUTOREC_TRAN_TYPE', '9999', '自动扣款默认交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('AUTO_DRW_TRAN_TYPE', '9998', '自动发放交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('AUTO_SETTLE', '4186', '定期账户到期自动结清交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('BALANCE_RES_TYPE', '003', '账户余额止付限制类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('BASIC_ACCT_NATURE', '4', '基本户账户属性', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('CASH_IN', '2410', '现金入库交易号', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('CASH_OUT', '2411', '现金出库交易号', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('CBRANCH_INOUT', '2418', '金库现金出入库交易号', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('CIF_DOCUMENT_RES_TYPE', '099', '证件到期止付限制类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('CL_DRW_TYPE', 'CL006', '垫款', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('CL_RES_TYPE', '032', '账户余额止付（贷款专用）', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('COLL_RES_TYPE', '025', '抵押品本行存单冻结类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('COMMON_ACCT_NATURE', '3', '一般户账户属性', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('DCT_RESTRAINT_TYPE', '025', '存单质押止付限制类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('DC_RESTRAINT_TYPE', '029', '大额存单存单认购余额限制类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('DEF_TRAN_TYPE', 'DEF', '债权减免类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('DEP_CASH_TRAN_TYPE', '1000', '定期销户转开现金存入交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('DEP_CERT_RESTRAINT_TYPE', '017', '存款证明限制类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('DISCNT_INT_TRAN_TYPE', '5ADF', '前付利息交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('DOS_WTD_TRAN_TYPE', '2201', '久悬户交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('DRW_TRAN_TYPE', 'DRW1', '发放交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('EOD_CYCLE_TRAN_TYPE', '5000', 'EOD结息交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('FX_IC_SETTLE_FILE_GLCODES', 'drIk:3,crIk:7', '阜新-IC卡销户结清文件入账-总账会计科目映射', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('FX_IC_TRAN_JOURNAL_FT_MAPPING', '1:4304,2:4306', '阜新-IC卡交易流水入账-CRDR_FLAG交易类型映射', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('FX_IC_TRAN_JOURNAL_TT_MAPPING', '2:4304,3:4306,4:4306', '阜新-IC卡交易流水入账-FEE_FLAG交易类型映射', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('GLC_AUTODEP_OTH_TRAN_TYPE', 'INGD', '负债利息转入', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('GLC_OTH_TRAN_TYPE', '5004', '内部账户非资本化结息（负债)', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('GLD_AUTODEP_OTH_TRAN_TYPE', 'INTC', '资产利息转入', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('GLD_OTH_TRAN_TYPE', '5003', '内部账户非资本化结息（资产)', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('GUARANTEE_SCALE', '5', '保证金比例', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('IMPOUND_DEP_TRAN_TYPE', '2128', '强制扣划转账存入(非支票)', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('IMPOUND_WTD_TRAN_TYPE', '2125', '强制扣划转账支取(非支票)', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('INIT_LINE_NO', '1', '初始行号', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('INIT_PAGE_NO', '1', '初始页号', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('INTERNAL_RES_TYPE', '003', '账户资金圈存（系统用）', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('IS_EXCHANGE_GUARA', 'Y', '是否缴纳保证金', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('LG_RES_TYPE', '027', '保函限制', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('LIMITS_DAY', '3', '宽限期天数', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('MAX_COMMISION_CARD_NUM', '2', '允许代办人开立的最大开卡张数', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('MAX_LINE_NO', '10', '最大行数', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('MAX_PAGE_NO', '10', '最大页数', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('MINOR_CLIENT_AGE', '16', '未成年客户年龄', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('NOT_CHK_TRAN_TYPE', '4386', '非支票转账', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('NO_CHECK_BRANCH_STATUS_ROGRAM', '0303,008001,2502,2503,0901', '机构关门允许的交易', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('NO_CHECK_PWDP_ROGRAM', '3702,3601,4001,3223,4100,3620,3080,2421,3081,5613,5614,5615,5616,5601,5603,5003,4007,4008', '密码户在这些交易中转出无需验密', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('NO_OD_AMT_QUERY', '3531,3602,3506', '不统计透支金额的查询交易', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('ONLINE_CYCLE_TRAN_TYPE', '5001', '联机结息交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('PD_CLASS2_CR', 'TranSumPd2CrLimit', '2类账户日累计入账限额', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('PD_CLASS2_DR', 'TranSumPd2DrLimit', '2类账户日累计出账限额', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('PD_CLASS3_CR', 'TranSumPd3CrLimit', '3类账户日累计入账限额', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('PD_CLASS3_DR', 'TranSumPd3DrLimit', '3类账户日累计出账限额', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('PY_CLASS2_CR', 'TranSumPy2CrLimit', '2类账户年累计入账限额', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('PY_CLASS2_DR', 'TranSumPy2DrLimit', '2类账户年累计出账限额', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('PY_CLASS3_CR', 'TranSumPy3CrLimit', '3类账户年累计入账限额', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('PY_CLASS3_DR', 'TranSumPy3DrLimit', '3类账户年累计出账限额', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('RECORD', '3,8,9', '备案类账户', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('RECORD_RESTRAINT', '022', '备案类账户限制', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('REC_TRAN_TYPE', 'REC1', '回收交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('REVERSE_ADJ_TRAN_TYPE', '5ADJ', '冲销交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('SETTLE_NET_FLG', 'N', '清算轧差标志', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('STAY_RUIN_CARD_TYPE', '020', '暂停结算（只收不付）', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('TAX_TRAN_TYPE', 'TAX1', '利息税交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('TER_TRAN_TYPE', 'TER', '终止交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('TRANSFER_RES_TYPE', '004', '账户资金圈存（系统用）', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('TRUSTEDPAY_TRAN_TYPE', 'C002', '受托支付存入交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('TRUSTEDREC_TRAN_TYPE', 'C001', '受托支付支取交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('TXT_UC_CHECK_JOURNAL', 'E:\\tmp\\test.txt', '银联对账磁条卡测试', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('UNC_BUY_TRAN_TYPE', 'FX32', '平盘买入交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('UNC_LOSS_TRAN_TYPE', 'FX35', '平盘损失交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('UNC_ONLINE_IND', 'Y', '实时平盘标志', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('UNC_PROFIT_TRAN_TYPE', 'FX34', '平盘收益交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('UNC_SELL_TRAN_TYPE', 'FX33', '平盘卖出交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('WAV_TRAN_TYPE', 'WAV', '豁免交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('WTPAY_TRAN_TYPE', 'W998', '委托付款默认交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('WTREC_TRAN_TYPE', 'W999', '委托扣款默认交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('appCardNum', '4', '允许一张主卡下发行的附属卡数量', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('clientCardsNum', '5', '允许客户持有的卡数量', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('clientMergeFlag', 'Y', '客户合并注销标志', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('feeCollMode', 'N', '账户可用余额不足时,日终扣费是否全额收取标志,Y-全额收取,N-部分收取', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('feeUnCollMode', 'Y', '账户可用余额不足时,余下欠费部分是否在下一收取日期收取标志,Y-下一收取日期收取,N-每天日终只要可用余额足够就收取', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('makeCardFilePath', '/app/dcits/ensemble/SmartTeller9/log/', NULL, NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('tdMatDateBasisCcy', 'B', NULL, NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('tdMatDateBasisFccy', 'F', NULL, NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('DRW_DS_TRAN_TYPE', 'DRW3', '贷款前收息交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('FORE_CASH_PRE_AMT', '5000', '存款支取预约登记外币现金支取预约等值金额', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('FORE_TRF_PRE_AMT', '10000', '存款支取预约登记外币转账支取预约等值金额', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('CNY_CASH_PRE_AMT', '50000', '存款支取预约登记人民币现金支取预约金额', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('CNY_TRF_PRE_AMT', '200000', '存款支取预约登记人民币转账支取预约金额', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('TRPF_TRAN_TYPE', '9999', '资产转让转出交易类型', NULL, NULL, NULL);
INSERT INTO fm_parameter (PARA_KEY, PARA_VALUE, PARA_DESC, COMPANY, TRAN_TIMESTAMP, TRAN_TIME) VALUES ('TRPT_TRAN_TYPE', '9998', '资产转让回购交易类型', NULL, NULL, NULL);

COMMIT;
