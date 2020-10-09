SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].SAT_CSG_1_FOODS_FinancialPeriod_INCR AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_FinancialPeriod];

	WITH [DIST_STG] AS 
	( 
		SELECT DISTINCT 
 			  [STG_DIS_SRC].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
			, [STG_DIS_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		FROM [CSG_1_FOODS_stage].[_etblPeriod] [STG_DIS_SRC]
	)
	, [TEMP_TABLE_SET] AS 
	( 
		SELECT 
			  [STG_TEMP_SRC].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
			, [STG_TEMP_SRC].[LOADDT] AS [LOADDT]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, [STG_TEMP_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, [STG_TEMP_SRC].[DATATYPE] AS [DATATYPE]
			, 'STG' AS [SRC]
			, 1 AS [ORIGIN_ID]
			, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1',
				COALESCE(REPLACE(REPLACE(RTRIM(REPLACE(REPLACE( REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[bBlocked] , 1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[bPBTProcessed] , 1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[bPeriodProcessed] , 1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[_etblPeriod_iBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[_etblPeriod_dCreatedDate] , 103)),'#'),'|','\' + '|')
				+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[_etblPeriod_dModifiedDate] , 103)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[_etblPeriod_iCreatedBranchID] , 1)
				),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[_etblPeriod_iModifiedBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[_etblPeriod_iCreatedAgentID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[_etblPeriod_iModifiedAgentID] , 1)),'#')
				,'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[_etblPeriod_iChangeSetID] ,
				1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CAST([STG_TEMP_SRC].[_etblPeriod_Checksum]  AS VARCHAR)),'#'),'|','\' + '|')+ '|',' ',
				'#' + '|'),'|' + '#',' ')),' ','|' + '#'),'#' + '|',' '),'#')),2)) AS [HASHDIFF]
			, CASE WHEN [STG_TEMP_SRC].[CHANGE_TYPE] = '-' THEN 'Y'  ELSE 'N'  END AS [ISDELETED]
			, [STG_TEMP_SRC].[idPeriod] AS [idPeriod]
			, [STG_TEMP_SRC].[iYearID] AS [iYearID]
			, [STG_TEMP_SRC].[dPeriodDate] AS [dPeriodDate]
			, [STG_TEMP_SRC].[bBlocked] AS [bBlocked]
			, [STG_TEMP_SRC].[bPBTProcessed] AS [bPBTProcessed]
			, [STG_TEMP_SRC].[bPeriodProcessed] AS [bPeriodProcessed]
			, [STG_TEMP_SRC].[_etblPeriod_iBranchID] AS [_etblPeriod_iBranchID]
			, [STG_TEMP_SRC].[_etblPeriod_dCreatedDate] AS [_etblPeriod_dCreatedDate]
			, [STG_TEMP_SRC].[_etblPeriod_dModifiedDate] AS [_etblPeriod_dModifiedDate]
			, [STG_TEMP_SRC].[_etblPeriod_iCreatedBranchID] AS [_etblPeriod_iCreatedBranchID]
			, [STG_TEMP_SRC].[_etblPeriod_iModifiedBranchID] AS [_etblPeriod_iModifiedBranchID]
			, [STG_TEMP_SRC].[_etblPeriod_iCreatedAgentID] AS [_etblPeriod_iCreatedAgentID]
			, [STG_TEMP_SRC].[_etblPeriod_iModifiedAgentID] AS [_etblPeriod_iModifiedAgentID]
			, [STG_TEMP_SRC].[_etblPeriod_iChangeSetID] AS [_etblPeriod_iChangeSetID]
			, [STG_TEMP_SRC].[_etblPeriod_Checksum] AS [_etblPeriod_Checksum]
		FROM [CSG_1_FOODS_stage].[_etblPeriod] [STG_TEMP_SRC]
		WHERE  [STG_TEMP_SRC].[DATATYPE] = 'SRC'
		UNION ALL 
		SELECT 
			  [SAT_SRC].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
			, [SAT_SRC].[LOADDT] AS [LOADDT]
			, [SAT_SRC].[LOADENDDT] AS [LOADENDDT]
			, [SAT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, 'SAT' AS [DATATYPE]
			, 'SAT' AS [SRC]
			, 0 AS [ORIGIN_ID]
			, [SAT_SRC].[HASHDIFF] AS [HASHDIFF]
			, [SAT_SRC].[ISDELETED] AS [ISDELETED]
			, [SAT_SRC].[idPeriod] AS [idPeriod]
			, [SAT_SRC].[iYearID] AS [iYearID]
			, [SAT_SRC].[dPeriodDate] AS [dPeriodDate]
			, [SAT_SRC].[bBlocked] AS [bBlocked]
			, [SAT_SRC].[bPBTProcessed] AS [bPBTProcessed]
			, [SAT_SRC].[bPeriodProcessed] AS [bPeriodProcessed]
			, [SAT_SRC].[_etblPeriod_iBranchID] AS [_etblPeriod_iBranchID]
			, [SAT_SRC].[_etblPeriod_dCreatedDate] AS [_etblPeriod_dCreatedDate]
			, [SAT_SRC].[_etblPeriod_dModifiedDate] AS [_etblPeriod_dModifiedDate]
			, [SAT_SRC].[_etblPeriod_iCreatedBranchID] AS [_etblPeriod_iCreatedBranchID]
			, [SAT_SRC].[_etblPeriod_iModifiedBranchID] AS [_etblPeriod_iModifiedBranchID]
			, [SAT_SRC].[_etblPeriod_iCreatedAgentID] AS [_etblPeriod_iCreatedAgentID]
			, [SAT_SRC].[_etblPeriod_iModifiedAgentID] AS [_etblPeriod_iModifiedAgentID]
			, [SAT_SRC].[_etblPeriod_iChangeSetID] AS [_etblPeriod_iChangeSetID]
			, [SAT_SRC].[_etblPeriod_Checksum] AS [_etblPeriod_Checksum]
		FROM [raw].[SAT_CSG_1_FOODS_FinancialPeriod] [SAT_SRC]
		INNER JOIN [DIST_STG] ON  [SAT_SRC].[HK_FinancialPeriod] = [DIST_STG].[HK_FinancialPeriod]
		WHERE  [SAT_SRC].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	INSERT INTO [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_FinancialPeriod](
		 [HK_FinancialPeriod]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[DATATYPE]
		,[SRC]
		,[EQUAL]
		,[HASHDIFF]
		,[ISDELETED]
		,[idPeriod]
		,[iYearID]
		,[dPeriodDate]
		,[bBlocked]
		,[bPBTProcessed]
		,[bPeriodProcessed]
		,[_etblPeriod_iBranchID]
		,[_etblPeriod_dCreatedDate]
		,[_etblPeriod_dModifiedDate]
		,[_etblPeriod_iCreatedBranchID]
		,[_etblPeriod_iModifiedBranchID]
		,[_etblPeriod_iCreatedAgentID]
		,[_etblPeriod_iModifiedAgentID]
		,[_etblPeriod_iChangeSetID]
		,[_etblPeriod_Checksum]
	)
	SELECT
		  [TEMP_TABLE_SET].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
		, [TEMP_TABLE_SET].[LOADDT] AS [LOADDT]
		, [TEMP_TABLE_SET].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [TEMP_TABLE_SET].[LOADENDDT] AS [LOADENDDT]
		, [TEMP_TABLE_SET].[DATATYPE] AS [DATATYPE]
		, [TEMP_TABLE_SET].[SRC] AS [SRC]
		, CASE WHEN [TEMP_TABLE_SET].[SRC] = 'STG' AND CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HASHDIFF]  AS VARCHAR) = LAG( CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HASHDIFF]  AS VARCHAR),1)
			OVER(PARTITION BY [TEMP_TABLE_SET].[HK_FinancialPeriod] ORDER BY [TEMP_TABLE_SET].[LOADDT],
			[TEMP_TABLE_SET].[ORIGIN_ID])THEN 1 ELSE 0 END AS [EQUAL]
		, [TEMP_TABLE_SET].[HASHDIFF] AS [HASHDIFF]
		, [TEMP_TABLE_SET].[ISDELETED] AS [ISDELETED]
		, [TEMP_TABLE_SET].[idPeriod] AS [idPeriod]
		, [TEMP_TABLE_SET].[iYearID] AS [iYearID]
		, [TEMP_TABLE_SET].[dPeriodDate] AS [dPeriodDate]
		, [TEMP_TABLE_SET].[bBlocked] AS [bBlocked]
		, [TEMP_TABLE_SET].[bPBTProcessed] AS [bPBTProcessed]
		, [TEMP_TABLE_SET].[bPeriodProcessed] AS [bPeriodProcessed]
		, [TEMP_TABLE_SET].[_etblPeriod_iBranchID] AS [_etblPeriod_iBranchID]
		, [TEMP_TABLE_SET].[_etblPeriod_dCreatedDate] AS [_etblPeriod_dCreatedDate]
		, [TEMP_TABLE_SET].[_etblPeriod_dModifiedDate] AS [_etblPeriod_dModifiedDate]
		, [TEMP_TABLE_SET].[_etblPeriod_iCreatedBranchID] AS [_etblPeriod_iCreatedBranchID]
		, [TEMP_TABLE_SET].[_etblPeriod_iModifiedBranchID] AS [_etblPeriod_iModifiedBranchID]
		, [TEMP_TABLE_SET].[_etblPeriod_iCreatedAgentID] AS [_etblPeriod_iCreatedAgentID]
		, [TEMP_TABLE_SET].[_etblPeriod_iModifiedAgentID] AS [_etblPeriod_iModifiedAgentID]
		, [TEMP_TABLE_SET].[_etblPeriod_iChangeSetID] AS [_etblPeriod_iChangeSetID]
		, [TEMP_TABLE_SET].[_etblPeriod_Checksum] AS [_etblPeriod_Checksum]
	FROM [TEMP_TABLE_SET]
	;
