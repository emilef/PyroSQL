SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_GLBudget](
	[HK_GLBudget] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[LOADDT] [datetime2](7) NOT NULL,
	[LOADENDDT] [datetime2](7) NOT NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NOT NULL,
	[HASHDIFF] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[ISDELETED] [varchar](2) COLLATE Latin1_General_CI_AS NOT NULL,
	[idBudgets] [int] NULL,
	[iBudgetAccountID] [int] NULL,
	[iBudgetProjectID] [int] NULL,
	[iBudgetPeriodID] [int] NULL,
	[iBudgetTxBranchID] [int] NULL,
	[iBudgetAccountType] [int] NULL,
	[fBudget] [float] NULL,
	[fUnprocessedPOValue] [float] NULL,
	[dBudgetDTStamp] [datetime2](7) NULL,
	[fForecast] [float] NULL,
	[fBudgetForeign] [float] NULL,
	[fUnprocessedPOValueForeign] [float] NULL,
	[fForecastForeign] [float] NULL,
	[_etblBudgets_iBranchID] [int] NULL,
	[_etblBudgets_dCreatedDate] [datetime2](7) NULL,
	[_etblBudgets_dModifiedDate] [datetime2](7) NULL,
	[_etblBudgets_iCreatedBranchID] [int] NULL,
	[_etblBudgets_iModifiedBranchID] [int] NULL,
	[_etblBudgets_iCreatedAgentID] [int] NULL,
	[_etblBudgets_iModifiedAgentID] [int] NULL,
	[_etblBudgets_iChangeSetID] [int] NULL,
	[_etblBudgets_Checksum] [binary](20) NULL,
	[SRC] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[EQUAL] [numeric](18, 0) NULL,
	[DATATYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]

GO
