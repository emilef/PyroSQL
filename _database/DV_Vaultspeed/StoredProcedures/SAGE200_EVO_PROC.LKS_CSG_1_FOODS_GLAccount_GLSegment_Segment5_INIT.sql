SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].LKS_CSG_1_FOODS_GLAccount_GLSegment_Segment5_INIT AS 
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

	DELETE FROM [raw].[LINKSAT_CSG_1_FOODS_GLAccount_GLSegment_Segment5] 
	WHERE  1 = 1
	;
END;


BEGIN -- LKS_TGT

	WITH [STG_SRC] AS 
	( 
		SELECT
			  [STG_INR_SRC].[HKLINK_GLAccount_GLSegment_Segment5] AS [HKLINK_GLAccount_GLSegment_Segment5]
			, [STG_INR_SRC].[HK_GLAccount] AS [HK_GLAccount]
			, [STG_INR_SRC].[HK_GLSegment_Segment5] AS [HK_GLSegment_Segment5]
			, [STG_INR_SRC].[LOADDT] AS [LOADDT]
			, [STG_INR_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, 'N'  AS [ISDELETED]
			, [STG_INR_SRC].[AccountLink] AS [AccountLink]
			, [STG_INR_SRC].[iGLSegment5ID] AS [iGLSegment5ID]
			, ROW_NUMBER()OVER(PARTITION BY [STG_INR_SRC].[HK_GLAccount] ORDER BY [STG_INR_SRC].[LOADDT]) AS [DUMMY]
		FROM [CSG_1_FOODS_stage].[Accounts] [STG_INR_SRC]
	)
	INSERT INTO [raw].[LINKSAT_CSG_1_FOODS_GLAccount_GLSegment_Segment5](
		 [HKLINK_GLAccount_GLSegment_Segment5]
		,[HK_GLAccount]
		,[HK_GLSegment_Segment5]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[ISDELETED]
		,[AccountLink]
		,[iGLSegment5ID]
	)
	SELECT
		  [STG_SRC].[HKLINK_GLAccount_GLSegment_Segment5] AS [HKLINK_GLAccount_GLSegment_Segment5]
		, [STG_SRC].[HK_GLAccount] AS [HK_GLAccount]
		, [STG_SRC].[HK_GLSegment_Segment5] AS [HK_GLSegment_Segment5]
		, [STG_SRC].[LOADDT] AS [LOADDT]
		, [STG_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [STG_SRC].[LOADENDDT] AS [LOADENDDT]
		, [STG_SRC].[ISDELETED] AS [ISDELETED]
		, [STG_SRC].[AccountLink] AS [AccountLink]
		, [STG_SRC].[iGLSegment5ID] AS [iGLSegment5ID]
	FROM [STG_SRC]
	WHERE  [STG_SRC].[DUMMY] = 1
	;
END;


END;

 
 


GO
