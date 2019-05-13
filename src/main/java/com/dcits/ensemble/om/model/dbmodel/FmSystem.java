package com.dcits.ensemble.om.model.dbmodel;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * @Author guihj
 * @Description 系统业务参数表 undefined
 * @Date 2019-05-07 20:10:42
 * @Version 1.0
 */

@Entity
@Table(name = "fm_system")
@Data
public class FmSystem implements Serializable {

	/**
	* This field corresponds to the database column FM_SYSTEM.COY_NAME
	* @Description  银行全称
	*/
	@Column(name="coyName")
	private String coyName;
	/**
	* This field corresponds to the database column FM_SYSTEM.COY_SHORT
	* @Description  银行简称
	*/
	@Column(name="coyShort")
	private String coyShort;
	/**
	* This field corresponds to the database column FM_SYSTEM.RUN_DATE
	* @Description  运行日期
	*/
	@Column(name="runDate")
	private String runDate;
	/**
	* This field corresponds to the database column FM_SYSTEM.MTH_END_DATE
	* @Description  本月月末日期
	*/
	@Column(name="mthEndDate")
	private String mthEndDate;
	/**
	* This field corresponds to the database column FM_SYSTEM.YR_END_DATE
	* @Description  本年年末日期
	*/
	@Column(name="yrEndDate")
	private String yrEndDate;
	/**
	* This field corresponds to the database column FM_SYSTEM.HEAD_OFFICE_CLIENT
	* @Description  总行清算行内部客户
	*/
	@Column(name="headOfficeClient")
	private String headOfficeClient;
	/**
	* This field corresponds to the database column FM_SYSTEM.CAPITAL_FUNDS
	* @Description  投资资金
	*/
	@Column(name="capitalFunds")
	private java.math.BigDecimal capitalFunds;
	/**
	* This field corresponds to the database column FM_SYSTEM.INTER_BRANCH_IND
	* @Description  是否为内部银行
	*/
	@Column(name="interBranchInd")
	private String interBranchInd;
	/**
	* This field corresponds to the database column FM_SYSTEM.EBH_BRANCH
	* @Description  电子银行
	*/
	@Column(name="ebhBranch")
	private String ebhBranch;
	/**
	* This field corresponds to the database column FM_SYSTEM.LAST_RUN_DATE
	* @Description  上一运行日期
	*/
	@Column(name="lastRunDate")
	private String lastRunDate;
	/**
	* This field corresponds to the database column FM_SYSTEM.NEXT_RUN_DATE
	* @Description  下一运行日
	*/
	@Column(name="nextRunDate")
	private String nextRunDate;
	/**
	* This field corresponds to the database column FM_SYSTEM.AUTO_CLIENT_GEN
	* @Description  是否自动生成客户号
	*/
	@Column(name="autoClientGen")
	private String autoClientGen;
	/**
	* This field corresponds to the database column FM_SYSTEM.INTER_BRANCH_ACCT_HO
	* @Description  分行间清算科目-同业存放
	*/
	@Column(name="interBranchAcctHo")
	private String interBranchAcctHo;
	/**
	* This field corresponds to the database column FM_SYSTEM.DEFAULT_RATE_TYPE_LOCAL
	* @Description  默认本地汇率类型
	*/
	@Column(name="defaultRateTypeLocal")
	private String defaultRateTypeLocal;
	/**
	* This field corresponds to the database column FM_SYSTEM.DEFAULT_BRANCH
	* @Description  默认机构
	*/
	@Column(name="defaultBranch")
	private String defaultBranch;
	/**
	* This field corresponds to the database column FM_SYSTEM.EXCHANGE_RATE_VARIANCE
	* @Description  汇率浮动百分比
	*/
	@Column(name="exchangeRateVariance")
	private java.math.BigDecimal exchangeRateVariance;
	/**
	* This field corresponds to the database column FM_SYSTEM.MAIN_BRANCH_CODE
	* @Description  总行层级代码
	*/
	@Column(name="mainBranchCode")
	private String mainBranchCode;
	/**
	* This field corresponds to the database column FM_SYSTEM.QUR_END_DATE
	* @Description  季末日期
	*/
	@Column(name="qurEndDate")
	private String qurEndDate;
	/**
	* This field corresponds to the database column FM_SYSTEM.HALF_END_DATE
	* @Description  半年末日期
	*/
	@Column(name="halfEndDate")
	private String halfEndDate;
	/**
	* This field corresponds to the database column FM_SYSTEM.CLIENT_BLOCK_FREQ
	* @Description  资料不全客户冻结周期
	*/
	@Column(name="clientBlockFreq")
	private String clientBlockFreq;
	/**
	* This field corresponds to the database column FM_SYSTEM.AUTO_COLL_GEN
	* @Description  是否自动生成抵质押编号
	*/
	@Column(name="autoCollGen")
	private String autoCollGen;
	/**
	* This field corresponds to the database column FM_SYSTEM.AUTO_LOCK_BL_CLIENT
	* @Description  自动冻结黑名单客户
	*/
	@Column(name="autoLockBlClient")
	private String autoLockBlClient;
	/**
	* This field corresponds to the database column FM_SYSTEM.GL_IND
	* @Description  SYMBOLS总账分离标志 
	*/
	@Column(name="glInd")
	private String glInd;
	/**
	* This field corresponds to the database column FM_SYSTEM.PROCESS_SPLIT_IND
	* @Description  批处理阶段标志
	*/
	@Column(name="processSplitInd")
	private String processSplitInd;
	/**
	* This field corresponds to the database column FM_SYSTEM.MULTI_CORPORATION_FLAG
	* @Description  是否多法人系统
	*/
	@Column(name="multiCorporationFlag")
	private String multiCorporationFlag;
	/**
	* This field corresponds to the database column FM_SYSTEM.MULTI_CORPORATION_METHOD
	* @Description  多法人机构间清算方式 
	*/
	@Column(name="multiCorporationMethod")
	private String multiCorporationMethod;
	/**
	* This field corresponds to the database column FM_SYSTEM.MULTI_CORP_QUERY_ALLOW
	* @Description  多法人是否允许跨法人查询标志 
	*/
	@Column(name="multiCorpQueryAllow")
	private String multiCorpQueryAllow;
	/**
	* This field corresponds to the database column FM_SYSTEM.RB_RESTRAINT_TYPE
	* @Description  默认存款账户限制类型 
	*/
	@Column(name="rbRestraintType")
	private String rbRestraintType;
	/**
	* This field corresponds to the database column FM_SYSTEM.INTERNAL_RATE_CHARGE_FLAG
	* @Description  是否行内结售汇平盘
	*/
	@Column(name="internalRateChargeFlag")
	private String internalRateChargeFlag;
	/**
	* This field corresponds to the database column FM_SYSTEM.DEFAULT_CHARGE_RATE_TYPE
	* @Description  结售汇内部平盘汇率类型
	*/
	@Column(name="defaultChargeRateType")
	private String defaultChargeRateType;
	/**
	* This field corresponds to the database column FM_SYSTEM.DAC_IND
	* @Description  DAC校验标志
	*/
	@Column(name="dacInd")
	private String dacInd;
	/**
	* This field corresponds to the database column FM_SYSTEM.ALLOW_BACKQRY_DAY
	* @Description  允许查询的历史天数
	*/
	@Column(name="allowBackqryDay")
	private String allowBackqryDay;
	/**
	* This field corresponds to the database column FM_SYSTEM.BATCH_MODULE
	* @Description  当前批处理的模块号
	*/
	@Column(name="batchModule")
	private String batchModule;
	/**
	* This field corresponds to the database column FM_SYSTEM.BATCH_UNIT
	* @Description  当前批处理的业务组编号
	*/
	@Column(name="batchUnit")
	private String batchUnit;
	/**
	* This field corresponds to the database column FM_SYSTEM.SYSTEM_PHASE
	* @Description  系统所处的阶段
	*/
	@Column(name="systemPhase")
	private String systemPhase;
	/**
	* This field corresponds to the database column FM_SYSTEM.CONTINUOUS_RUN
	* @Description  是否连续使用指定的数字区间标志
	*/
	@Column(name="continuousRun")
	private String continuousRun;
	/**
	* This field corresponds to the database column FM_SYSTEM.PRODUCT_30E
	* @Description  是否产品版30E计算天数
	*/
	@Column(name="product30e")
	private String product30e;
	/**
	* This field corresponds to the database column FM_SYSTEM.IS_DEBUG
	* @Description  是否记录业务数据信息 
	*/
	@Column(name="isDebug")
	private String isDebug;
	/**
	* This field corresponds to the database column FM_SYSTEM.IS_ERROR
	* @Description  是否记录出错时的业务数据信息
	*/
	@Column(name="isError")
	private String isError;
	/**
	* This field corresponds to the database column FM_SYSTEM.BATCH_DEFAULT_USER_ID
	* @Description  默认批处理用户
	*/
	@Column(name="batchDefaultUserId")
	private String batchDefaultUserId;
	/**
	* This field corresponds to the database column FM_SYSTEM.BATCH_CHECK_FLAG
	* @Description  批处理检查标志
	*/
	@Column(name="batchCheckFlag")
	private String batchCheckFlag;
	/**
	* This field corresponds to the database column FM_SYSTEM.CR_DR_CHECK_FLAG
	* @Description  借贷检查标志
	*/
	@Column(name="crDrCheckFlag")
	private String crDrCheckFlag;
	/**
	* This field corresponds to the database column FM_SYSTEM.COMPANY
	* @Description  法人
	*/
	@Id
	@Column(name="company")
	private String company;
	/**
	* This field corresponds to the database column FM_SYSTEM.DEFAULT_PROFIT_CENTRE
	* @Description  默认利润中心
	*/
	@Column(name="defaultProfitCentre")
	private String defaultProfitCentre;
	/**
	* This field corresponds to the database column FM_SYSTEM.CLIENT_NO_STRUCTURE_TYPE
	* @Description  客户号结构类型
	*/
	@Column(name="clientNoStructureType")
	private String clientNoStructureType;
	/**
	* This field corresponds to the database column FM_SYSTEM.BASE_CCY
	* @Description  基础币种
	*/
	@Column(name="baseCcy")
	private String baseCcy;
	/**
	* This field corresponds to the database column FM_SYSTEM.LIMIT_CCY
	* @Description  限制币种
	*/
	@Column(name="limitCcy")
	private String limitCcy;
	/**
	* This field corresponds to the database column FM_SYSTEM.LOCAL_CCY
	* @Description  当地币种
	*/
	@Column(name="localCcy")
	private String localCcy;
	/**
	* This field corresponds to the database column FM_SYSTEM.REPORT_CCY
	* @Description  报表币种
	*/
	@Column(name="reportCcy")
	private String reportCcy;
	/**
	* This field corresponds to the database column FM_SYSTEM.NPV_GAP_TYPE
	* @Description  敞口类型
	*/
	@Column(name="npvGapType")
	private String npvGapType;
	/**
	* This field corresponds to the database column FM_SYSTEM.DEFAULT_RATE_TYPE
	* @Description  本地币种汇率类型
	*/
	@Column(name="defaultRateType")
	private String defaultRateType;
	/**
	* This field corresponds to the database column FM_SYSTEM.TRAN_TIMESTAMP
	* @Description  交易时间戳
	*/
	@Column(name="tranTimestamp")
	private String tranTimestamp;
	/**
	* This field corresponds to the database column FM_SYSTEM.TRAN_TIME
	* @Description  交易时间
	*/
	@Column(name="tranTime")
	private java.math.BigDecimal tranTime;
	/**
	* This field corresponds to the database column FM_SYSTEM.MULTI_INFO_SHARE
	* @Description  法人间客户信息是否共享
	*/
	@Column(name="multiInfoShare")
	private String multiInfoShare;
	/**
	* This field corresponds to the database column FM_SYSTEM.MULTI_ENABLE_SWAP
	* @Description  是否允许法人间交易
	*/
	@Column(name="multiEnableSwap")
	private String multiEnableSwap;
}
