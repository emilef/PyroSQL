SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].LKS_CSG_1_FOODS_FinancialPeriod_FinancialYear_INCR AS 
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
BEGIN -- LKS_TEMP_TGT

	TRUNCATE TABLE [CSG_1_FOODS_stage].[TMP_LINKSAT_CSG_1_FOODS_FinancialPeriod_FinancialYear];

	WITH [DIST_STG] AS 
	( 
		SELECT
			  [STG_DIS_SRC].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
			, [STG_DIS_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, MIN([STG_DIS_SRC].[LOADDT]) AS [MIN_LOAD_TIMESTAMP]
		FROM [CSG_1_FOODS_stage].[_etblPeriod] [STG_DIS_SRC]
		GROUP BY  [STG_DIS_SRC].[HK_FinancialPeriod],  [STG_DIS_SRC].[LOAD_CYCLE_ID]
	)
	, [TEMP_TABLE_SET] AS 
	( 
		SELECT 
			  [STG_TEMP_SRC].[HKLINK_FinancialPeriod_FinancialYear] AS [HKLINK_FinancialPeriod_FinancialYear]
			, [STG_TEMP_SRC].[HK_FinancialYear] AS [HK_FinancialYear]
			, [STG_TEMP_SRC].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
			, [STG_TEMP_SRC].[LOADDT] AS [LOADDT]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, [STG_TEMP_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, [STG_TEMP_SRC].[DATATYPE] AS [DATATYPE]
			, 'STG' AS [SRC]
			, 1 AS [ORIGIN_ID]
			, CASE WHEN [STG_TEMP_SRC].[CHANGE_TYPE] = '-' THEN 'Y'  ELSE 'N'  END AS [ISDELETED]
			, [STG_TEMP_SRC].[idPeriod] AS [idPeriod]
			, [STG_TEMP_SRC].[iYearID] AS [iYearID]
		FROM [CSG_1_FOODS_stage].[_etblPeriod] [STG_TEMP_SRC]
		UNION 
		SELECT 
			  [LKS_SRC].[HKLINK_FinancialPeriod_FinancialYear] AS [HKLINK_FinancialPeriod_FinancialYear]
			, [LNK_SRC].[HK_FinancialYear] AS [HK_FinancialYear]
			, [LNK_SRC].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
			, [LKS_SRC].[LOADDT] AS [LOADDT]
			, [LKS_SRC].[LOADENDDT] AS [LOADENDDT]
			, [LKS_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, 'SAT' AS [DATATYPE]
			, 'LKS' AS [SRC]
			, 0 AS [ORIGIN_ID]
			, [LKS_SRC].[ISDELETED] AS [ISDELETED]
			, [LKS_SRC].[idPeriod] AS [idPeriod]
			, [LKS_SRC].[iYearID] AS [iYearID]
		FROM [raw].[LINKSAT_CSG_1_FOODS_FinancialPeriod_FinancialYear] [LKS_SRC]
		INNER JOIN [raw].[LINK_FinancialPeriod_FinancialYear] [LNK_SRC] ON  [LKS_SRC].[HKLINK_FinancialPeriod_FinancialYear] = [LNK_SRC].[HKLINK_FinancialPeriod_FinancialYear]
		INNER JOIN [DIST_STG] ON  [LNK_SRC].[HK_FinancialPeriod] = [DIST_STG].[HK_FinancialPeriod]
		WHERE  [LKS_SRC].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	INSERT INTO [CSG_1_FOODS_stage].[TMP_LINKSAT_CSG_1_FOODS_FinancialPeriod_FinancialYear](
		 [HKLINK_FinancialPeriod_FinancialYear]
		,[HK_FinancialYear]
		,[HK_FinancialPeriod]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[DATATYPE]
		,[SRC]
		,[EQUAL]
		,[ISDELETED]
		,[idPeriod]
		,[iYearID]
	)
	SELECT
		  [TEMP_TABLE_SET].[HKLINK_FinancialPeriod_FinancialYear] AS [HKLINK_FinancialPeriod_FinancialYear]
		, [TEMP_TABLE_SET].[HK_FinancialYear] AS [HK_FinancialYear]
		, [TEMP_TABLE_SET].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
		, [TEMP_TABLE_SET].[LOADDT] AS [LOADDT]
		, [TEMP_TABLE_SET].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [TEMP_TABLE_SET].[LOADENDDT] AS [LOADENDDT]
		, [TEMP_TABLE_SET].[DATATYPE] AS [DATATYPE]
		, [TEMP_TABLE_SET].[SRC] AS [SRC]
		, CASE WHEN [TEMP_TABLE_SET].[SRC] = 'STG' AND CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HK_FinancialYear]  AS VARCHAR) = LAG( CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HK_FinancialYear]  AS VARCHAR),1)
			OVER(PARTITION BY [TEMP_TABLE_SET].[HK_FinancialPeriod] ORDER BY [TEMP_TABLE_SET].[LOADDT],
			[TEMP_TABLE_SET].[ORIGIN_ID])THEN 1 ELSE 0 END AS [EQUAL]
		, [TEMP_TABLE_SET].[ISDELETED] AS [ISDELETED]
		, [TEMP_TABLE_SET].[idPeriod] AS [idPeriod]
		, [TEMP_TABLE_SET].[iYearID] AS [iYearID]
	FROM [TEMP_TABLE_SET]
	;
