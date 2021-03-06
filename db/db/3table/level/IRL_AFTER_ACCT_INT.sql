drop table if exists IRL_AFTER_ACCT_INT;
/*==============================================================*/
/* Table: IRL_AFTER_ACCT_INT                                           */
/*==============================================================*/
create table IRL_AFTER_ACCT_INT
(
    IRL_INTERNAL_KEY varchar(50) not null comment '账户键值',
    INT_CLASS varchar(20) not null comment '利息分类 取自表fm_ref_code中的domain取值为INT_CLASS时对应的值，比如：  INT  利息 ODP  罚息 ODI  复利 ODODI复利的复利  ODODP 罚息的复利  ODF 透支利息 PDUE 超期利息',
    AGG Decimal(38,2) not null comment '积数',
    INT_AMT Decimal(17,2) comment '利息金额',
    INT_START_DATE varchar(8) comment '开户起息日',
    INT_IND varchar(1) comment '是否计息 默认为Y Y：计息累积数 N：不计息不累积数 ',
    INT_TYPE varchar(3) comment '利率类型',
    ACTUAL_RATE Decimal(15,8) comment '行内利率',
    FLOAT_RATE Decimal(15,8) comment '浮动利率',
    REAL_RATE Decimal(15,8) comment '执行利率',
    ACCT_FIXED_RATE Decimal(15,8) comment '分户固定利率',
    ACCT_SPREAD_RATE Decimal(15,8) comment '分户浮动点数',
    ACCT_PERCENT_RATE Decimal(5,2) comment '分户浮动百分比',
    INT_APPL_TYPE varchar(1) comment '利率启用方式 N-利率不变更  如果接口中有利率（存量业务），则以此值为准，如没有（新办理业务），则取系统最新利率  B-利率生效日当天生效  始终取系统最新利率计算利息。  S-从下一个计息周期开始生效  R-按照约定的生效周期开始生效  待考虑 ',
    NEXT_ROLL_DATE varchar(8) comment '下一个利率变更日期  如果利率启用方式为R时，需要指定利率变更的日期',
    LAST_ROLL_DATE varchar(8) comment '上一个利率变更日期  如果利率启用方式为R时录入',
    ROLL_FREQ varchar(2) comment '利率变更周期 如果利率启用方式为R时，需要指定利率变更的频率 取自表FM_PERIOD_FREQ ',
    ROLL_DAY varchar(2) comment '利率变更日  如果利率启用方式为R时，需要指定利率变更的日。系统根据上一个利率变更日，利率变更周期，和这个‘日’计算下一个利率变更日',
    CYCLE_PERIOD_FREQ varchar(2) comment '结息周期 取自表FM_PERIOD_FREQ',
    CYCLE_INT_DAY varchar(50) comment '结息日',
    NEXT_CYCLE_DATE varchar(8) comment '下一结息日期',
    LAST_CYCLE_DATE varchar(8) comment '上一结息日期',
    LAST_ACCR_DATE varchar(8) comment '上一计提日期',
    INT_ACCRUED Decimal(17,2) comment '累计计提利息',
    INT_ADJ_CTD Decimal(17,2) comment '计提日利息调整',
    INT_ADJ Decimal(17,2) comment '利息调整(累计)',
    INT_ACCRUED_CTD Decimal(17,2) comment '计提日计提利息（币种格式化后金额）',
    INT_POSTED Decimal(17,2) comment '结息利息金额（累计金额）',
    INT_POSTED_CTD Decimal(17,2) comment '结息日利息金额',
    TAX_TYPE varchar(3) comment '税率类型',
    TAX_RATE Decimal(15,8) comment '税率',
    TAX_ACCRUED_CTD Decimal(17,2) comment '计提日利息税',
    TAX_ACCRUED Decimal(17,2) comment '结息周期内利息税累计金额',
    TAX_POSTED_CTD Decimal(17,2) comment '结息日利息税',
    TAX_POSTED Decimal(17,2) comment '利息税累计金额',
    COMPANY varchar(20) comment '所属法人',
    SYSTEM_ID varchar(20) not null comment '系统标识 10：ENSEMBLE 20：互联网金融 ',
    RATE_CHANGE_IND varchar(1) comment '是否利率变化 Y：当日变化  N：当日未变化',
    TRAN_TIMESTAMP varchar(17) comment '交易时间戳',
    TRAN_TIME Decimal(11,0) comment '交易时间',
    ROUTER_KEY varchar(100) comment '分库路由关键字',
    primary  key (IRL_INTERNAL_KEY,INT_CLASS,SYSTEM_ID)
);
alter table IRL_AFTER_ACCT_INT comment '分户利息分类明细信息表 undefined';