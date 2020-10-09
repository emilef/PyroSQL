SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [raw].[SAT_CSG_1_FOODS_GLSegment](
	[HK_GLSegment] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[LOADDT] [datetime2](7) NOT NULL,
	[LOADENDDT] [datetime2](7) NOT NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NOT NULL,
	[HASHDIFF] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[ISDELETED] [varchar](2) COLLATE Latin1_General_CI_AS NOT NULL,
	[iSegmentNo] [int] NULL,
	[cCode] [varchar](120) COLLATE Latin1_General_CI_AS NULL,
	[idSegment] [int] NULL,
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
