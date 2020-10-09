SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].SAT_CSG_1_FOODS_FinancialYear_INCR AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_FinancialYear];

	WITH [DIST_STG] AS 
	( 
		SELECT DISTINCT 
 			  [STG_DIS_SRC].[HK_FinancialYear] AS [HK_FinancialYear]
			, [STG_DIS_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		FROM [CSG_1_FOODS_stage].[_etblPeriodYear] [STG_DIS_SRC]
	)
	, [TEMP_TABLE_SET] AS 
	( 
		SELECT 
			  [STG_TEMP_SRC].[HK_FinancialYear] AS [HK_FinancialYear]
			, [STG_TEMP_SRC].[LOADDT] AS [LOADDT]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, [STG_TEMP_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, [STG_TEMP_SRC].[DATATYPE] AS [DATATYPE]
			, 'STG' AS [SRC]
			, 1 AS [ORIGIN_ID]
			, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1',
				COALESCE(REPLACE(REPLACE(RTRIM(REPLACE(REPLACE( REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cYearDescription] ),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bArchived] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bPurged] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[_etblPeriodYear_iBranchID] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[_etblPeriodYear_dCreatedDate] , 103)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[_etblPeriodYear_dModifiedDate] , 103)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[_etblPeriodYear_iCreatedBranchID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[_etblPeriodYear_iModifiedBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[_etblPeriodYear_iCreatedAgentID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[_etblPeriodYear_iModifiedAgentID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[_etblPeriodYear_iChangeSetID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CAST([STG_TEMP_SRC].[_etblPeriodYear_Checksum]  AS VARCHAR)),'#'),'|','\' + '|')+ '|',
				' ','#' + '|'),'|' + '#',' ')),' ','|' + '#'),'#' + '|',' '),'#')),2)) AS [HASHDIFF]
			, CASE WHEN [STG_TEMP_SRC].[CHANGE_TYPE] = '-' THEN 'Y'  ELSE 'N'  END AS [ISDELETED]
			, [STG_TEMP_SRC].[idYear] AS [idYear]
			, [STG_TEMP_SRC].[dYearStartDate] AS [dYearStartDate]
			, [STG_TEMP_SRC].[cYearDescription] AS [cYearDescription]
			, [STG_TEMP_SRC].[bArchived] AS [bArchived]
			, [STG_TEMP_SRC].[bPurged] AS [bPurged]
			, [STG_TEMP_SRC].[_etblPeriodYear_iBranchID] AS [_etblPeriodYear_iBranchID]
			, [STG_TEMP_SRC].[_etblPeriodYear_dCreatedDate] AS [_etblPeriodYear_dCreatedDate]
			, [STG_TEMP_SRC].[_etblPeriodYear_dModifiedDate] AS [_etblPeriodYear_dModifiedDate]
			, [STG_TEMP_SRC].[_etblPeriodYear_iCreatedBranchID] AS [_etblPeriodYear_iCreatedBranchID]
			, [STG_TEMP_SRC].[_etblPeriodYear_iModifiedBranchID] AS [_etblPeriodYear_iModifiedBranchID]
			, [STG_TEMP_SRC].[_etblPeriodYear_iCreatedAgentID] AS [_etblPeriodYear_iCreatedAgentID]
			, [STG_TEMP_SRC].[_etblPeriodYear_iModifiedAgentID] AS [_etblPeriodYear_iModifiedAgentID]
			, [STG_TEMP_SRC].[_etblPeriodYear_iChangeSetID] AS [_etblPeriodYear_iChangeSetID]
			, [STG_TEMP_SRC].[_etblPeriodYear_Checksum] AS [_etblPeriodYear_Checksum]
		FROM [CSG_1_FOODS_stage].[_etblPeriodYear] [STG_TEMP_SRC]
		WHERE  [STG_TEMP_SRC].[DATATYPE] = 'SRC'
		UNION ALL 
		SELECT 
			  [SAT_SRC].[HK_FinancialYear] AS [HK_FinancialYear]
			, [SAT_SRC].[LOADDT] AS [LOADDT]
			, [SAT_SRC].[LOADENDDT] AS [LOADENDDT]
			, [SAT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, 'SAT' AS [DATATYPE]
			, 'SAT' AS [SRC]
			, 0 AS [ORIGIN_ID]
			, [SAT_SRC].[HASHDIFF] AS [HASHDIFF]
			, [SAT_SRC].[ISDELETED] AS [ISDELETED]
			, [SAT_SRC].[idYear] AS [idYear]
			, [SAT_SRC].[dYearStartDate] AS [dYearStartDate]
			, [SAT_SRC].[cYearDescription] AS [cYearDescription]
			, [SAT_SRC].[bArchived] AS [bArchived]
			, [SAT_SRC].[bPurged] AS [bPurged]
			, [SAT_SRC].[_etblPeriodYear_iBranchID] AS [_etblPeriodYear_iBranchID]
			, [SAT_SRC].[_etblPeriodYear_dCreatedDate] AS [_etblPeriodYear_dCreatedDate]
			, [SAT_SRC].[_etblPeriodYear_dModifiedDate] AS [_etblPeriodYear_dModifiedDate]
			, [SAT_SRC].[_etblPeriodYear_iCreatedBranchID] AS [_etblPeriodYear_iCreatedBranchID]
			, [SAT_SRC].[_etblPeriodYear_iModifiedBranchID] AS [_etblPeriodYear_iModifiedBranchID]
			, [SAT_SRC].[_etblPeriodYear_iCreatedAgentID] AS [_etblPeriodYear_iCreatedAgentID]
			, [SAT_SRC].[_etblPeriodYear_iModifiedAgentID] AS [_etblPeriodYear_iModifiedAgentID]
			, [SAT_SRC].[_etblPeriodYear_iChangeSetID] AS [_etblPeriodYear_iChangeSetID]
			, [SAT_SRC].[_etblPeriodYear_Checksum] AS [_etblPeriodYear_Checksum]
		FROM [raw].[SAT_CSG_1_FOODS_FinancialYear] [SAT_SRC]
		INNER JOIN [DIST_STG] ON  [SAT_SRC].[HK_FinancialYear] = [DIST_STG].[HK_FinancialYear]
		WHERE  [SAT_SRC].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	INSERT INTO [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_FinancialYear](
		 [HK_FinancialYear]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[DATATYPE]
		,[SRC]
		,[EQUAL]
		,[HASHDIFF]
		,[ISDELETED]
		,[idYear]
		,[dYearStartDate]
		,[cYearDescription]
		,[bArchived]
		,[bPurged]
		,[_etblPeriodYear_iBranchID]
		,[_etblPeriodYear_dCreatedDate]
		,[_etblPeriodYear_dModifiedDate]
		,[_etblPeriodYear_iCreatedBranchID]
		,[_etblPeriodYear_iModifiedBranchID]
		,[_etblPeriodYear_iCreatedAgentID]
		,[_etblPeriodYear_iModifiedAgentID]
		,[_etblPeriodYear_iChangeSetID]
		,[_etblPeriodYear_Checksum]
	)
	SELECT
		  [TEMP_TABLE_SET].[HK_FinancialYear] AS [HK_FinancialYear]
		, [TEMP_TABLE_SET].[LOADDT] AS [LOADDT]
		, [TEMP_TABLE_SET].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [TEMP_TABLE_SET].[LOADENDDT] AS [LOADENDDT]
		, [TEMP_TABLE_SET].[DATATYPE] AS [DATATYPE]
		, [TEMP_TABLE_SET].[SRC] AS [SRC]
		, CASE WHEN [TEMP_TABLE_SET].[SRC] = 'STG' AND CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HASHDIFF]  AS VARCHAR) = LAG( CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HASHDIFF]  AS VARCHAR),1)
			OVER(PARTITION BY [TEMP_TABLE_SET].[HK_FinancialYear] ORDER BY [TEMP_TABLE_SET].[LOADDT],
			[TEMP_TABLE_SET].[ORIGIN_ID])THEN 1 ELSE 0 END AS [EQUAL]
		, [TEMP_TABLE_SET].[HASHDIFF] AS [HASHDIFF]
		, [TEMP_TABLE_SET].[ISDELETED] AS [ISDELETED]
		, [TEMP_TABLE_SET].[idYear] AS [idYear]
		, [TEMP_TABLE_SET].[dYearStartDate] AS [dYearStartDate]
		, [TEMP_TABLE_SET].[cYearDescription] AS [cYearDescription]
		, [TEMP_TABLE_SET].[bArchived] AS [bArchived]
		, [TEMP_TABLE_SET].[bPurged] AS [bPurged]
		, [TEMP_TABLE_SET].[_etblPeriodYear_iBranchID] AS [_etblPeriodYear_iBranchID]
		, [TEMP_TABLE_SET].[_etblPeriodYear_dCreatedDate] AS [_etblPeriodYear_dCreatedDate]
		, [TEMP_TABLE_SET].[_etblPeriodYear_dModifiedDate] AS [_etblPeriodYear_dModifiedDate]
		, [TEMP_TABLE_SET].[_etblPeriodYear_iCreatedBranchID] AS [_etblPeriodYear_iCreatedBranchID]
		, [TEMP_TABLE_SET].[_etblPeriodYear_iModifiedBranchID] AS [_etblPeriodYear_iModifiedBranchID]
		, [TEMP_TABLE_SET].[_etblPeriodYear_iCreatedAgentID] AS [_etblPeriodYear_iCreatedAgentID]
		, [TEMP_TABLE_SET].[_etblPeriodYear_iModifiedAgentID] AS [_etblPeriodYear_iModifiedAgentID]
		, [TEMP_TABLE_SET].[_etblPeriodYear_iChangeSetID] AS [_etblPeriodYear_iChangeSetID]
		, [TEMP_TABLE_SET].[_etblPeriodYear_Checksum] AS [_etblPeriodYear_Checksum]
	FROM [TEMP_TABLE_SET]
	;
