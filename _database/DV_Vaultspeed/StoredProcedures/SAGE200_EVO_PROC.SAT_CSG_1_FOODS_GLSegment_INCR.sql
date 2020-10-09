SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].SAT_CSG_1_FOODS_GLSegment_INCR AS 
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
BEGIN -- SAT_TEMP_TGT

	TRUNCATE TABLE [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_GLSegment];

	WITH [DIST_STG] AS 
	( 
		SELECT DISTINCT 
 			  [STG_DIS_SRC].[HK_GLSegment] AS [HK_GLSegment]
			, [STG_DIS_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		FROM [CSG_1_FOODS_stage].[_etblGLSegment] [STG_DIS_SRC]
	)
	, [TEMP_TABLE_SET] AS 
	( 
		SELECT 
			  [STG_TEMP_SRC].[HK_GLSegment] AS [HK_GLSegment]
			, [STG_TEMP_SRC].[LOADDT] AS [LOADDT]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, [STG_TEMP_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, [STG_TEMP_SRC].[DATATYPE] AS [DATATYPE]
			, 'STG' AS [SRC]
			, 1 AS [ORIGIN_ID]
			, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1',
				COALESCE(REPLACE(REPLACE(RTRIM(REPLACE(REPLACE( REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cDescription] ),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iSegmentBranchID] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[_etblGLSegment_iBranchID] , 1)
				),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[_etblGLSegment_dCreatedDate] , 103)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[_etblGLSegment_dModifiedDate] , 103)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[_etblGLSegment_iCreatedBranchID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[_etblGLSegment_iModifiedBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[_etblGLSegment_iCreatedAgentID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[_etblGLSegment_iModifiedAgentID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[_etblGLSegment_iChangeSetID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CAST([STG_TEMP_SRC].[_etblGLSegment_Checksum]  AS VARCHAR)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[imSCOAAccountID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[mSCOAId] ),'#'),'|','\' + '|')+ '|',' ','#' + '|'),'|' + '#',' ')),
				' ','|' + '#'),'#' + '|',' '),'#')),2)) AS [HASHDIFF]
			, CASE WHEN [STG_TEMP_SRC].[CHANGE_TYPE] = '-' THEN 'Y'  ELSE 'N'  END AS [ISDELETED]
			, [STG_TEMP_SRC].[idSegment] AS [idSegment]
			, [STG_TEMP_SRC].[iSegmentNo] AS [iSegmentNo]
			, [STG_TEMP_SRC].[cCode] AS [cCode]
			, [STG_TEMP_SRC].[cDescription] AS [cDescription]
			, [STG_TEMP_SRC].[iSegmentBranchID] AS [iSegmentBranchID]
			, [STG_TEMP_SRC].[_etblGLSegment_iBranchID] AS [_etblGLSegment_iBranchID]
			, [STG_TEMP_SRC].[_etblGLSegment_dCreatedDate] AS [_etblGLSegment_dCreatedDate]
			, [STG_TEMP_SRC].[_etblGLSegment_dModifiedDate] AS [_etblGLSegment_dModifiedDate]
			, [STG_TEMP_SRC].[_etblGLSegment_iCreatedBranchID] AS [_etblGLSegment_iCreatedBranchID]
			, [STG_TEMP_SRC].[_etblGLSegment_iModifiedBranchID] AS [_etblGLSegment_iModifiedBranchID]
			, [STG_TEMP_SRC].[_etblGLSegment_iCreatedAgentID] AS [_etblGLSegment_iCreatedAgentID]
			, [STG_TEMP_SRC].[_etblGLSegment_iModifiedAgentID] AS [_etblGLSegment_iModifiedAgentID]
			, [STG_TEMP_SRC].[_etblGLSegment_iChangeSetID] AS [_etblGLSegment_iChangeSetID]
			, [STG_TEMP_SRC].[_etblGLSegment_Checksum] AS [_etblGLSegment_Checksum]
			, [STG_TEMP_SRC].[imSCOAAccountID] AS [imSCOAAccountID]
			, [STG_TEMP_SRC].[mSCOAId] AS [mSCOAId]
		FROM [CSG_1_FOODS_stage].[_etblGLSegment] [STG_TEMP_SRC]
		WHERE  [STG_TEMP_SRC].[DATATYPE] = 'SRC'
		UNION ALL 
		SELECT 
			  [SAT_SRC].[HK_GLSegment] AS [HK_GLSegment]
			, [SAT_SRC].[LOADDT] AS [LOADDT]
			, [SAT_SRC].[LOADENDDT] AS [LOADENDDT]
			, [SAT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, 'SAT' AS [DATATYPE]
			, 'SAT' AS [SRC]
			, 0 AS [ORIGIN_ID]
			, [SAT_SRC].[HASHDIFF] AS [HASHDIFF]
			, [SAT_SRC].[ISDELETED] AS [ISDELETED]
			, [SAT_SRC].[idSegment] AS [idSegment]
			, [SAT_SRC].[iSegmentNo] AS [iSegmentNo]
			, [SAT_SRC].[cCode] AS [cCode]
			, [SAT_SRC].[cDescription] AS [cDescription]
			, [SAT_SRC].[iSegmentBranchID] AS [iSegmentBranchID]
			, [SAT_SRC].[_etblGLSegment_iBranchID] AS [_etblGLSegment_iBranchID]
			, [SAT_SRC].[_etblGLSegment_dCreatedDate] AS [_etblGLSegment_dCreatedDate]
			, [SAT_SRC].[_etblGLSegment_dModifiedDate] AS [_etblGLSegment_dModifiedDate]
			, [SAT_SRC].[_etblGLSegment_iCreatedBranchID] AS [_etblGLSegment_iCreatedBranchID]
			, [SAT_SRC].[_etblGLSegment_iModifiedBranchID] AS [_etblGLSegment_iModifiedBranchID]
			, [SAT_SRC].[_etblGLSegment_iCreatedAgentID] AS [_etblGLSegment_iCreatedAgentID]
			, [SAT_SRC].[_etblGLSegment_iModifiedAgentID] AS [_etblGLSegment_iModifiedAgentID]
			, [SAT_SRC].[_etblGLSegment_iChangeSetID] AS [_etblGLSegment_iChangeSetID]
			, [SAT_SRC].[_etblGLSegment_Checksum] AS [_etblGLSegment_Checksum]
			, [SAT_SRC].[imSCOAAccountID] AS [imSCOAAccountID]
			, [SAT_SRC].[mSCOAId] AS [mSCOAId]
		FROM [raw].[SAT_CSG_1_FOODS_GLSegment] [SAT_SRC]
		INNER JOIN [DIST_STG] ON  [SAT_SRC].[HK_GLSegment] = [DIST_STG].[HK_GLSegment]
		WHERE  [SAT_SRC].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	INSERT INTO [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_GLSegment](
		 [HK_GLSegment]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[DATATYPE]
		,[SRC]
		,[EQUAL]
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
		  [TEMP_TABLE_SET].[HK_GLSegment] AS [HK_GLSegment]
		, [TEMP_TABLE_SET].[LOADDT] AS [LOADDT]
		, [TEMP_TABLE_SET].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [TEMP_TABLE_SET].[LOADENDDT] AS [LOADENDDT]
		, [TEMP_TABLE_SET].[DATATYPE] AS [DATATYPE]
		, [TEMP_TABLE_SET].[SRC] AS [SRC]
		, CASE WHEN [TEMP_TABLE_SET].[SRC] = 'STG' AND CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HASHDIFF]  AS VARCHAR) = LAG( CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HASHDIFF]  AS VARCHAR),1)
			OVER(PARTITION BY [TEMP_TABLE_SET].[HK_GLSegment] ORDER BY [TEMP_TABLE_SET].[LOADDT],
			[TEMP_TABLE_SET].[ORIGIN_ID])THEN 1 ELSE 0 END AS [EQUAL]
		, [TEMP_TABLE_SET].[HASHDIFF] AS [HASHDIFF]
		, [TEMP_TABLE_SET].[ISDELETED] AS [ISDELETED]
		, [TEMP_TABLE_SET].[idSegment] AS [idSegment]
		, [TEMP_TABLE_SET].[iSegmentNo] AS [iSegmentNo]
		, [TEMP_TABLE_SET].[cCode] AS [cCode]
		, [TEMP_TABLE_SET].[cDescription] AS [cDescription]
		, [TEMP_TABLE_SET].[iSegmentBranchID] AS [iSegmentBranchID]
		, [TEMP_TABLE_SET].[_etblGLSegment_iBranchID] AS [_etblGLSegment_iBranchID]
		, [TEMP_TABLE_SET].[_etblGLSegment_dCreatedDate] AS [_etblGLSegment_dCreatedDate]
		, [TEMP_TABLE_SET].[_etblGLSegment_dModifiedDate] AS [_etblGLSegment_dModifiedDate]
		, [TEMP_TABLE_SET].[_etblGLSegment_iCreatedBranchID] AS [_etblGLSegment_iCreatedBranchID]
		, [TEMP_TABLE_SET].[_etblGLSegment_iModifiedBranchID] AS [_etblGLSegment_iModifiedBranchID]
		, [TEMP_TABLE_SET].[_etblGLSegment_iCreatedAgentID] AS [_etblGLSegment_iCreatedAgentID]
		, [TEMP_TABLE_SET].[_etblGLSegment_iModifiedAgentID] AS [_etblGLSegment_iModifiedAgentID]
		, [TEMP_TABLE_SET].[_etblGLSegment_iChangeSetID] AS [_etblGLSegment_iChangeSetID]
		, [TEMP_TABLE_SET].[_etblGLSegment_Checksum] AS [_etblGLSegment_Checksum]
		, [TEMP_TABLE_SET].[imSCOAAccountID] AS [imSCOAAccountID]
		, [TEMP_TABLE_SET].[mSCOAId] AS [mSCOAId]
	FROM [TEMP_TABLE_SET]
	;
