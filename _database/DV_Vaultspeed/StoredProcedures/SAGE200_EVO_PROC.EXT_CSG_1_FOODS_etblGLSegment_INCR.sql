SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].EXT_CSG_1_FOODS_etblGLSegment_INCR AS 
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
BEGIN -- EXT_TGT

	TRUNCATE TABLE [CSG_1_FOODS_ext].[_etblGLSegment];

	INSERT INTO [CSG_1_FOODS_ext].[_etblGLSegment](
		 [LOAD_CYCLE_ID]
		,[LOADDT]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[idSegment]
		,[BK_iSegmentNo]
		,[BK_cCode]
		,[BK_idSegment]
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
		  [LCI_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, dateadd(MICROSECOND, 2*row_number() over (order by [LCI_SRC].[LOADDT]), SYSDATETIME()) AS [LOADDT]
		, [MEX_SRC].[ATTRIBUTE_VARCHAR] AS [CHANGE_TYPE]
		, [TDFV_SRC].[DATATYPE] AS [DATATYPE]
		, CONVERT(INT, [TDFV_SRC].[idSegment] , 1) AS [idSegment]
		, COALESCE(UPPER([TDFV_SRC].[iSegmentNo]),[MEX_SRC].[KEY_ATTRIBUTE_INT]) AS [BK_iSegmentNo]
		, COALESCE(UPPER(REPLACE([TDFV_SRC].[cCode],'|','\' + '|')),[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR]) AS [BK_cCode]
		, COALESCE(UPPER([TDFV_SRC].[idSegment]),[MEX_SRC].[KEY_ATTRIBUTE_INT]) AS [BK_idSegment]
		, CONVERT(INT, [TDFV_SRC].[iSegmentNo] , 1) AS [iSegmentNo]
		, [TDFV_SRC].[cCode]  AS [cCode]
		, [TDFV_SRC].[cDescription]  AS [cDescription]
		, CONVERT(INT, [TDFV_SRC].[iSegmentBranchID] , 1) AS [iSegmentBranchID]
		, CONVERT(INT, [TDFV_SRC].[_etblGLSegment_iBranchID] , 1) AS [_etblGLSegment_iBranchID]
		, CONVERT(DATETIME2, [TDFV_SRC].[_etblGLSegment_dCreatedDate] , 103) AS [_etblGLSegment_dCreatedDate]
		, CONVERT(DATETIME2, [TDFV_SRC].[_etblGLSegment_dModifiedDate] , 103) AS [_etblGLSegment_dModifiedDate]
		, CONVERT(INT, [TDFV_SRC].[_etblGLSegment_iCreatedBranchID] , 1) AS [_etblGLSegment_iCreatedBranchID]
		, CONVERT(INT, [TDFV_SRC].[_etblGLSegment_iModifiedBranchID] , 1) AS [_etblGLSegment_iModifiedBranchID]
		, CONVERT(INT, [TDFV_SRC].[_etblGLSegment_iCreatedAgentID] , 1) AS [_etblGLSegment_iCreatedAgentID]
		, CONVERT(INT, [TDFV_SRC].[_etblGLSegment_iModifiedAgentID] , 1) AS [_etblGLSegment_iModifiedAgentID]
		, CONVERT(INT, [TDFV_SRC].[_etblGLSegment_iChangeSetID] , 1) AS [_etblGLSegment_iChangeSetID]
		, CAST([TDFV_SRC].[_etblGLSegment_Checksum]  AS BINARY) AS [_etblGLSegment_Checksum]
		, CONVERT(INT, [TDFV_SRC].[imSCOAAccountID] , 1) AS [imSCOAAccountID]
		, [TDFV_SRC].[mSCOAId]  AS [mSCOAId]
	FROM [dv_CSG_1_FOODS].[VW__etblGLSegment] [TDFV_SRC]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  1 = 1
	WHERE  [MEX_SRC].[DATATYPE] = '#'
	;
END;


END;

 
 


GO
