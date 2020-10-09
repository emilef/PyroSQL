SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].EXT_CSG_1_FOODS_etblPeriodYear_INIT AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_ext].[_etblPeriodYear];

	WITH [PREP_EXCEP] AS 
	( 
		SELECT 
			  '+' AS [CHANGE_TYPE]
			, 'SRC' AS [DATATYPE]
			, NULL AS [LOAD_CYCLE_ID]
			, COALESCE( CONVERT(INT, REPLACE([INI_SRC].[idYear],',','') , 1), CONVERT(INT,
				[MEX_INR_SRC].[KEY_ATTRIBUTE_INT] , 1)) AS [idYear]
			, CONVERT(DATETIME2, [INI_SRC].[dYearStartDate] , 103) AS [dYearStartDate]
			, [INI_SRC].[cYearDescription]  AS [cYearDescription]
			, CONVERT(BIT, [INI_SRC].[bArchived] , 1) AS [bArchived]
			, CONVERT(BIT, [INI_SRC].[bPurged] , 1) AS [bPurged]
			, CONVERT(INT, [INI_SRC].[_etblPeriodYear_iBranchID] , 1) AS [_etblPeriodYear_iBranchID]
			, CONVERT(DATETIME2, [INI_SRC].[_etblPeriodYear_dCreatedDate] , 103) AS [_etblPeriodYear_dCreatedDate]
			, CONVERT(DATETIME2, [INI_SRC].[_etblPeriodYear_dModifiedDate] , 103) AS [_etblPeriodYear_dModifiedDate]
			, CONVERT(INT, [INI_SRC].[_etblPeriodYear_iCreatedBranchID] , 1) AS [_etblPeriodYear_iCreatedBranchID]
			, CONVERT(INT, [INI_SRC].[_etblPeriodYear_iModifiedBranchID] , 1) AS [_etblPeriodYear_iModifiedBranchID]
			, CONVERT(INT, [INI_SRC].[_etblPeriodYear_iCreatedAgentID] , 1) AS [_etblPeriodYear_iCreatedAgentID]
			, CONVERT(INT, [INI_SRC].[_etblPeriodYear_iModifiedAgentID] , 1) AS [_etblPeriodYear_iModifiedAgentID]
			, CONVERT(INT, [INI_SRC].[_etblPeriodYear_iChangeSetID] , 1) AS [_etblPeriodYear_iChangeSetID]
			, CAST([INI_SRC].[_etblPeriodYear_Checksum]  AS BINARY) AS [_etblPeriodYear_Checksum]
		FROM [CSG_1_FOODS].[_etblPeriodYear] [INI_SRC]
		INNER JOIN [dc].[EXECEPTION] [MEX_INR_SRC] ON  [MEX_INR_SRC].[DATATYPE] = '#'
		UNION 
		SELECT 
			  '+' AS [CHANGE_TYPE]
			, [MEX_EXT_SRC].[DATATYPE] AS [DATATYPE]
			, CONVERT(int, [MEX_EXT_SRC].[LOAD_CYCLE_ID] ) AS [LOAD_CYCLE_ID]
			, CONVERT(INT, [MEX_EXT_SRC].[KEY_ATTRIBUTE_INT] , 1) AS [idYear]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[KEY_ATTRIBUTE_DATETIME2] , 103) AS [dYearStartDate]
			, [MEX_EXT_SRC].[ATTRIBUTE_VARCHAR]  AS [cYearDescription]
			, CONVERT(BIT, [MEX_EXT_SRC].[ATTRIBUTE_BIT] , 1) AS [bArchived]
			, CONVERT(BIT, [MEX_EXT_SRC].[ATTRIBUTE_BIT] , 1) AS [bPurged]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblPeriodYear_iBranchID]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[ATTRIBUTE_DATETIME2] , 103) AS [_etblPeriodYear_dCreatedDate]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[ATTRIBUTE_DATETIME2] , 103) AS [_etblPeriodYear_dModifiedDate]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblPeriodYear_iCreatedBranchID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblPeriodYear_iModifiedBranchID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblPeriodYear_iCreatedAgentID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblPeriodYear_iModifiedAgentID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblPeriodYear_iChangeSetID]
			, CAST([MEX_EXT_SRC].[ATTRIBUTE_BINARY]  AS BINARY) AS [_etblPeriodYear_Checksum]
		FROM [dc].[EXECEPTION] [MEX_EXT_SRC]
	)
	INSERT INTO [CSG_1_FOODS_ext].[_etblPeriodYear](
		 [LOAD_CYCLE_ID]
		,[LOADDT]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[idYear]
		,[BK_dYearStartDate]
		,[BK_idYear]
		,[dYearStartDate]
		,[cYearDescription]
		,[bArchived]
		,[bPurged]
		,[_etblPeriodYear_iBranchID]
		,[_etblPeriodYear_dCreatedDate]
		,[_etblPeriodYear_dModifiedDate]
		,[_etblPeriodYear_iCreatedBranchID]
		,[_etblPeriodYear_iModifiedBranchID]
		,[_etblPeriodYear_iCreatedAgentID]
		,[_etblPeriodYear_iModifiedAgentID]
		,[_etblPeriodYear_iChangeSetID]
		,[_etblPeriodYear_Checksum]
	)
	SELECT
		  COALESCE([PREP_EXCEP].[LOAD_CYCLE_ID],[LCI_SRC].[LOAD_CYCLE_ID]) AS [LOAD_CYCLE_ID]
		, [LCI_SRC].[LOADDT] AS [LOADDT]
		, [PREP_EXCEP].[CHANGE_TYPE] AS [CHANGE_TYPE]
		, [PREP_EXCEP].[DATATYPE] AS [DATATYPE]
		, [PREP_EXCEP].[idYear] AS [idYear]
		, COALESCE(UPPER( CONVERT(VARCHAR, [PREP_EXCEP].[dYearStartDate] , 103)),[MEX_SRC].[KEY_ATTRIBUTE_DATETIME2]) AS [BK_dYearStartDate]
		, COALESCE(UPPER( CONVERT(VARCHAR, [PREP_EXCEP].[idYear] , 1)),[MEX_SRC].[KEY_ATTRIBUTE_INT]) AS [BK_idYear]
		, [PREP_EXCEP].[dYearStartDate] AS [dYearStartDate]
		, [PREP_EXCEP].[cYearDescription] AS [cYearDescription]
		, [PREP_EXCEP].[bArchived] AS [bArchived]
		, [PREP_EXCEP].[bPurged] AS [bPurged]
		, [PREP_EXCEP].[_etblPeriodYear_iBranchID] AS [_etblPeriodYear_iBranchID]
		, [PREP_EXCEP].[_etblPeriodYear_dCreatedDate] AS [_etblPeriodYear_dCreatedDate]
		, [PREP_EXCEP].[_etblPeriodYear_dModifiedDate] AS [_etblPeriodYear_dModifiedDate]
		, [PREP_EXCEP].[_etblPeriodYear_iCreatedBranchID] AS [_etblPeriodYear_iCreatedBranchID]
		, [PREP_EXCEP].[_etblPeriodYear_iModifiedBranchID] AS [_etblPeriodYear_iModifiedBranchID]
		, [PREP_EXCEP].[_etblPeriodYear_iCreatedAgentID] AS [_etblPeriodYear_iCreatedAgentID]
		, [PREP_EXCEP].[_etblPeriodYear_iModifiedAgentID] AS [_etblPeriodYear_iModifiedAgentID]
		, [PREP_EXCEP].[_etblPeriodYear_iChangeSetID] AS [_etblPeriodYear_iChangeSetID]
		, [PREP_EXCEP].[_etblPeriodYear_Checksum] AS [_etblPeriodYear_Checksum]
	FROM [PREP_EXCEP]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  1 = 1
	WHERE  [MEX_SRC].[DATATYPE] = '#'
	;
END;


END;

 
 


GO
