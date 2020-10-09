SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].SAT_CSG_1_FOODS_ClientClass_INCR AS 
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
BEGIN -- SAT_TEMP_TGT

	TRUNCATE TABLE [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_ClientClass];

	WITH [DIST_STG] AS 
	( 
		SELECT DISTINCT 
 			  [STG_DIS_SRC].[HK_ClientClass] AS [HK_ClientClass]
			, [STG_DIS_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		FROM [CSG_1_FOODS_stage].[CliClass] [STG_DIS_SRC]
	)
	, [TEMP_TABLE_SET] AS 
	( 
		SELECT 
			  [STG_TEMP_SRC].[HK_ClientClass] AS [HK_ClientClass]
			, [STG_TEMP_SRC].[LOADDT] AS [LOADDT]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, [STG_TEMP_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, [STG_TEMP_SRC].[DATATYPE] AS [DATATYPE]
			, 'STG' AS [SRC]
			, 1 AS [ORIGIN_ID]
			, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1',
				COALESCE(REPLACE(REPLACE(RTRIM(REPLACE(REPLACE( REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Description] ),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[DiscMtrxRow] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[dGroupTimeStamp] , 103)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iAccountsIDControlAcc] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iAccountsIDProfitAcc] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iAccountsIDLossAcc] , 1))
				,'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iTaxControlAccID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iRevProfitAcc] , 1)),'#')
				,'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iRevLossAcc] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iProvForRevAcc] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iInvoiceDocProfileID] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iSOInvoiceDocProfileID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[iCreditNoteDocProfileID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iJCInvoiceDocProfileID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[CliClass_iBranchID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[CliClass_dCreatedDate] , 103)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[CliClass_dModifiedDate] , 103)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[CliClass_iCreatedBranchID] ,
				1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[CliClass_iModifiedBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[CliClass_iCreatedAgentID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[CliClass_iModifiedAgentID] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[CliClass_iChangeSetID] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CAST([STG_TEMP_SRC].[CliClass_Checksum]  AS VARCHAR)),'#'),'|',
				'\' + '|')+ '|',' ','#' + '|'),'|' + '#',' ')),' ','|' + '#'),'#' + '|',' '),'#')),2)) AS [HASHDIFF]
			, CASE WHEN [STG_TEMP_SRC].[CHANGE_TYPE] = '-' THEN 'Y'  ELSE 'N'  END AS [ISDELETED]
			, [STG_TEMP_SRC].[IdCliClass] AS [IdCliClass]
			, [STG_TEMP_SRC].[Code] AS [Code]
			, [STG_TEMP_SRC].[Description] AS [Description]
			, [STG_TEMP_SRC].[DiscMtrxRow] AS [DiscMtrxRow]
			, [STG_TEMP_SRC].[dGroupTimeStamp] AS [dGroupTimeStamp]
			, [STG_TEMP_SRC].[iAccountsIDControlAcc] AS [iAccountsIDControlAcc]
			, [STG_TEMP_SRC].[iAccountsIDProfitAcc] AS [iAccountsIDProfitAcc]
			, [STG_TEMP_SRC].[iAccountsIDLossAcc] AS [iAccountsIDLossAcc]
			, [STG_TEMP_SRC].[iTaxControlAccID] AS [iTaxControlAccID]
			, [STG_TEMP_SRC].[iRevProfitAcc] AS [iRevProfitAcc]
			, [STG_TEMP_SRC].[iRevLossAcc] AS [iRevLossAcc]
			, [STG_TEMP_SRC].[iProvForRevAcc] AS [iProvForRevAcc]
			, [STG_TEMP_SRC].[iInvoiceDocProfileID] AS [iInvoiceDocProfileID]
			, [STG_TEMP_SRC].[iSOInvoiceDocProfileID] AS [iSOInvoiceDocProfileID]
			, [STG_TEMP_SRC].[iCreditNoteDocProfileID] AS [iCreditNoteDocProfileID]
			, [STG_TEMP_SRC].[iJCInvoiceDocProfileID] AS [iJCInvoiceDocProfileID]
			, [STG_TEMP_SRC].[CliClass_iBranchID] AS [CliClass_iBranchID]
			, [STG_TEMP_SRC].[CliClass_dCreatedDate] AS [CliClass_dCreatedDate]
			, [STG_TEMP_SRC].[CliClass_dModifiedDate] AS [CliClass_dModifiedDate]
			, [STG_TEMP_SRC].[CliClass_iCreatedBranchID] AS [CliClass_iCreatedBranchID]
			, [STG_TEMP_SRC].[CliClass_iModifiedBranchID] AS [CliClass_iModifiedBranchID]
			, [STG_TEMP_SRC].[CliClass_iCreatedAgentID] AS [CliClass_iCreatedAgentID]
			, [STG_TEMP_SRC].[CliClass_iModifiedAgentID] AS [CliClass_iModifiedAgentID]
			, [STG_TEMP_SRC].[CliClass_iChangeSetID] AS [CliClass_iChangeSetID]
			, [STG_TEMP_SRC].[CliClass_Checksum] AS [CliClass_Checksum]
		FROM [CSG_1_FOODS_stage].[CliClass] [STG_TEMP_SRC]
		WHERE  [STG_TEMP_SRC].[DATATYPE] = 'SRC'
		UNION ALL 
		SELECT 
			  [SAT_SRC].[HK_ClientClass] AS [HK_ClientClass]
			, [SAT_SRC].[LOADDT] AS [LOADDT]
			, [SAT_SRC].[LOADENDDT] AS [LOADENDDT]
			, [SAT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, 'SAT' AS [DATATYPE]
			, 'SAT' AS [SRC]
			, 0 AS [ORIGIN_ID]
			, [SAT_SRC].[HASHDIFF] AS [HASHDIFF]
			, [SAT_SRC].[ISDELETED] AS [ISDELETED]
			, [SAT_SRC].[IdCliClass] AS [IdCliClass]
			, [SAT_SRC].[Code] AS [Code]
			, [SAT_SRC].[Description] AS [Description]
			, [SAT_SRC].[DiscMtrxRow] AS [DiscMtrxRow]
			, [SAT_SRC].[dGroupTimeStamp] AS [dGroupTimeStamp]
			, [SAT_SRC].[iAccountsIDControlAcc] AS [iAccountsIDControlAcc]
			, [SAT_SRC].[iAccountsIDProfitAcc] AS [iAccountsIDProfitAcc]
			, [SAT_SRC].[iAccountsIDLossAcc] AS [iAccountsIDLossAcc]
			, [SAT_SRC].[iTaxControlAccID] AS [iTaxControlAccID]
			, [SAT_SRC].[iRevProfitAcc] AS [iRevProfitAcc]
			, [SAT_SRC].[iRevLossAcc] AS [iRevLossAcc]
			, [SAT_SRC].[iProvForRevAcc] AS [iProvForRevAcc]
			, [SAT_SRC].[iInvoiceDocProfileID] AS [iInvoiceDocProfileID]
			, [SAT_SRC].[iSOInvoiceDocProfileID] AS [iSOInvoiceDocProfileID]
			, [SAT_SRC].[iCreditNoteDocProfileID] AS [iCreditNoteDocProfileID]
			, [SAT_SRC].[iJCInvoiceDocProfileID] AS [iJCInvoiceDocProfileID]
			, [SAT_SRC].[CliClass_iBranchID] AS [CliClass_iBranchID]
			, [SAT_SRC].[CliClass_dCreatedDate] AS [CliClass_dCreatedDate]
			, [SAT_SRC].[CliClass_dModifiedDate] AS [CliClass_dModifiedDate]
			, [SAT_SRC].[CliClass_iCreatedBranchID] AS [CliClass_iCreatedBranchID]
			, [SAT_SRC].[CliClass_iModifiedBranchID] AS [CliClass_iModifiedBranchID]
			, [SAT_SRC].[CliClass_iCreatedAgentID] AS [CliClass_iCreatedAgentID]
			, [SAT_SRC].[CliClass_iModifiedAgentID] AS [CliClass_iModifiedAgentID]
			, [SAT_SRC].[CliClass_iChangeSetID] AS [CliClass_iChangeSetID]
			, [SAT_SRC].[CliClass_Checksum] AS [CliClass_Checksum]
		FROM [raw].[SAT_CSG_1_FOODS_ClientClass] [SAT_SRC]
		INNER JOIN [DIST_STG] ON  [SAT_SRC].[HK_ClientClass] = [DIST_STG].[HK_ClientClass]
		WHERE  [SAT_SRC].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	INSERT INTO [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_ClientClass](
		 [HK_ClientClass]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[DATATYPE]
		,[SRC]
		,[EQUAL]
		,[HASHDIFF]
		,[ISDELETED]
		,[IdCliClass]
		,[Code]
		,[Description]
		,[DiscMtrxRow]
		,[dGroupTimeStamp]
		,[iAccountsIDControlAcc]
		,[iAccountsIDProfitAcc]
		,[iAccountsIDLossAcc]
		,[iTaxControlAccID]
		,[iRevProfitAcc]
		,[iRevLossAcc]
		,[iProvForRevAcc]
		,[iInvoiceDocProfileID]
		,[iSOInvoiceDocProfileID]
		,[iCreditNoteDocProfileID]
		,[iJCInvoiceDocProfileID]
		,[CliClass_iBranchID]
		,[CliClass_dCreatedDate]
		,[CliClass_dModifiedDate]
		,[CliClass_iCreatedBranchID]
		,[CliClass_iModifiedBranchID]
		,[CliClass_iCreatedAgentID]
		,[CliClass_iModifiedAgentID]
		,[CliClass_iChangeSetID]
		,[CliClass_Checksum]
	)
	SELECT
		  [TEMP_TABLE_SET].[HK_ClientClass] AS [HK_ClientClass]
		, [TEMP_TABLE_SET].[LOADDT] AS [LOADDT]
		, [TEMP_TABLE_SET].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [TEMP_TABLE_SET].[LOADENDDT] AS [LOADENDDT]
		, [TEMP_TABLE_SET].[DATATYPE] AS [DATATYPE]
		, [TEMP_TABLE_SET].[SRC] AS [SRC]
		, CASE WHEN [TEMP_TABLE_SET].[SRC] = 'STG' AND CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HASHDIFF]  AS VARCHAR) = LAG( CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HASHDIFF]  AS VARCHAR),1)
			OVER(PARTITION BY [TEMP_TABLE_SET].[HK_ClientClass] ORDER BY [TEMP_TABLE_SET].[LOADDT],
			[TEMP_TABLE_SET].[ORIGIN_ID])THEN 1 ELSE 0 END AS [EQUAL]
		, [TEMP_TABLE_SET].[HASHDIFF] AS [HASHDIFF]
		, [TEMP_TABLE_SET].[ISDELETED] AS [ISDELETED]
		, [TEMP_TABLE_SET].[IdCliClass] AS [IdCliClass]
		, [TEMP_TABLE_SET].[Code] AS [Code]
		, [TEMP_TABLE_SET].[Description] AS [Description]
		, [TEMP_TABLE_SET].[DiscMtrxRow] AS [DiscMtrxRow]
		, [TEMP_TABLE_SET].[dGroupTimeStamp] AS [dGroupTimeStamp]
		, [TEMP_TABLE_SET].[iAccountsIDControlAcc] AS [iAccountsIDControlAcc]
		, [TEMP_TABLE_SET].[iAccountsIDProfitAcc] AS [iAccountsIDProfitAcc]
		, [TEMP_TABLE_SET].[iAccountsIDLossAcc] AS [iAccountsIDLossAcc]
		, [TEMP_TABLE_SET].[iTaxControlAccID] AS [iTaxControlAccID]
		, [TEMP_TABLE_SET].[iRevProfitAcc] AS [iRevProfitAcc]
		, [TEMP_TABLE_SET].[iRevLossAcc] AS [iRevLossAcc]
		, [TEMP_TABLE_SET].[iProvForRevAcc] AS [iProvForRevAcc]
		, [TEMP_TABLE_SET].[iInvoiceDocProfileID] AS [iInvoiceDocProfileID]
		, [TEMP_TABLE_SET].[iSOInvoiceDocProfileID] AS [iSOInvoiceDocProfileID]
		, [TEMP_TABLE_SET].[iCreditNoteDocProfileID] AS [iCreditNoteDocProfileID]
		, [TEMP_TABLE_SET].[iJCInvoiceDocProfileID] AS [iJCInvoiceDocProfileID]
		, [TEMP_TABLE_SET].[CliClass_iBranchID] AS [CliClass_iBranchID]
		, [TEMP_TABLE_SET].[CliClass_dCreatedDate] AS [CliClass_dCreatedDate]
		, [TEMP_TABLE_SET].[CliClass_dModifiedDate] AS [CliClass_dModifiedDate]
		, [TEMP_TABLE_SET].[CliClass_iCreatedBranchID] AS [CliClass_iCreatedBranchID]
		, [TEMP_TABLE_SET].[CliClass_iModifiedBranchID] AS [CliClass_iModifiedBranchID]
		, [TEMP_TABLE_SET].[CliClass_iCreatedAgentID] AS [CliClass_iCreatedAgentID]
		, [TEMP_TABLE_SET].[CliClass_iModifiedAgentID] AS [CliClass_iModifiedAgentID]
		, [TEMP_TABLE_SET].[CliClass_iChangeSetID] AS [CliClass_iChangeSetID]
		, [TEMP_TABLE_SET].[CliClass_Checksum] AS [CliClass_Checksum]
	FROM [TEMP_TABLE_SET]
	;
