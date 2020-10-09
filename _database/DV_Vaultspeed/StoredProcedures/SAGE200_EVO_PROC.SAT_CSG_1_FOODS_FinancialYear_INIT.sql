SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].SAT_CSG_1_FOODS_FinancialYear_INIT AS 
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

	DELETE FROM [raw].[SAT_CSG_1_FOODS_FinancialYear] 
	WHERE  1 = 1
	;
END;


BEGIN -- SAT_TGT

	WITH [STG_SRC] AS 
	( 
		SELECT
			  [STG_INR_SRC].[HK_FinancialYear] AS [HK_FinancialYear]
			, [STG_INR_SRC].[LOADDT] AS [LOADDT]
			, [STG_INR_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1',
				COALESCE(REPLACE(REPLACE(RTRIM(REPLACE(REPLACE( REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cYearDescription] ),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bArchived] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bPurged] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[_etblPeriodYear_iBranchID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[_etblPeriodYear_dCreatedDate] , 103)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[_etblPeriodYear_dModifiedDate] , 103)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[_etblPeriodYear_iCreatedBranchID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[_etblPeriodYear_iModifiedBranchID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[_etblPeriodYear_iCreatedAgentID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[_etblPeriodYear_iModifiedAgentID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[_etblPeriodYear_iChangeSetID] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CAST([STG_INR_SRC].[_etblPeriodYear_Checksum]  AS VARCHAR)),
				'#'),'|','\' + '|')+ '|',' ','#' + '|'),'|' + '#',' ')),' ','|' + '#'),'#' + '|',' '),'#')),2)) AS [HASHDIFF]
			, 'N'  AS [ISDELETED]
			, [STG_INR_SRC].[idYear] AS [idYear]
			, [STG_INR_SRC].[dYearStartDate] AS [dYearStartDate]
			, [STG_INR_SRC].[cYearDescription] AS [cYearDescription]
			, [STG_INR_SRC].[bArchived] AS [bArchived]
			, [STG_INR_SRC].[bPurged] AS [bPurged]
			, [STG_INR_SRC].[_etblPeriodYear_iBranchID] AS [_etblPeriodYear_iBranchID]
			, [STG_INR_SRC].[_etblPeriodYear_dCreatedDate] AS [_etblPeriodYear_dCreatedDate]
			, [STG_INR_SRC].[_etblPeriodYear_dModifiedDate] AS [_etblPeriodYear_dModifiedDate]
			, [STG_INR_SRC].[_etblPeriodYear_iCreatedBranchID] AS [_etblPeriodYear_iCreatedBranchID]
			, [STG_INR_SRC].[_etblPeriodYear_iModifiedBranchID] AS [_etblPeriodYear_iModifiedBranchID]
			, [STG_INR_SRC].[_etblPeriodYear_iCreatedAgentID] AS [_etblPeriodYear_iCreatedAgentID]
			, [STG_INR_SRC].[_etblPeriodYear_iModifiedAgentID] AS [_etblPeriodYear_iModifiedAgentID]
			, [STG_INR_SRC].[_etblPeriodYear_iChangeSetID] AS [_etblPeriodYear_iChangeSetID]
			, [STG_INR_SRC].[_etblPeriodYear_Checksum] AS [_etblPeriodYear_Checksum]
			, ROW_NUMBER()OVER(PARTITION BY [STG_INR_SRC].[HK_FinancialYear] ORDER BY [STG_INR_SRC].[LOADDT]) AS [DUMMY]
		FROM [CSG_1_FOODS_stage].[_etblPeriodYear] [STG_INR_SRC]
	)
	INSERT INTO [raw].[SAT_CSG_1_FOODS_FinancialYear](
		 [HK_FinancialYear]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[HASHDIFF]
		,[ISDELETED]
		,[idYear]
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
		  [STG_SRC].[HK_FinancialYear] AS [HK_FinancialYear]
		, [STG_SRC].[LOADDT] AS [LOADDT]
		, [STG_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [STG_SRC].[LOADENDDT] AS [LOADENDDT]
		, [STG_SRC].[HASHDIFF] AS [HASHDIFF]
		, [STG_SRC].[ISDELETED] AS [ISDELETED]
		, [STG_SRC].[idYear] AS [idYear]
		, [STG_SRC].[dYearStartDate] AS [dYearStartDate]
		, [STG_SRC].[cYearDescription] AS [cYearDescription]
		, [STG_SRC].[bArchived] AS [bArchived]
		, [STG_SRC].[bPurged] AS [bPurged]
		, [STG_SRC].[_etblPeriodYear_iBranchID] AS [_etblPeriodYear_iBranchID]
		, [STG_SRC].[_etblPeriodYear_dCreatedDate] AS [_etblPeriodYear_dCreatedDate]
		, [STG_SRC].[_etblPeriodYear_dModifiedDate] AS [_etblPeriodYear_dModifiedDate]
		, [STG_SRC].[_etblPeriodYear_iCreatedBranchID] AS [_etblPeriodYear_iCreatedBranchID]
		, [STG_SRC].[_etblPeriodYear_iModifiedBranchID] AS [_etblPeriodYear_iModifiedBranchID]
		, [STG_SRC].[_etblPeriodYear_iCreatedAgentID] AS [_etblPeriodYear_iCreatedAgentID]
		, [STG_SRC].[_etblPeriodYear_iModifiedAgentID] AS [_etblPeriodYear_iModifiedAgentID]
		, [STG_SRC].[_etblPeriodYear_iChangeSetID] AS [_etblPeriodYear_iChangeSetID]
		, [STG_SRC].[_etblPeriodYear_Checksum] AS [_etblPeriodYear_Checksum]
	FROM [STG_SRC]
	WHERE  [STG_SRC].[DUMMY] = 1
	;
END;


END;

 
 


GO
