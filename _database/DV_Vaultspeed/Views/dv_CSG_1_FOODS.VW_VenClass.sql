SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dv_CSG_1_FOODS].[VW_VenClass] AS 
	SELECT
		  [TDFT_SRC].[DATATYPE] AS [DATATYPE]
		, [TDFT_SRC].[idVenClass] AS [idVenClass]
		, [TDFT_SRC].[Code] AS [Code]
		, [TDFT_SRC].[Description] AS [Description]
		, [TDFT_SRC].[DiscMtrxRow] AS [DiscMtrxRow]
		, [TDFT_SRC].[dGroupTimeStamp] AS [dGroupTimeStamp]
		, [TDFT_SRC].[iAccountsIDControlAcc] AS [iAccountsIDControlAcc]
		, [TDFT_SRC].[iAccountsIDProfitAcc] AS [iAccountsIDProfitAcc]
		, [TDFT_SRC].[iAccountsIDLossAcc] AS [iAccountsIDLossAcc]
		, [TDFT_SRC].[iTaxControlAccID] AS [iTaxControlAccID]
		, [TDFT_SRC].[iRevProfitAcc] AS [iRevProfitAcc]
		, [TDFT_SRC].[iRevLossAcc] AS [iRevLossAcc]
		, [TDFT_SRC].[iProvForRevAcc] AS [iProvForRevAcc]
		, [TDFT_SRC].[iInvoiceDocProfileID] AS [iInvoiceDocProfileID]
		, [TDFT_SRC].[iSOInvoiceDocProfileID] AS [iSOInvoiceDocProfileID]
		, [TDFT_SRC].[iCreditNoteDocProfileID] AS [iCreditNoteDocProfileID]
		, [TDFT_SRC].[iJCInvoiceDocProfileID] AS [iJCInvoiceDocProfileID]
		, [TDFT_SRC].[VenClass_iBranchID] AS [VenClass_iBranchID]
		, [TDFT_SRC].[VenClass_dCreatedDate] AS [VenClass_dCreatedDate]
		, [TDFT_SRC].[VenClass_dModifiedDate] AS [VenClass_dModifiedDate]
		, [TDFT_SRC].[VenClass_iCreatedBranchID] AS [VenClass_iCreatedBranchID]
		, [TDFT_SRC].[VenClass_iModifiedBranchID] AS [VenClass_iModifiedBranchID]
		, [TDFT_SRC].[VenClass_iCreatedAgentID] AS [VenClass_iCreatedAgentID]
		, [TDFT_SRC].[VenClass_iModifiedAgentID] AS [VenClass_iModifiedAgentID]
		, [TDFT_SRC].[VenClass_iChangeSetID] AS [VenClass_iChangeSetID]
		, [TDFT_SRC].[VenClass_Checksum] AS [VenClass_Checksum]
	FROM [dv_CSG_1_FOODS].[VenClass] [TDFT_SRC]
	;

GO
