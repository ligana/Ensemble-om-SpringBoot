drop table if exists MB_DELAY_SERV_CHANGE;
/*==============================================================*/
/* Table: MB_DELAY_SERV_CHANGE                                           */
/*==============================================================*/
create table MB_DELAY_SERV_CHANGE
(
    SC_SEQ_NO varchar(50) not null comment '收费序号',
    INTERNAL_KEY Decimal(15) comment '账户标识符',
    CLIENT_NO varchar(20) comment '客户号',
    CLIENT_TYPE varchar(3) comment '客户类型',
    FEE_TYPE varchar(8) not null comment '服务费类型',
    EFFECT_DATE varchar(8) not null comment '生效日期',
    FEE_CCY varchar(3) comment '收费币种',
    ORIG_FEE_AMT Decimal(17,2) comment '原始费用金额,即折扣前的费用金额',
    DISC_FEE_AMT Decimal(17,2) comment '折扣金额',
    FEE_AMT Decimal(17,2) not null comment '费用金额,即实收金额',
    SC_DISCOUNT_TYPE varchar(30) comment '费用折扣类型',
    SC_DISCOUNT_RATE Decimal(15,8) comment '费用折扣率',
    PRIMARY_TRAN_SEQ_NO varchar(50) comment '主交易序号',
    BO_IND varchar(1) not null comment '日终/联机标志',
    TRAN_SEQ_NO varchar(50) comment '费用交易序号',
    TRAN_BRANCH varchar(20) not null comment '收费机构',
    REFERENCE varchar(50) comment '交易参考号',
    CHARGE_WAY varchar(1) comment '收费方式',
    TRAN_DATE varchar(8) not null comment '收费日期',
    USER_ID varchar(30) not null comment '收费柜员',
    CHARGE_TO_INTERNAL_KEY Decimal(15) comment '收费账户标识符',
    CHARGE_TO_BASE_ACCT_NO varchar(150) comment '收费账号',
    CHARGE_TO_PROD_TYPE varchar(50) comment '收费账户产品类型',
    CHARGE_TO_CCY varchar(3) comment '收费账户币种符',
    CHARGE_TO_ACCT_SEQ_NO varchar(8) comment '收费账户序号',
    DOC_TYPE varchar(10) comment '凭证类型',
    PREFIX varchar(10) comment '凭证前缀',
    VOUCHER_SUM varchar(5) comment '凭证合计数',
    START_NO varchar(50) comment '凭证起始号码',
    END_NO varchar(50) comment '凭证结束号码',
    COMPANY varchar(20) comment '法人代码',
    TAX_TYPE varchar(3) comment '税率类型',
    TAX_RATE Decimal(15,8) comment '税率',
    TAX_AMT Decimal(17,2) comment '税金',
    TRAN_TYPE varchar(10) comment '交易类型',
    BANK_SEQ_NO varchar(50) comment '银行交易序号',
    CHANNEL_SEQ_NO varchar(50) comment '渠道流水号',
    TRAN_FEE_AMT Decimal(17,2) comment '原应收费用金额,即初始实收费用金额',
    OSD_SEQ_NO varchar(50) comment '应收费用序号',
    REVERSAL varchar(1) default 'N' comment '冲正标志',
    REVERSAL_DATE varchar(8) comment '冲正日期',
    REVERSAL_BRANCH varchar(20) comment '冲正机构',
    REVERSAL_USER_ID varchar(30) comment '冲正柜员',
    REVERSAL_AUTH_USER_ID varchar(30) comment '冲正授权柜员',
    REVERSAL_SC_SEQ_NO varchar(50) comment '冲正序号',
    AGREEMENT_ID varchar(30) comment '协议编号,费用套餐签约协议编号',
    GL_POSTED varchar(1) comment '过账标志 ',
    TRAN_TIMESTAMP varchar(17) comment '交易时间戳',
    TRAN_TIME Decimal(11,0) comment '交易时间',
    ROUTER_KEY varchar(100) comment '分库路由关键字',
    primary  key (SC_SEQ_NO)
);
alter table MB_DELAY_SERV_CHANGE comment '24小时转账服务费表 undefined';