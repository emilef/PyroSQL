SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dv_CSG_1_FOODS].[VW_CliClass] AS 
	SELECT
		  [TDFT_SRC].[DATATYPE] AS [DATATYPE]
		, [TDFT_SRC].[IdCliClass] AS [IdCliClass]
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
		, [TDFT_SRC].[CliClass_iBranchID] AS [CliClass_iBranchID]
		, [TDFT_SRC].[CliClass_dCreatedDate] AS [CliClass_dCreatedDate]
		, [TDFT_SRC].[CliClass_dModifiedDate] AS [CliClass_dModifiedDate]
		, [TDFT_SRC].[CliClass_iCreatedBranchID] AS [CliClass_iCreatedBranchID]
		, [TDFT_SRC].[CliClass_iModifiedBranchID] AS [CliClass_iModifiedBranchID]
		, [TDFT_SRC].[CliClass_iCreatedAgentID] AS [CliClass_iCreatedAgentID]
		, [TDFT_SRC].[CliClass_iModifiedAgentID] AS [CliClass_iModifiedAgentID]
		, [TDFT_SRC].[CliClass_iChangeSetID] AS [CliClass_iChangeSetID]
		, [TDFT_SRC].[CliClass_Checksum] AS [CliClass_Checksum]
	FROM [dv_CSG_1_FOODS].[CliClass] [TDFT_SRC]
	;

GO
