SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_Project_PREP_DELETE AS 
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
BEGIN -- STG_PREP_DEL_TGT

	INSERT INTO [CSG_1_FOODS_stage].[Project](
		 [HK_Project]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[LOAD_CYCLE_ID]
		,[LOADDT]
		,[ProjectLink]
		,[ProjectCode]
		,[ProjectName]
		,[BK_Project]
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
		  [HUB_SRC].[HK_Project] AS [HK_Project]
		, '-' AS [CHANGE_TYPE]
		, 'SRC' AS [DATATYPE]
		, [LCI_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [LCI_SRC].[LOADDT] AS [LOADDT]
		, [SAT_SRC1].[ProjectLink] AS [ProjectLink]
		, [SAT_SRC1].[ProjectCode] AS [ProjectCode]
		, [SAT_SRC1].[ProjectName] AS [ProjectName]
		, [HUB_SRC].[BK_Project] AS [BK_Project]
		, [SAT_SRC1].[ActiveProject] AS [ActiveProject]
		, [SAT_SRC1].[ProjectDescription] AS [ProjectDescription]
		, [SAT_SRC1].[MasterSubProject] AS [MasterSubProject]
		, [SAT_SRC1].[ProjectLevel] AS [ProjectLevel]
		, [SAT_SRC1].[SubProjectOfLink] AS [SubProjectOfLink]
		, [SAT_SRC1].[Project_iBranchID] AS [Project_iBranchID]
		, [SAT_SRC1].[Project_dCreatedDate] AS [Project_dCreatedDate]
		, [SAT_SRC1].[Project_dModifiedDate] AS [Project_dModifiedDate]
		, [SAT_SRC1].[Project_iCreatedBranchID] AS [Project_iCreatedBranchID]
		, [SAT_SRC1].[Project_iModifiedBranchID] AS [Project_iModifiedBranchID]
		, [SAT_SRC1].[Project_iCreatedAgentID] AS [Project_iCreatedAgentID]
		, [SAT_SRC1].[Project_iModifiedAgentID] AS [Project_iModifiedAgentID]
		, [SAT_SRC1].[Project_iChangeSetID] AS [Project_iChangeSetID]
		, [SAT_SRC1].[Project_Checksum] AS [Project_Checksum]
	FROM [raw].[HUB_Project] [HUB_SRC]
	INNER JOIN [raw].[SAT_CSG_1_FOODS_Project] [SAT_SRC1] ON  [SAT_SRC1].[HK_Project] = [HUB_SRC].[HK_Project] AND [SAT_SRC1].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' ,
		103) AND [SAT_SRC1].[ISDELETED] = 'N'
	LEFT OUTER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [HUB_SRC].[LOAD_CYCLE_ID] = CONVERT(int, [MEX_SRC].[LOAD_CYCLE_ID] )
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	LEFT OUTER JOIN [CSG_1_FOODS_stage].[Project] [STG_SRC] ON  [HUB_SRC].[HK_Project] = [STG_SRC].[HK_Project] AND [HUB_SRC].[SOURCE_SYSTEM] = [STG_SRC].[SOURCE_SYSTEM]
	WHERE  [STG_SRC].[LOAD_CYCLE_ID] IS NULL AND [MEX_SRC].[LOAD_CYCLE_ID] IS NULL
	;
END;


END;

 
 


GO
