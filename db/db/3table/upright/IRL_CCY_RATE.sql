drop table if exists IRL_CCY_RATE;
/*==============================================================*/
/* Table: IRL_CCY_RATE                                           */
/*==============================================================*/
create table IRL_CCY_RATE
(
    CCY varchar(3) not null comment '币种',
    BRANCH varchar(20) not null comment '机构',
    RATE_TYPE varchar(3) not null comment '汇率类型',
    EFFECT_DATE varchar(8) not null comment '生效日期',
    EFFECT_TIME varchar(6) not null comment '生效时间',
    QUOTE_TYPE varchar(1) not null comment '牌价类型',
    MIDDLE_RATE Decimal(15,8) not null comment '中间价',
    EXCH_BUY_RATE Decimal(15,8) not null comment '汇买价',
    EXCH_SELL_RATE Decimal(15,8) not null comment '汇卖价',
    CENTRAL_BANK_RATE Decimal(15,8) comment '央行参考汇率',
    NOTES_BUY_RATE Decimal(15,8) comment '钞买价',
    NOTES_SELL_RATE Decimal(15,8) comment '钞卖价',
    MAX_FLOAT_RATE Decimal(15,8) comment '最大浮动点',
    COMPANY varchar(20) comment '法人代码',
    TRAN_TIMESTAMP varchar(17) comment '交易时间戳',
    TRAN_TIME Decimal(11,0) comment '交易时间',
    primary  key (CCY,BRANCH,RATE_TYPE,EFFECT_DATE,EFFECT_TIME)
);
alter table IRL_CCY_RATE comment '汇率牌价表 undefined';