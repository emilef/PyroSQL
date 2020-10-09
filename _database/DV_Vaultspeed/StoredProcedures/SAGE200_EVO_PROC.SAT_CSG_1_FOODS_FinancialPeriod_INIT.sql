SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].SAT_CSG_1_FOODS_FinancialPeriod_INIT AS 
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

	DELETE FROM [raw].[SAT_CSG_1_FOODS_FinancialPeriod] 
	WHERE  1 = 1
	;
END;


BEGIN -- SAT_TGT

	WITH [STG_SRC] AS 
	( 
		SELECT
			  [STG_INR_SRC].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
			, [STG_INR_SRC].[LOADDT] AS [LOADDT]
			, [STG_INR_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1',
				COALESCE(REPLACE(REPLACE(RTRIM(REPLACE(REPLACE( REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[bBlocked] , 1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[bPBTProcessed] , 1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[bPeriodProcessed] , 1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[_etblPeriod_iBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[_etblPeriod_dCreatedDate] , 103)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[_etblPeriod_dModifiedDate] , 103)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[_etblPeriod_iCreatedBranchID] , 1))
				,'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[_etblPeriod_iModifiedBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[_etblPeriod_iCreatedAgentID] , 1)),'#'),'|','\' + '|')
				+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[_etblPeriod_iModifiedAgentID] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[_etblPeriod_iChangeSetID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CAST([STG_INR_SRC].[_etblPeriod_Checksum]  AS VARCHAR)),
				'#'),'|','\' + '|')+ '|',' ','#' + '|'),'|' + '#',' ')),' ','|' + '#'),'#' + '|',' '),'#')),2)) AS [HASHDIFF]
			, 'N'  AS [ISDELETED]
			, [STG_INR_SRC].[idPeriod] AS [idPeriod]
			, [STG_INR_SRC].[iYearID] AS [iYearID]
			, [STG_INR_SRC].[dPeriodDate] AS [dPeriodDate]
			, [STG_INR_SRC].[bBlocked] AS [bBlocked]
			, [STG_INR_SRC].[bPBTProcessed] AS [bPBTProcessed]
			, [STG_INR_SRC].[bPeriodProcessed] AS [bPeriodProcessed]
			, [STG_INR_SRC].[_etblPeriod_iBranchID] AS [_etblPeriod_iBranchID]
			, [STG_INR_SRC].[_etblPeriod_dCreatedDate] AS [_etblPeriod_dCreatedDate]
			, [STG_INR_SRC].[_etblPeriod_dModifiedDate] AS [_etblPeriod_dModifiedDate]
			, [STG_INR_SRC].[_etblPeriod_iCreatedBranchID] AS [_etblPeriod_iCreatedBranchID]
			, [STG_INR_SRC].[_etblPeriod_iModifiedBranchID] AS [_etblPeriod_iModifiedBranchID]
			, [STG_INR_SRC].[_etblPeriod_iCreatedAgentID] AS [_etblPeriod_iCreatedAgentID]
			, [STG_INR_SRC].[_etblPeriod_iModifiedAgentID] AS [_etblPeriod_iModifiedAgentID]
			, [STG_INR_SRC].[_etblPeriod_iChangeSetID] AS [_etblPeriod_iChangeSetID]
			, [STG_INR_SRC].[_etblPeriod_Checksum] AS [_etblPeriod_Checksum]
			, ROW_NUMBER()OVER(PARTITION BY [STG_INR_SRC].[HK_FinancialPeriod] ORDER BY [STG_INR_SRC].[LOADDT]) AS [DUMMY]
		FROM [CSG_1_FOODS_stage].[_etblPeriod] [STG_INR_SRC]
	)
	INSERT INTO [raw].[SAT_CSG_1_FOODS_FinancialPeriod](
		 [HK_FinancialPeriod]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[HASHDIFF]
		,[ISDELETED]
		,[idPeriod]
		,[iYearID]
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
		  [STG_SRC].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
		, [STG_SRC].[LOADDT] AS [LOADDT]
		, [STG_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [STG_SRC].[LOADENDDT] AS [LOADENDDT]
		, [STG_SRC].[HASHDIFF] AS [HASHDIFF]
		, [STG_SRC].[ISDELETED] AS [ISDELETED]
		, [STG_SRC].[idPeriod] AS [idPeriod]
		, [STG_SRC].[iYearID] AS [iYearID]
		, [STG_SRC].[dPeriodDate] AS [dPeriodDate]
		, [STG_SRC].[bBlocked] AS [bBlocked]
		, [STG_SRC].[bPBTProcessed] AS [bPBTProcessed]
		, [STG_SRC].[bPeriodProcessed] AS [bPeriodProcessed]
		, [STG_SRC].[_etblPeriod_iBranchID] AS [_etblPeriod_iBranchID]
		, [STG_SRC].[_etblPeriod_dCreatedDate] AS [_etblPeriod_dCreatedDate]
		, [STG_SRC].[_etblPeriod_dModifiedDate] AS [_etblPeriod_dModifiedDate]
		, [STG_SRC].[_etblPeriod_iCreatedBranchID] AS [_etblPeriod_iCreatedBranchID]
		, [STG_SRC].[_etblPeriod_iModifiedBranchID] AS [_etblPeriod_iModifiedBranchID]
		, [STG_SRC].[_etblPeriod_iCreatedAgentID] AS [_etblPeriod_iCreatedAgentID]
		, [STG_SRC].[_etblPeriod_iModifiedAgentID] AS [_etblPeriod_iModifiedAgentID]
		, [STG_SRC].[_etblPeriod_iChangeSetID] AS [_etblPeriod_iChangeSetID]
		, [STG_SRC].[_etblPeriod_Checksum] AS [_etblPeriod_Checksum]
	FROM [STG_SRC]
	WHERE  [STG_SRC].[DUMMY] = 1
	;
END;


END;

 
 


GO
