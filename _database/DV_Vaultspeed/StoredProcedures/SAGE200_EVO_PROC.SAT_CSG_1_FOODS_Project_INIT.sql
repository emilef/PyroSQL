SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].SAT_CSG_1_FOODS_Project_INIT AS 
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
BEGIN -- SAT_TGT

	DELETE FROM [raw].[SAT_CSG_1_FOODS_Project] 
	WHERE  1 = 1
	;
END;


BEGIN -- SAT_TGT

	WITH [STG_SRC] AS 
	( 
		SELECT
			  [STG_INR_SRC].[HK_Project] AS [HK_Project]
			, [STG_INR_SRC].[LOADDT] AS [LOADDT]
			, [STG_INR_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1',
				COALESCE(REPLACE(REPLACE(RTRIM(REPLACE(REPLACE( REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[ActiveProject] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[ProjectDescription] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[MasterSubProject] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[ProjectLevel] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[SubProjectOfLink] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Project_iBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Project_dCreatedDate] , 103)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Project_dModifiedDate] , 103)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Project_iCreatedBranchID] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Project_iModifiedBranchID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Project_iCreatedAgentID] ,
				1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[Project_iModifiedAgentID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Project_iChangeSetID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CAST([STG_INR_SRC].[Project_Checksum]  AS VARCHAR)),'#'),'|','\' + '|')+ '|',' ','#' +
				'|'),'|' + '#',' ')),' ','|' + '#'),'#' + '|',' '),'#')),2)) AS [HASHDIFF]
			, 'N'  AS [ISDELETED]
			, [STG_INR_SRC].[ProjectLink] AS [ProjectLink]
			, [STG_INR_SRC].[ProjectCode] AS [ProjectCode]
			, [STG_INR_SRC].[ProjectName] AS [ProjectName]
			, [STG_INR_SRC].[ActiveProject] AS [ActiveProject]
			, [STG_INR_SRC].[ProjectDescription] AS [ProjectDescription]
			, [STG_INR_SRC].[MasterSubProject] AS [MasterSubProject]
			, [STG_INR_SRC].[ProjectLevel] AS [ProjectLevel]
			, [STG_INR_SRC].[SubProjectOfLink] AS [SubProjectOfLink]
			, [STG_INR_SRC].[Project_iBranchID] AS [Project_iBranchID]
			, [STG_INR_SRC].[Project_dCreatedDate] AS [Project_dCreatedDate]
			, [STG_INR_SRC].[Project_dModifiedDate] AS [Project_dModifiedDate]
			, [STG_INR_SRC].[Project_iCreatedBranchID] AS [Project_iCreatedBranchID]
			, [STG_INR_SRC].[Project_iModifiedBranchID] AS [Project_iModifiedBranchID]
			, [STG_INR_SRC].[Project_iCreatedAgentID] AS [Project_iCreatedAgentID]
			, [STG_INR_SRC].[Project_iModifiedAgentID] AS [Project_iModifiedAgentID]
			, [STG_INR_SRC].[Project_iChangeSetID] AS [Project_iChangeSetID]
			, [STG_INR_SRC].[Project_Checksum] AS [Project_Checksum]
			, ROW_NUMBER()OVER(PARTITION BY [STG_INR_SRC].[HK_Project] ORDER BY [STG_INR_SRC].[LOADDT]) AS [DUMMY]
		FROM [CSG_1_FOODS_stage].[Project] [STG_INR_SRC]
	)
	INSERT INTO [raw].[SAT_CSG_1_FOODS_Project](
		 [HK_Project]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[HASHDIFF]
		,[ISDELETED]
		,[ProjectLink]
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
		  [STG_SRC].[HK_Project] AS [HK_Project]
		, [STG_SRC].[LOADDT] AS [LOADDT]
		, [STG_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [STG_SRC].[LOADENDDT] AS [LOADENDDT]
		, [STG_SRC].[HASHDIFF] AS [HASHDIFF]
		, [STG_SRC].[ISDELETED] AS [ISDELETED]
		, [STG_SRC].[ProjectLink] AS [ProjectLink]
		, [STG_SRC].[ProjectCode] AS [ProjectCode]
		, [STG_SRC].[ProjectName] AS [ProjectName]
		, [STG_SRC].[ActiveProject] AS [ActiveProject]
		, [STG_SRC].[ProjectDescription] AS [ProjectDescription]
		, [STG_SRC].[MasterSubProject] AS [MasterSubProject]
		, [STG_SRC].[ProjectLevel] AS [ProjectLevel]
		, [STG_SRC].[SubProjectOfLink] AS [SubProjectOfLink]
		, [STG_SRC].[Project_iBranchID] AS [Project_iBranchID]
		, [STG_SRC].[Project_dCreatedDate] AS [Project_dCreatedDate]
		, [STG_SRC].[Project_dModifiedDate] AS [Project_dModifiedDate]
		, [STG_SRC].[Project_iCreatedBranchID] AS [Project_iCreatedBranchID]
		, [STG_SRC].[Project_iModifiedBranchID] AS [Project_iModifiedBranchID]
		, [STG_SRC].[Project_iCreatedAgentID] AS [Project_iCreatedAgentID]
		, [STG_SRC].[Project_iModifiedAgentID] AS [Project_iModifiedAgentID]
		, [STG_SRC].[Project_iChangeSetID] AS [Project_iChangeSetID]
		, [STG_SRC].[Project_Checksum] AS [Project_Checksum]
	FROM [STG_SRC]
	WHERE  [STG_SRC].[DUMMY] = 1
	;
END;


END;

 
 


GO
