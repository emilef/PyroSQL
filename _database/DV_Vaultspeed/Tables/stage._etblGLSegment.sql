SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [CSG_1_FOODS_stage].[_etblGLSegment](
	[HK_GLSegment] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[LOADDT] [datetime2](7) NULL,
	[SOURCE_SYSTEM] [varchar](200) COLLATE Latin1_General_CI_AS NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NULL,
	[CHANGE_TYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[DATATYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[idSegment] [int] NULL,
	[BK_GLSegment] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[BK_iSegmentNo] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
	[iSegmentNo] [int] NULL,
	[BK_cCode] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
	[cCode] [varchar](120) COLLATE Latin1_General_CI_AS NULL,
	[BK_idSegment] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
	[cDescription] [varchar](120) COLLATE Latin1_General_CI_AS NULL,
	[iSegmentBranchID] [int] NULL,
	[_etblGLSegment_iBranchID] [int] NULL,
	[_etblGLSegment_dCreatedDate] [datetime2](7) NULL,
	[_etblGLSegment_dModifiedDate] [datetime2](7) NULL,
	[_etblGLSegment_iCreatedBranchID] [int] NULL,
	[_etblGLSegment_iModifiedBranchID] [int] NULL,
	[_etblGLSegment_iCreatedAgentID] [int] NULL,
	[_etblGLSegment_iModifiedAgentID] [int] NULL,
	[_etblGLSegment_iChangeSetID] [int] NULL,
	[_etblGLSegment_Checksum] [binary](20) NULL,
	[imSCOAAccountID] [int] NULL,
	[mSCOAId] [varchar](150) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]

GO
