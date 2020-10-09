SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_PostAP_PREP_DELETE AS 
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

	INSERT INTO [CSG_1_FOODS_stage].[PostAP](
		 [HK_APTransaction]
		,[HKLINK_APTransaction_Project]
		,[HKLINK_APTransaction_Vendor]
		,[HK_Project]
		,[HK_Vendor]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[LOAD_CYCLE_ID]
		,[LOADDT]
		,[AutoIdx]
		,[Reference]
		,[cAuditNumber]
		,[cReference2]
		,[BK_APTransaction]
		,[Project]
		,[AccountLink]
		,[TxDate]
		,[Id]
		,[TrCodeID]
		,[Debit]
		,[Credit]
		,[iCurrencyID]
		,[fExchangeRate]
		,[fForeignDebit]
		,[fForeignCredit]
		,[Description]
		,[TaxTypeID]
		,[Order_No]
		,[ExtOrderNum]
		,[Tax_Amount]
		,[fForeignTax]
		,[Outstanding]
		,[fForeignOutstanding]
		,[cAllocs]
		,[InvNumKey]
		,[CRCCheck]
		,[DTStamp]
		,[UserName]
		,[iTaxPeriodID]
		,[iAge]
		,[dDateAged]
		,[iPostSettlementTermsID]
		,[iTxBranchID]
		,[bPBTPaid]
		,[iGLTaxAccountID]
		,[bTxOnHold]
		,[PostAP_iBranchID]
		,[PostAP_dCreatedDate]
		,[PostAP_dModifiedDate]
		,[PostAP_iCreatedBranchID]
		,[PostAP_iModifiedBranchID]
		,[PostAP_iCreatedAgentID]
		,[PostAP_iModifiedAgentID]
		,[PostAP_iChangeSetID]
		,[PostAP_Checksum]
		,[SagePayExtra1]
		,[SagePayExtra2]
		,[SagePayExtra3]
		,[iTaxBadDebtState]
		,[bReverseChargeApplied]
		,[bReverseChargeCustoms]
		,[cReverseChargeAuditNr]
	)
	SELECT
		  [HUB_SRC].[HK_APTransaction] AS [HK_APTransaction]
		, [LNK_SRC1].[HKLINK_APTransaction_Project] AS [HKLINK_APTransaction_Project]
		, [LNK_SRC2].[HKLINK_APTransaction_Vendor] AS [HKLINK_APTransaction_Vendor]
		, [LNK_SRC1].[HK_Project] AS [HK_Project]
		, [LNK_SRC2].[HK_Vendor] AS [HK_Vendor]
		, '-' AS [CHANGE_TYPE]
		, 'SRC' AS [DATATYPE]
		, [LCI_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [LCI_SRC].[LOADDT] AS [LOADDT]
		, [SAT_SRC1].[AutoIdx] AS [AutoIdx]
		, [SAT_SRC1].[Reference] AS [Reference]
		, [SAT_SRC1].[cAuditNumber] AS [cAuditNumber]
		, [SAT_SRC1].[cReference2] AS [cReference2]
		, [HUB_SRC].[BK_APTransaction] AS [BK_APTransaction]
		, [LKS_SRC1].[Project] AS [Project]
		, [LKS_SRC2].[AccountLink] AS [AccountLink]
		, [SAT_SRC1].[TxDate] AS [TxDate]
		, [SAT_SRC1].[Id] AS [Id]
		, [SAT_SRC1].[TrCodeID] AS [TrCodeID]
		, [SAT_SRC1].[Debit] AS [Debit]
		, [SAT_SRC1].[Credit] AS [Credit]
		, [SAT_SRC1].[iCurrencyID] AS [iCurrencyID]
		, [SAT_SRC1].[fExchangeRate] AS [fExchangeRate]
		, [SAT_SRC1].[fForeignDebit] AS [fForeignDebit]
		, [SAT_SRC1].[fForeignCredit] AS [fForeignCredit]
		, [SAT_SRC1].[Description] AS [Description]
		, [SAT_SRC1].[TaxTypeID] AS [TaxTypeID]
		, [SAT_SRC1].[Order_No] AS [Order_No]
		, [SAT_SRC1].[ExtOrderNum] AS [ExtOrderNum]
		, [SAT_SRC1].[Tax_Amount] AS [Tax_Amount]
		, [SAT_SRC1].[fForeignTax] AS [fForeignTax]
		, [SAT_SRC1].[Outstanding] AS [Outstanding]
		, [SAT_SRC1].[fForeignOutstanding] AS [fForeignOutstanding]
		, [SAT_SRC1].[cAllocs] AS [cAllocs]
		, [SAT_SRC1].[InvNumKey] AS [InvNumKey]
		, [SAT_SRC1].[CRCCheck] AS [CRCCheck]
		, [SAT_SRC1].[DTStamp] AS [DTStamp]
		, [SAT_SRC1].[UserName] AS [UserName]
		, [SAT_SRC1].[iTaxPeriodID] AS [iTaxPeriodID]
		, [SAT_SRC1].[iAge] AS [iAge]
		, [SAT_SRC1].[dDateAged] AS [dDateAged]
		, [SAT_SRC1].[iPostSettlementTermsID] AS [iPostSettlementTermsID]
		, [SAT_SRC1].[iTxBranchID] AS [iTxBranchID]
		, [SAT_SRC1].[bPBTPaid] AS [bPBTPaid]
		, [SAT_SRC1].[iGLTaxAccountID] AS [iGLTaxAccountID]
		, [SAT_SRC1].[bTxOnHold] AS [bTxOnHold]
		, [SAT_SRC1].[PostAP_iBranchID] AS [PostAP_iBranchID]
		, [SAT_SRC1].[PostAP_dCreatedDate] AS [PostAP_dCreatedDate]
		, [SAT_SRC1].[PostAP_dModifiedDate] AS [PostAP_dModifiedDate]
		, [SAT_SRC1].[PostAP_iCreatedBranchID] AS [PostAP_iCreatedBranchID]
		, [SAT_SRC1].[PostAP_iModifiedBranchID] AS [PostAP_iModifiedBranchID]
		, [SAT_SRC1].[PostAP_iCreatedAgentID] AS [PostAP_iCreatedAgentID]
		, [SAT_SRC1].[PostAP_iModifiedAgentID] AS [PostAP_iModifiedAgentID]
		, [SAT_SRC1].[PostAP_iChangeSetID] AS [PostAP_iChangeSetID]
		, [SAT_SRC1].[PostAP_Checksum] AS [PostAP_Checksum]
		, [SAT_SRC1].[SagePayExtra1] AS [SagePayExtra1]
		, [SAT_SRC1].[SagePayExtra2] AS [SagePayExtra2]
		, [SAT_SRC1].[SagePayExtra3] AS [SagePayExtra3]
		, [SAT_SRC1].[iTaxBadDebtState] AS [iTaxBadDebtState]
		, [SAT_SRC1].[bReverseChargeApplied] AS [bReverseChargeApplied]
		, [SAT_SRC1].[bReverseChargeCustoms] AS [bReverseChargeCustoms]
		, [SAT_SRC1].[cReverseChargeAuditNr] AS [cReverseChargeAuditNr]
	FROM [raw].[HUB_APTransaction] [HUB_SRC]
	INNER JOIN [raw].[SAT_CSG_1_FOODS_APTransaction] [SAT_SRC1] ON  [SAT_SRC1].[HK_APTransaction] = [HUB_SRC].[HK_APTransaction] AND [SAT_SRC1].[LOADENDDT] = CONVERT(DATETIME2,
		'31/12/2999' , 103) AND [SAT_SRC1].[ISDELETED] = 'N'
	INNER JOIN [raw].[LINK_APTransaction_Project] [LNK_SRC1] ON  [LNK_SRC1].[HK_APTransaction] = [HUB_SRC].[HK_APTransaction]
	INNER JOIN [raw].[LINKSAT_CSG_1_FOODS_APTransaction_Project] [LKS_SRC1] ON  [LKS_SRC1].[HKLINK_APTransaction_Project] =
		[LNK_SRC1].[HKLINK_APTransaction_Project] AND [LKS_SRC1].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' , 103)
		AND [LKS_SRC1].[ISDELETED] = 'N'
	INNER JOIN [raw].[LINK_APTransaction_Vendor] [LNK_SRC2] ON  [LNK_SRC2].[HK_APTransaction] = [HUB_SRC].[HK_APTransaction]
	INNER JOIN [raw].[LINKSAT_CSG_1_FOODS_APTransaction_Vendor] [LKS_SRC2] ON  [LKS_SRC2].[HKLINK_APTransaction_Vendor] = [LNK_SRC2].[HKLINK_APTransaction_Vendor] AND [LKS_SRC2].[LOADENDDT] =
		CONVERT(DATETIME2, '31/12/2999' , 103) AND [LKS_SRC2].[ISDELETED] = 'N'
	LEFT OUTER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [HUB_SRC].[LOAD_CYCLE_ID] = CONVERT(int, [MEX_SRC].[LOAD_CYCLE_ID] )
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	LEFT OUTER JOIN [CSG_1_FOODS_stage].[PostAP] [STG_SRC] ON  [HUB_SRC].[HK_APTransaction] = [STG_SRC].[HK_APTransaction] AND [HUB_SRC].[SOURCE_SYSTEM] =
		[STG_SRC].[SOURCE_SYSTEM]
	WHERE  [STG_SRC].[LOAD_CYCLE_ID] IS NULL AND [MEX_SRC].[LOAD_CYCLE_ID] IS NULL
	;
END;


END;

 
 


GO
