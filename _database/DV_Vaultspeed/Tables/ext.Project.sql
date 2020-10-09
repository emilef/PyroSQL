SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [CSG_1_FOODS_ext].[Project](
	[LOADDT] [datetime2](7) NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NULL,
	[CHANGE_TYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[DATATYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[ProjectLink] [int] NULL,
	[BK_ProjectCode] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
	[ProjectCode] [varchar](63) COLLATE Latin1_General_CI_AS NULL,
	[BK_ProjectName] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
	[ProjectName] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
	[BK_ProjectLink] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
	[ActiveProject] [bit] NULL,
	[ProjectDescription] [varchar](180) COLLATE Latin1_General_CI_AS NULL,
	[MasterSubProject] [varchar](123) COLLATE Latin1_General_CI_AS NULL,
	[ProjectLevel] [int] NULL,
	[SubProjectOfLink] [int] NULL,
	[Project_iBranchID] [int] NULL,
	[Project_dCreatedDate] [datetime2](7) NULL,
	[Project_dModifiedDate] [datetime2](7) NULL,
	[Project_iCreatedBranchID] [int] NULL,
	[Project_iModifiedBranchID] [int] NULL,
	[Project_iCreatedAgentID] [int] NULL,
	[Project_iModifiedAgentID] [int] NULL,
	[Project_iChangeSetID] [int] NULL,
	[Project_Checksum] [binary](20) NULL
) ON [PRIMARY]

GO
