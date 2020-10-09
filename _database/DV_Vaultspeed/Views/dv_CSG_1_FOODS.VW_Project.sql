SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dv_CSG_1_FOODS].[VW_Project] AS 
	SELECT
		  [TDFT_SRC].[DATATYPE] AS [DATATYPE]
		, [TDFT_SRC].[ProjectLink] AS [ProjectLink]
		, [TDFT_SRC].[ProjectCode] AS [ProjectCode]
		, [TDFT_SRC].[ProjectName] AS [ProjectName]
		, [TDFT_SRC].[ActiveProject] AS [ActiveProject]
		, [TDFT_SRC].[ProjectDescription] AS [ProjectDescription]
		, [TDFT_SRC].[MasterSubProject] AS [MasterSubProject]
		, [TDFT_SRC].[ProjectLevel] AS [ProjectLevel]
		, [TDFT_SRC].[SubProjectOfLink] AS [SubProjectOfLink]
		, [TDFT_SRC].[Project_iBranchID] AS [Project_iBranchID]
		, [TDFT_SRC].[Project_dCreatedDate] AS [Project_dCreatedDate]
		, [TDFT_SRC].[Project_dModifiedDate] AS [Project_dModifiedDate]
		, [TDFT_SRC].[Project_iCreatedBranchID] AS [Project_iCreatedBranchID]
		, [TDFT_SRC].[Project_iModifiedBranchID] AS [Project_iModifiedBranchID]
		, [TDFT_SRC].[Project_iCreatedAgentID] AS [Project_iCreatedAgentID]
		, [TDFT_SRC].[Project_iModifiedAgentID] AS [Project_iModifiedAgentID]
		, [TDFT_SRC].[Project_iChangeSetID] AS [Project_iChangeSetID]
		, [TDFT_SRC].[Project_Checksum] AS [Project_Checksum]
	FROM [dv_CSG_1_FOODS].[Project] [TDFT_SRC]
	;

GO
