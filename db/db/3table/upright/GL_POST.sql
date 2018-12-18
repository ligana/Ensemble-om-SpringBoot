drop table if exists GL_POST;
/*==============================================================*/
/* Table: GL_POST                                           */
/*==============================================================*/
create table GL_POST
(
    TRAN_KEY varchar(50) comment '交易内部键',
    BRANCH varchar(20) not null comment '机构代码',
    CCY varchar(3) not null comment '币种',
    CLIENT_NO varchar(20) not null comment '客户号',
    GL_CODE varchar(20) not null comment '科目代码 AC_SUBJECT.SUBJECT_CODE',
    SEQ_NO varchar(50) not null comment '序号',
    PROFIT_CENTRE varchar(12) not null comment '利润中心 FM_PROFIT_CENTRE.PROFIT_CENTRE',
    SOURCE_MODULE varchar(10) not null comment '模块',
    SOURCE_TYPE varchar(10) not null comment '渠道 FM_CHANNEL.CHANNEL',
    TRADE_NO varchar(50) comment '交易号',
    REFERENCE varchar(50) comment '交易参考号',
    POST_DATE varchar(8) not null comment '入帐日期',
    VALUE_DATE varchar(8) not null comment '生效日期',
    NARRATIVE varchar(300) comment '摘要，开户时的账号用途，销户时的销户原因',
    AMOUNT Decimal(17,2) not null comment '交易金额',
    REVERSAL varchar(1) not null comment '冲正标志 Y:是 N:否',
    STATUS varchar(3) not null comment '状态',
    ACCT_INTERNAL_KEY varchar(50) comment '账号KEY值',
    OF_STATUS varchar(3) comment '状态',
    EVENT_TYPE varchar(50) comment '事件类型 MB_EVENT_CLASS.EVENT_CLASS',
    BANK_SEQ_NO varchar(50) comment '银行交易序号',
    PREV_TRAN_KEY varchar(30) comment '上次交易KEY',
    PREV_TRADE_NO varchar(50) comment '关联的上一交易号',
    STMT_PRINT_DATE varchar(8) comment 'STMT打印日期',
    RECON_SEQ_NO varchar(30) comment '事件号',
    SWIFT_PRINT_DATE varchar(8) comment 'SWIFT打印日期',
    TRAN_TYPE varchar(10) comment '交易类型',
    BRANCH_SEQ_NO varchar(30) comment '分行序列号',
    ENTRY_REVERSED varchar(1) default 'N' comment '手工记账冲正标志 ',
    OF_REF21 varchar(50) comment '大总账参考号',
    BUSINESS_UNIT varchar(10) comment '帐套',
    D2_REFERENCE varchar(50) comment '参考号',
    ACCOUNTING_DATE varchar(8) comment '会计日期',
    NARRATIVE1 varchar(300) comment '备注',
    HEADER_ID varchar(23) comment '凭证ID',
    BASE_AMT Decimal(17,2) comment '折算金额',
    RATE_TYPE varchar(3) comment '利率类型 IRL_INT_TYPE.INT_TAX_TYPE',
    CCY_RATE Decimal(15,8) comment '折算汇率',
    PERIOD_NAME varchar(16) comment '会计期间',
    PROC_FLAG varchar(1) default 'N' comment '处理标志',
    COMPANY varchar(20) comment '法人代码',
    BASE_ACCT_NO varchar(150) comment '账号',
    CR_DR_IND varchar(1) comment '收入支出标志  C:收入 D：支出',
    PROD_TYPE varchar(50) comment '产品类型',
    CHANNEL_DATE varchar(8) comment '渠道日期',
    TRAN_TIME Decimal(11,0) comment '交易时间',
    TRAN_TIMESTAMP varchar(17) comment '交易时间戳',
    ROUTER_KEY varchar(100) comment '分库路由关键字',
    CHANNEL_SEQ_NO varchar(50) comment '渠道流水号',
    REVERSAL_SEQ_NO varchar(50) comment '冲正流水号',
    REVERSAL_DATE varchar(8) comment '冲正日期',
    IS_VALUE_ADDED varchar(1) comment '是否过账标识'
);
alter table GL_POST comment '会计分录表 undefined';

drop index GL_POST_IND1 on GL_POST;
/*==============================================================*/
/* Index: GL_POST_IND1                                           */
/*==============================================================*/
create index GL_POST_IND1 on GL_POST (
    REFERENCE,POST_DATE
);

drop index IND_GL_POST_1 on GL_POST;
/*==============================================================*/
/* Index: IND_GL_POST_1                                           */
/*==============================================================*/
create index IND_GL_POST_1 on GL_POST (
    REFERENCE
);