END;


BEGIN -- SAT_INUR_TGT

	INSERT INTO [raw].[SAT_CSG_1_FOODS_FinancialPeriod](
		 [HK_FinancialPeriod]
		,[LOADDT]
		,[LOADENDDT]
		,[LOAD_CYCLE_ID]
		,[ISDELETED]
		,[HASHDIFF]
		,[idPeriod]
		,[iYearID]
		,[dPeriodDate]
		,[bBlocked]
		,[bPBTProcessed]
		,[bPeriodProcessed]
		,[_etblPeriod_iBranchID]
		,[_etblPeriod_dCreatedDate]
		,[_etblPeriod_dModifiedDate]
		,[_etblPeriod_iCreatedBranchID]
		,[_etblPeriod_iModifiedBranchID]
		,[_etblPeriod_iCreatedAgentID]
		,[_etblPeriod_iModifiedAgentID]
		,[_etblPeriod_iChangeSetID]
		,[_etblPeriod_Checksum]
	)
	SELECT
		  [SAT_TEMP_SRC_INUR].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
		, [SAT_TEMP_SRC_INUR].[LOADDT] AS [LOADDT]
		, [SAT_TEMP_SRC_INUR].[LOADENDDT] AS [LOADENDDT]
		, [SAT_TEMP_SRC_INUR].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [SAT_TEMP_SRC_INUR].[ISDELETED] AS [ISDELETED]
		, [SAT_TEMP_SRC_INUR].[HASHDIFF] AS [HASHDIFF]
		, [SAT_TEMP_SRC_INUR].[idPeriod] AS [idPeriod]
		, [SAT_TEMP_SRC_INUR].[iYearID] AS [iYearID]
		, [SAT_TEMP_SRC_INUR].[dPeriodDate] AS [dPeriodDate]
		, [SAT_TEMP_SRC_INUR].[bBlocked] AS [bBlocked]
		, [SAT_TEMP_SRC_INUR].[bPBTProcessed] AS [bPBTProcessed]
		, [SAT_TEMP_SRC_INUR].[bPeriodProcessed] AS [bPeriodProcessed]
		, [SAT_TEMP_SRC_INUR].[_etblPeriod_iBranchID] AS [_etblPeriod_iBranchID]
		, [SAT_TEMP_SRC_INUR].[_etblPeriod_dCreatedDate] AS [_etblPeriod_dCreatedDate]
		, [SAT_TEMP_SRC_INUR].[_etblPeriod_dModifiedDate] AS [_etblPeriod_dModifiedDate]
		, [SAT_TEMP_SRC_INUR].[_etblPeriod_iCreatedBranchID] AS [_etblPeriod_iCreatedBranchID]
		, [SAT_TEMP_SRC_INUR].[_etblPeriod_iModifiedBranchID] AS [_etblPeriod_iModifiedBranchID]
		, [SAT_TEMP_SRC_INUR].[_etblPeriod_iCreatedAgentID] AS [_etblPeriod_iCreatedAgentID]
		, [SAT_TEMP_SRC_INUR].[_etblPeriod_iModifiedAgentID] AS [_etblPeriod_iModifiedAgentID]
		, [SAT_TEMP_SRC_INUR].[_etblPeriod_iChangeSetID] AS [_etblPeriod_iChangeSetID]
		, [SAT_TEMP_SRC_INUR].[_etblPeriod_Checksum] AS [_etblPeriod_Checksum]
	FROM [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_FinancialPeriod] [SAT_TEMP_SRC_INUR]
	WHERE  [SAT_TEMP_SRC_INUR].[SRC] = 'STG' AND [SAT_TEMP_SRC_INUR].[EQUAL] = 0
	;
