SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].SAT_CSG_1_FOODS_Project_INCR AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_Project];

	WITH [DIST_STG] AS 
	( 
		SELECT DISTINCT 
 			  [STG_DIS_SRC].[HK_Project] AS [HK_Project]
			, [STG_DIS_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		FROM [CSG_1_FOODS_stage].[Project] [STG_DIS_SRC]
	)
	, [TEMP_TABLE_SET] AS 
	( 
		SELECT 
			  [STG_TEMP_SRC].[HK_Project] AS [HK_Project]
			, [STG_TEMP_SRC].[LOADDT] AS [LOADDT]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, [STG_TEMP_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, [STG_TEMP_SRC].[DATATYPE] AS [DATATYPE]
			, 'STG' AS [SRC]
			, 1 AS [ORIGIN_ID]
			, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1',
				COALESCE(REPLACE(REPLACE(RTRIM(REPLACE(REPLACE( REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[ActiveProject] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[ProjectDescription] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[MasterSubProject] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[ProjectLevel] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[SubProjectOfLink] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Project_iBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Project_dCreatedDate] , 103)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Project_dModifiedDate] , 103)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Project_iCreatedBranchID] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Project_iModifiedBranchID] ,
				1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[Project_iCreatedAgentID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Project_iModifiedAgentID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Project_iChangeSetID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CAST([STG_TEMP_SRC].[Project_Checksum]  AS VARCHAR)),'#'),'|','\' + '|')+
				'|',' ','#' + '|'),'|' + '#',' ')),' ','|' + '#'),'#' + '|',' '),'#')),2)) AS [HASHDIFF]
			, CASE WHEN [STG_TEMP_SRC].[CHANGE_TYPE] = '-' THEN 'Y'  ELSE 'N'  END AS [ISDELETED]
			, [STG_TEMP_SRC].[ProjectLink] AS [ProjectLink]
			, [STG_TEMP_SRC].[ProjectCode] AS [ProjectCode]
			, [STG_TEMP_SRC].[ProjectName] AS [ProjectName]
			, [STG_TEMP_SRC].[ActiveProject] AS [ActiveProject]
			, [STG_TEMP_SRC].[ProjectDescription] AS [ProjectDescription]
			, [STG_TEMP_SRC].[MasterSubProject] AS [MasterSubProject]
			, [STG_TEMP_SRC].[ProjectLevel] AS [ProjectLevel]
			, [STG_TEMP_SRC].[SubProjectOfLink] AS [SubProjectOfLink]
			, [STG_TEMP_SRC].[Project_iBranchID] AS [Project_iBranchID]
			, [STG_TEMP_SRC].[Project_dCreatedDate] AS [Project_dCreatedDate]
			, [STG_TEMP_SRC].[Project_dModifiedDate] AS [Project_dModifiedDate]
			, [STG_TEMP_SRC].[Project_iCreatedBranchID] AS [Project_iCreatedBranchID]
			, [STG_TEMP_SRC].[Project_iModifiedBranchID] AS [Project_iModifiedBranchID]
			, [STG_TEMP_SRC].[Project_iCreatedAgentID] AS [Project_iCreatedAgentID]
			, [STG_TEMP_SRC].[Project_iModifiedAgentID] AS [Project_iModifiedAgentID]
			, [STG_TEMP_SRC].[Project_iChangeSetID] AS [Project_iChangeSetID]
			, [STG_TEMP_SRC].[Project_Checksum] AS [Project_Checksum]
		FROM [CSG_1_FOODS_stage].[Project] [STG_TEMP_SRC]
		WHERE  [STG_TEMP_SRC].[DATATYPE] = 'SRC'
		UNION ALL 
		SELECT 
			  [SAT_SRC].[HK_Project] AS [HK_Project]
			, [SAT_SRC].[LOADDT] AS [LOADDT]
			, [SAT_SRC].[LOADENDDT] AS [LOADENDDT]
			, [SAT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, 'SAT' AS [DATATYPE]
			, 'SAT' AS [SRC]
			, 0 AS [ORIGIN_ID]
			, [SAT_SRC].[HASHDIFF] AS [HASHDIFF]
			, [SAT_SRC].[ISDELETED] AS [ISDELETED]
			, [SAT_SRC].[ProjectLink] AS [ProjectLink]
			, [SAT_SRC].[ProjectCode] AS [ProjectCode]
			, [SAT_SRC].[ProjectName] AS [ProjectName]
			, [SAT_SRC].[ActiveProject] AS [ActiveProject]
			, [SAT_SRC].[ProjectDescription] AS [ProjectDescription]
			, [SAT_SRC].[MasterSubProject] AS [MasterSubProject]
			, [SAT_SRC].[ProjectLevel] AS [ProjectLevel]
			, [SAT_SRC].[SubProjectOfLink] AS [SubProjectOfLink]
			, [SAT_SRC].[Project_iBranchID] AS [Project_iBranchID]
			, [SAT_SRC].[Project_dCreatedDate] AS [Project_dCreatedDate]
			, [SAT_SRC].[Project_dModifiedDate] AS [Project_dModifiedDate]
			, [SAT_SRC].[Project_iCreatedBranchID] AS [Project_iCreatedBranchID]
			, [SAT_SRC].[Project_iModifiedBranchID] AS [Project_iModifiedBranchID]
			, [SAT_SRC].[Project_iCreatedAgentID] AS [Project_iCreatedAgentID]
			, [SAT_SRC].[Project_iModifiedAgentID] AS [Project_iModifiedAgentID]
			, [SAT_SRC].[Project_iChangeSetID] AS [Project_iChangeSetID]
			, [SAT_SRC].[Project_Checksum] AS [Project_Checksum]
		FROM [raw].[SAT_CSG_1_FOODS_Project] [SAT_SRC]
		INNER JOIN [DIST_STG] ON  [SAT_SRC].[HK_Project] = [DIST_STG].[HK_Project]
		WHERE  [SAT_SRC].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	INSERT INTO [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_Project](
		 [HK_Project]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[DATATYPE]
		,[SRC]
		,[EQUAL]
		,[HASHDIFF]
		,[ISDELETED]
		,[ProjectLink]
		,[ProjectCode]
		,[ProjectName]
		,[ActiveProject]
		,[ProjectDescription]
		,[MasterSubProject]
		,[ProjectLevel]
		,[SubProjectOfLink]
		,[Project_iBranchID]
		,[Project_dCreatedDate]
		,[Project_dModifiedDate]
		,[Project_iCreatedBranchID]
		,[Project_iModifiedBranchID]
		,[Project_iCreatedAgentID]
		,[Project_iModifiedAgentID]
		,[Project_iChangeSetID]
		,[Project_Checksum]
	)
	SELECT
		  [TEMP_TABLE_SET].[HK_Project] AS [HK_Project]
		, [TEMP_TABLE_SET].[LOADDT] AS [LOADDT]
		, [TEMP_TABLE_SET].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [TEMP_TABLE_SET].[LOADENDDT] AS [LOADENDDT]
		, [TEMP_TABLE_SET].[DATATYPE] AS [DATATYPE]
		, [TEMP_TABLE_SET].[SRC] AS [SRC]
		, CASE WHEN [TEMP_TABLE_SET].[SRC] = 'STG' AND CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HASHDIFF]  AS VARCHAR) = LAG( CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HASHDIFF]  AS VARCHAR),1)
			OVER(PARTITION BY [TEMP_TABLE_SET].[HK_Project] ORDER BY [TEMP_TABLE_SET].[LOADDT],
			[TEMP_TABLE_SET].[ORIGIN_ID])THEN 1 ELSE 0 END AS [EQUAL]
		, [TEMP_TABLE_SET].[HASHDIFF] AS [HASHDIFF]
		, [TEMP_TABLE_SET].[ISDELETED] AS [ISDELETED]
		, [TEMP_TABLE_SET].[ProjectLink] AS [ProjectLink]
		, [TEMP_TABLE_SET].[ProjectCode] AS [ProjectCode]
		, [TEMP_TABLE_SET].[ProjectName] AS [ProjectName]
		, [TEMP_TABLE_SET].[ActiveProject] AS [ActiveProject]
		, [TEMP_TABLE_SET].[ProjectDescription] AS [ProjectDescription]
		, [TEMP_TABLE_SET].[MasterSubProject] AS [MasterSubProject]
		, [TEMP_TABLE_SET].[ProjectLevel] AS [ProjectLevel]
		, [TEMP_TABLE_SET].[SubProjectOfLink] AS [SubProjectOfLink]
		, [TEMP_TABLE_SET].[Project_iBranchID] AS [Project_iBranchID]
		, [TEMP_TABLE_SET].[Project_dCreatedDate] AS [Project_dCreatedDate]
		, [TEMP_TABLE_SET].[Project_dModifiedDate] AS [Project_dModifiedDate]
		, [TEMP_TABLE_SET].[Project_iCreatedBranchID] AS [Project_iCreatedBranchID]
		, [TEMP_TABLE_SET].[Project_iModifiedBranchID] AS [Project_iModifiedBranchID]
		, [TEMP_TABLE_SET].[Project_iCreatedAgentID] AS [Project_iCreatedAgentID]
		, [TEMP_TABLE_SET].[Project_iModifiedAgentID] AS [Project_iModifiedAgentID]
		, [TEMP_TABLE_SET].[Project_iChangeSetID] AS [Project_iChangeSetID]
		, [TEMP_TABLE_SET].[Project_Checksum] AS [Project_Checksum]
	FROM [TEMP_TABLE_SET]
	;
