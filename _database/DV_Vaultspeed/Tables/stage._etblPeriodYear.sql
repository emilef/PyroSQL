SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [CSG_1_FOODS_stage].[_etblPeriodYear](
	[HK_FinancialYear] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[LOADDT] [datetime2](7) NULL,
	[SOURCE_SYSTEM] [varchar](200) COLLATE Latin1_General_CI_AS NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NULL,
	[CHANGE_TYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[DATATYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[idYear] [int] NULL,
	[BK_FinancialYear] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[BK_idYear] [varchar](750) COLLATE Latin1_General_CI_AS NULL,
	[BK_dYearStartDate] [varchar](750) COLLATE Latin1_General_CI_AS NULL,
	[dYearStartDate] [datetime2](7) NULL,
	[cYearDescription] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
	[bArchived] [bit] NULL,
	[bPurged] [bit] NULL,
	[_etblPeriodYear_iBranchID] [int] NULL,
	[_etblPeriodYear_dCreatedDate] [datetime2](7) NULL,
	[_etblPeriodYear_dModifiedDate] [datetime2](7) NULL,
	[_etblPeriodYear_iCreatedBranchID] [int] NULL,
	[_etblPeriodYear_iModifiedBranchID] [int] NULL,
	[_etblPeriodYear_iCreatedAgentID] [int] NULL,
	[_etblPeriodYear_iModifiedAgentID] [int] NULL,
	[_etblPeriodYear_iChangeSetID] [int] NULL,
	[_etblPeriodYear_Checksum] [binary](20) NULL
) ON [PRIMARY]

GO