END;


BEGIN -- SAT_ED_TGT

	WITH [CALC_LOAD_END_DATE] AS 
	( 
		SELECT
			  [SAT_TEMP_SRC_US].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
			, [SAT_TEMP_SRC_US].[LOADDT] AS [LOADDT]
			, COALESCE(LEAD([SAT_TEMP_SRC_US].[LOADDT],1)
				OVER(PARTITION BY [SAT_TEMP_SRC_US].[HK_FinancialPeriod] ORDER BY [SAT_TEMP_SRC_US].[LOADDT]),
				CONVERT(DATETIME2, '31/12/2999' , 103)) AS [LOADENDDT]
		FROM [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_FinancialPeriod] [SAT_TEMP_SRC_US]
		WHERE  [SAT_TEMP_SRC_US].[EQUAL] = 0
	)
	, [FILTER_LOAD_END_DATE] AS 
	( 
		SELECT
			  [CALC_LOAD_END_DATE].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
			, [CALC_LOAD_END_DATE].[LOADDT] AS [LOADDT]
			, [CALC_LOAD_END_DATE].[LOADENDDT] AS [LOADENDDT]
		FROM [CALC_LOAD_END_DATE]
		WHERE  [CALC_LOAD_END_DATE].[LOADENDDT] != CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	UPDATE [SAT_ED_TGT]
	SET 
		 [LOADENDDT] =  [FILTER_LOAD_END_DATE].[LOADENDDT]
	FROM [FILTER_LOAD_END_DATE]
	JOIN [raw].[SAT_CSG_1_FOODS_FinancialPeriod] [SAT_ED_TGT] ON 1 = 1 
	WHERE [SAT_ED_TGT].[HK_FinancialPeriod] =  [FILTER_LOAD_END_DATE].[HK_FinancialPeriod]
	  AND [SAT_ED_TGT].[LOADDT] =  [FILTER_LOAD_END_DATE].[LOADDT]
	;
END;


END;

 
 


GO
