SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].HUB_CSG_1_FOODS_GLTransaction_INIT AS 
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

	DELETE FROM [raw].[HUB_GLTransaction] 
	WHERE  [HUB_GLTransaction].[SOURCE_SYSTEM] = 'CSG_1_FOODS'
	;
END;


BEGIN -- HUB_TGT

	INSERT INTO [raw].[HUB_GLTransaction](
		 [HK_GLTransaction]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[BK_GLTransaction]
		,[SOURCE_SYSTEM]
	)
	SELECT DISTINCT 
 		  [STG_SRC].[HK_GLTransaction] AS [HK_GLTransaction]
		, [STG_SRC].[LOADDT] AS [LOADDT]
		, [STG_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [STG_SRC].[BK_GLTransaction] AS [BK_GLTransaction]
		, [STG_SRC].[SOURCE_SYSTEM] AS [SOURCE_SYSTEM]
	FROM [CSG_1_FOODS_stage].[PostGL] [STG_SRC]
	;
END;


END;

 
 


GO