END;


BEGIN -- SAT_INUR_TGT

	INSERT INTO [raw].[SAT_CSG_1_FOODS_FinancialYear](
		 [HK_FinancialYear]
		,[LOADDT]
		,[LOADENDDT]
		,[LOAD_CYCLE_ID]
		,[ISDELETED]
		,[HASHDIFF]
		,[idYear]
		,[dYearStartDate]
		,[cYearDescription]
		,[bArchived]
		,[bPurged]
		,[_etblPeriodYear_iBranchID]
		,[_etblPeriodYear_dCreatedDate]
		,[_etblPeriodYear_dModifiedDate]
		,[_etblPeriodYear_iCreatedBranchID]
		,[_etblPeriodYear_iModifiedBranchID]
		,[_etblPeriodYear_iCreatedAgentID]
		,[_etblPeriodYear_iModifiedAgentID]
		,[_etblPeriodYear_iChangeSetID]
		,[_etblPeriodYear_Checksum]
	)
	SELECT
		  [SAT_TEMP_SRC_INUR].[HK_FinancialYear] AS [HK_FinancialYear]
		, [SAT_TEMP_SRC_INUR].[LOADDT] AS [LOADDT]
		, [SAT_TEMP_SRC_INUR].[LOADENDDT] AS [LOADENDDT]
		, [SAT_TEMP_SRC_INUR].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [SAT_TEMP_SRC_INUR].[ISDELETED] AS [ISDELETED]
		, [SAT_TEMP_SRC_INUR].[HASHDIFF] AS [HASHDIFF]
		, [SAT_TEMP_SRC_INUR].[idYear] AS [idYear]
		, [SAT_TEMP_SRC_INUR].[dYearStartDate] AS [dYearStartDate]
		, [SAT_TEMP_SRC_INUR].[cYearDescription] AS [cYearDescription]
		, [SAT_TEMP_SRC_INUR].[bArchived] AS [bArchived]
		, [SAT_TEMP_SRC_INUR].[bPurged] AS [bPurged]
		, [SAT_TEMP_SRC_INUR].[_etblPeriodYear_iBranchID] AS [_etblPeriodYear_iBranchID]
		, [SAT_TEMP_SRC_INUR].[_etblPeriodYear_dCreatedDate] AS [_etblPeriodYear_dCreatedDate]
		, [SAT_TEMP_SRC_INUR].[_etblPeriodYear_dModifiedDate] AS [_etblPeriodYear_dModifiedDate]
		, [SAT_TEMP_SRC_INUR].[_etblPeriodYear_iCreatedBranchID] AS [_etblPeriodYear_iCreatedBranchID]
		, [SAT_TEMP_SRC_INUR].[_etblPeriodYear_iModifiedBranchID] AS [_etblPeriodYear_iModifiedBranchID]
		, [SAT_TEMP_SRC_INUR].[_etblPeriodYear_iCreatedAgentID] AS [_etblPeriodYear_iCreatedAgentID]
		, [SAT_TEMP_SRC_INUR].[_etblPeriodYear_iModifiedAgentID] AS [_etblPeriodYear_iModifiedAgentID]
		, [SAT_TEMP_SRC_INUR].[_etblPeriodYear_iChangeSetID] AS [_etblPeriodYear_iChangeSetID]
		, [SAT_TEMP_SRC_INUR].[_etblPeriodYear_Checksum] AS [_etblPeriodYear_Checksum]
	FROM [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_FinancialYear] [SAT_TEMP_SRC_INUR]
	WHERE  [SAT_TEMP_SRC_INUR].[SRC] = 'STG' AND [SAT_TEMP_SRC_INUR].[EQUAL] = 0
	;
