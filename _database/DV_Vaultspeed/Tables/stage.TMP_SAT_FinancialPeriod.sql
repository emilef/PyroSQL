SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_FinancialPeriod](
	[HK_FinancialPeriod] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[LOADDT] [datetime2](7) NOT NULL,
	[LOADENDDT] [datetime2](7) NOT NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NOT NULL,
	[HASHDIFF] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[ISDELETED] [varchar](2) COLLATE Latin1_General_CI_AS NOT NULL,
	[dPeriodDate] [datetime2](7) NULL,
	[idPeriod] [int] NULL,
	[iYearID] [int] NULL,
	[bBlocked] [bit] NULL,
	[bPBTProcessed] [bit] NULL,
	[bPeriodProcessed] [bit] NULL,
	[_etblPeriod_iBranchID] [int] NULL,
	[_etblPeriod_dCreatedDate] [datetime2](7) NULL,
	[_etblPeriod_dModifiedDate] [datetime2](7) NULL,
	[_etblPeriod_iCreatedBranchID] [int] NULL,
	[_etblPeriod_iModifiedBranchID] [int] NULL,
	[_etblPeriod_iCreatedAgentID] [int] NULL,
	[_etblPeriod_iModifiedAgentID] [int] NULL,
	[_etblPeriod_iChangeSetID] [int] NULL,
	[_etblPeriod_Checksum] [binary](20) NULL,
	[SRC] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[EQUAL] [numeric](18, 0) NULL,
	[DATATYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]

GO
