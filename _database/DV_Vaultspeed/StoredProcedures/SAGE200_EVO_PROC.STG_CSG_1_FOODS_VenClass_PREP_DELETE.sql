SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_VenClass_PREP_DELETE AS 
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
BEGIN -- STG_PREP_DEL_TGT

	INSERT INTO [CSG_1_FOODS_stage].[VenClass](
		 [HK_VendorClass]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[LOAD_CYCLE_ID]
		,[LOADDT]
		,[idVenClass]
		,[Code]
		,[BK_VendorClass]
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
		  [HUB_SRC].[HK_VendorClass] AS [HK_VendorClass]
		, '-' AS [CHANGE_TYPE]
		, 'SRC' AS [DATATYPE]
		, [LCI_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [LCI_SRC].[LOADDT] AS [LOADDT]
		, [SAT_SRC1].[idVenClass] AS [idVenClass]
		, [SAT_SRC1].[Code] AS [Code]
		, [HUB_SRC].[BK_VendorClass] AS [BK_VendorClass]
		, [SAT_SRC1].[Description] AS [Description]
		, [SAT_SRC1].[DiscMtrxRow] AS [DiscMtrxRow]
		, [SAT_SRC1].[dGroupTimeStamp] AS [dGroupTimeStamp]
		, [SAT_SRC1].[iAccountsIDControlAcc] AS [iAccountsIDControlAcc]
		, [SAT_SRC1].[iAccountsIDProfitAcc] AS [iAccountsIDProfitAcc]
		, [SAT_SRC1].[iAccountsIDLossAcc] AS [iAccountsIDLossAcc]
		, [SAT_SRC1].[iTaxControlAccID] AS [iTaxControlAccID]
		, [SAT_SRC1].[iRevProfitAcc] AS [iRevProfitAcc]
		, [SAT_SRC1].[iRevLossAcc] AS [iRevLossAcc]
		, [SAT_SRC1].[iProvForRevAcc] AS [iProvForRevAcc]
		, [SAT_SRC1].[iInvoiceDocProfileID] AS [iInvoiceDocProfileID]
		, [SAT_SRC1].[iSOInvoiceDocProfileID] AS [iSOInvoiceDocProfileID]
		, [SAT_SRC1].[iCreditNoteDocProfileID] AS [iCreditNoteDocProfileID]
		, [SAT_SRC1].[iJCInvoiceDocProfileID] AS [iJCInvoiceDocProfileID]
		, [SAT_SRC1].[VenClass_iBranchID] AS [VenClass_iBranchID]
		, [SAT_SRC1].[VenClass_dCreatedDate] AS [VenClass_dCreatedDate]
		, [SAT_SRC1].[VenClass_dModifiedDate] AS [VenClass_dModifiedDate]
		, [SAT_SRC1].[VenClass_iCreatedBranchID] AS [VenClass_iCreatedBranchID]
		, [SAT_SRC1].[VenClass_iModifiedBranchID] AS [VenClass_iModifiedBranchID]
		, [SAT_SRC1].[VenClass_iCreatedAgentID] AS [VenClass_iCreatedAgentID]
		, [SAT_SRC1].[VenClass_iModifiedAgentID] AS [VenClass_iModifiedAgentID]
		, [SAT_SRC1].[VenClass_iChangeSetID] AS [VenClass_iChangeSetID]
		, [SAT_SRC1].[VenClass_Checksum] AS [VenClass_Checksum]
	FROM [raw].[HUB_VendorClass] [HUB_SRC]
	INNER JOIN [raw].[SAT_CSG_1_FOODS_VendorClass] [SAT_SRC1] ON  [SAT_SRC1].[HK_VendorClass] = [HUB_SRC].[HK_VendorClass] AND [SAT_SRC1].[LOADENDDT] = CONVERT(DATETIME2,
		'31/12/2999' , 103) AND [SAT_SRC1].[ISDELETED] = 'N'
	LEFT OUTER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [HUB_SRC].[LOAD_CYCLE_ID] = CONVERT(int, [MEX_SRC].[LOAD_CYCLE_ID] )
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	LEFT OUTER JOIN [CSG_1_FOODS_stage].[VenClass] [STG_SRC] ON  [HUB_SRC].[HK_VendorClass] = [STG_SRC].[HK_VendorClass] AND [HUB_SRC].[SOURCE_SYSTEM] =
		[STG_SRC].[SOURCE_SYSTEM]
	WHERE  [STG_SRC].[LOAD_CYCLE_ID] IS NULL AND [MEX_SRC].[LOAD_CYCLE_ID] IS NULL
	;
END;


END;

 
 


GO
