SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dv_CSG_1_FOODS].[_etblBudgets](
	[idBudgets] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iBudgetAccountID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iBudgetProjectID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iBudgetPeriodID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iBudgetTxBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iBudgetAccountType] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[fBudget] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[fUnprocessedPOValue] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[dBudgetDTStamp] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[fForecast] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[fBudgetForeign] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[fUnprocessedPOValueForeign] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[fForecastForeign] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblBudgets_iBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblBudgets_dCreatedDate] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblBudgets_dModifiedDate] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblBudgets_iCreatedBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblBudgets_iModifiedBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblBudgets_iCreatedAgentID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblBudgets_iModifiedAgentID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblBudgets_iChangeSetID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblBudgets_Checksum] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[CHANGE_TYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[DATATYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NULL,
	[LOADDT] [datetime2](7) NULL
) ON [PRIMARY]

GO
