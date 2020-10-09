SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].[SRC_CSG_1_FOODS_etblGLSegment_TDFT_INCR] AS 
/*
    ___  ___  ______  |  
   / _ \/ _ \|  ____| |  agile    
  / / \ \/ \ \ |__    |  automation
 / /  /\ \  \ \ __|   |  factory   
/_/  /_/\_\  \_\      | 

Vaultspeed version: 4.1.16.6, generation date: 2020/09/22 13:12:11
DV_NAME: CSG_DV - Release: CSG_DV_V11(11) - Comment: CSG_DV_V11 - Release date: 2020/09/22 12:36:07, 
BV release: init(1) - Comment: initial release - Release date: 2020/09/22 10:44:25, 
SRC_NAME: CSG_1_FOODS - Release: CSG_1_FOODS(6) - Comment: Release 6.0 - Release date: 2020/09/22 12:10:29
 */


BEGIN 
BEGIN -- TDFT_TGT

	TRUNCATE TABLE [dv_CSG_1_FOODS].[_etblGLSegment];

	WITH [DELTA_VIEW] AS 
	( 
		SELECT 
			  CAST('SRC'  AS VARCHAR) AS [DATATYPE]
			, [CDC_SRC].[idSegment] AS [idSegment]
			, [CDC_SRC].[iSegmentNo] AS [iSegmentNo]
			, [CDC_SRC].[cCode] AS [cCode]
			, [CDC_SRC].[cDescription] AS [cDescription]
			, [CDC_SRC].[iSegmentBranchID] AS [iSegmentBranchID]
			, [CDC_SRC].[_etblGLSegment_iBranchID] AS [_etblGLSegment_iBranchID]
			, [CDC_SRC].[_etblGLSegment_dCreatedDate] AS [_etblGLSegment_dCreatedDate]
			, [CDC_SRC].[_etblGLSegment_dModifiedDate] AS [_etblGLSegment_dModifiedDate]
			, [CDC_SRC].[_etblGLSegment_iCreatedBranchID] AS [_etblGLSegment_iCreatedBranchID]
			, [CDC_SRC].[_etblGLSegment_iModifiedBranchID] AS [_etblGLSegment_iModifiedBranchID]
			, [CDC_SRC].[_etblGLSegment_iCreatedAgentID] AS [_etblGLSegment_iCreatedAgentID]
			, [CDC_SRC].[_etblGLSegment_iModifiedAgentID] AS [_etblGLSegment_iModifiedAgentID]
			, [CDC_SRC].[_etblGLSegment_iChangeSetID] AS [_etblGLSegment_iChangeSetID]
			, [CDC_SRC].[_etblGLSegment_Checksum] AS [_etblGLSegment_Checksum]
			, [CDC_SRC].[imSCOAAccountID] AS [imSCOAAccountID]
			, [CDC_SRC].[mSCOAId] AS [mSCOAId]
		FROM [CSG_1_FOODS].[_etblGLSegment] [CDC_SRC]
	)
	, [PREPJOINBK] AS 
	( 
		SELECT
			  [DELTA_VIEW].[DATATYPE] AS [DATATYPE]
			, COALESCE(REPLACE([DELTA_VIEW].[idSegment],',',''),[MEX_BK_SRC].[KEY_ATTRIBUTE_INT]) AS [idSegment]
			, REPLACE([DELTA_VIEW].[iSegmentNo],',','') AS [iSegmentNo]
			, [DELTA_VIEW].[cCode] AS [cCode]
			, [DELTA_VIEW].[cDescription] AS [cDescription]
			, REPLACE([DELTA_VIEW].[iSegmentBranchID],',','') AS [iSegmentBranchID]
			, REPLACE([DELTA_VIEW].[_etblGLSegment_iBranchID],',','') AS [_etblGLSegment_iBranchID]
			, [DELTA_VIEW].[_etblGLSegment_dCreatedDate] AS [_etblGLSegment_dCreatedDate]
			, [DELTA_VIEW].[_etblGLSegment_dModifiedDate] AS [_etblGLSegment_dModifiedDate]
			, REPLACE([DELTA_VIEW].[_etblGLSegment_iCreatedBranchID],',','') AS [_etblGLSegment_iCreatedBranchID]
			, REPLACE([DELTA_VIEW].[_etblGLSegment_iModifiedBranchID],',','') AS [_etblGLSegment_iModifiedBranchID]
			, REPLACE([DELTA_VIEW].[_etblGLSegment_iCreatedAgentID],',','') AS [_etblGLSegment_iCreatedAgentID]
			, REPLACE([DELTA_VIEW].[_etblGLSegment_iModifiedAgentID],',','') AS [_etblGLSegment_iModifiedAgentID]
			, REPLACE([DELTA_VIEW].[_etblGLSegment_iChangeSetID],',','') AS [_etblGLSegment_iChangeSetID]
			, [DELTA_VIEW].[_etblGLSegment_Checksum] AS [_etblGLSegment_Checksum]
			, REPLACE([DELTA_VIEW].[imSCOAAccountID],',','') AS [imSCOAAccountID]
			, [DELTA_VIEW].[mSCOAId] AS [mSCOAId]
		FROM [DELTA_VIEW]
		INNER JOIN [dc].[EXECEPTION] [MEX_BK_SRC] ON  1 = 1
		WHERE  [MEX_BK_SRC].[DATATYPE] = '#'
	)
	INSERT INTO [dv_CSG_1_FOODS].[_etblGLSegment](
		 [DATATYPE]
		,[idSegment]
		,[iSegmentNo]
		,[cCode]
		,[cDescription]
		,[iSegmentBranchID]
		,[_etblGLSegment_iBranchID]
		,[_etblGLSegment_dCreatedDate]
		,[_etblGLSegment_dModifiedDate]
		,[_etblGLSegment_iCreatedBranchID]
		,[_etblGLSegment_iModifiedBranchID]
		,[_etblGLSegment_iCreatedAgentID]
		,[_etblGLSegment_iModifiedAgentID]
		,[_etblGLSegment_iChangeSetID]
		,[_etblGLSegment_Checksum]
		,[imSCOAAccountID]
		,[mSCOAId]
	)
	SELECT
		  [PREPJOINBK].[DATATYPE] AS [DATATYPE]
		, [PREPJOINBK].[idSegment] AS [idSegment]
		, [PREPJOINBK].[iSegmentNo] AS [iSegmentNo]
		, [PREPJOINBK].[cCode] AS [cCode]
		, [PREPJOINBK].[cDescription] AS [cDescription]
		, [PREPJOINBK].[iSegmentBranchID] AS [iSegmentBranchID]
		, [PREPJOINBK].[_etblGLSegment_iBranchID] AS [_etblGLSegment_iBranchID]
		, [PREPJOINBK].[_etblGLSegment_dCreatedDate] AS [_etblGLSegment_dCreatedDate]
		, [PREPJOINBK].[_etblGLSegment_dModifiedDate] AS [_etblGLSegment_dModifiedDate]
		, [PREPJOINBK].[_etblGLSegment_iCreatedBranchID] AS [_etblGLSegment_iCreatedBranchID]
		, [PREPJOINBK].[_etblGLSegment_iModifiedBranchID] AS [_etblGLSegment_iModifiedBranchID]
		, [PREPJOINBK].[_etblGLSegment_iCreatedAgentID] AS [_etblGLSegment_iCreatedAgentID]
		, [PREPJOINBK].[_etblGLSegment_iModifiedAgentID] AS [_etblGLSegment_iModifiedAgentID]
		, [PREPJOINBK].[_etblGLSegment_iChangeSetID] AS [_etblGLSegment_iChangeSetID]
		, [PREPJOINBK].[_etblGLSegment_Checksum] AS [_etblGLSegment_Checksum]
		, [PREPJOINBK].[imSCOAAccountID] AS [imSCOAAccountID]
		, [PREPJOINBK].[mSCOAId] AS [mSCOAId]
	FROM [PREPJOINBK]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	LEFT OUTER JOIN [raw].[SAT_CSG_1_FOODS_GLSegment] [SAT_SRC1] ON  CONVERT(INT, [PREPJOINBK].[idSegment] , 1) = [SAT_SRC1].[idSegment] AND [SAT_SRC1].[LOAD_CYCLE_ID] =
		[LCI_SRC].[LOAD_CYCLE_ID]
	WHERE  [SAT_SRC1].[HK_GLSegment] IS NULL
	;
END;


END;

 
 


GO
