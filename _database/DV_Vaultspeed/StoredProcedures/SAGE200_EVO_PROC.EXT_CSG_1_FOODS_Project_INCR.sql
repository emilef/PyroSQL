SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].EXT_CSG_1_FOODS_Project_INCR AS 
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
BEGIN -- EXT_TGT

	TRUNCATE TABLE [CSG_1_FOODS_ext].[Project];

	INSERT INTO [CSG_1_FOODS_ext].[Project](
		 [LOAD_CYCLE_ID]
		,[LOADDT]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[ProjectLink]
		,[BK_ProjectCode]
		,[BK_ProjectName]
		,[BK_ProjectLink]
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
		  [LCI_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, dateadd(MICROSECOND, 2*row_number() over (order by [LCI_SRC].[LOADDT]), SYSDATETIME()) AS [LOADDT]
		, [MEX_SRC].[ATTRIBUTE_VARCHAR] AS [CHANGE_TYPE]
		, [TDFV_SRC].[DATATYPE] AS [DATATYPE]
		, CONVERT(INT, [TDFV_SRC].[ProjectLink] , 1) AS [ProjectLink]
		, COALESCE(UPPER(REPLACE([TDFV_SRC].[ProjectCode],'|','\' + '|')),[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR]) AS [BK_ProjectCode]
		, COALESCE(UPPER(REPLACE([TDFV_SRC].[ProjectName],'|','\' + '|')),[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR]) AS [BK_ProjectName]
		, COALESCE(UPPER([TDFV_SRC].[ProjectLink]),[MEX_SRC].[KEY_ATTRIBUTE_INT]) AS [BK_ProjectLink]
		, [TDFV_SRC].[ProjectCode]  AS [ProjectCode]
		, [TDFV_SRC].[ProjectName]  AS [ProjectName]
		, CONVERT(BIT, [TDFV_SRC].[ActiveProject] , 1) AS [ActiveProject]
		, [TDFV_SRC].[ProjectDescription]  AS [ProjectDescription]
		, [TDFV_SRC].[MasterSubProject]  AS [MasterSubProject]
		, CONVERT(INT, [TDFV_SRC].[ProjectLevel] , 1) AS [ProjectLevel]
		, CONVERT(INT, [TDFV_SRC].[SubProjectOfLink] , 1) AS [SubProjectOfLink]
		, CONVERT(INT, [TDFV_SRC].[Project_iBranchID] , 1) AS [Project_iBranchID]
		, CONVERT(DATETIME2, [TDFV_SRC].[Project_dCreatedDate] , 103) AS [Project_dCreatedDate]
		, CONVERT(DATETIME2, [TDFV_SRC].[Project_dModifiedDate] , 103) AS [Project_dModifiedDate]
		, CONVERT(INT, [TDFV_SRC].[Project_iCreatedBranchID] , 1) AS [Project_iCreatedBranchID]
		, CONVERT(INT, [TDFV_SRC].[Project_iModifiedBranchID] , 1) AS [Project_iModifiedBranchID]
		, CONVERT(INT, [TDFV_SRC].[Project_iCreatedAgentID] , 1) AS [Project_iCreatedAgentID]
		, CONVERT(INT, [TDFV_SRC].[Project_iModifiedAgentID] , 1) AS [Project_iModifiedAgentID]
		, CONVERT(INT, [TDFV_SRC].[Project_iChangeSetID] , 1) AS [Project_iChangeSetID]
		, CAST([TDFV_SRC].[Project_Checksum]  AS BINARY) AS [Project_Checksum]
	FROM [dv_CSG_1_FOODS].[VW_Project] [TDFV_SRC]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  1 = 1
	WHERE  [MEX_SRC].[DATATYPE] = '#'
	;
END;


END;

 
 


GO
