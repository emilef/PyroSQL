SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].SAT_CSG_1_FOODS_GLSegment_INIT AS 
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
BEGIN -- SAT_TGT

	DELETE FROM [raw].[SAT_CSG_1_FOODS_GLSegment] 
	WHERE  1 = 1
	;
END;


BEGIN -- SAT_TGT

	WITH [STG_SRC] AS 
	( 
		SELECT
			  [STG_INR_SRC].[HK_GLSegment] AS [HK_GLSegment]
			, [STG_INR_SRC].[LOADDT] AS [LOADDT]
			, [STG_INR_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1',
				COALESCE(REPLACE(REPLACE(RTRIM(REPLACE(REPLACE( REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cDescription] ),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iSegmentBranchID] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[_etblGLSegment_iBranchID] , 1))
				,'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[_etblGLSegment_dCreatedDate] , 103)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[_etblGLSegment_dModifiedDate] , 103)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[_etblGLSegment_iCreatedBranchID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[_etblGLSegment_iModifiedBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[_etblGLSegment_iCreatedAgentID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[_etblGLSegment_iModifiedAgentID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[_etblGLSegment_iChangeSetID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CAST([STG_INR_SRC].[_etblGLSegment_Checksum]  AS VARCHAR)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[imSCOAAccountID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[mSCOAId] ),'#'),'|','\' + '|')+ '|',' ','#' + '|'),'|' + '#',' ')),' ',
				'|' + '#'),'#' + '|',' '),'#')),2)) AS [HASHDIFF]
			, 'N'  AS [ISDELETED]
			, [STG_INR_SRC].[idSegment] AS [idSegment]
			, [STG_INR_SRC].[iSegmentNo] AS [iSegmentNo]
			, [STG_INR_SRC].[cCode] AS [cCode]
			, [STG_INR_SRC].[cDescription] AS [cDescription]
			, [STG_INR_SRC].[iSegmentBranchID] AS [iSegmentBranchID]
			, [STG_INR_SRC].[_etblGLSegment_iBranchID] AS [_etblGLSegment_iBranchID]
			, [STG_INR_SRC].[_etblGLSegment_dCreatedDate] AS [_etblGLSegment_dCreatedDate]
			, [STG_INR_SRC].[_etblGLSegment_dModifiedDate] AS [_etblGLSegment_dModifiedDate]
			, [STG_INR_SRC].[_etblGLSegment_iCreatedBranchID] AS [_etblGLSegment_iCreatedBranchID]
			, [STG_INR_SRC].[_etblGLSegment_iModifiedBranchID] AS [_etblGLSegment_iModifiedBranchID]
			, [STG_INR_SRC].[_etblGLSegment_iCreatedAgentID] AS [_etblGLSegment_iCreatedAgentID]
			, [STG_INR_SRC].[_etblGLSegment_iModifiedAgentID] AS [_etblGLSegment_iModifiedAgentID]
			, [STG_INR_SRC].[_etblGLSegment_iChangeSetID] AS [_etblGLSegment_iChangeSetID]
			, [STG_INR_SRC].[_etblGLSegment_Checksum] AS [_etblGLSegment_Checksum]
			, [STG_INR_SRC].[imSCOAAccountID] AS [imSCOAAccountID]
			, [STG_INR_SRC].[mSCOAId] AS [mSCOAId]
			, ROW_NUMBER()OVER(PARTITION BY [STG_INR_SRC].[HK_GLSegment] ORDER BY [STG_INR_SRC].[LOADDT]) AS [DUMMY]
		FROM [CSG_1_FOODS_stage].[_etblGLSegment] [STG_INR_SRC]
	)
	INSERT INTO [raw].[SAT_CSG_1_FOODS_GLSegment](
		 [HK_GLSegment]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[HASHDIFF]
		,[ISDELETED]
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
		  [STG_SRC].[HK_GLSegment] AS [HK_GLSegment]
		, [STG_SRC].[LOADDT] AS [LOADDT]
		, [STG_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [STG_SRC].[LOADENDDT] AS [LOADENDDT]
		, [STG_SRC].[HASHDIFF] AS [HASHDIFF]
		, [STG_SRC].[ISDELETED] AS [ISDELETED]
		, [STG_SRC].[idSegment] AS [idSegment]
		, [STG_SRC].[iSegmentNo] AS [iSegmentNo]
		, [STG_SRC].[cCode] AS [cCode]
		, [STG_SRC].[cDescription] AS [cDescription]
		, [STG_SRC].[iSegmentBranchID] AS [iSegmentBranchID]
		, [STG_SRC].[_etblGLSegment_iBranchID] AS [_etblGLSegment_iBranchID]
		, [STG_SRC].[_etblGLSegment_dCreatedDate] AS [_etblGLSegment_dCreatedDate]
		, [STG_SRC].[_etblGLSegment_dModifiedDate] AS [_etblGLSegment_dModifiedDate]
		, [STG_SRC].[_etblGLSegment_iCreatedBranchID] AS [_etblGLSegment_iCreatedBranchID]
		, [STG_SRC].[_etblGLSegment_iModifiedBranchID] AS [_etblGLSegment_iModifiedBranchID]
		, [STG_SRC].[_etblGLSegment_iCreatedAgentID] AS [_etblGLSegment_iCreatedAgentID]
		, [STG_SRC].[_etblGLSegment_iModifiedAgentID] AS [_etblGLSegment_iModifiedAgentID]
		, [STG_SRC].[_etblGLSegment_iChangeSetID] AS [_etblGLSegment_iChangeSetID]
		, [STG_SRC].[_etblGLSegment_Checksum] AS [_etblGLSegment_Checksum]
		, [STG_SRC].[imSCOAAccountID] AS [imSCOAAccountID]
		, [STG_SRC].[mSCOAId] AS [mSCOAId]
	FROM [STG_SRC]
	WHERE  [STG_SRC].[DUMMY] = 1
	;
END;


END;

 
 


GO
