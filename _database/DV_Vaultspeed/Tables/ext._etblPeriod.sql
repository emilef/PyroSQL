SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [CSG_1_FOODS_ext].[_etblPeriod](
	[LOADDT] [datetime2](7) NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NULL,
	[CHANGE_TYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[DATATYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[idPeriod] [int] NULL,
	[iYearID] [int] NULL,
	[BK_idPeriod] [varchar](750) COLLATE Latin1_General_CI_AS NULL,
	[BK_dPeriodDate] [varchar](750) COLLATE Latin1_General_CI_AS NULL,
	[dPeriodDate] [datetime2](7) NULL,
	[BK_FK_idYear_iYearID] [varchar](750) COLLATE Latin1_General_CI_AS NULL,
	[BK_FK_dYearStartDate_iYearID] [varchar](750) COLLATE Latin1_General_CI_AS NULL,
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
	[_etblPeriod_Checksum] [binary](20) NULL
) ON [PRIMARY]

GO
