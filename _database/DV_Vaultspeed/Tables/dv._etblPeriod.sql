SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dv_CSG_1_FOODS].[_etblPeriod](
	[idPeriod] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[dPeriodDate] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[bBlocked] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[bPBTProcessed] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[bPeriodProcessed] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iYearID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriod_iBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriod_dCreatedDate] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriod_dModifiedDate] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriod_iCreatedBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriod_iModifiedBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriod_iCreatedAgentID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriod_iModifiedAgentID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriod_iChangeSetID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriod_Checksum] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[CHANGE_TYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[DATATYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NULL,
	[LOADDT] [datetime2](7) NULL
) ON [PRIMARY]

GO
