SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_PostGL_PREP_DELETE AS 
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

	INSERT INTO [CSG_1_FOODS_stage].[PostGL](
		 [HK_GLTransaction]
		,[HKLINK_GLTransaction_GLAccount]
		,[HKLINK_GLTransaction_FinancialPeriod]
		,[HKLINK_GLTransaction_Project]
		,[HK_GLAccount]
		,[HK_FinancialPeriod]
		,[HK_Project]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[LOAD_CYCLE_ID]
		,[LOADDT]
		,[AutoIdx]
		,[Description]
		,[Reference]
		,[cReference2]
		,[BK_GLTransaction]
		,[AccountLink]
		,[Period]
		,[Project]
		,[TxDate]
		,[Id]
		,[TrCodeID]
		,[Debit]
		,[Credit]
		,[iCurrencyID]
		,[fExchangeRate]
		,[fForeignDebit]
		,[fForeignCredit]
		,[TaxTypeID]
		,[Order_No]
		,[ExtOrderNum]
		,[cAuditNumber]
		,[Tax_Amount]
		,[fForeignTax]
		,[DrCrAccount]
		,[JobCodeLink]
		,[CRCCheck]
		,[DTStamp]
		,[UserName]
		,[iTaxPeriodID]
		,[cPayeeName]
		,[bPrintCheque]
		,[RepID]
		,[fJCRepCost]
		,[iMFPID]
		,[bIsJCDocLine]
		,[bIsSTGLDocLine]
		,[iInvLineID]
		,[iTxBranchID]
		,[cBankRef]
		,[bPBTPaid]
		,[iGLTaxAccountID]
		,[bReconciled]
		,[xAttribute]
		,[PostGL_iBranchID]
		,[PostGL_dCreatedDate]
		,[PostGL_dModifiedDate]
		,[PostGL_iCreatedBranchID]
		,[PostGL_iModifiedBranchID]
		,[PostGL_iCreatedAgentID]
		,[PostGL_iModifiedAgentID]
		,[PostGL_iChangeSetID]
		,[PostGL_Checksum]
		,[iMajorIndustryCodeID]
		,[iImportDeclarationID]
	)
	SELECT
		  [HUB_SRC].[HK_GLTransaction] AS [HK_GLTransaction]
		, [LNK_SRC1].[HKLINK_GLTransaction_GLAccount] AS [HKLINK_GLTransaction_GLAccount]
		, [LNK_SRC2].[HKLINK_GLTransaction_FinancialPeriod] AS [HKLINK_GLTransaction_FinancialPeriod]
		, [LNK_SRC3].[HKLINK_GLTransaction_Project] AS [HKLINK_GLTransaction_Project]
		, [LNK_SRC1].[HK_GLAccount] AS [HK_GLAccount]
		, [LNK_SRC2].[HK_FinancialPeriod] AS [HK_FinancialPeriod]
		, [LNK_SRC3].[HK_Project] AS [HK_Project]
		, '-' AS [CHANGE_TYPE]
		, 'SRC' AS [DATATYPE]
		, [LCI_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [LCI_SRC].[LOADDT] AS [LOADDT]
		, [SAT_SRC1].[AutoIdx] AS [AutoIdx]
		, [SAT_SRC1].[Description] AS [Description]
		, [SAT_SRC1].[Reference] AS [Reference]
		, [SAT_SRC1].[cReference2] AS [cReference2]
		, [HUB_SRC].[BK_GLTransaction] AS [BK_GLTransaction]
		, [LKS_SRC1].[AccountLink] AS [AccountLink]
		, [LKS_SRC2].[Period] AS [Period]
		, [LKS_SRC3].[Project] AS [Project]
		, [SAT_SRC1].[TxDate] AS [TxDate]
		, [SAT_SRC1].[Id] AS [Id]
		, [SAT_SRC1].[TrCodeID] AS [TrCodeID]
		, [SAT_SRC1].[Debit] AS [Debit]
		, [SAT_SRC1].[Credit] AS [Credit]
		, [SAT_SRC1].[iCurrencyID] AS [iCurrencyID]
		, [SAT_SRC1].[fExchangeRate] AS [fExchangeRate]
		, [SAT_SRC1].[fForeignDebit] AS [fForeignDebit]
		, [SAT_SRC1].[fForeignCredit] AS [fForeignCredit]
		, [SAT_SRC1].[TaxTypeID] AS [TaxTypeID]
		, [SAT_SRC1].[Order_No] AS [Order_No]
		, [SAT_SRC1].[ExtOrderNum] AS [ExtOrderNum]
		, [SAT_SRC1].[cAuditNumber] AS [cAuditNumber]
		, [SAT_SRC1].[Tax_Amount] AS [Tax_Amount]
		, [SAT_SRC1].[fForeignTax] AS [fForeignTax]
		, [SAT_SRC1].[DrCrAccount] AS [DrCrAccount]
		, [SAT_SRC1].[JobCodeLink] AS [JobCodeLink]
		, [SAT_SRC1].[CRCCheck] AS [CRCCheck]
		, [SAT_SRC1].[DTStamp] AS [DTStamp]
		, [SAT_SRC1].[UserName] AS [UserName]
		, [SAT_SRC1].[iTaxPeriodID] AS [iTaxPeriodID]
		, [SAT_SRC1].[cPayeeName] AS [cPayeeName]
		, [SAT_SRC1].[bPrintCheque] AS [bPrintCheque]
		, [SAT_SRC1].[RepID] AS [RepID]
		, [SAT_SRC1].[fJCRepCost] AS [fJCRepCost]
		, [SAT_SRC1].[iMFPID] AS [iMFPID]
		, [SAT_SRC1].[bIsJCDocLine] AS [bIsJCDocLine]
		, [SAT_SRC1].[bIsSTGLDocLine] AS [bIsSTGLDocLine]
		, [SAT_SRC1].[iInvLineID] AS [iInvLineID]
		, [SAT_SRC1].[iTxBranchID] AS [iTxBranchID]
		, [SAT_SRC1].[cBankRef] AS [cBankRef]
		, [SAT_SRC1].[bPBTPaid] AS [bPBTPaid]
		, [SAT_SRC1].[iGLTaxAccountID] AS [iGLTaxAccountID]
		, [SAT_SRC1].[bReconciled] AS [bReconciled]
		, [SAT_SRC1].[xAttribute] AS [xAttribute]
		, [SAT_SRC1].[PostGL_iBranchID] AS [PostGL_iBranchID]
		, [SAT_SRC1].[PostGL_dCreatedDate] AS [PostGL_dCreatedDate]
		, [SAT_SRC1].[PostGL_dModifiedDate] AS [PostGL_dModifiedDate]
		, [SAT_SRC1].[PostGL_iCreatedBranchID] AS [PostGL_iCreatedBranchID]
		, [SAT_SRC1].[PostGL_iModifiedBranchID] AS [PostGL_iModifiedBranchID]
		, [SAT_SRC1].[PostGL_iCreatedAgentID] AS [PostGL_iCreatedAgentID]
		, [SAT_SRC1].[PostGL_iModifiedAgentID] AS [PostGL_iModifiedAgentID]
		, [SAT_SRC1].[PostGL_iChangeSetID] AS [PostGL_iChangeSetID]
		, [SAT_SRC1].[PostGL_Checksum] AS [PostGL_Checksum]
		, [SAT_SRC1].[iMajorIndustryCodeID] AS [iMajorIndustryCodeID]
		, [SAT_SRC1].[iImportDeclarationID] AS [iImportDeclarationID]
	FROM [raw].[HUB_GLTransaction] [HUB_SRC]
	INNER JOIN [raw].[SAT_CSG_1_FOODS_GLTransaction] [SAT_SRC1] ON  [SAT_SRC1].[HK_GLTransaction] = [HUB_SRC].[HK_GLTransaction] AND [SAT_SRC1].[LOADENDDT] = CONVERT(DATETIME2,
		'31/12/2999' , 103) AND [SAT_SRC1].[ISDELETED] = 'N'
	INNER JOIN [raw].[LINK_GLTransaction_GLAccount] [LNK_SRC1] ON  [LNK_SRC1].[HK_GLTransaction] = [HUB_SRC].[HK_GLTransaction]
	INNER JOIN [raw].[LINKSAT_CSG_1_FOODS_GLTransaction_GLAccount] [LKS_SRC1] ON  [LKS_SRC1].[HKLINK_GLTransaction_GLAccount] =
		[LNK_SRC1].[HKLINK_GLTransaction_GLAccount] AND [LKS_SRC1].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' , 103)
		AND [LKS_SRC1].[ISDELETED] = 'N'
	INNER JOIN [raw].[LINK_GLTransaction_FinancialPeriod] [LNK_SRC2] ON  [LNK_SRC2].[HK_GLTransaction] = [HUB_SRC].[HK_GLTransaction]
	INNER JOIN [raw].[LINKSAT_CSG_1_FOODS_GLTransaction_FinancialPeriod] [LKS_SRC2] ON  [LKS_SRC2].[HKLINK_GLTransaction_FinancialPeriod] =
		[LNK_SRC2].[HKLINK_GLTransaction_FinancialPeriod] AND [LKS_SRC2].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' ,
		103) AND [LKS_SRC2].[ISDELETED] = 'N'
	INNER JOIN [raw].[LINK_GLTransaction_Project] [LNK_SRC3] ON  [LNK_SRC3].[HK_GLTransaction] = [HUB_SRC].[HK_GLTransaction]
	INNER JOIN [raw].[LINKSAT_CSG_1_FOODS_GLTransaction_Project] [LKS_SRC3] ON  [LKS_SRC3].[HKLINK_GLTransaction_Project] =
		[LNK_SRC3].[HKLINK_GLTransaction_Project] AND [LKS_SRC3].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' , 103)
		AND [LKS_SRC3].[ISDELETED] = 'N'
	LEFT OUTER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [HUB_SRC].[LOAD_CYCLE_ID] = CONVERT(int, [MEX_SRC].[LOAD_CYCLE_ID] )
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	LEFT OUTER JOIN [CSG_1_FOODS_stage].[PostGL] [STG_SRC] ON  [HUB_SRC].[HK_GLTransaction] = [STG_SRC].[HK_GLTransaction] AND [HUB_SRC].[SOURCE_SYSTEM] =
		[STG_SRC].[SOURCE_SYSTEM]
	WHERE  [STG_SRC].[LOAD_CYCLE_ID] IS NULL AND [MEX_SRC].[LOAD_CYCLE_ID] IS NULL
	;
END;


END;

 
 


GO