END;


BEGIN -- SAT_INUR_TGT

	INSERT INTO [raw].[SAT_CSG_1_FOODS_ClientClass](
		 [HK_ClientClass]
		,[LOADDT]
		,[LOADENDDT]
		,[LOAD_CYCLE_ID]
		,[ISDELETED]
		,[HASHDIFF]
		,[IdCliClass]
		,[Code]
		,[Description]
		,[DiscMtrxRow]
		,[dGroupTimeStamp]
		,[iAccountsIDControlAcc]
		,[iAccountsIDProfitAcc]
		,[iAccountsIDLossAcc]
		,[iTaxControlAccID]
		,[iRevProfitAcc]
		,[iRevLossAcc]
		,[iProvForRevAcc]
		,[iInvoiceDocProfileID]
		,[iSOInvoiceDocProfileID]
		,[iCreditNoteDocProfileID]
		,[iJCInvoiceDocProfileID]
		,[CliClass_iBranchID]
		,[CliClass_dCreatedDate]
		,[CliClass_dModifiedDate]
		,[CliClass_iCreatedBranchID]
		,[CliClass_iModifiedBranchID]
		,[CliClass_iCreatedAgentID]
		,[CliClass_iModifiedAgentID]
		,[CliClass_iChangeSetID]
		,[CliClass_Checksum]
	)
	SELECT
		  [SAT_TEMP_SRC_INUR].[HK_ClientClass] AS [HK_ClientClass]
		, [SAT_TEMP_SRC_INUR].[LOADDT] AS [LOADDT]
		, [SAT_TEMP_SRC_INUR].[LOADENDDT] AS [LOADENDDT]
		, [SAT_TEMP_SRC_INUR].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [SAT_TEMP_SRC_INUR].[ISDELETED] AS [ISDELETED]
		, [SAT_TEMP_SRC_INUR].[HASHDIFF] AS [HASHDIFF]
		, [SAT_TEMP_SRC_INUR].[IdCliClass] AS [IdCliClass]
		, [SAT_TEMP_SRC_INUR].[Code] AS [Code]
		, [SAT_TEMP_SRC_INUR].[Description] AS [Description]
		, [SAT_TEMP_SRC_INUR].[DiscMtrxRow] AS [DiscMtrxRow]
		, [SAT_TEMP_SRC_INUR].[dGroupTimeStamp] AS [dGroupTimeStamp]
		, [SAT_TEMP_SRC_INUR].[iAccountsIDControlAcc] AS [iAccountsIDControlAcc]
		, [SAT_TEMP_SRC_INUR].[iAccountsIDProfitAcc] AS [iAccountsIDProfitAcc]
		, [SAT_TEMP_SRC_INUR].[iAccountsIDLossAcc] AS [iAccountsIDLossAcc]
		, [SAT_TEMP_SRC_INUR].[iTaxControlAccID] AS [iTaxControlAccID]
		, [SAT_TEMP_SRC_INUR].[iRevProfitAcc] AS [iRevProfitAcc]
		, [SAT_TEMP_SRC_INUR].[iRevLossAcc] AS [iRevLossAcc]
		, [SAT_TEMP_SRC_INUR].[iProvForRevAcc] AS [iProvForRevAcc]
		, [SAT_TEMP_SRC_INUR].[iInvoiceDocProfileID] AS [iInvoiceDocProfileID]
		, [SAT_TEMP_SRC_INUR].[iSOInvoiceDocProfileID] AS [iSOInvoiceDocProfileID]
		, [SAT_TEMP_SRC_INUR].[iCreditNoteDocProfileID] AS [iCreditNoteDocProfileID]
		, [SAT_TEMP_SRC_INUR].[iJCInvoiceDocProfileID] AS [iJCInvoiceDocProfileID]
		, [SAT_TEMP_SRC_INUR].[CliClass_iBranchID] AS [CliClass_iBranchID]
		, [SAT_TEMP_SRC_INUR].[CliClass_dCreatedDate] AS [CliClass_dCreatedDate]
		, [SAT_TEMP_SRC_INUR].[CliClass_dModifiedDate] AS [CliClass_dModifiedDate]
		, [SAT_TEMP_SRC_INUR].[CliClass_iCreatedBranchID] AS [CliClass_iCreatedBranchID]
		, [SAT_TEMP_SRC_INUR].[CliClass_iModifiedBranchID] AS [CliClass_iModifiedBranchID]
		, [SAT_TEMP_SRC_INUR].[CliClass_iCreatedAgentID] AS [CliClass_iCreatedAgentID]
		, [SAT_TEMP_SRC_INUR].[CliClass_iModifiedAgentID] AS [CliClass_iModifiedAgentID]
		, [SAT_TEMP_SRC_INUR].[CliClass_iChangeSetID] AS [CliClass_iChangeSetID]
		, [SAT_TEMP_SRC_INUR].[CliClass_Checksum] AS [CliClass_Checksum]
	FROM [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_ClientClass] [SAT_TEMP_SRC_INUR]
	WHERE  [SAT_TEMP_SRC_INUR].[SRC] = 'STG' AND [SAT_TEMP_SRC_INUR].[EQUAL] = 0
	;
