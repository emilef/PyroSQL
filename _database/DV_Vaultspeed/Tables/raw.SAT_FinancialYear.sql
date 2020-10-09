SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [raw].[SAT_CSG_1_FOODS_FinancialYear](
	[HK_FinancialYear] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[LOADDT] [datetime2](7) NOT NULL,
	[LOADENDDT] [datetime2](7) NOT NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NOT NULL,
	[HASHDIFF] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[ISDELETED] [varchar](2) COLLATE Latin1_General_CI_AS NOT NULL,
	[dYearStartDate] [datetime2](7) NULL,
	[idYear] [int] NULL,
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
