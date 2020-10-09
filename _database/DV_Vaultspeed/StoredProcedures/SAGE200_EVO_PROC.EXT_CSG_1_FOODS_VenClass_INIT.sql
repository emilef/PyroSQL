SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].EXT_CSG_1_FOODS_VenClass_INIT AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_ext].[VenClass];

	WITH [PREP_EXCEP] AS 
	( 
		SELECT 
			  '+' AS [CHANGE_TYPE]
			, 'SRC' AS [DATATYPE]
			, NULL AS [LOAD_CYCLE_ID]
			, COALESCE( CONVERT(INT, REPLACE([INI_SRC].[idVenClass],',','') , 1), CONVERT(INT,
				[MEX_INR_SRC].[KEY_ATTRIBUTE_INT] , 1)) AS [idVenClass]
			, [INI_SRC].[Code]  AS [Code]
			, [INI_SRC].[Description]  AS [Description]
			, CONVERT(INT, [INI_SRC].[DiscMtrxRow] , 1) AS [DiscMtrxRow]
			, CONVERT(DATETIME2, [INI_SRC].[dGroupTimeStamp] , 103) AS [dGroupTimeStamp]
			, CONVERT(INT, [INI_SRC].[iAccountsIDControlAcc] , 1) AS [iAccountsIDControlAcc]
			, CONVERT(INT, [INI_SRC].[iAccountsIDProfitAcc] , 1) AS [iAccountsIDProfitAcc]
			, CONVERT(INT, [INI_SRC].[iAccountsIDLossAcc] , 1) AS [iAccountsIDLossAcc]
			, CONVERT(INT, [INI_SRC].[iTaxControlAccID] , 1) AS [iTaxControlAccID]
			, CONVERT(INT, [INI_SRC].[iRevProfitAcc] , 1) AS [iRevProfitAcc]
			, CONVERT(INT, [INI_SRC].[iRevLossAcc] , 1) AS [iRevLossAcc]
			, CONVERT(INT, [INI_SRC].[iProvForRevAcc] , 1) AS [iProvForRevAcc]
			, CONVERT(INT, [INI_SRC].[iInvoiceDocProfileID] , 1) AS [iInvoiceDocProfileID]
			, CONVERT(INT, [INI_SRC].[iSOInvoiceDocProfileID] , 1) AS [iSOInvoiceDocProfileID]
			, CONVERT(INT, [INI_SRC].[iCreditNoteDocProfileID] , 1) AS [iCreditNoteDocProfileID]
			, CONVERT(INT, [INI_SRC].[iJCInvoiceDocProfileID] , 1) AS [iJCInvoiceDocProfileID]
			, CONVERT(INT, [INI_SRC].[VenClass_iBranchID] , 1) AS [VenClass_iBranchID]
			, CONVERT(DATETIME2, [INI_SRC].[VenClass_dCreatedDate] , 103) AS [VenClass_dCreatedDate]
			, CONVERT(DATETIME2, [INI_SRC].[VenClass_dModifiedDate] , 103) AS [VenClass_dModifiedDate]
			, CONVERT(INT, [INI_SRC].[VenClass_iCreatedBranchID] , 1) AS [VenClass_iCreatedBranchID]
			, CONVERT(INT, [INI_SRC].[VenClass_iModifiedBranchID] , 1) AS [VenClass_iModifiedBranchID]
			, CONVERT(INT, [INI_SRC].[VenClass_iCreatedAgentID] , 1) AS [VenClass_iCreatedAgentID]
			, CONVERT(INT, [INI_SRC].[VenClass_iModifiedAgentID] , 1) AS [VenClass_iModifiedAgentID]
			, CONVERT(INT, [INI_SRC].[VenClass_iChangeSetID] , 1) AS [VenClass_iChangeSetID]
			, CAST([INI_SRC].[VenClass_Checksum]  AS BINARY) AS [VenClass_Checksum]
		FROM [CSG_1_FOODS].[VenClass] [INI_SRC]
		INNER JOIN [dc].[EXECEPTION] [MEX_INR_SRC] ON  [MEX_INR_SRC].[DATATYPE] = '#'
		UNION 
		SELECT 
			  '+' AS [CHANGE_TYPE]
			, [MEX_EXT_SRC].[DATATYPE] AS [DATATYPE]
			, CONVERT(int, [MEX_EXT_SRC].[LOAD_CYCLE_ID] ) AS [LOAD_CYCLE_ID]
			, CONVERT(INT, [MEX_EXT_SRC].[KEY_ATTRIBUTE_INT] , 1) AS [idVenClass]
			, [MEX_EXT_SRC].[KEY_ATTRIBUTE_VARCHAR]  AS [Code]
			, [MEX_EXT_SRC].[ATTRIBUTE_VARCHAR]  AS [Description]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [DiscMtrxRow]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[ATTRIBUTE_DATETIME2] , 103) AS [dGroupTimeStamp]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iAccountsIDControlAcc]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iAccountsIDProfitAcc]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iAccountsIDLossAcc]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iTaxControlAccID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iRevProfitAcc]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iRevLossAcc]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iProvForRevAcc]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iInvoiceDocProfileID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iSOInvoiceDocProfileID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iCreditNoteDocProfileID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iJCInvoiceDocProfileID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [VenClass_iBranchID]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[ATTRIBUTE_DATETIME2] , 103) AS [VenClass_dCreatedDate]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[ATTRIBUTE_DATETIME2] , 103) AS [VenClass_dModifiedDate]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [VenClass_iCreatedBranchID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [VenClass_iModifiedBranchID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [VenClass_iCreatedAgentID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [VenClass_iModifiedAgentID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [VenClass_iChangeSetID]
			, CAST([MEX_EXT_SRC].[ATTRIBUTE_BINARY]  AS BINARY) AS [VenClass_Checksum]
		FROM [dc].[EXECEPTION] [MEX_EXT_SRC]
	)
	INSERT INTO [CSG_1_FOODS_ext].[VenClass](
		 [LOAD_CYCLE_ID]
		,[LOADDT]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[idVenClass]
		,[BK_Code]
		,[BK_idVenClass]
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
		  COALESCE([PREP_EXCEP].[LOAD_CYCLE_ID],[LCI_SRC].[LOAD_CYCLE_ID]) AS [LOAD_CYCLE_ID]
		, [LCI_SRC].[LOADDT] AS [LOADDT]
		, [PREP_EXCEP].[CHANGE_TYPE] AS [CHANGE_TYPE]
		, [PREP_EXCEP].[DATATYPE] AS [DATATYPE]
		, [PREP_EXCEP].[idVenClass] AS [idVenClass]
		, COALESCE(UPPER(REPLACE([PREP_EXCEP].[Code],'|','\' + '|')),[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR]) AS [BK_Code]
		, COALESCE(UPPER( CONVERT(VARCHAR, [PREP_EXCEP].[idVenClass] , 1)),[MEX_SRC].[KEY_ATTRIBUTE_INT]) AS [BK_idVenClass]
		, [PREP_EXCEP].[Code] AS [Code]
		, [PREP_EXCEP].[Description] AS [Description]
		, [PREP_EXCEP].[DiscMtrxRow] AS [DiscMtrxRow]
		, [PREP_EXCEP].[dGroupTimeStamp] AS [dGroupTimeStamp]
		, [PREP_EXCEP].[iAccountsIDControlAcc] AS [iAccountsIDControlAcc]
		, [PREP_EXCEP].[iAccountsIDProfitAcc] AS [iAccountsIDProfitAcc]
		, [PREP_EXCEP].[iAccountsIDLossAcc] AS [iAccountsIDLossAcc]
		, [PREP_EXCEP].[iTaxControlAccID] AS [iTaxControlAccID]
		, [PREP_EXCEP].[iRevProfitAcc] AS [iRevProfitAcc]
		, [PREP_EXCEP].[iRevLossAcc] AS [iRevLossAcc]
		, [PREP_EXCEP].[iProvForRevAcc] AS [iProvForRevAcc]
		, [PREP_EXCEP].[iInvoiceDocProfileID] AS [iInvoiceDocProfileID]
		, [PREP_EXCEP].[iSOInvoiceDocProfileID] AS [iSOInvoiceDocProfileID]
		, [PREP_EXCEP].[iCreditNoteDocProfileID] AS [iCreditNoteDocProfileID]
		, [PREP_EXCEP].[iJCInvoiceDocProfileID] AS [iJCInvoiceDocProfileID]
		, [PREP_EXCEP].[VenClass_iBranchID] AS [VenClass_iBranchID]
		, [PREP_EXCEP].[VenClass_dCreatedDate] AS [VenClass_dCreatedDate]
		, [PREP_EXCEP].[VenClass_dModifiedDate] AS [VenClass_dModifiedDate]
		, [PREP_EXCEP].[VenClass_iCreatedBranchID] AS [VenClass_iCreatedBranchID]
		, [PREP_EXCEP].[VenClass_iModifiedBranchID] AS [VenClass_iModifiedBranchID]
		, [PREP_EXCEP].[VenClass_iCreatedAgentID] AS [VenClass_iCreatedAgentID]
		, [PREP_EXCEP].[VenClass_iModifiedAgentID] AS [VenClass_iModifiedAgentID]
		, [PREP_EXCEP].[VenClass_iChangeSetID] AS [VenClass_iChangeSetID]
		, [PREP_EXCEP].[VenClass_Checksum] AS [VenClass_Checksum]
	FROM [PREP_EXCEP]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  1 = 1
	WHERE  [MEX_SRC].[DATATYPE] = '#'
	;
END;


END;

 
 


GO
