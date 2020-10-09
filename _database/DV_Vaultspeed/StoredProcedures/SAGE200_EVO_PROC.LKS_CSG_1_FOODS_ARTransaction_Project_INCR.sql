SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].LKS_CSG_1_FOODS_ARTransaction_Project_INCR AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_stage].[TMP_LINKSAT_CSG_1_FOODS_ARTransaction_Project];

	WITH [DIST_STG] AS 
	( 
		SELECT
			  [STG_DIS_SRC].[HK_ARTransaction] AS [HK_ARTransaction]
			, [STG_DIS_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, MIN([STG_DIS_SRC].[LOADDT]) AS [MIN_LOAD_TIMESTAMP]
		FROM [CSG_1_FOODS_stage].[PostAR] [STG_DIS_SRC]
		GROUP BY  [STG_DIS_SRC].[HK_ARTransaction],  [STG_DIS_SRC].[LOAD_CYCLE_ID]
	)
	, [TEMP_TABLE_SET] AS 
	( 
		SELECT 
			  [STG_TEMP_SRC].[HKLINK_ARTransaction_Project] AS [HKLINK_ARTransaction_Project]
			, [STG_TEMP_SRC].[HK_Project] AS [HK_Project]
			, [STG_TEMP_SRC].[HK_ARTransaction] AS [HK_ARTransaction]
			, [STG_TEMP_SRC].[LOADDT] AS [LOADDT]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, [STG_TEMP_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, [STG_TEMP_SRC].[DATATYPE] AS [DATATYPE]
			, 'STG' AS [SRC]
			, 1 AS [ORIGIN_ID]
			, CASE WHEN [STG_TEMP_SRC].[CHANGE_TYPE] = '-' THEN 'Y'  ELSE 'N'  END AS [ISDELETED]
			, [STG_TEMP_SRC].[AutoIdx] AS [AutoIdx]
			, [STG_TEMP_SRC].[Project] AS [Project]
		FROM [CSG_1_FOODS_stage].[PostAR] [STG_TEMP_SRC]
		UNION 
		SELECT 
			  [LKS_SRC].[HKLINK_ARTransaction_Project] AS [HKLINK_ARTransaction_Project]
			, [LNK_SRC].[HK_Project] AS [HK_Project]
			, [LNK_SRC].[HK_ARTransaction] AS [HK_ARTransaction]
			, [LKS_SRC].[LOADDT] AS [LOADDT]
			, [LKS_SRC].[LOADENDDT] AS [LOADENDDT]
			, [LKS_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, 'SAT' AS [DATATYPE]
			, 'LKS' AS [SRC]
			, 0 AS [ORIGIN_ID]
			, [LKS_SRC].[ISDELETED] AS [ISDELETED]
			, [LKS_SRC].[AutoIdx] AS [AutoIdx]
			, [LKS_SRC].[Project] AS [Project]
		FROM [raw].[LINKSAT_CSG_1_FOODS_ARTransaction_Project] [LKS_SRC]
		INNER JOIN [raw].[LINK_ARTransaction_Project] [LNK_SRC] ON  [LKS_SRC].[HKLINK_ARTransaction_Project] = [LNK_SRC].[HKLINK_ARTransaction_Project]
		INNER JOIN [DIST_STG] ON  [LNK_SRC].[HK_ARTransaction] = [DIST_STG].[HK_ARTransaction]
		WHERE  [LKS_SRC].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	INSERT INTO [CSG_1_FOODS_stage].[TMP_LINKSAT_CSG_1_FOODS_ARTransaction_Project](
		 [HKLINK_ARTransaction_Project]
		,[HK_Project]
		,[HK_ARTransaction]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[DATATYPE]
		,[SRC]
		,[EQUAL]
		,[ISDELETED]
		,[AutoIdx]
		,[Project]
	)
	SELECT
		  [TEMP_TABLE_SET].[HKLINK_ARTransaction_Project] AS [HKLINK_ARTransaction_Project]
		, [TEMP_TABLE_SET].[HK_Project] AS [HK_Project]
		, [TEMP_TABLE_SET].[HK_ARTransaction] AS [HK_ARTransaction]
		, [TEMP_TABLE_SET].[LOADDT] AS [LOADDT]
		, [TEMP_TABLE_SET].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [TEMP_TABLE_SET].[LOADENDDT] AS [LOADENDDT]
		, [TEMP_TABLE_SET].[DATATYPE] AS [DATATYPE]
		, [TEMP_TABLE_SET].[SRC] AS [SRC]
		, CASE WHEN [TEMP_TABLE_SET].[SRC] = 'STG' AND CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HK_Project]  AS VARCHAR) = LAG( CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HK_Project]  AS VARCHAR),1)
			OVER(PARTITION BY [TEMP_TABLE_SET].[HK_ARTransaction] ORDER BY [TEMP_TABLE_SET].[LOADDT],
			[TEMP_TABLE_SET].[ORIGIN_ID])THEN 1 ELSE 0 END AS [EQUAL]
		, [TEMP_TABLE_SET].[ISDELETED] AS [ISDELETED]
		, [TEMP_TABLE_SET].[AutoIdx] AS [AutoIdx]
		, [TEMP_TABLE_SET].[Project] AS [Project]
	FROM [TEMP_TABLE_SET]
	;
