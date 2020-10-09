SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].SAT_CSG_1_FOODS_VendorClass_INIT AS 
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

	DELETE FROM [raw].[SAT_CSG_1_FOODS_VendorClass] 
	WHERE  1 = 1
	;
END;


BEGIN -- SAT_TGT

	WITH [STG_SRC] AS 
	( 
		SELECT
			  [STG_INR_SRC].[HK_VendorClass] AS [HK_VendorClass]
			, [STG_INR_SRC].[LOADDT] AS [LOADDT]
			, [STG_INR_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1',
				COALESCE(REPLACE(REPLACE(RTRIM(REPLACE(REPLACE( REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Description] ),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[DiscMtrxRow] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[dGroupTimeStamp] , 103)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iAccountsIDControlAcc] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iAccountsIDProfitAcc] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iAccountsIDLossAcc] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iTaxControlAccID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iRevProfitAcc] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iRevLossAcc] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iProvForRevAcc] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iInvoiceDocProfileID] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iSOInvoiceDocProfileID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iCreditNoteDocProfileID] ,
				1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[iJCInvoiceDocProfileID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[VenClass_iBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[VenClass_dCreatedDate] , 103)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[VenClass_dModifiedDate] , 103)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[VenClass_iCreatedBranchID] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[VenClass_iModifiedBranchID] ,
				1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[VenClass_iCreatedAgentID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[VenClass_iModifiedAgentID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[VenClass_iChangeSetID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CAST([STG_INR_SRC].[VenClass_Checksum]  AS VARCHAR)),'#'),'|','\' + '|')+
				'|',' ','#' + '|'),'|' + '#',' ')),' ','|' + '#'),'#' + '|',' '),'#')),2)) AS [HASHDIFF]
			, 'N'  AS [ISDELETED]
			, [STG_INR_SRC].[idVenClass] AS [idVenClass]
			, [STG_INR_SRC].[Code] AS [Code]
			, [STG_INR_SRC].[Description] AS [Description]
			, [STG_INR_SRC].[DiscMtrxRow] AS [DiscMtrxRow]
			, [STG_INR_SRC].[dGroupTimeStamp] AS [dGroupTimeStamp]
			, [STG_INR_SRC].[iAccountsIDControlAcc] AS [iAccountsIDControlAcc]
			, [STG_INR_SRC].[iAccountsIDProfitAcc] AS [iAccountsIDProfitAcc]
			, [STG_INR_SRC].[iAccountsIDLossAcc] AS [iAccountsIDLossAcc]
			, [STG_INR_SRC].[iTaxControlAccID] AS [iTaxControlAccID]
			, [STG_INR_SRC].[iRevProfitAcc] AS [iRevProfitAcc]
			, [STG_INR_SRC].[iRevLossAcc] AS [iRevLossAcc]
			, [STG_INR_SRC].[iProvForRevAcc] AS [iProvForRevAcc]
			, [STG_INR_SRC].[iInvoiceDocProfileID] AS [iInvoiceDocProfileID]
			, [STG_INR_SRC].[iSOInvoiceDocProfileID] AS [iSOInvoiceDocProfileID]
			, [STG_INR_SRC].[iCreditNoteDocProfileID] AS [iCreditNoteDocProfileID]
			, [STG_INR_SRC].[iJCInvoiceDocProfileID] AS [iJCInvoiceDocProfileID]
			, [STG_INR_SRC].[VenClass_iBranchID] AS [VenClass_iBranchID]
			, [STG_INR_SRC].[VenClass_dCreatedDate] AS [VenClass_dCreatedDate]
			, [STG_INR_SRC].[VenClass_dModifiedDate] AS [VenClass_dModifiedDate]
			, [STG_INR_SRC].[VenClass_iCreatedBranchID] AS [VenClass_iCreatedBranchID]
			, [STG_INR_SRC].[VenClass_iModifiedBranchID] AS [VenClass_iModifiedBranchID]
			, [STG_INR_SRC].[VenClass_iCreatedAgentID] AS [VenClass_iCreatedAgentID]
			, [STG_INR_SRC].[VenClass_iModifiedAgentID] AS [VenClass_iModifiedAgentID]
			, [STG_INR_SRC].[VenClass_iChangeSetID] AS [VenClass_iChangeSetID]
			, [STG_INR_SRC].[VenClass_Checksum] AS [VenClass_Checksum]
			, ROW_NUMBER()OVER(PARTITION BY [STG_INR_SRC].[HK_VendorClass] ORDER BY [STG_INR_SRC].[LOADDT]) AS [DUMMY]
		FROM [CSG_1_FOODS_stage].[VenClass] [STG_INR_SRC]
	)
	INSERT INTO [raw].[SAT_CSG_1_FOODS_VendorClass](
		 [HK_VendorClass]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[HASHDIFF]
		,[ISDELETED]
		,[idVenClass]
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
		,[VenClass_iBranchID]
		,[VenClass_dCreatedDate]
		,[VenClass_dModifiedDate]
		,[VenClass_iCreatedBranchID]
		,[VenClass_iModifiedBranchID]
		,[VenClass_iCreatedAgentID]
		,[VenClass_iModifiedAgentID]
		,[VenClass_iChangeSetID]
		,[VenClass_Checksum]
	)
	SELECT
		  [STG_SRC].[HK_VendorClass] AS [HK_VendorClass]
		, [STG_SRC].[LOADDT] AS [LOADDT]
		, [STG_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [STG_SRC].[LOADENDDT] AS [LOADENDDT]
		, [STG_SRC].[HASHDIFF] AS [HASHDIFF]
		, [STG_SRC].[ISDELETED] AS [ISDELETED]
		, [STG_SRC].[idVenClass] AS [idVenClass]
		, [STG_SRC].[Code] AS [Code]
		, [STG_SRC].[Description] AS [Description]
		, [STG_SRC].[DiscMtrxRow] AS [DiscMtrxRow]
		, [STG_SRC].[dGroupTimeStamp] AS [dGroupTimeStamp]
		, [STG_SRC].[iAccountsIDControlAcc] AS [iAccountsIDControlAcc]
		, [STG_SRC].[iAccountsIDProfitAcc] AS [iAccountsIDProfitAcc]
		, [STG_SRC].[iAccountsIDLossAcc] AS [iAccountsIDLossAcc]
		, [STG_SRC].[iTaxControlAccID] AS [iTaxControlAccID]
		, [STG_SRC].[iRevProfitAcc] AS [iRevProfitAcc]
		, [STG_SRC].[iRevLossAcc] AS [iRevLossAcc]
		, [STG_SRC].[iProvForRevAcc] AS [iProvForRevAcc]
		, [STG_SRC].[iInvoiceDocProfileID] AS [iInvoiceDocProfileID]
		, [STG_SRC].[iSOInvoiceDocProfileID] AS [iSOInvoiceDocProfileID]
		, [STG_SRC].[iCreditNoteDocProfileID] AS [iCreditNoteDocProfileID]
		, [STG_SRC].[iJCInvoiceDocProfileID] AS [iJCInvoiceDocProfileID]
		, [STG_SRC].[VenClass_iBranchID] AS [VenClass_iBranchID]
		, [STG_SRC].[VenClass_dCreatedDate] AS [VenClass_dCreatedDate]
		, [STG_SRC].[VenClass_dModifiedDate] AS [VenClass_dModifiedDate]
		, [STG_SRC].[VenClass_iCreatedBranchID] AS [VenClass_iCreatedBranchID]
		, [STG_SRC].[VenClass_iModifiedBranchID] AS [VenClass_iModifiedBranchID]
		, [STG_SRC].[VenClass_iCreatedAgentID] AS [VenClass_iCreatedAgentID]
		, [STG_SRC].[VenClass_iModifiedAgentID] AS [VenClass_iModifiedAgentID]
		, [STG_SRC].[VenClass_iChangeSetID] AS [VenClass_iChangeSetID]
		, [STG_SRC].[VenClass_Checksum] AS [VenClass_Checksum]
	FROM [STG_SRC]
	WHERE  [STG_SRC].[DUMMY] = 1
	;
END;


END;

 
 


GO
