SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [CSG_Modelling_VaultSpeed].[_etblGLSegment](
	[idSegment] [int] IDENTITY(1,1) NOT NULL,
	[iSegmentNo] [int] NOT NULL,
	[cCode] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[cDescription] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[iSegmentBranchID] [int] NULL,
	[_etblGLSegment_iBranchID] [int] NULL,
	[_etblGLSegment_dCreatedDate] [datetime] NULL,
	[_etblGLSegment_dModifiedDate] [datetime] NULL,
	[_etblGLSegment_iCreatedBranchID] [int] NULL,
	[_etblGLSegment_iModifiedBranchID] [int] NULL,
	[_etblGLSegment_iCreatedAgentID] [int] NULL,
	[_etblGLSegment_iModifiedAgentID] [int] NULL,
	[_etblGLSegment_iChangeSetID] [int] NULL,
	[_etblGLSegment_Checksum] [binary](20) NULL,
	[imSCOAAccountID] [int] NULL,
	[mSCOAId] [varchar](50) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]

GO
