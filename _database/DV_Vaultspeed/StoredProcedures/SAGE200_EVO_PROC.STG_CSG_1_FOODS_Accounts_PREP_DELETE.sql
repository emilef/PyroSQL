SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_Accounts_PREP_DELETE AS 
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

	INSERT INTO [CSG_1_FOODS_stage].[Accounts](
		 [HK_GLAccount]
		,[HKLINK_GLAccount_GLSegment_Segment0]
		,[HKLINK_GLAccount_GLSegment_Segment1]
		,[HKLINK_GLAccount_GLSegment_Segment2]
		,[HKLINK_GLAccount_GLSegment_Segment3]
		,[HKLINK_GLAccount_GLSegment_Segment4]
		,[HKLINK_GLAccount_GLSegment_Segment5]
		,[HKLINK_GLAccount_GLSegment_Segment6]
		,[HKLINK_GLAccount_GLSegment_Segment7]
		,[HKLINK_GLAccount_GLSegment_Segment8]
		,[HKLINK_GLAccount_GLSegment_Segment9]
		,[HK_GLSegment_Segment0]
		,[HK_GLSegment_Segment1]
		,[HK_GLSegment_Segment2]
		,[HK_GLSegment_Segment3]
		,[HK_GLSegment_Segment4]
		,[HK_GLSegment_Segment5]
		,[HK_GLSegment_Segment6]
		,[HK_GLSegment_Segment7]
		,[HK_GLSegment_Segment8]
		,[HK_GLSegment_Segment9]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[LOAD_CYCLE_ID]
		,[LOADDT]
		,[AccountLink]
		,[BK_GLAccount]
		,[iGLSegment0ID]
		,[iGLSegment1ID]
		,[iGLSegment2ID]
		,[iGLSegment3ID]
		,[iGLSegment4ID]
		,[iGLSegment5ID]
		,[iGLSegment6ID]
		,[iGLSegment7ID]
		,[iGLSegment8ID]
		,[iGLSegment9ID]
		,[Master_Sub_Account]
		,[AccountLevel]
		,[Account]
		,[iAccountType]
		,[SubAccOfLink]
		,[Dept]
		,[Brch]
		,[Jr]
		,[Description]
		,[CaseAcc]
		,[ActiveAccount]
		,[dAccountsTimeStamp]
		,[cNextChequeNum]
		,[iReportCategoryID]
		,[fBankStatementBalance]
		,[cExtDescription]
		,[iTaxTypeINVID]
		,[iTaxTypeCRNID]
		,[iTaxTypeGRVID]
		,[iTaxTypeRTSID]
		,[iAllowICSales]
		,[iAllowICPurchases]
		,[iMBReportingCategoryID]
		,[iMBCashFlowCategoryID]
		,[bMBIsAsset]
		,[bMBIsGrant]
		,[iMBAssetClassificationID]
		,[iMBAssetCategoryID]
		,[iMBAssetTypeID]
		,[iMBGrantLevel1TypeID]
		,[iMBGrantLevel2TypeID]
		,[iMBGrantLevel3TypeID]
		,[bIsBranchLoanAccount]
		,[iForeignBankCurrencyID]
		,[iForeignBankPEXAccID]
		,[iForeignBankLEXAccID]
		,[bRevalueWithSellingRate]
		,[bPaymentsBasedTax]
		,[cBankName]
		,[cBankAccountName]
		,[cBankCode]
		,[cBankAccountNumber]
		,[cBranchName]
		,[cSEPABranchCode]
		,[cBankRefNr]
		,[iAttributeGroupID]
		,[xAttribute]
		,[bForeignBankAcc]
		,[Accounts_iBranchID]
		,[Accounts_dCreatedDate]
		,[Accounts_dModifiedDate]
		,[Accounts_iCreatedBranchID]
		,[Accounts_iModifiedBranchID]
		,[Accounts_iCreatedAgentID]
		,[Accounts_iModifiedAgentID]
		,[Accounts_iChangeSetID]
		,[Accounts_Checksum]
		,[cBCloudBankAccountID]
	)
	SELECT
		  [HUB_SRC].[HK_GLAccount] AS [HK_GLAccount]
		, [LNK_SRC1].[HKLINK_GLAccount_GLSegment_Segment0] AS [HKLINK_GLAccount_GLSegment_Segment0]
		, [LNK_SRC2].[HKLINK_GLAccount_GLSegment_Segment1] AS [HKLINK_GLAccount_GLSegment_Segment1]
		, [LNK_SRC3].[HKLINK_GLAccount_GLSegment_Segment2] AS [HKLINK_GLAccount_GLSegment_Segment2]
		, [LNK_SRC4].[HKLINK_GLAccount_GLSegment_Segment3] AS [HKLINK_GLAccount_GLSegment_Segment3]
		, [LNK_SRC5].[HKLINK_GLAccount_GLSegment_Segment4] AS [HKLINK_GLAccount_GLSegment_Segment4]
		, [LNK_SRC6].[HKLINK_GLAccount_GLSegment_Segment5] AS [HKLINK_GLAccount_GLSegment_Segment5]
		, [LNK_SRC7].[HKLINK_GLAccount_GLSegment_Segment6] AS [HKLINK_GLAccount_GLSegment_Segment6]
		, [LNK_SRC8].[HKLINK_GLAccount_GLSegment_Segment7] AS [HKLINK_GLAccount_GLSegment_Segment7]
		, [LNK_SRC9].[HKLINK_GLAccount_GLSegment_Segment8] AS [HKLINK_GLAccount_GLSegment_Segment8]
		, [LNK_SRC10].[HKLINK_GLAccount_GLSegment_Segment9] AS [HKLINK_GLAccount_GLSegment_Segment9]
		, [LNK_SRC1].[HK_GLSegment_Segment0] AS [HK_GLSegment_Segment0]
		, [LNK_SRC2].[HK_GLSegment_Segment1] AS [HK_GLSegment_Segment1]
		, [LNK_SRC3].[HK_GLSegment_Segment2] AS [HK_GLSegment_Segment2]
		, [LNK_SRC4].[HK_GLSegment_Segment3] AS [HK_GLSegment_Segment3]
		, [LNK_SRC5].[HK_GLSegment_Segment4] AS [HK_GLSegment_Segment4]
		, [LNK_SRC6].[HK_GLSegment_Segment5] AS [HK_GLSegment_Segment5]
		, [LNK_SRC7].[HK_GLSegment_Segment6] AS [HK_GLSegment_Segment6]
		, [LNK_SRC8].[HK_GLSegment_Segment7] AS [HK_GLSegment_Segment7]
		, [LNK_SRC9].[HK_GLSegment_Segment8] AS [HK_GLSegment_Segment8]
		, [LNK_SRC10].[HK_GLSegment_Segment9] AS [HK_GLSegment_Segment9]
		, '-' AS [CHANGE_TYPE]
		, 'SRC' AS [DATATYPE]
		, [LCI_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [LCI_SRC].[LOADDT] AS [LOADDT]
		, [SAT_SRC1].[AccountLink] AS [AccountLink]
		, [HUB_SRC].[BK_GLAccount] AS [BK_GLAccount]
		, [LKS_SRC1].[iGLSegment0ID] AS [iGLSegment0ID]
		, [LKS_SRC2].[iGLSegment1ID] AS [iGLSegment1ID]
		, [LKS_SRC3].[iGLSegment2ID] AS [iGLSegment2ID]
		, [LKS_SRC4].[iGLSegment3ID] AS [iGLSegment3ID]
		, [LKS_SRC5].[iGLSegment4ID] AS [iGLSegment4ID]
		, [LKS_SRC6].[iGLSegment5ID] AS [iGLSegment5ID]
		, [LKS_SRC7].[iGLSegment6ID] AS [iGLSegment6ID]
		, [LKS_SRC8].[iGLSegment7ID] AS [iGLSegment7ID]
		, [LKS_SRC9].[iGLSegment8ID] AS [iGLSegment8ID]
		, [LKS_SRC10].[iGLSegment9ID] AS [iGLSegment9ID]
		, [SAT_SRC1].[Master_Sub_Account] AS [Master_Sub_Account]
		, [SAT_SRC1].[AccountLevel] AS [AccountLevel]
		, [SAT_SRC1].[Account] AS [Account]
		, [SAT_SRC1].[iAccountType] AS [iAccountType]
		, [SAT_SRC1].[SubAccOfLink] AS [SubAccOfLink]
		, [SAT_SRC1].[Dept] AS [Dept]
		, [SAT_SRC1].[Brch] AS [Brch]
		, [SAT_SRC1].[Jr] AS [Jr]
		, [SAT_SRC1].[Description] AS [Description]
		, [SAT_SRC1].[CaseAcc] AS [CaseAcc]
		, [SAT_SRC1].[ActiveAccount] AS [ActiveAccount]
		, [SAT_SRC1].[dAccountsTimeStamp] AS [dAccountsTimeStamp]
		, [SAT_SRC1].[cNextChequeNum] AS [cNextChequeNum]
		, [SAT_SRC1].[iReportCategoryID] AS [iReportCategoryID]
		, [SAT_SRC1].[fBankStatementBalance] AS [fBankStatementBalance]
		, [SAT_SRC1].[cExtDescription] AS [cExtDescription]
		, [SAT_SRC1].[iTaxTypeINVID] AS [iTaxTypeINVID]
		, [SAT_SRC1].[iTaxTypeCRNID] AS [iTaxTypeCRNID]
		, [SAT_SRC1].[iTaxTypeGRVID] AS [iTaxTypeGRVID]
		, [SAT_SRC1].[iTaxTypeRTSID] AS [iTaxTypeRTSID]
		, [SAT_SRC1].[iAllowICSales] AS [iAllowICSales]
		, [SAT_SRC1].[iAllowICPurchases] AS [iAllowICPurchases]
		, [SAT_SRC1].[iMBReportingCategoryID] AS [iMBReportingCategoryID]
		, [SAT_SRC1].[iMBCashFlowCategoryID] AS [iMBCashFlowCategoryID]
		, [SAT_SRC1].[bMBIsAsset] AS [bMBIsAsset]
		, [SAT_SRC1].[bMBIsGrant] AS [bMBIsGrant]
		, [SAT_SRC1].[iMBAssetClassificationID] AS [iMBAssetClassificationID]
		, [SAT_SRC1].[iMBAssetCategoryID] AS [iMBAssetCategoryID]
		, [SAT_SRC1].[iMBAssetTypeID] AS [iMBAssetTypeID]
		, [SAT_SRC1].[iMBGrantLevel1TypeID] AS [iMBGrantLevel1TypeID]
		, [SAT_SRC1].[iMBGrantLevel2TypeID] AS [iMBGrantLevel2TypeID]
		, [SAT_SRC1].[iMBGrantLevel3TypeID] AS [iMBGrantLevel3TypeID]
		, [SAT_SRC1].[bIsBranchLoanAccount] AS [bIsBranchLoanAccount]
		, [SAT_SRC1].[iForeignBankCurrencyID] AS [iForeignBankCurrencyID]
		, [SAT_SRC1].[iForeignBankPEXAccID] AS [iForeignBankPEXAccID]
		, [SAT_SRC1].[iForeignBankLEXAccID] AS [iForeignBankLEXAccID]
		, [SAT_SRC1].[bRevalueWithSellingRate] AS [bRevalueWithSellingRate]
		, [SAT_SRC1].[bPaymentsBasedTax] AS [bPaymentsBasedTax]
		, [SAT_SRC1].[cBankName] AS [cBankName]
		, [SAT_SRC1].[cBankAccountName] AS [cBankAccountName]
		, [SAT_SRC1].[cBankCode] AS [cBankCode]
		, [SAT_SRC1].[cBankAccountNumber] AS [cBankAccountNumber]
		, [SAT_SRC1].[cBranchName] AS [cBranchName]
		, [SAT_SRC1].[cSEPABranchCode] AS [cSEPABranchCode]
		, [SAT_SRC1].[cBankRefNr] AS [cBankRefNr]
		, [SAT_SRC1].[iAttributeGroupID] AS [iAttributeGroupID]
		, [SAT_SRC1].[xAttribute] AS [xAttribute]
		, [SAT_SRC1].[bForeignBankAcc] AS [bForeignBankAcc]
		, [SAT_SRC1].[Accounts_iBranchID] AS [Accounts_iBranchID]
		, [SAT_SRC1].[Accounts_dCreatedDate] AS [Accounts_dCreatedDate]
		, [SAT_SRC1].[Accounts_dModifiedDate] AS [Accounts_dModifiedDate]
		, [SAT_SRC1].[Accounts_iCreatedBranchID] AS [Accounts_iCreatedBranchID]
		, [SAT_SRC1].[Accounts_iModifiedBranchID] AS [Accounts_iModifiedBranchID]
		, [SAT_SRC1].[Accounts_iCreatedAgentID] AS [Accounts_iCreatedAgentID]
		, [SAT_SRC1].[Accounts_iModifiedAgentID] AS [Accounts_iModifiedAgentID]
		, [SAT_SRC1].[Accounts_iChangeSetID] AS [Accounts_iChangeSetID]
		, [SAT_SRC1].[Accounts_Checksum] AS [Accounts_Checksum]
		, [SAT_SRC1].[cBCloudBankAccountID] AS [cBCloudBankAccountID]
	FROM [raw].[HUB_GLAccount] [HUB_SRC]
	INNER JOIN [raw].[SAT_CSG_1_FOODS_GLAccount] [SAT_SRC1] ON  [SAT_SRC1].[HK_GLAccount] = [HUB_SRC].[HK_GLAccount] AND [SAT_SRC1].[LOADENDDT] = CONVERT(DATETIME2,
		'31/12/2999' , 103) AND [SAT_SRC1].[ISDELETED] = 'N'
	INNER JOIN [raw].[LINK_GLAccount_GLSegment_Segment0] [LNK_SRC1] ON  [LNK_SRC1].[HK_GLAccount] = [HUB_SRC].[HK_GLAccount]
	INNER JOIN [raw].[LINKSAT_CSG_1_FOODS_GLAccount_GLSegment_Segment0] [LKS_SRC1] ON  [LKS_SRC1].[HKLINK_GLAccount_GLSegment_Segment0] =
		[LNK_SRC1].[HKLINK_GLAccount_GLSegment_Segment0] AND [LKS_SRC1].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' ,
		103) AND [LKS_SRC1].[ISDELETED] = 'N'
	INNER JOIN [raw].[LINK_GLAccount_GLSegment_Segment1] [LNK_SRC2] ON  [LNK_SRC2].[HK_GLAccount] = [HUB_SRC].[HK_GLAccount]
	INNER JOIN [raw].[LINKSAT_CSG_1_FOODS_GLAccount_GLSegment_Segment1] [LKS_SRC2] ON  [LKS_SRC2].[HKLINK_GLAccount_GLSegment_Segment1] =
		[LNK_SRC2].[HKLINK_GLAccount_GLSegment_Segment1] AND [LKS_SRC2].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' ,
		103) AND [LKS_SRC2].[ISDELETED] = 'N'
	INNER JOIN [raw].[LINK_GLAccount_GLSegment_Segment2] [LNK_SRC3] ON  [LNK_SRC3].[HK_GLAccount] = [HUB_SRC].[HK_GLAccount]
	INNER JOIN [raw].[LINKSAT_CSG_1_FOODS_GLAccount_GLSegment_Segment2] [LKS_SRC3] ON  [LKS_SRC3].[HKLINK_GLAccount_GLSegment_Segment2] =
		[LNK_SRC3].[HKLINK_GLAccount_GLSegment_Segment2] AND [LKS_SRC3].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' ,
		103) AND [LKS_SRC3].[ISDELETED] = 'N'
	INNER JOIN [raw].[LINK_GLAccount_GLSegment_Segment3] [LNK_SRC4] ON  [LNK_SRC4].[HK_GLAccount] = [HUB_SRC].[HK_GLAccount]
	INNER JOIN [raw].[LINKSAT_CSG_1_FOODS_GLAccount_GLSegment_Segment3] [LKS_SRC4] ON  [LKS_SRC4].[HKLINK_GLAccount_GLSegment_Segment3] =
		[LNK_SRC4].[HKLINK_GLAccount_GLSegment_Segment3] AND [LKS_SRC4].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' ,
		103) AND [LKS_SRC4].[ISDELETED] = 'N'
	INNER JOIN [raw].[LINK_GLAccount_GLSegment_Segment4] [LNK_SRC5] ON  [LNK_SRC5].[HK_GLAccount] = [HUB_SRC].[HK_GLAccount]
	INNER JOIN [raw].[LINKSAT_CSG_1_FOODS_GLAccount_GLSegment_Segment4] [LKS_SRC5] ON  [LKS_SRC5].[HKLINK_GLAccount_GLSegment_Segment4] =
		[LNK_SRC5].[HKLINK_GLAccount_GLSegment_Segment4] AND [LKS_SRC5].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' ,
		103) AND [LKS_SRC5].[ISDELETED] = 'N'
	INNER JOIN [raw].[LINK_GLAccount_GLSegment_Segment5] [LNK_SRC6] ON  [LNK_SRC6].[HK_GLAccount] = [HUB_SRC].[HK_GLAccount]
	INNER JOIN [raw].[LINKSAT_CSG_1_FOODS_GLAccount_GLSegment_Segment5] [LKS_SRC6] ON  [LKS_SRC6].[HKLINK_GLAccount_GLSegment_Segment5] =
		[LNK_SRC6].[HKLINK_GLAccount_GLSegment_Segment5] AND [LKS_SRC6].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' ,
		103) AND [LKS_SRC6].[ISDELETED] = 'N'
	INNER JOIN [raw].[LINK_GLAccount_GLSegment_Segment6] [LNK_SRC7] ON  [LNK_SRC7].[HK_GLAccount] = [HUB_SRC].[HK_GLAccount]
	INNER JOIN [raw].[LINKSAT_CSG_1_FOODS_GLAccount_GLSegment_Segment6] [LKS_SRC7] ON  [LKS_SRC7].[HKLINK_GLAccount_GLSegment_Segment6] =
		[LNK_SRC7].[HKLINK_GLAccount_GLSegment_Segment6] AND [LKS_SRC7].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' ,
		103) AND [LKS_SRC7].[ISDELETED] = 'N'
	INNER JOIN [raw].[LINK_GLAccount_GLSegment_Segment7] [LNK_SRC8] ON  [LNK_SRC8].[HK_GLAccount] = [HUB_SRC].[HK_GLAccount]
	INNER JOIN [raw].[LINKSAT_CSG_1_FOODS_GLAccount_GLSegment_Segment7] [LKS_SRC8] ON  [LKS_SRC8].[HKLINK_GLAccount_GLSegment_Segment7] =
		[LNK_SRC8].[HKLINK_GLAccount_GLSegment_Segment7] AND [LKS_SRC8].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' ,
		103) AND [LKS_SRC8].[ISDELETED] = 'N'
	INNER JOIN [raw].[LINK_GLAccount_GLSegment_Segment8] [LNK_SRC9] ON  [LNK_SRC9].[HK_GLAccount] = [HUB_SRC].[HK_GLAccount]
	INNER JOIN [raw].[LINKSAT_CSG_1_FOODS_GLAccount_GLSegment_Segment8] [LKS_SRC9] ON  [LKS_SRC9].[HKLINK_GLAccount_GLSegment_Segment8] =
		[LNK_SRC9].[HKLINK_GLAccount_GLSegment_Segment8] AND [LKS_SRC9].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' ,
		103) AND [LKS_SRC9].[ISDELETED] = 'N'
	INNER JOIN [raw].[LINK_GLAccount_GLSegment_Segment9] [LNK_SRC10] ON  [LNK_SRC10].[HK_GLAccount] = [HUB_SRC].[HK_GLAccount]
	INNER JOIN [raw].[LINKSAT_CSG_1_FOODS_GLAccount_GLSegment_Segment9] [LKS_SRC10] ON  [LKS_SRC10].[HKLINK_GLAccount_GLSegment_Segment9] =
		[LNK_SRC10].[HKLINK_GLAccount_GLSegment_Segment9] AND [LKS_SRC10].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' ,
		103) AND [LKS_SRC10].[ISDELETED] = 'N'
	LEFT OUTER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [HUB_SRC].[LOAD_CYCLE_ID] = CONVERT(int, [MEX_SRC].[LOAD_CYCLE_ID] )
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	LEFT OUTER JOIN [CSG_1_FOODS_stage].[Accounts] [STG_SRC] ON  [HUB_SRC].[HK_GLAccount] = [STG_SRC].[HK_GLAccount] AND [HUB_SRC].[SOURCE_SYSTEM] = [STG_SRC].[SOURCE_SYSTEM]
	WHERE  [STG_SRC].[LOAD_CYCLE_ID] IS NULL AND [MEX_SRC].[LOAD_CYCLE_ID] IS NULL
	;
END;


END;

 
 


GO
