SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].[SRC_CSG_1_FOODS_Project_TDFT_INCR] AS 
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
BEGIN -- TDFT_TGT

	TRUNCATE TABLE [dv_CSG_1_FOODS].[Project];

	WITH [DELTA_VIEW] AS 
	( 
		SELECT 
			  CAST('SRC'  AS VARCHAR) AS [DATATYPE]
			, [CDC_SRC].[ProjectLink] AS [ProjectLink]
			, [CDC_SRC].[ProjectCode] AS [ProjectCode]
			, [CDC_SRC].[ProjectName] AS [ProjectName]
			, [CDC_SRC].[ActiveProject] AS [ActiveProject]
			, [CDC_SRC].[ProjectDescription] AS [ProjectDescription]
			, [CDC_SRC].[MasterSubProject] AS [MasterSubProject]
			, [CDC_SRC].[ProjectLevel] AS [ProjectLevel]
			, [CDC_SRC].[SubProjectOfLink] AS [SubProjectOfLink]
			, [CDC_SRC].[Project_iBranchID] AS [Project_iBranchID]
			, [CDC_SRC].[Project_dCreatedDate] AS [Project_dCreatedDate]
			, [CDC_SRC].[Project_dModifiedDate] AS [Project_dModifiedDate]
			, [CDC_SRC].[Project_iCreatedBranchID] AS [Project_iCreatedBranchID]
			, [CDC_SRC].[Project_iModifiedBranchID] AS [Project_iModifiedBranchID]
			, [CDC_SRC].[Project_iCreatedAgentID] AS [Project_iCreatedAgentID]
			, [CDC_SRC].[Project_iModifiedAgentID] AS [Project_iModifiedAgentID]
			, [CDC_SRC].[Project_iChangeSetID] AS [Project_iChangeSetID]
			, [CDC_SRC].[Project_Checksum] AS [Project_Checksum]
		FROM [CSG_1_FOODS].[Project] [CDC_SRC]
	)
	, [PREPJOINBK] AS 
	( 
		SELECT
			  [DELTA_VIEW].[DATATYPE] AS [DATATYPE]
			, COALESCE(REPLACE([DELTA_VIEW].[ProjectLink],',',''),[MEX_BK_SRC].[KEY_ATTRIBUTE_INT]) AS [ProjectLink]
			, [DELTA_VIEW].[ProjectCode] AS [ProjectCode]
			, [DELTA_VIEW].[ProjectName] AS [ProjectName]
			, REPLACE([DELTA_VIEW].[ActiveProject],',','') AS [ActiveProject]
			, [DELTA_VIEW].[ProjectDescription] AS [ProjectDescription]
			, [DELTA_VIEW].[MasterSubProject] AS [MasterSubProject]
			, REPLACE([DELTA_VIEW].[ProjectLevel],',','') AS [ProjectLevel]
			, REPLACE([DELTA_VIEW].[SubProjectOfLink],',','') AS [SubProjectOfLink]
			, REPLACE([DELTA_VIEW].[Project_iBranchID],',','') AS [Project_iBranchID]
			, [DELTA_VIEW].[Project_dCreatedDate] AS [Project_dCreatedDate]
			, [DELTA_VIEW].[Project_dModifiedDate] AS [Project_dModifiedDate]
			, REPLACE([DELTA_VIEW].[Project_iCreatedBranchID],',','') AS [Project_iCreatedBranchID]
			, REPLACE([DELTA_VIEW].[Project_iModifiedBranchID],',','') AS [Project_iModifiedBranchID]
			, REPLACE([DELTA_VIEW].[Project_iCreatedAgentID],',','') AS [Project_iCreatedAgentID]
			, REPLACE([DELTA_VIEW].[Project_iModifiedAgentID],',','') AS [Project_iModifiedAgentID]
			, REPLACE([DELTA_VIEW].[Project_iChangeSetID],',','') AS [Project_iChangeSetID]
			, [DELTA_VIEW].[Project_Checksum] AS [Project_Checksum]
		FROM [DELTA_VIEW]
		INNER JOIN [dc].[EXECEPTION] [MEX_BK_SRC] ON  1 = 1
		WHERE  [MEX_BK_SRC].[DATATYPE] = '#'
	)
	INSERT INTO [dv_CSG_1_FOODS].[Project](
		 [DATATYPE]
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
		  [PREPJOINBK].[DATATYPE] AS [DATATYPE]
		, [PREPJOINBK].[ProjectLink] AS [ProjectLink]
		, [PREPJOINBK].[ProjectCode] AS [ProjectCode]
		, [PREPJOINBK].[ProjectName] AS [ProjectName]
		, [PREPJOINBK].[ActiveProject] AS [ActiveProject]
		, [PREPJOINBK].[ProjectDescription] AS [ProjectDescription]
		, [PREPJOINBK].[MasterSubProject] AS [MasterSubProject]
		, [PREPJOINBK].[ProjectLevel] AS [ProjectLevel]
		, [PREPJOINBK].[SubProjectOfLink] AS [SubProjectOfLink]
		, [PREPJOINBK].[Project_iBranchID] AS [Project_iBranchID]
		, [PREPJOINBK].[Project_dCreatedDate] AS [Project_dCreatedDate]
		, [PREPJOINBK].[Project_dModifiedDate] AS [Project_dModifiedDate]
		, [PREPJOINBK].[Project_iCreatedBranchID] AS [Project_iCreatedBranchID]
		, [PREPJOINBK].[Project_iModifiedBranchID] AS [Project_iModifiedBranchID]
		, [PREPJOINBK].[Project_iCreatedAgentID] AS [Project_iCreatedAgentID]
		, [PREPJOINBK].[Project_iModifiedAgentID] AS [Project_iModifiedAgentID]
		, [PREPJOINBK].[Project_iChangeSetID] AS [Project_iChangeSetID]
		, [PREPJOINBK].[Project_Checksum] AS [Project_Checksum]
	FROM [PREPJOINBK]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	LEFT OUTER JOIN [raw].[SAT_CSG_1_FOODS_Project] [SAT_SRC1] ON  CONVERT(INT, [PREPJOINBK].[ProjectLink] , 1) = [SAT_SRC1].[ProjectLink] AND [SAT_SRC1].[LOAD_CYCLE_ID] =
		[LCI_SRC].[LOAD_CYCLE_ID]
	WHERE  [SAT_SRC1].[HK_Project] IS NULL
	;
END;


END;

 
 


GO
