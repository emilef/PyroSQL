SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_Project_INCR AS 
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
BEGIN -- STG_TGT

	TRUNCATE TABLE [CSG_1_FOODS_stage].[Project];

	INSERT INTO [CSG_1_FOODS_stage].[Project](
		 [HK_Project]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[SOURCE_SYSTEM]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[ProjectLink]
		,[BK_Project]
		,[ProjectCode]
		,[ProjectName]
		,[ActiveProject]
		,[ProjectDescription]
		,[MasterSubProject]
		,[ProjectLevel]
		,[SubProjectOfLink]
		,[Project_iBranchID]
		,[Project_dCreatedDate]
		,[Project_dModifiedDate]
		,[Project_iCreatedBranchID]
		,[Project_iModifiedBranchID]
		,[Project_iCreatedAgentID]
		,[Project_iModifiedAgentID]
		,[Project_iChangeSetID]
		,[Project_Checksum]
	)
	SELECT
		  UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_ProjectCode] + '|' +
			[EXT_SRC].[BK_ProjectName] + '|' +  [EXT_SRC].[BK_ProjectLink] + '|'),2)) AS [HK_Project]
		, [EXT_SRC].[LOADDT] AS [LOADDT]
		, [EXT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, 'CSG_1_FOODS' AS [SOURCE_SYSTEM]
		, [EXT_SRC].[CHANGE_TYPE] AS [CHANGE_TYPE]
		, [EXT_SRC].[DATATYPE] AS [DATATYPE]
		, [EXT_SRC].[ProjectLink] AS [ProjectLink]
		, [EXT_SRC].[BK_ProjectCode] + '|' +  [EXT_SRC].[BK_ProjectName] + '|' +  [EXT_SRC].[BK_ProjectLink] AS [BK_Project]
		, [EXT_SRC].[ProjectCode] AS [ProjectCode]
		, [EXT_SRC].[ProjectName] AS [ProjectName]
		, [EXT_SRC].[ActiveProject] AS [ActiveProject]
		, [EXT_SRC].[ProjectDescription] AS [ProjectDescription]
		, [EXT_SRC].[MasterSubProject] AS [MasterSubProject]
		, [EXT_SRC].[ProjectLevel] AS [ProjectLevel]
		, [EXT_SRC].[SubProjectOfLink] AS [SubProjectOfLink]
		, [EXT_SRC].[Project_iBranchID] AS [Project_iBranchID]
		, [EXT_SRC].[Project_dCreatedDate] AS [Project_dCreatedDate]
		, [EXT_SRC].[Project_dModifiedDate] AS [Project_dModifiedDate]
		, [EXT_SRC].[Project_iCreatedBranchID] AS [Project_iCreatedBranchID]
		, [EXT_SRC].[Project_iModifiedBranchID] AS [Project_iModifiedBranchID]
		, [EXT_SRC].[Project_iCreatedAgentID] AS [Project_iCreatedAgentID]
		, [EXT_SRC].[Project_iModifiedAgentID] AS [Project_iModifiedAgentID]
		, [EXT_SRC].[Project_iChangeSetID] AS [Project_iChangeSetID]
		, [EXT_SRC].[Project_Checksum] AS [Project_Checksum]
	FROM [CSG_1_FOODS_ext].[Project] [EXT_SRC]
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [MEX_SRC].[DATATYPE] = 'NA'
	;
END;


END;

 
 


GO
