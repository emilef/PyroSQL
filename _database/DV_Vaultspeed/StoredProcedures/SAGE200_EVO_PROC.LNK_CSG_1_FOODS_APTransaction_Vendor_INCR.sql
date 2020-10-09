SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].LNK_CSG_1_FOODS_APTransaction_Vendor_INCR AS 
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
BEGIN -- LNK_TGT

	WITH [STG_SRC] AS 
	( 
		SELECT
			  [STG_INR_SRC].[HKLINK_APTransaction_Vendor] AS [HKLINK_APTransaction_Vendor]
			, [STG_INR_SRC].[LOADDT] AS [LOADDT]
			, [STG_INR_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, [STG_INR_SRC].[HK_Vendor] AS [HK_Vendor]
			, [STG_INR_SRC].[HK_APTransaction] AS [HK_APTransaction]
			, [STG_INR_SRC].[CHANGE_TYPE] AS [CHANGE_TYPE]
			, ROW_NUMBER()OVER(PARTITION BY [STG_INR_SRC].[HKLINK_APTransaction_Vendor] ORDER BY [STG_INR_SRC].[LOADDT]) AS [DUMMY]
		FROM [CSG_1_FOODS_stage].[PostAP] [STG_INR_SRC]
		WHERE  [STG_INR_SRC].[CHANGE_TYPE] != '-'
	)
	INSERT INTO [raw].[LINK_APTransaction_Vendor](
		 [HKLINK_APTransaction_Vendor]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[HK_Vendor]
		,[HK_APTransaction]
	)
	SELECT
		  [STG_SRC].[HKLINK_APTransaction_Vendor] AS [HKLINK_APTransaction_Vendor]
		, [STG_SRC].[LOADDT] AS [LOADDT]
		, [STG_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [STG_SRC].[HK_Vendor] AS [HK_Vendor]
		, [STG_SRC].[HK_APTransaction] AS [HK_APTransaction]
	FROM [STG_SRC]
	LEFT OUTER JOIN [raw].[LINK_APTransaction_Vendor] [LNK_SRC] ON  [STG_SRC].[HKLINK_APTransaction_Vendor] = [LNK_SRC].[HKLINK_APTransaction_Vendor]
	WHERE  [STG_SRC].[DUMMY] = 1 AND [LNK_SRC].[HKLINK_APTransaction_Vendor] IS NULL
	;
END;


END;

 
 


GO
