SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dv_CSG_1_FOODS].[_etblPeriodYear](
	[idYear] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[cYearDescription] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[dYearStartDate] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[bArchived] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[bPurged] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriodYear_iBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriodYear_dCreatedDate] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriodYear_dModifiedDate] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriodYear_iCreatedBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriodYear_iModifiedBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriodYear_iCreatedAgentID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriodYear_iModifiedAgentID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriodYear_iChangeSetID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblPeriodYear_Checksum] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[CHANGE_TYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[DATATYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NULL,
	[LOADDT] [datetime2](7) NULL
) ON [PRIMARY]

GO