END;


BEGIN -- SAT_INUR_TGT

	INSERT INTO [raw].[SAT_CSG_1_FOODS_GLSegment](
		 [HK_GLSegment]
		,[LOADDT]
		,[LOADENDDT]
		,[LOAD_CYCLE_ID]
		,[ISDELETED]
		,[HASHDIFF]
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
		  [SAT_TEMP_SRC_INUR].[HK_GLSegment] AS [HK_GLSegment]
		, [SAT_TEMP_SRC_INUR].[LOADDT] AS [LOADDT]
		, [SAT_TEMP_SRC_INUR].[LOADENDDT] AS [LOADENDDT]
		, [SAT_TEMP_SRC_INUR].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [SAT_TEMP_SRC_INUR].[ISDELETED] AS [ISDELETED]
		, [SAT_TEMP_SRC_INUR].[HASHDIFF] AS [HASHDIFF]
		, [SAT_TEMP_SRC_INUR].[idSegment] AS [idSegment]
		, [SAT_TEMP_SRC_INUR].[iSegmentNo] AS [iSegmentNo]
		, [SAT_TEMP_SRC_INUR].[cCode] AS [cCode]
		, [SAT_TEMP_SRC_INUR].[cDescription] AS [cDescription]
		, [SAT_TEMP_SRC_INUR].[iSegmentBranchID] AS [iSegmentBranchID]
		, [SAT_TEMP_SRC_INUR].[_etblGLSegment_iBranchID] AS [_etblGLSegment_iBranchID]
		, [SAT_TEMP_SRC_INUR].[_etblGLSegment_dCreatedDate] AS [_etblGLSegment_dCreatedDate]
		, [SAT_TEMP_SRC_INUR].[_etblGLSegment_dModifiedDate] AS [_etblGLSegment_dModifiedDate]
		, [SAT_TEMP_SRC_INUR].[_etblGLSegment_iCreatedBranchID] AS [_etblGLSegment_iCreatedBranchID]
		, [SAT_TEMP_SRC_INUR].[_etblGLSegment_iModifiedBranchID] AS [_etblGLSegment_iModifiedBranchID]
		, [SAT_TEMP_SRC_INUR].[_etblGLSegment_iCreatedAgentID] AS [_etblGLSegment_iCreatedAgentID]
		, [SAT_TEMP_SRC_INUR].[_etblGLSegment_iModifiedAgentID] AS [_etblGLSegment_iModifiedAgentID]
		, [SAT_TEMP_SRC_INUR].[_etblGLSegment_iChangeSetID] AS [_etblGLSegment_iChangeSetID]
		, [SAT_TEMP_SRC_INUR].[_etblGLSegment_Checksum] AS [_etblGLSegment_Checksum]
		, [SAT_TEMP_SRC_INUR].[imSCOAAccountID] AS [imSCOAAccountID]
		, [SAT_TEMP_SRC_INUR].[mSCOAId] AS [mSCOAId]
	FROM [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_GLSegment] [SAT_TEMP_SRC_INUR]
	WHERE  [SAT_TEMP_SRC_INUR].[SRC] = 'STG' AND [SAT_TEMP_SRC_INUR].[EQUAL] = 0
	;
END;


BEGIN -- SAT_ED_TGT

	WITH [CALC_LOAD_END_DATE] AS 
	( 
		SELECT
			  [SAT_TEMP_SRC_US].[HK_GLSegment] AS [HK_GLSegment]
			, [SAT_TEMP_SRC_US].[LOADDT] AS [LOADDT]
			, COALESCE(LEAD([SAT_TEMP_SRC_US].[LOADDT],1)
				OVER(PARTITION BY [SAT_TEMP_SRC_US].[HK_GLSegment] ORDER BY [SAT_TEMP_SRC_US].[LOADDT]), CONVERT(DATETIME2,
				'31/12/2999' , 103)) AS [LOADENDDT]
		FROM [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_GLSegment] [SAT_TEMP_SRC_US]
		WHERE  [SAT_TEMP_SRC_US].[EQUAL] = 0
	)
	, [FILTER_LOAD_END_DATE] AS 
	( 
		SELECT
			  [CALC_LOAD_END_DATE].[HK_GLSegment] AS [HK_GLSegment]
			, [CALC_LOAD_END_DATE].[LOADDT] AS [LOADDT]
			, [CALC_LOAD_END_DATE].[LOADENDDT] AS [LOADENDDT]
		FROM [CALC_LOAD_END_DATE]
		WHERE  [CALC_LOAD_END_DATE].[LOADENDDT] != CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	UPDATE [SAT_ED_TGT]
	SET 
		 [LOADENDDT] =  [FILTER_LOAD_END_DATE].[LOADENDDT]
	FROM [FILTER_LOAD_END_DATE]
	JOIN [raw].[SAT_CSG_1_FOODS_GLSegment] [SAT_ED_TGT] ON 1 = 1 
	WHERE [SAT_ED_TGT].[HK_GLSegment] =  [FILTER_LOAD_END_DATE].[HK_GLSegment]
	  AND [SAT_ED_TGT].[LOADDT] =  [FILTER_LOAD_END_DATE].[LOADDT]
	;
END;


END;

 
 


GO
