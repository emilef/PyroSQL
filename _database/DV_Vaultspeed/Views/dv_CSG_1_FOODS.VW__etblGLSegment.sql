SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dv_CSG_1_FOODS].[VW__etblGLSegment] AS 
	SELECT
		  [TDFT_SRC].[DATATYPE] AS [DATATYPE]
		, [TDFT_SRC].[idSegment] AS [idSegment]
		, [TDFT_SRC].[iSegmentNo] AS [iSegmentNo]
		, [TDFT_SRC].[cCode] AS [cCode]
		, [TDFT_SRC].[cDescription] AS [cDescription]
		, [TDFT_SRC].[iSegmentBranchID] AS [iSegmentBranchID]
		, [TDFT_SRC].[_etblGLSegment_iBranchID] AS [_etblGLSegment_iBranchID]
		, [TDFT_SRC].[_etblGLSegment_dCreatedDate] AS [_etblGLSegment_dCreatedDate]
		, [TDFT_SRC].[_etblGLSegment_dModifiedDate] AS [_etblGLSegment_dModifiedDate]
		, [TDFT_SRC].[_etblGLSegment_iCreatedBranchID] AS [_etblGLSegment_iCreatedBranchID]
		, [TDFT_SRC].[_etblGLSegment_iModifiedBranchID] AS [_etblGLSegment_iModifiedBranchID]
		, [TDFT_SRC].[_etblGLSegment_iCreatedAgentID] AS [_etblGLSegment_iCreatedAgentID]
		, [TDFT_SRC].[_etblGLSegment_iModifiedAgentID] AS [_etblGLSegment_iModifiedAgentID]
		, [TDFT_SRC].[_etblGLSegment_iChangeSetID] AS [_etblGLSegment_iChangeSetID]
		, [TDFT_SRC].[_etblGLSegment_Checksum] AS [_etblGLSegment_Checksum]
		, [TDFT_SRC].[imSCOAAccountID] AS [imSCOAAccountID]
		, [TDFT_SRC].[mSCOAId] AS [mSCOAId]
	FROM [dv_CSG_1_FOODS].[_etblGLSegment] [TDFT_SRC]
	;

GO
