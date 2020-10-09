SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_etblGLSegment_INIT AS 
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
BEGIN -- STG_TGT

	TRUNCATE TABLE [CSG_1_FOODS_stage].[_etblGLSegment];

	INSERT INTO [CSG_1_FOODS_stage].[_etblGLSegment](
		 [HK_GLSegment]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[SOURCE_SYSTEM]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[idSegment]
		,[BK_GLSegment]
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
		  UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_iSegmentNo] + '|' +
			[EXT_SRC].[BK_cCode] + '|' +  [EXT_SRC].[BK_idSegment] + '|'),2)) AS [HK_GLSegment]
		, [EXT_SRC].[LOADDT] AS [LOADDT]
		, [EXT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, 'CSG_1_FOODS' AS [SOURCE_SYSTEM]
		, [EXT_SRC].[CHANGE_TYPE] AS [CHANGE_TYPE]
		, [EXT_SRC].[DATATYPE] AS [DATATYPE]
		, [EXT_SRC].[idSegment] AS [idSegment]
		, [EXT_SRC].[BK_iSegmentNo] + '|' +  [EXT_SRC].[BK_cCode] + '|' +  [EXT_SRC].[BK_idSegment] AS [BK_GLSegment]
		, [EXT_SRC].[iSegmentNo] AS [iSegmentNo]
		, [EXT_SRC].[cCode] AS [cCode]
		, [EXT_SRC].[cDescription] AS [cDescription]
		, [EXT_SRC].[iSegmentBranchID] AS [iSegmentBranchID]
		, [EXT_SRC].[_etblGLSegment_iBranchID] AS [_etblGLSegment_iBranchID]
		, [EXT_SRC].[_etblGLSegment_dCreatedDate] AS [_etblGLSegment_dCreatedDate]
		, [EXT_SRC].[_etblGLSegment_dModifiedDate] AS [_etblGLSegment_dModifiedDate]
		, [EXT_SRC].[_etblGLSegment_iCreatedBranchID] AS [_etblGLSegment_iCreatedBranchID]
		, [EXT_SRC].[_etblGLSegment_iModifiedBranchID] AS [_etblGLSegment_iModifiedBranchID]
		, [EXT_SRC].[_etblGLSegment_iCreatedAgentID] AS [_etblGLSegment_iCreatedAgentID]
		, [EXT_SRC].[_etblGLSegment_iModifiedAgentID] AS [_etblGLSegment_iModifiedAgentID]
		, [EXT_SRC].[_etblGLSegment_iChangeSetID] AS [_etblGLSegment_iChangeSetID]
		, [EXT_SRC].[_etblGLSegment_Checksum] AS [_etblGLSegment_Checksum]
		, [EXT_SRC].[imSCOAAccountID] AS [imSCOAAccountID]
		, [EXT_SRC].[mSCOAId] AS [mSCOAId]
	FROM [CSG_1_FOODS_ext].[_etblGLSegment] [EXT_SRC]
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [MEX_SRC].[DATATYPE] = 'NA'
	;
END;


END;

 
 


GO