END;


BEGIN -- SAT_INUR_TGT

	INSERT INTO [raw].[SAT_CSG_1_FOODS_Project](
		 [HK_Project]
		,[LOADDT]
		,[LOADENDDT]
		,[LOAD_CYCLE_ID]
		,[ISDELETED]
		,[HASHDIFF]
		,[ProjectLink]
		,[ProjectCode]
		,[ProjectName]
		,[ActiveProject]
		,[ProjectDescription]
		,[MasterSubProject]
		,[ProjectLevel]
		,[SubProjectOfLink]
		,[Project_iBranchID]
		,[Project_dCreatedDate]
		,[Project_dModifiedDate]
		,[Project_iCreatedBranchID]
		,[Project_iModifiedBranchID]
		,[Project_iCreatedAgentID]
		,[Project_iModifiedAgentID]
		,[Project_iChangeSetID]
		,[Project_Checksum]
	)
	SELECT
		  [SAT_TEMP_SRC_INUR].[HK_Project] AS [HK_Project]
		, [SAT_TEMP_SRC_INUR].[LOADDT] AS [LOADDT]
		, [SAT_TEMP_SRC_INUR].[LOADENDDT] AS [LOADENDDT]
		, [SAT_TEMP_SRC_INUR].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [SAT_TEMP_SRC_INUR].[ISDELETED] AS [ISDELETED]
		, [SAT_TEMP_SRC_INUR].[HASHDIFF] AS [HASHDIFF]
		, [SAT_TEMP_SRC_INUR].[ProjectLink] AS [ProjectLink]
		, [SAT_TEMP_SRC_INUR].[ProjectCode] AS [ProjectCode]
		, [SAT_TEMP_SRC_INUR].[ProjectName] AS [ProjectName]
		, [SAT_TEMP_SRC_INUR].[ActiveProject] AS [ActiveProject]
		, [SAT_TEMP_SRC_INUR].[ProjectDescription] AS [ProjectDescription]
		, [SAT_TEMP_SRC_INUR].[MasterSubProject] AS [MasterSubProject]
		, [SAT_TEMP_SRC_INUR].[ProjectLevel] AS [ProjectLevel]
		, [SAT_TEMP_SRC_INUR].[SubProjectOfLink] AS [SubProjectOfLink]
		, [SAT_TEMP_SRC_INUR].[Project_iBranchID] AS [Project_iBranchID]
		, [SAT_TEMP_SRC_INUR].[Project_dCreatedDate] AS [Project_dCreatedDate]
		, [SAT_TEMP_SRC_INUR].[Project_dModifiedDate] AS [Project_dModifiedDate]
		, [SAT_TEMP_SRC_INUR].[Project_iCreatedBranchID] AS [Project_iCreatedBranchID]
		, [SAT_TEMP_SRC_INUR].[Project_iModifiedBranchID] AS [Project_iModifiedBranchID]
		, [SAT_TEMP_SRC_INUR].[Project_iCreatedAgentID] AS [Project_iCreatedAgentID]
		, [SAT_TEMP_SRC_INUR].[Project_iModifiedAgentID] AS [Project_iModifiedAgentID]
		, [SAT_TEMP_SRC_INUR].[Project_iChangeSetID] AS [Project_iChangeSetID]
		, [SAT_TEMP_SRC_INUR].[Project_Checksum] AS [Project_Checksum]
	FROM [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_Project] [SAT_TEMP_SRC_INUR]
	WHERE  [SAT_TEMP_SRC_INUR].[SRC] = 'STG' AND [SAT_TEMP_SRC_INUR].[EQUAL] = 0
	;
