SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Project](
	[ProjectLink] [int] IDENTITY(1,1) NOT NULL,
	[ProjectCode] [varchar](21) COLLATE Latin1_General_CI_AS NULL,
	[ProjectName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[ActiveProject] [bit] NOT NULL,
	[ProjectDescription] [varchar](60) COLLATE Latin1_General_CI_AS NULL,
	[MasterSubProject] [varchar](41) COLLATE Latin1_General_CI_AS NULL,
	[ProjectLevel] [int] NULL,
	[SubProjectOfLink] [int] NULL,
	[Project_iBranchID] [int] NULL,
	[Project_dCreatedDate] [datetime] NULL,
	[Project_dModifiedDate] [datetime] NULL,
	[Project_iCreatedBranchID] [int] NULL,
	[Project_iModifiedBranchID] [int] NULL,
	[Project_iCreatedAgentID] [int] NULL,
	[Project_iModifiedAgentID] [int] NULL,
	[Project_iChangeSetID] [int] NULL,
	[Project_Checksum] [binary](20) NULL
) ON [PRIMARY]

GO
