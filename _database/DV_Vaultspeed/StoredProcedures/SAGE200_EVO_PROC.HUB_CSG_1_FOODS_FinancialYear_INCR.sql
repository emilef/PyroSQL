SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].HUB_CSG_1_FOODS_FinancialYear_INCR AS 
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

	WITH [STG_SRC] AS 
	( 
		SELECT
			  [STG_INR_SRC].[HK_FinancialYear] AS [HK_FinancialYear]
			, [STG_INR_SRC].[LOADDT] AS [LOADDT]
			, [STG_INR_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, [STG_INR_SRC].[BK_FinancialYear] AS [BK_FinancialYear]
			, [STG_INR_SRC].[SOURCE_SYSTEM] AS [SOURCE_SYSTEM]
			, ROW_NUMBER()OVER(PARTITION BY [STG_INR_SRC].[HK_FinancialYear] ORDER BY [STG_INR_SRC].[LOADDT]) AS [DUMMY]
		FROM [CSG_1_FOODS_stage].[_etblPeriodYear] [STG_INR_SRC]
		WHERE  [STG_INR_SRC].[DATATYPE] = 'SRC' AND [STG_INR_SRC].[CHANGE_TYPE] != '-'
	)
	INSERT INTO [raw].[HUB_FinancialYear](
		 [HK_FinancialYear]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[BK_FinancialYear]
		,[SOURCE_SYSTEM]
	)
	SELECT
		  [STG_SRC].[HK_FinancialYear] AS [HK_FinancialYear]
		, [STG_SRC].[LOADDT] AS [LOADDT]
		, [STG_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [STG_SRC].[BK_FinancialYear] AS [BK_FinancialYear]
		, [STG_SRC].[SOURCE_SYSTEM] AS [SOURCE_SYSTEM]
	FROM [STG_SRC]
	LEFT OUTER JOIN [raw].[HUB_FinancialYear] [HUB_SRC] ON  [STG_SRC].[HK_FinancialYear] = [HUB_SRC].[HK_FinancialYear]
	WHERE  [STG_SRC].[DUMMY] = 1 AND [HUB_SRC].[HK_FinancialYear] is NULL
	;
END;


END;

 
 


GO