END;


BEGIN -- SAT_ED_TGT

	WITH [CALC_LOAD_END_DATE] AS 
	( 
		SELECT
			  [SAT_TEMP_SRC_US].[HK_Project] AS [HK_Project]
			, [SAT_TEMP_SRC_US].[LOADDT] AS [LOADDT]
			, COALESCE(LEAD([SAT_TEMP_SRC_US].[LOADDT],1)
				OVER(PARTITION BY [SAT_TEMP_SRC_US].[HK_Project] ORDER BY [SAT_TEMP_SRC_US].[LOADDT]), CONVERT(DATETIME2,
				'31/12/2999' , 103)) AS [LOADENDDT]
		FROM [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_Project] [SAT_TEMP_SRC_US]
		WHERE  [SAT_TEMP_SRC_US].[EQUAL] = 0
	)
	, [FILTER_LOAD_END_DATE] AS 
	( 
		SELECT
			  [CALC_LOAD_END_DATE].[HK_Project] AS [HK_Project]
			, [CALC_LOAD_END_DATE].[LOADDT] AS [LOADDT]
			, [CALC_LOAD_END_DATE].[LOADENDDT] AS [LOADENDDT]
		FROM [CALC_LOAD_END_DATE]
		WHERE  [CALC_LOAD_END_DATE].[LOADENDDT] != CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	UPDATE [SAT_ED_TGT]
	SET 
		 [LOADENDDT] =  [FILTER_LOAD_END_DATE].[LOADENDDT]
	FROM [FILTER_LOAD_END_DATE]
	JOIN [raw].[SAT_CSG_1_FOODS_Project] [SAT_ED_TGT] ON 1 = 1 
	WHERE [SAT_ED_TGT].[HK_Project] =  [FILTER_LOAD_END_DATE].[HK_Project]
	  AND [SAT_ED_TGT].[LOADDT] =  [FILTER_LOAD_END_DATE].[LOADDT]
	;
END;


END;

 
 


GO
