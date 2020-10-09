SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dv_CSG_1_FOODS].[_etblGLSegment](
	[idSegment] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iSegmentNo] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[cCode] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[cDescription] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iSegmentBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblGLSegment_iBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblGLSegment_dCreatedDate] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblGLSegment_dModifiedDate] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblGLSegment_iCreatedBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblGLSegment_iModifiedBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblGLSegment_iCreatedAgentID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblGLSegment_iModifiedAgentID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblGLSegment_iChangeSetID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[_etblGLSegment_Checksum] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[imSCOAAccountID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[mSCOAId] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[CHANGE_TYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[DATATYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NULL,
	[LOADDT] [datetime2](7) NULL
) ON [PRIMARY]

GO
