SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].[SRC_CSG_1_FOODS_VenClass_TDFT_INCR] AS 
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

	TRUNCATE TABLE [dv_CSG_1_FOODS].[VenClass];

	WITH [DELTA_VIEW] AS 
	( 
		SELECT 
			  CAST('SRC'  AS VARCHAR) AS [DATATYPE]
			, [CDC_SRC].[idVenClass] AS [idVenClass]
			, [CDC_SRC].[Code] AS [Code]
			, [CDC_SRC].[Description] AS [Description]
			, [CDC_SRC].[DiscMtrxRow] AS [DiscMtrxRow]
			, [CDC_SRC].[dGroupTimeStamp] AS [dGroupTimeStamp]
			, [CDC_SRC].[iAccountsIDControlAcc] AS [iAccountsIDControlAcc]
			, [CDC_SRC].[iAccountsIDProfitAcc] AS [iAccountsIDProfitAcc]
			, [CDC_SRC].[iAccountsIDLossAcc] AS [iAccountsIDLossAcc]
			, [CDC_SRC].[iTaxControlAccID] AS [iTaxControlAccID]
			, [CDC_SRC].[iRevProfitAcc] AS [iRevProfitAcc]
			, [CDC_SRC].[iRevLossAcc] AS [iRevLossAcc]
			, [CDC_SRC].[iProvForRevAcc] AS [iProvForRevAcc]
			, [CDC_SRC].[iInvoiceDocProfileID] AS [iInvoiceDocProfileID]
			, [CDC_SRC].[iSOInvoiceDocProfileID] AS [iSOInvoiceDocProfileID]
			, [CDC_SRC].[iCreditNoteDocProfileID] AS [iCreditNoteDocProfileID]
			, [CDC_SRC].[iJCInvoiceDocProfileID] AS [iJCInvoiceDocProfileID]
			, [CDC_SRC].[VenClass_iBranchID] AS [VenClass_iBranchID]
			, [CDC_SRC].[VenClass_dCreatedDate] AS [VenClass_dCreatedDate]
			, [CDC_SRC].[VenClass_dModifiedDate] AS [VenClass_dModifiedDate]
			, [CDC_SRC].[VenClass_iCreatedBranchID] AS [VenClass_iCreatedBranchID]
			, [CDC_SRC].[VenClass_iModifiedBranchID] AS [VenClass_iModifiedBranchID]
			, [CDC_SRC].[VenClass_iCreatedAgentID] AS [VenClass_iCreatedAgentID]
			, [CDC_SRC].[VenClass_iModifiedAgentID] AS [VenClass_iModifiedAgentID]
			, [CDC_SRC].[VenClass_iChangeSetID] AS [VenClass_iChangeSetID]
			, [CDC_SRC].[VenClass_Checksum] AS [VenClass_Checksum]
		FROM [CSG_1_FOODS].[VenClass] [CDC_SRC]
	)
	, [PREPJOINBK] AS 
	( 
		SELECT
			  [DELTA_VIEW].[DATATYPE] AS [DATATYPE]
			, COALESCE(REPLACE([DELTA_VIEW].[idVenClass],',',''),[MEX_BK_SRC].[KEY_ATTRIBUTE_INT]) AS [idVenClass]
			, [DELTA_VIEW].[Code] AS [Code]
			, [DELTA_VIEW].[Description] AS [Description]
			, REPLACE([DELTA_VIEW].[DiscMtrxRow],',','') AS [DiscMtrxRow]
			, [DELTA_VIEW].[dGroupTimeStamp] AS [dGroupTimeStamp]
			, REPLACE([DELTA_VIEW].[iAccountsIDControlAcc],',','') AS [iAccountsIDControlAcc]
			, REPLACE([DELTA_VIEW].[iAccountsIDProfitAcc],',','') AS [iAccountsIDProfitAcc]
			, REPLACE([DELTA_VIEW].[iAccountsIDLossAcc],',','') AS [iAccountsIDLossAcc]
			, REPLACE([DELTA_VIEW].[iTaxControlAccID],',','') AS [iTaxControlAccID]
			, REPLACE([DELTA_VIEW].[iRevProfitAcc],',','') AS [iRevProfitAcc]
			, REPLACE([DELTA_VIEW].[iRevLossAcc],',','') AS [iRevLossAcc]
			, REPLACE([DELTA_VIEW].[iProvForRevAcc],',','') AS [iProvForRevAcc]
			, REPLACE([DELTA_VIEW].[iInvoiceDocProfileID],',','') AS [iInvoiceDocProfileID]
			, REPLACE([DELTA_VIEW].[iSOInvoiceDocProfileID],',','') AS [iSOInvoiceDocProfileID]
			, REPLACE([DELTA_VIEW].[iCreditNoteDocProfileID],',','') AS [iCreditNoteDocProfileID]
			, REPLACE([DELTA_VIEW].[iJCInvoiceDocProfileID],',','') AS [iJCInvoiceDocProfileID]
			, REPLACE([DELTA_VIEW].[VenClass_iBranchID],',','') AS [VenClass_iBranchID]
			, [DELTA_VIEW].[VenClass_dCreatedDate] AS [VenClass_dCreatedDate]
			, [DELTA_VIEW].[VenClass_dModifiedDate] AS [VenClass_dModifiedDate]
			, REPLACE([DELTA_VIEW].[VenClass_iCreatedBranchID],',','') AS [VenClass_iCreatedBranchID]
			, REPLACE([DELTA_VIEW].[VenClass_iModifiedBranchID],',','') AS [VenClass_iModifiedBranchID]
			, REPLACE([DELTA_VIEW].[VenClass_iCreatedAgentID],',','') AS [VenClass_iCreatedAgentID]
			, REPLACE([DELTA_VIEW].[VenClass_iModifiedAgentID],',','') AS [VenClass_iModifiedAgentID]
			, REPLACE([DELTA_VIEW].[VenClass_iChangeSetID],',','') AS [VenClass_iChangeSetID]
			, [DELTA_VIEW].[VenClass_Checksum] AS [VenClass_Checksum]
		FROM [DELTA_VIEW]
		INNER JOIN [dc].[EXECEPTION] [MEX_BK_SRC] ON  1 = 1
		WHERE  [MEX_BK_SRC].[DATATYPE] = '#'
	)
	INSERT INTO [dv_CSG_1_FOODS].[VenClass](
		 [DATATYPE]
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
		  [PREPJOINBK].[DATATYPE] AS [DATATYPE]
		, [PREPJOINBK].[idVenClass] AS [idVenClass]
		, [PREPJOINBK].[Code] AS [Code]
		, [PREPJOINBK].[Description] AS [Description]
		, [PREPJOINBK].[DiscMtrxRow] AS [DiscMtrxRow]
		, [PREPJOINBK].[dGroupTimeStamp] AS [dGroupTimeStamp]
		, [PREPJOINBK].[iAccountsIDControlAcc] AS [iAccountsIDControlAcc]
		, [PREPJOINBK].[iAccountsIDProfitAcc] AS [iAccountsIDProfitAcc]
		, [PREPJOINBK].[iAccountsIDLossAcc] AS [iAccountsIDLossAcc]
		, [PREPJOINBK].[iTaxControlAccID] AS [iTaxControlAccID]
		, [PREPJOINBK].[iRevProfitAcc] AS [iRevProfitAcc]
		, [PREPJOINBK].[iRevLossAcc] AS [iRevLossAcc]
		, [PREPJOINBK].[iProvForRevAcc] AS [iProvForRevAcc]
		, [PREPJOINBK].[iInvoiceDocProfileID] AS [iInvoiceDocProfileID]
		, [PREPJOINBK].[iSOInvoiceDocProfileID] AS [iSOInvoiceDocProfileID]
		, [PREPJOINBK].[iCreditNoteDocProfileID] AS [iCreditNoteDocProfileID]
		, [PREPJOINBK].[iJCInvoiceDocProfileID] AS [iJCInvoiceDocProfileID]
		, [PREPJOINBK].[VenClass_iBranchID] AS [VenClass_iBranchID]
		, [PREPJOINBK].[VenClass_dCreatedDate] AS [VenClass_dCreatedDate]
		, [PREPJOINBK].[VenClass_dModifiedDate] AS [VenClass_dModifiedDate]
		, [PREPJOINBK].[VenClass_iCreatedBranchID] AS [VenClass_iCreatedBranchID]
		, [PREPJOINBK].[VenClass_iModifiedBranchID] AS [VenClass_iModifiedBranchID]
		, [PREPJOINBK].[VenClass_iCreatedAgentID] AS [VenClass_iCreatedAgentID]
		, [PREPJOINBK].[VenClass_iModifiedAgentID] AS [VenClass_iModifiedAgentID]
		, [PREPJOINBK].[VenClass_iChangeSetID] AS [VenClass_iChangeSetID]
		, [PREPJOINBK].[VenClass_Checksum] AS [VenClass_Checksum]
	FROM [PREPJOINBK]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	LEFT OUTER JOIN [raw].[SAT_CSG_1_FOODS_VendorClass] [SAT_SRC1] ON  CONVERT(INT, [PREPJOINBK].[idVenClass] , 1) = [SAT_SRC1].[idVenClass] AND [SAT_SRC1].[LOAD_CYCLE_ID] =
		[LCI_SRC].[LOAD_CYCLE_ID]
	WHERE  [SAT_SRC1].[HK_VendorClass] IS NULL
	;
END;


END;

 
 


GO