END;


BEGIN -- SAT_ED_TGT

	WITH [CALC_LOAD_END_DATE] AS 
	( 
		SELECT
			  [SAT_TEMP_SRC_US].[HK_FinancialYear] AS [HK_FinancialYear]
			, [SAT_TEMP_SRC_US].[LOADDT] AS [LOADDT]
			, COALESCE(LEAD([SAT_TEMP_SRC_US].[LOADDT],1)
				OVER(PARTITION BY [SAT_TEMP_SRC_US].[HK_FinancialYear] ORDER BY [SAT_TEMP_SRC_US].[LOADDT]),
				CONVERT(DATETIME2, '31/12/2999' , 103)) AS [LOADENDDT]
		FROM [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_FinancialYear] [SAT_TEMP_SRC_US]
		WHERE  [SAT_TEMP_SRC_US].[EQUAL] = 0
	)
	, [FILTER_LOAD_END_DATE] AS 
	( 
		SELECT
			  [CALC_LOAD_END_DATE].[HK_FinancialYear] AS [HK_FinancialYear]
			, [CALC_LOAD_END_DATE].[LOADDT] AS [LOADDT]
			, [CALC_LOAD_END_DATE].[LOADENDDT] AS [LOADENDDT]
		FROM [CALC_LOAD_END_DATE]
		WHERE  [CALC_LOAD_END_DATE].[LOADENDDT] != CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	UPDATE [SAT_ED_TGT]
	SET 
		 [LOADENDDT] =  [FILTER_LOAD_END_DATE].[LOADENDDT]
	FROM [FILTER_LOAD_END_DATE]
	JOIN [raw].[SAT_CSG_1_FOODS_FinancialYear] [SAT_ED_TGT] ON 1 = 1 
	WHERE [SAT_ED_TGT].[HK_FinancialYear] =  [FILTER_LOAD_END_DATE].[HK_FinancialYear]
	  AND [SAT_ED_TGT].[LOADDT] =  [FILTER_LOAD_END_DATE].[LOADDT]
	;
END;


END;

 
 


GO
