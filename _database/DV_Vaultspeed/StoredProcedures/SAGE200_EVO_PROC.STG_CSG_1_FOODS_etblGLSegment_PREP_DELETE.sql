SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_etblGLSegment_PREP_DELETE AS 
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
BEGIN -- STG_PREP_DEL_TGT

	INSERT INTO [CSG_1_FOODS_stage].[_etblGLSegment](
		 [HK_GLSegment]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[LOAD_CYCLE_ID]
		,[LOADDT]
		,[idSegment]
		,[iSegmentNo]
		,[cCode]
		,[BK_GLSegment]
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
		  [HUB_SRC].[HK_GLSegment] AS [HK_GLSegment]
		, '-' AS [CHANGE_TYPE]
		, 'SRC' AS [DATATYPE]
		, [LCI_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [LCI_SRC].[LOADDT] AS [LOADDT]
		, [SAT_SRC1].[idSegment] AS [idSegment]
		, [SAT_SRC1].[iSegmentNo] AS [iSegmentNo]
		, [SAT_SRC1].[cCode] AS [cCode]
		, [HUB_SRC].[BK_GLSegment] AS [BK_GLSegment]
		, [SAT_SRC1].[cDescription] AS [cDescription]
		, [SAT_SRC1].[iSegmentBranchID] AS [iSegmentBranchID]
		, [SAT_SRC1].[_etblGLSegment_iBranchID] AS [_etblGLSegment_iBranchID]
		, [SAT_SRC1].[_etblGLSegment_dCreatedDate] AS [_etblGLSegment_dCreatedDate]
		, [SAT_SRC1].[_etblGLSegment_dModifiedDate] AS [_etblGLSegment_dModifiedDate]
		, [SAT_SRC1].[_etblGLSegment_iCreatedBranchID] AS [_etblGLSegment_iCreatedBranchID]
		, [SAT_SRC1].[_etblGLSegment_iModifiedBranchID] AS [_etblGLSegment_iModifiedBranchID]
		, [SAT_SRC1].[_etblGLSegment_iCreatedAgentID] AS [_etblGLSegment_iCreatedAgentID]
		, [SAT_SRC1].[_etblGLSegment_iModifiedAgentID] AS [_etblGLSegment_iModifiedAgentID]
		, [SAT_SRC1].[_etblGLSegment_iChangeSetID] AS [_etblGLSegment_iChangeSetID]
		, [SAT_SRC1].[_etblGLSegment_Checksum] AS [_etblGLSegment_Checksum]
		, [SAT_SRC1].[imSCOAAccountID] AS [imSCOAAccountID]
		, [SAT_SRC1].[mSCOAId] AS [mSCOAId]
	FROM [raw].[HUB_GLSegment] [HUB_SRC]
	INNER JOIN [raw].[SAT_CSG_1_FOODS_GLSegment] [SAT_SRC1] ON  [SAT_SRC1].[HK_GLSegment] = [HUB_SRC].[HK_GLSegment] AND [SAT_SRC1].[LOADENDDT] = CONVERT(DATETIME2,
		'31/12/2999' , 103) AND [SAT_SRC1].[ISDELETED] = 'N'
	LEFT OUTER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [HUB_SRC].[LOAD_CYCLE_ID] = CONVERT(int, [MEX_SRC].[LOAD_CYCLE_ID] )
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	LEFT OUTER JOIN [CSG_1_FOODS_stage].[_etblGLSegment] [STG_SRC] ON  [HUB_SRC].[HK_GLSegment] = [STG_SRC].[HK_GLSegment] AND [HUB_SRC].[SOURCE_SYSTEM] = [STG_SRC].[SOURCE_SYSTEM]
	WHERE  [STG_SRC].[LOAD_CYCLE_ID] IS NULL AND [MEX_SRC].[LOAD_CYCLE_ID] IS NULL
	;
END;


END;

 
 


GO
