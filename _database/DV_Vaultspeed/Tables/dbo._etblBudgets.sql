SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[_etblBudgets](
	[idBudgets] [int] IDENTITY(1,1) NOT NULL,
	[iBudgetAccountID] [int] NOT NULL,
	[iBudgetProjectID] [int] NOT NULL,
	[iBudgetPeriodID] [int] NOT NULL,
	[iBudgetTxBranchID] [int] NOT NULL,
	[iBudgetAccountType] [int] NOT NULL,
	[fBudget] [float] NULL,
	[fUnprocessedPOValue] [float] NULL,
	[dBudgetDTStamp] [datetime] NULL,
	[fForecast] [float] NOT NULL,
	[fBudgetForeign] [float] NOT NULL,
	[fUnprocessedPOValueForeign] [float] NOT NULL,
	[fForecastForeign] [float] NOT NULL,
	[_etblBudgets_iBranchID] [int] NULL,
	[_etblBudgets_dCreatedDate] [datetime] NULL,
	[_etblBudgets_dModifiedDate] [datetime] NULL,
	[_etblBudgets_iCreatedBranchID] [int] NULL,
	[_etblBudgets_iModifiedBranchID] [int] NULL,
	[_etblBudgets_iCreatedAgentID] [int] NULL,
	[_etblBudgets_iModifiedAgentID] [int] NULL,
	[_etblBudgets_iChangeSetID] [int] NULL,
	[_etblBudgets_Checksum] [binary](20) NULL
) ON [PRIMARY]

GO
