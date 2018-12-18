drop table if exists OC_TRAN_HIST;
/*==============================================================*/
/* Table: OC_TRAN_HIST                                           */
/*==============================================================*/
create table OC_TRAN_HIST
(
    OC_REF_NO varchar(50) not null comment '同城交易流水号',
    CHANNEL_SEQ_NO varchar(50) comment '渠道流水号',
    TRAN_DATE varchar(8) comment '交易日期',
    BRANCH varchar(20) comment '机构代码',
    CHANGE_NO varchar(10) comment '交换号',
    CHANGE_REGION varchar(4) comment '交换地区 ',
    CHANGE_DATE varchar(8) comment '交换日期',
    CHANGE_SESSION varchar(2) comment '交换场次',
    TRAN_TYPE varchar(10) comment '交易类型',
    BASE_ACCT_NO varchar(150) comment '账号',
    PROD_TYPE varchar(50) comment '产品类型',
    CCY varchar(3) comment '币种',
    ACCT_SEQ_NO varchar(8) comment '账户序列号',
    ACCT_NAME varchar(200) comment '账户名称，一般指中文账户名称',
    DOC_TYPE varchar(10) comment '凭证类型',
    PREFIX varchar(10) comment '前缀',
    VOUCHER_NO varchar(50) comment '凭证号',
    ISS_DATE varchar(8) comment '出票日期',
    TRAN_AMT Decimal(17,2) comment '交易金额',
    PAY_PASSWORD varchar(50) comment '支付密码',
    NARRATIVE varchar(300) comment '摘要',
    OTH_CHANGE_NO varchar(50) comment '对方交换号',
    OTH_CHANGE_NAME varchar(100) comment '对方交换行名称',
    OTH_ACCT_NO varchar(150) comment '对方账号',
    OTH_ACCT_NAME varchar(200) comment '对方户名',
    OTH_DOC_TYPE varchar(10) comment '对方凭证类型',
    OTH_PREFIX varchar(10) comment '对方票据前缀',
    OTH_VOUCHER_NO varchar(50) comment '对方票据号码',
    USER_ID varchar(30) comment '交易柜员 ',
    APPR_USER_ID varchar(30) comment '复核柜员',
    TRAN_STATUS varchar(3) comment '状态',
    PRE_TRAN_STATUS varchar(3) comment '上一交易状态',
    RETURNED_FLAG varchar(1) comment '是否退票',
    RETURNED_REASON varchar(200) comment '退票原因',
    ORG_OC_REF_NO varchar(50) comment '源流水号',
    DONE_FLAG varchar(1) comment '收妥方式  ',
    DONE_DATE varchar(8) comment '收妥日期',
    DONE_USER_ID varchar(30) comment '收妥柜员',
    REFERENCE varchar(50) comment '交易参考号',
    RETURNED_PROCESS_MODE varchar(2) comment '退票处理方式  ',
    RESTRAINT_SEQ_NO varchar(50) comment '冻结编号',
    TRAN_TIMESTAMP varchar(17) comment '时间戳',
    ROUTER_KEY varchar(100) comment '分库路由关键字',
    TRAN_TIME Decimal(11,0) comment '交易时间',
    INTERNAL_KEY Decimal(15) comment '帐户主键',
    REASON_CODE varchar(6) comment '账户用途',
    DONE_FAIL_REASON varchar(200) comment '收妥失败原因',
    REVERSAL_REASON varchar(200) comment '冲正原因',
    RETURNED_CHANGE_DATE varchar(8) comment '退票交换日期',
    RETURNED_CHANGE_SESSION varchar(2) comment '退票交换场次',
    RETURNED_RECORD varchar(1) comment '退票标记',
    primary  key (OC_REF_NO)
);
alter table OC_TRAN_HIST comment '同城票交业务流水表 undefined';