SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].LKS_CSG_1_FOODS_FinancialPeriod_FinancialYear_INIT AS 
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
BEGIN -- LKS_TGT

	DELETE FROM [raw].[LINKSAT_CSG_1_FOODS_FinancialPeriod_FinancialYear] 
	WHERE  1 = 1
	;
END;


BEGIN -- LKS_TGT

	WITH [STG_SRC] AS 
	( 
		SELECT
			  [STG_INR_SRC].[HKLINK_FinancialPeriod_FinancialYear] AS [HKLINK_FinancialPeriod_FinancialYear]
			, [STG_INR_SRC].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
			, [STG_INR_SRC].[HK_FinancialYear] AS [HK_FinancialYear]
			, [STG_INR_SRC].[LOADDT] AS [LOADDT]
			, [STG_INR_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, 'N'  AS [ISDELETED]
			, [STG_INR_SRC].[idPeriod] AS [idPeriod]
			, [STG_INR_SRC].[iYearID] AS [iYearID]
			, ROW_NUMBER()OVER(PARTITION BY [STG_INR_SRC].[HK_FinancialPeriod] ORDER BY [STG_INR_SRC].[LOADDT]) AS [DUMMY]
		FROM [CSG_1_FOODS_stage].[_etblPeriod] [STG_INR_SRC]
	)
	INSERT INTO [raw].[LINKSAT_CSG_1_FOODS_FinancialPeriod_FinancialYear](
		 [HKLINK_FinancialPeriod_FinancialYear]
		,[HK_FinancialPeriod]
		,[HK_FinancialYear]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[ISDELETED]
		,[idPeriod]
		,[iYearID]
	)
	SELECT
		  [STG_SRC].[HKLINK_FinancialPeriod_FinancialYear] AS [HKLINK_FinancialPeriod_FinancialYear]
		, [STG_SRC].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
		, [STG_SRC].[HK_FinancialYear] AS [HK_FinancialYear]
		, [STG_SRC].[LOADDT] AS [LOADDT]
		, [STG_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [STG_SRC].[LOADENDDT] AS [LOADENDDT]
		, [STG_SRC].[ISDELETED] AS [ISDELETED]
		, [STG_SRC].[idPeriod] AS [idPeriod]
		, [STG_SRC].[iYearID] AS [iYearID]
	FROM [STG_SRC]
	WHERE  [STG_SRC].[DUMMY] = 1
	;
END;


END;

 
 


GO
