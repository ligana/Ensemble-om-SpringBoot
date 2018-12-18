drop table if exists TB_APPLY_DETAIL;
/*==============================================================*/
/* Table: TB_APPLY_DETAIL                                           */
/*==============================================================*/
create table TB_APPLY_DETAIL
(
    APPLY_DETAIL_ID varchar(30) not null comment '现金预约申请明细编号',
    APPLY_ID varchar(30) not null comment '预约编号',
    APPLY_CCY varchar(3) not null comment '预约币种',
    PAR_VALUE Decimal(17,2) comment '券别',
    PAR_DESC varchar(60) comment '券别描述',
    AMT Decimal(17,2) not null comment '金额',
    COUNT_SUM varchar(15) comment '数量',
    PAR_VALUE_ID varchar(20) not null comment '券别代码',
    REFERENCE varchar(50) comment '交易参考号',
    COMPANY varchar(20) comment '法人代码',
    TRAN_TIMESTAMP varchar(17) comment '交易时间戳',
    TRAN_TIME Decimal(11,0) comment '交易时间',
    ROUTER_KEY varchar(100) comment '分库路由关键字',
    primary  key (APPLY_DETAIL_ID)
);
alter table TB_APPLY_DETAIL comment '现金预约申请明细表 undefined';