END;


BEGIN -- LKS_INUR_TGT

	INSERT INTO [raw].[LINKSAT_CSG_1_FOODS_FinancialPeriod_FinancialYear](
		 [HKLINK_FinancialPeriod_FinancialYear]
		,[HK_FinancialPeriod]
		,[HK_FinancialYear]
		,[LOADDT]
		,[LOADENDDT]
		,[LOAD_CYCLE_ID]
		,[ISDELETED]
		,[idPeriod]
		,[iYearID]
	)
	SELECT
		  [LKS_TEMP_SRC_INUR].[HKLINK_FinancialPeriod_FinancialYear] AS [HKLINK_FinancialPeriod_FinancialYear]
		, [LKS_TEMP_SRC_INUR].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
		, [LKS_TEMP_SRC_INUR].[HK_FinancialYear] AS [HK_FinancialYear]
		, [LKS_TEMP_SRC_INUR].[LOADDT] AS [LOADDT]
		, [LKS_TEMP_SRC_INUR].[LOADENDDT] AS [LOADENDDT]
		, [LKS_TEMP_SRC_INUR].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [LKS_TEMP_SRC_INUR].[ISDELETED] AS [ISDELETED]
		, [LKS_TEMP_SRC_INUR].[idPeriod] AS [idPeriod]
		, [LKS_TEMP_SRC_INUR].[iYearID] AS [iYearID]
	FROM [CSG_1_FOODS_stage].[TMP_LINKSAT_CSG_1_FOODS_FinancialPeriod_FinancialYear] [LKS_TEMP_SRC_INUR]
	WHERE  [LKS_TEMP_SRC_INUR].[SRC] = 'STG' AND [LKS_TEMP_SRC_INUR].[EQUAL] = 0
	;
END;


BEGIN -- LKS_ED_TGT

	WITH [CALC_LOAD_END_DATE] AS 
	( 
		SELECT
			  [LKS_TEMP_SRC_US].[HKLINK_FinancialPeriod_FinancialYear] AS [HKLINK_FinancialPeriod_FinancialYear]
			, [LKS_TEMP_SRC_US].[LOADDT] AS [LOADDT]
			, COALESCE(LEAD([LKS_TEMP_SRC_US].[LOADDT],1)
				OVER(PARTITION BY [LKS_TEMP_SRC_US].[HK_FinancialPeriod] ORDER BY [LKS_TEMP_SRC_US].[LOADDT],
				[LKS_TEMP_SRC_US].[LOAD_CYCLE_ID]), CONVERT(DATETIME2, '31/12/2999' , 103)) AS [LOADENDDT]
		FROM [CSG_1_FOODS_stage].[TMP_LINKSAT_CSG_1_FOODS_FinancialPeriod_FinancialYear] [LKS_TEMP_SRC_US]
		WHERE  [LKS_TEMP_SRC_US].[EQUAL] = 0
	)
	, [FILTER_LOAD_END_DATE] AS 
	( 
		SELECT
			  [CALC_LOAD_END_DATE].[HKLINK_FinancialPeriod_FinancialYear] AS [HKLINK_FinancialPeriod_FinancialYear]
			, [CALC_LOAD_END_DATE].[LOADDT] AS [LOADDT]
			, [CALC_LOAD_END_DATE].[LOADENDDT] AS [LOADENDDT]
		FROM [CALC_LOAD_END_DATE]
		WHERE  [CALC_LOAD_END_DATE].[LOADENDDT] != CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	UPDATE [LKS_ED_TGT]
	SET 
		 [LOADENDDT] =  [FILTER_LOAD_END_DATE].[LOADENDDT]
	FROM [FILTER_LOAD_END_DATE]
	JOIN [raw].[LINKSAT_CSG_1_FOODS_FinancialPeriod_FinancialYear] [LKS_ED_TGT] ON 1 = 1 
	WHERE [LKS_ED_TGT].[HKLINK_FinancialPeriod_FinancialYear] =
			[FILTER_LOAD_END_DATE].[HKLINK_FinancialPeriod_FinancialYear]
	  AND [LKS_ED_TGT].[LOADDT] =  [FILTER_LOAD_END_DATE].[LOADDT]
	;
END;


END;

 
 


GO
