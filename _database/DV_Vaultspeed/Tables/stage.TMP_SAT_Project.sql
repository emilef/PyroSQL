SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_Project](
	[HK_Project] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[LOADDT] [datetime2](7) NOT NULL,
	[LOADENDDT] [datetime2](7) NOT NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NOT NULL,
	[HASHDIFF] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[ISDELETED] [varchar](2) COLLATE Latin1_General_CI_AS NOT NULL,
	[ProjectCode] [varchar](63) COLLATE Latin1_General_CI_AS NULL,
	[ProjectName] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
	[ProjectLink] [int] NULL,
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
	[Project_Checksum] [binary](20) NULL,
	[SRC] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[EQUAL] [numeric](18, 0) NULL,
	[DATATYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]

GO