END;


BEGIN -- SAT_ED_TGT

	WITH [CALC_LOAD_END_DATE] AS 
	( 
		SELECT
			  [SAT_TEMP_SRC_US].[HK_ClientClass] AS [HK_ClientClass]
			, [SAT_TEMP_SRC_US].[LOADDT] AS [LOADDT]
			, COALESCE(LEAD([SAT_TEMP_SRC_US].[LOADDT],1)
				OVER(PARTITION BY [SAT_TEMP_SRC_US].[HK_ClientClass] ORDER BY [SAT_TEMP_SRC_US].[LOADDT]), CONVERT(DATETIME2,
				'31/12/2999' , 103)) AS [LOADENDDT]
		FROM [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_ClientClass] [SAT_TEMP_SRC_US]
		WHERE  [SAT_TEMP_SRC_US].[EQUAL] = 0
	)
	, [FILTER_LOAD_END_DATE] AS 
	( 
		SELECT
			  [CALC_LOAD_END_DATE].[HK_ClientClass] AS [HK_ClientClass]
			, [CALC_LOAD_END_DATE].[LOADDT] AS [LOADDT]
			, [CALC_LOAD_END_DATE].[LOADENDDT] AS [LOADENDDT]
		FROM [CALC_LOAD_END_DATE]
		WHERE  [CALC_LOAD_END_DATE].[LOADENDDT] != CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	UPDATE [SAT_ED_TGT]
	SET 
		 [LOADENDDT] =  [FILTER_LOAD_END_DATE].[LOADENDDT]
	FROM [FILTER_LOAD_END_DATE]
	JOIN [raw].[SAT_CSG_1_FOODS_ClientClass] [SAT_ED_TGT] ON 1 = 1 
	WHERE [SAT_ED_TGT].[HK_ClientClass] =  [FILTER_LOAD_END_DATE].[HK_ClientClass]
	  AND [SAT_ED_TGT].[LOADDT] =  [FILTER_LOAD_END_DATE].[LOADDT]
	;
END;


END;

 
 


GO