END;


BEGIN -- LKS_INUR_TGT

	INSERT INTO [raw].[LINKSAT_CSG_1_FOODS_ARTransaction_Project](
		 [HKLINK_ARTransaction_Project]
		,[HK_ARTransaction]
		,[HK_Project]
		,[LOADDT]
		,[LOADENDDT]
		,[LOAD_CYCLE_ID]
		,[ISDELETED]
		,[AutoIdx]
		,[Project]
	)
	SELECT
		  [LKS_TEMP_SRC_INUR].[HKLINK_ARTransaction_Project] AS [HKLINK_ARTransaction_Project]
		, [LKS_TEMP_SRC_INUR].[HK_ARTransaction] AS [HK_ARTransaction]
		, [LKS_TEMP_SRC_INUR].[HK_Project] AS [HK_Project]
		, [LKS_TEMP_SRC_INUR].[LOADDT] AS [LOADDT]
		, [LKS_TEMP_SRC_INUR].[LOADENDDT] AS [LOADENDDT]
		, [LKS_TEMP_SRC_INUR].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [LKS_TEMP_SRC_INUR].[ISDELETED] AS [ISDELETED]
		, [LKS_TEMP_SRC_INUR].[AutoIdx] AS [AutoIdx]
		, [LKS_TEMP_SRC_INUR].[Project] AS [Project]
	FROM [CSG_1_FOODS_stage].[TMP_LINKSAT_CSG_1_FOODS_ARTransaction_Project] [LKS_TEMP_SRC_INUR]
	WHERE  [LKS_TEMP_SRC_INUR].[SRC] = 'STG' AND [LKS_TEMP_SRC_INUR].[EQUAL] = 0
	;
END;


BEGIN -- LKS_ED_TGT

	WITH [CALC_LOAD_END_DATE] AS 
	( 
		SELECT
			  [LKS_TEMP_SRC_US].[HKLINK_ARTransaction_Project] AS [HKLINK_ARTransaction_Project]
			, [LKS_TEMP_SRC_US].[LOADDT] AS [LOADDT]
			, COALESCE(LEAD([LKS_TEMP_SRC_US].[LOADDT],1)
				OVER(PARTITION BY [LKS_TEMP_SRC_US].[HK_ARTransaction] ORDER BY [LKS_TEMP_SRC_US].[LOADDT],
				[LKS_TEMP_SRC_US].[LOAD_CYCLE_ID]), CONVERT(DATETIME2, '31/12/2999' , 103)) AS [LOADENDDT]
		FROM [CSG_1_FOODS_stage].[TMP_LINKSAT_CSG_1_FOODS_ARTransaction_Project] [LKS_TEMP_SRC_US]
		WHERE  [LKS_TEMP_SRC_US].[EQUAL] = 0
	)
	, [FILTER_LOAD_END_DATE] AS 
	( 
		SELECT
			  [CALC_LOAD_END_DATE].[HKLINK_ARTransaction_Project] AS [HKLINK_ARTransaction_Project]
			, [CALC_LOAD_END_DATE].[LOADDT] AS [LOADDT]
			, [CALC_LOAD_END_DATE].[LOADENDDT] AS [LOADENDDT]
		FROM [CALC_LOAD_END_DATE]
		WHERE  [CALC_LOAD_END_DATE].[LOADENDDT] != CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	UPDATE [LKS_ED_TGT]
	SET 
		 [LOADENDDT] =  [FILTER_LOAD_END_DATE].[LOADENDDT]
	FROM [FILTER_LOAD_END_DATE]
	JOIN [raw].[LINKSAT_CSG_1_FOODS_ARTransaction_Project] [LKS_ED_TGT] ON 1 = 1 
	WHERE [LKS_ED_TGT].[HKLINK_ARTransaction_Project] =  [FILTER_LOAD_END_DATE].[HKLINK_ARTransaction_Project]
	  AND [LKS_ED_TGT].[LOADDT] =  [FILTER_LOAD_END_DATE].[LOADDT]
	;
END;


END;

 
 


GO
