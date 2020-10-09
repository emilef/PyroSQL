SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].EXT_CSG_1_FOODS_etblPeriod_INIT AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_ext].[_etblPeriod];

	WITH [PREP_EXCEP] AS 
	( 
		SELECT 
			  '+' AS [CHANGE_TYPE]
			, 'SRC' AS [DATATYPE]
			, NULL AS [LOAD_CYCLE_ID]
			, COALESCE( CONVERT(INT, REPLACE([INI_SRC].[idPeriod],',','') , 1), CONVERT(INT,
				[MEX_INR_SRC].[KEY_ATTRIBUTE_INT] , 1)) AS [idPeriod]
			, COALESCE( CONVERT(INT, REPLACE([INI_SRC].[iYearID],',','') , 1), CONVERT(INT,
				[MEX_INR_SRC].[KEY_ATTRIBUTE_INT] , 1)) AS [iYearID]
			, CONVERT(DATETIME2, [INI_SRC].[dPeriodDate] , 103) AS [dPeriodDate]
			, CONVERT(BIT, [INI_SRC].[bBlocked] , 1) AS [bBlocked]
			, CONVERT(BIT, [INI_SRC].[bPBTProcessed] , 1) AS [bPBTProcessed]
			, CONVERT(BIT, [INI_SRC].[bPeriodProcessed] , 1) AS [bPeriodProcessed]
			, CONVERT(INT, [INI_SRC].[_etblPeriod_iBranchID] , 1) AS [_etblPeriod_iBranchID]
			, CONVERT(DATETIME2, [INI_SRC].[_etblPeriod_dCreatedDate] , 103) AS [_etblPeriod_dCreatedDate]
			, CONVERT(DATETIME2, [INI_SRC].[_etblPeriod_dModifiedDate] , 103) AS [_etblPeriod_dModifiedDate]
			, CONVERT(INT, [INI_SRC].[_etblPeriod_iCreatedBranchID] , 1) AS [_etblPeriod_iCreatedBranchID]
			, CONVERT(INT, [INI_SRC].[_etblPeriod_iModifiedBranchID] , 1) AS [_etblPeriod_iModifiedBranchID]
			, CONVERT(INT, [INI_SRC].[_etblPeriod_iCreatedAgentID] , 1) AS [_etblPeriod_iCreatedAgentID]
			, CONVERT(INT, [INI_SRC].[_etblPeriod_iModifiedAgentID] , 1) AS [_etblPeriod_iModifiedAgentID]
			, CONVERT(INT, [INI_SRC].[_etblPeriod_iChangeSetID] , 1) AS [_etblPeriod_iChangeSetID]
			, CAST([INI_SRC].[_etblPeriod_Checksum]  AS BINARY) AS [_etblPeriod_Checksum]
		FROM [CSG_1_FOODS].[_etblPeriod] [INI_SRC]
		INNER JOIN [dc].[EXECEPTION] [MEX_INR_SRC] ON  [MEX_INR_SRC].[DATATYPE] = '#'
		UNION 
		SELECT 
			  '+' AS [CHANGE_TYPE]
			, [MEX_EXT_SRC].[DATATYPE] AS [DATATYPE]
			, CONVERT(int, [MEX_EXT_SRC].[LOAD_CYCLE_ID] ) AS [LOAD_CYCLE_ID]
			, CONVERT(INT, [MEX_EXT_SRC].[KEY_ATTRIBUTE_INT] , 1) AS [idPeriod]
			, CONVERT(INT, [MEX_EXT_SRC].[KEY_ATTRIBUTE_INT] , 1) AS [iYearID]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[KEY_ATTRIBUTE_DATETIME2] , 103) AS [dPeriodDate]
			, CONVERT(BIT, [MEX_EXT_SRC].[ATTRIBUTE_BIT] , 1) AS [bBlocked]
			, CONVERT(BIT, [MEX_EXT_SRC].[ATTRIBUTE_BIT] , 1) AS [bPBTProcessed]
			, CONVERT(BIT, [MEX_EXT_SRC].[ATTRIBUTE_BIT] , 1) AS [bPeriodProcessed]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblPeriod_iBranchID]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[ATTRIBUTE_DATETIME2] , 103) AS [_etblPeriod_dCreatedDate]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[ATTRIBUTE_DATETIME2] , 103) AS [_etblPeriod_dModifiedDate]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblPeriod_iCreatedBranchID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblPeriod_iModifiedBranchID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblPeriod_iCreatedAgentID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblPeriod_iModifiedAgentID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [_etblPeriod_iChangeSetID]
			, CAST([MEX_EXT_SRC].[ATTRIBUTE_BINARY]  AS BINARY) AS [_etblPeriod_Checksum]
		FROM [dc].[EXECEPTION] [MEX_EXT_SRC]
	)
	INSERT INTO [CSG_1_FOODS_ext].[_etblPeriod](
		 [LOAD_CYCLE_ID]
		,[LOADDT]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[idPeriod]
		,[iYearID]
		,[BK_dPeriodDate]
		,[BK_idPeriod]
		,[dPeriodDate]
		,[bBlocked]
		,[bPBTProcessed]
		,[bPeriodProcessed]
		,[_etblPeriod_iBranchID]
		,[_etblPeriod_dCreatedDate]
		,[_etblPeriod_dModifiedDate]
		,[_etblPeriod_iCreatedBranchID]
		,[_etblPeriod_iModifiedBranchID]
		,[_etblPeriod_iCreatedAgentID]
		,[_etblPeriod_iModifiedAgentID]
		,[_etblPeriod_iChangeSetID]
		,[_etblPeriod_Checksum]
	)
	SELECT
		  COALESCE([PREP_EXCEP].[LOAD_CYCLE_ID],[LCI_SRC].[LOAD_CYCLE_ID]) AS [LOAD_CYCLE_ID]
		, [LCI_SRC].[LOADDT] AS [LOADDT]
		, [PREP_EXCEP].[CHANGE_TYPE] AS [CHANGE_TYPE]
		, [PREP_EXCEP].[DATATYPE] AS [DATATYPE]
		, [PREP_EXCEP].[idPeriod] AS [idPeriod]
		, [PREP_EXCEP].[iYearID] AS [iYearID]
		, COALESCE(UPPER( CONVERT(VARCHAR, [PREP_EXCEP].[dPeriodDate] , 103)),[MEX_SRC].[KEY_ATTRIBUTE_DATETIME2]) AS [BK_dPeriodDate]
		, COALESCE(UPPER( CONVERT(VARCHAR, [PREP_EXCEP].[idPeriod] , 1)),[MEX_SRC].[KEY_ATTRIBUTE_INT]) AS [BK_idPeriod]
		, [PREP_EXCEP].[dPeriodDate] AS [dPeriodDate]
		, [PREP_EXCEP].[bBlocked] AS [bBlocked]
		, [PREP_EXCEP].[bPBTProcessed] AS [bPBTProcessed]
		, [PREP_EXCEP].[bPeriodProcessed] AS [bPeriodProcessed]
		, [PREP_EXCEP].[_etblPeriod_iBranchID] AS [_etblPeriod_iBranchID]
		, [PREP_EXCEP].[_etblPeriod_dCreatedDate] AS [_etblPeriod_dCreatedDate]
		, [PREP_EXCEP].[_etblPeriod_dModifiedDate] AS [_etblPeriod_dModifiedDate]
		, [PREP_EXCEP].[_etblPeriod_iCreatedBranchID] AS [_etblPeriod_iCreatedBranchID]
		, [PREP_EXCEP].[_etblPeriod_iModifiedBranchID] AS [_etblPeriod_iModifiedBranchID]
		, [PREP_EXCEP].[_etblPeriod_iCreatedAgentID] AS [_etblPeriod_iCreatedAgentID]
		, [PREP_EXCEP].[_etblPeriod_iModifiedAgentID] AS [_etblPeriod_iModifiedAgentID]
		, [PREP_EXCEP].[_etblPeriod_iChangeSetID] AS [_etblPeriod_iChangeSetID]
		, [PREP_EXCEP].[_etblPeriod_Checksum] AS [_etblPeriod_Checksum]
	FROM [PREP_EXCEP]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  1 = 1
	WHERE  [MEX_SRC].[DATATYPE] = '#'
	;
END;


END;

 
 


GO
