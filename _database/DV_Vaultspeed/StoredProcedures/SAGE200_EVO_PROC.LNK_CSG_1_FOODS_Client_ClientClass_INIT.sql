SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].LNK_CSG_1_FOODS_Client_ClientClass_INIT AS 
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

	INSERT INTO [raw].[LINK_Client_ClientClass](
		 [HKLINK_Client_ClientClass]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[HK_ClientClass]
		,[HK_Client]
	)
	SELECT DISTINCT 
 		  [STG_SRC].[HKLINK_Client_ClientClass] AS [HKLINK_Client_ClientClass]
		, [STG_SRC].[LOADDT] AS [LOADDT]
		, [STG_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [STG_SRC].[HK_ClientClass] AS [HK_ClientClass]
		, [STG_SRC].[HK_Client] AS [HK_Client]
	FROM [CSG_1_FOODS_stage].[Client] [STG_SRC]
	;
END;


END;

 
 


GO
