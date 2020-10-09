SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].EXT_CSG_1_FOODS_Project_INIT AS 
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

	WITH [PREP_EXCEP] AS 
	( 
		SELECT 
			  '+' AS [CHANGE_TYPE]
			, 'SRC' AS [DATATYPE]
			, NULL AS [LOAD_CYCLE_ID]
			, COALESCE( CONVERT(INT, REPLACE([INI_SRC].[ProjectLink],',','') , 1), CONVERT(INT,
				[MEX_INR_SRC].[KEY_ATTRIBUTE_INT] , 1)) AS [ProjectLink]
			, [INI_SRC].[ProjectCode]  AS [ProjectCode]
			, [INI_SRC].[ProjectName]  AS [ProjectName]
			, CONVERT(BIT, [INI_SRC].[ActiveProject] , 1) AS [ActiveProject]
			, [INI_SRC].[ProjectDescription]  AS [ProjectDescription]
			, [INI_SRC].[MasterSubProject]  AS [MasterSubProject]
			, CONVERT(INT, [INI_SRC].[ProjectLevel] , 1) AS [ProjectLevel]
			, CONVERT(INT, [INI_SRC].[SubProjectOfLink] , 1) AS [SubProjectOfLink]
			, CONVERT(INT, [INI_SRC].[Project_iBranchID] , 1) AS [Project_iBranchID]
			, CONVERT(DATETIME2, [INI_SRC].[Project_dCreatedDate] , 103) AS [Project_dCreatedDate]
			, CONVERT(DATETIME2, [INI_SRC].[Project_dModifiedDate] , 103) AS [Project_dModifiedDate]
			, CONVERT(INT, [INI_SRC].[Project_iCreatedBranchID] , 1) AS [Project_iCreatedBranchID]
			, CONVERT(INT, [INI_SRC].[Project_iModifiedBranchID] , 1) AS [Project_iModifiedBranchID]
			, CONVERT(INT, [INI_SRC].[Project_iCreatedAgentID] , 1) AS [Project_iCreatedAgentID]
			, CONVERT(INT, [INI_SRC].[Project_iModifiedAgentID] , 1) AS [Project_iModifiedAgentID]
			, CONVERT(INT, [INI_SRC].[Project_iChangeSetID] , 1) AS [Project_iChangeSetID]
			, CAST([INI_SRC].[Project_Checksum]  AS BINARY) AS [Project_Checksum]
		FROM [CSG_1_FOODS].[Project] [INI_SRC]
		INNER JOIN [dc].[EXECEPTION] [MEX_INR_SRC] ON  [MEX_INR_SRC].[DATATYPE] = '#'
		UNION 
		SELECT 
			  '+' AS [CHANGE_TYPE]
			, [MEX_EXT_SRC].[DATATYPE] AS [DATATYPE]
			, CONVERT(int, [MEX_EXT_SRC].[LOAD_CYCLE_ID] ) AS [LOAD_CYCLE_ID]
			, CONVERT(INT, [MEX_EXT_SRC].[KEY_ATTRIBUTE_INT] , 1) AS [ProjectLink]
			, [MEX_EXT_SRC].[KEY_ATTRIBUTE_VARCHAR]  AS [ProjectCode]
			, [MEX_EXT_SRC].[KEY_ATTRIBUTE_VARCHAR]  AS [ProjectName]
			, CONVERT(BIT, [MEX_EXT_SRC].[ATTRIBUTE_BIT] , 1) AS [ActiveProject]
			, [MEX_EXT_SRC].[ATTRIBUTE_VARCHAR]  AS [ProjectDescription]
			, [MEX_EXT_SRC].[ATTRIBUTE_VARCHAR]  AS [MasterSubProject]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [ProjectLevel]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [SubProjectOfLink]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [Project_iBranchID]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[ATTRIBUTE_DATETIME2] , 103) AS [Project_dCreatedDate]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[ATTRIBUTE_DATETIME2] , 103) AS [Project_dModifiedDate]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [Project_iCreatedBranchID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [Project_iModifiedBranchID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [Project_iCreatedAgentID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [Project_iModifiedAgentID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [Project_iChangeSetID]
			, CAST([MEX_EXT_SRC].[ATTRIBUTE_BINARY]  AS BINARY) AS [Project_Checksum]
		FROM [dc].[EXECEPTION] [MEX_EXT_SRC]
	)
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
		  COALESCE([PREP_EXCEP].[LOAD_CYCLE_ID],[LCI_SRC].[LOAD_CYCLE_ID]) AS [LOAD_CYCLE_ID]
		, [LCI_SRC].[LOADDT] AS [LOADDT]
		, [PREP_EXCEP].[CHANGE_TYPE] AS [CHANGE_TYPE]
		, [PREP_EXCEP].[DATATYPE] AS [DATATYPE]
		, [PREP_EXCEP].[ProjectLink] AS [ProjectLink]
		, COALESCE(UPPER(REPLACE([PREP_EXCEP].[ProjectCode],'|','\' + '|')),[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR]) AS [BK_ProjectCode]
		, COALESCE(UPPER(REPLACE([PREP_EXCEP].[ProjectName],'|','\' + '|')),[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR]) AS [BK_ProjectName]
		, COALESCE(UPPER( CONVERT(VARCHAR, [PREP_EXCEP].[ProjectLink] , 1)),[MEX_SRC].[KEY_ATTRIBUTE_INT]) AS [BK_ProjectLink]
		, [PREP_EXCEP].[ProjectCode] AS [ProjectCode]
		, [PREP_EXCEP].[ProjectName] AS [ProjectName]
		, [PREP_EXCEP].[ActiveProject] AS [ActiveProject]
		, [PREP_EXCEP].[ProjectDescription] AS [ProjectDescription]
		, [PREP_EXCEP].[MasterSubProject] AS [MasterSubProject]
		, [PREP_EXCEP].[ProjectLevel] AS [ProjectLevel]
		, [PREP_EXCEP].[SubProjectOfLink] AS [SubProjectOfLink]
		, [PREP_EXCEP].[Project_iBranchID] AS [Project_iBranchID]
		, [PREP_EXCEP].[Project_dCreatedDate] AS [Project_dCreatedDate]
		, [PREP_EXCEP].[Project_dModifiedDate] AS [Project_dModifiedDate]
		, [PREP_EXCEP].[Project_iCreatedBranchID] AS [Project_iCreatedBranchID]
		, [PREP_EXCEP].[Project_iModifiedBranchID] AS [Project_iModifiedBranchID]
		, [PREP_EXCEP].[Project_iCreatedAgentID] AS [Project_iCreatedAgentID]
		, [PREP_EXCEP].[Project_iModifiedAgentID] AS [Project_iModifiedAgentID]
		, [PREP_EXCEP].[Project_iChangeSetID] AS [Project_iChangeSetID]
		, [PREP_EXCEP].[Project_Checksum] AS [Project_Checksum]
	FROM [PREP_EXCEP]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  1 = 1
	WHERE  [MEX_SRC].[DATATYPE] = '#'
	;
END;


END;

 
 


GO
