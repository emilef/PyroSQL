SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dv_CSG_1_FOODS].[Project](
	[ProjectLink] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[ProjectCode] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[ProjectName] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[ActiveProject] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[ProjectDescription] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[MasterSubProject] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[ProjectLevel] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[SubProjectOfLink] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[Project_iBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[Project_dCreatedDate] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[Project_dModifiedDate] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[Project_iCreatedBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[Project_iModifiedBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[Project_iCreatedAgentID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[Project_iModifiedAgentID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[Project_iChangeSetID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[Project_Checksum] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[CHANGE_TYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[DATATYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NULL,
	[LOADDT] [datetime2](7) NULL
) ON [PRIMARY]

GO
