SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].HUB_CSG_1_FOODS_GLAccount_INCR AS 
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
BEGIN -- HUB_TGT

	WITH [CHANGE_SET] AS 
	( 
		SELECT 
			  [STG_SRC].[HK_GLAccount] AS [HK_GLAccount]
			, [STG_SRC].[LOADDT] AS [LOADDT]
			, [STG_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, [STG_SRC].[BK_GLAccount] AS [BK_GLAccount]
		FROM [CSG_1_FOODS_stage].[Accounts] [STG_SRC]
		WHERE  [STG_SRC].[DATATYPE] = 'SRC' AND [STG_SRC].[CHANGE_TYPE] != '-'
	)
	, [MIN_LOAD_TIME] AS 
	( 
		SELECT
			  [CHANGE_SET].[HK_GLAccount] AS [HK_GLAccount]
			, [CHANGE_SET].[LOADDT] AS [LOADDT]
			, [CHANGE_SET].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, [CHANGE_SET].[BK_GLAccount] AS [BK_GLAccount]
			, 'CSG_1_FOODS' AS [SOURCE_SYSTEM]
			, ROW_NUMBER()OVER(PARTITION BY [CHANGE_SET].[HK_GLAccount] ORDER BY [CHANGE_SET].[LOADDT]) AS [DUMMY]
		FROM [CHANGE_SET]
	)
	INSERT INTO [raw].[HUB_GLAccount](
		 [HK_GLAccount]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[BK_GLAccount]
		,[SOURCE_SYSTEM]
	)
	SELECT
		  [MIN_LOAD_TIME].[HK_GLAccount] AS [HK_GLAccount]
		, [MIN_LOAD_TIME].[LOADDT] AS [LOADDT]
		, [MIN_LOAD_TIME].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [MIN_LOAD_TIME].[BK_GLAccount] AS [BK_GLAccount]
		, [MIN_LOAD_TIME].[SOURCE_SYSTEM] AS [SOURCE_SYSTEM]
	FROM [MIN_LOAD_TIME]
	LEFT OUTER JOIN [raw].[HUB_GLAccount] [HUB_SRC] ON  [MIN_LOAD_TIME].[HK_GLAccount] = [HUB_SRC].[HK_GLAccount]
	WHERE  [MIN_LOAD_TIME].[DUMMY] = 1 AND [HUB_SRC].[HK_GLAccount] is NULL
	;
END;


END;

 
 


GO
