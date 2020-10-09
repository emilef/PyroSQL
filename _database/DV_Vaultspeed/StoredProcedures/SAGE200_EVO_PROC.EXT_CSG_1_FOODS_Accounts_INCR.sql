SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].EXT_CSG_1_FOODS_Accounts_INCR AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_ext].[Accounts];

	INSERT INTO [CSG_1_FOODS_ext].[Accounts](
		 [LOAD_CYCLE_ID]
		,[LOADDT]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[AccountLink]
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
		,[BK_AccountLink]
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
		  [LCI_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, dateadd(MICROSECOND, 2*row_number() over (order by [LCI_SRC].[LOADDT]), SYSDATETIME()) AS [LOADDT]
		, [MEX_SRC].[ATTRIBUTE_VARCHAR] AS [CHANGE_TYPE]
		, [TDFV_SRC].[DATATYPE] AS [DATATYPE]
		, CONVERT(INT, [TDFV_SRC].[AccountLink] , 1) AS [AccountLink]
		, CONVERT(INT, [TDFV_SRC].[iGLSegment0ID] , 1) AS [iGLSegment0ID]
		, CONVERT(INT, [TDFV_SRC].[iGLSegment1ID] , 1) AS [iGLSegment1ID]
		, CONVERT(INT, [TDFV_SRC].[iGLSegment2ID] , 1) AS [iGLSegment2ID]
		, CONVERT(INT, [TDFV_SRC].[iGLSegment3ID] , 1) AS [iGLSegment3ID]
		, CONVERT(INT, [TDFV_SRC].[iGLSegment4ID] , 1) AS [iGLSegment4ID]
		, CONVERT(INT, [TDFV_SRC].[iGLSegment5ID] , 1) AS [iGLSegment5ID]
		, CONVERT(INT, [TDFV_SRC].[iGLSegment6ID] , 1) AS [iGLSegment6ID]
		, CONVERT(INT, [TDFV_SRC].[iGLSegment7ID] , 1) AS [iGLSegment7ID]
		, CONVERT(INT, [TDFV_SRC].[iGLSegment8ID] , 1) AS [iGLSegment8ID]
		, CONVERT(INT, [TDFV_SRC].[iGLSegment9ID] , 1) AS [iGLSegment9ID]
		, COALESCE(UPPER([TDFV_SRC].[AccountLink]),[MEX_SRC].[KEY_ATTRIBUTE_INT]) AS [BK_AccountLink]
		, [TDFV_SRC].[Master_Sub_Account]  AS [Master_Sub_Account]
		, CONVERT(INT, [TDFV_SRC].[AccountLevel] , 1) AS [AccountLevel]
		, [TDFV_SRC].[Account]  AS [Account]
		, CONVERT(INT, [TDFV_SRC].[iAccountType] , 1) AS [iAccountType]
		, CONVERT(INT, [TDFV_SRC].[SubAccOfLink] , 1) AS [SubAccOfLink]
		, [TDFV_SRC].[Dept]  AS [Dept]
		, [TDFV_SRC].[Brch]  AS [Brch]
		, CONVERT(BIT, [TDFV_SRC].[Jr] , 1) AS [Jr]
		, [TDFV_SRC].[Description]  AS [Description]
		, [TDFV_SRC].[CaseAcc]  AS [CaseAcc]
		, CONVERT(BIT, [TDFV_SRC].[ActiveAccount] , 1) AS [ActiveAccount]
		, CONVERT(DATETIME2, [TDFV_SRC].[dAccountsTimeStamp] , 103) AS [dAccountsTimeStamp]
		, [TDFV_SRC].[cNextChequeNum]  AS [cNextChequeNum]
		, CONVERT(INT, [TDFV_SRC].[iReportCategoryID] , 1) AS [iReportCategoryID]
		, CONVERT(FLOAT, [TDFV_SRC].[fBankStatementBalance] , 1) AS [fBankStatementBalance]
		, [TDFV_SRC].[cExtDescription]  AS [cExtDescription]
		, CONVERT(INT, [TDFV_SRC].[iTaxTypeINVID] , 1) AS [iTaxTypeINVID]
		, CONVERT(INT, [TDFV_SRC].[iTaxTypeCRNID] , 1) AS [iTaxTypeCRNID]
		, CONVERT(INT, [TDFV_SRC].[iTaxTypeGRVID] , 1) AS [iTaxTypeGRVID]
		, CONVERT(INT, [TDFV_SRC].[iTaxTypeRTSID] , 1) AS [iTaxTypeRTSID]
		, CONVERT(BIT, [TDFV_SRC].[iAllowICSales] , 1) AS [iAllowICSales]
		, CONVERT(BIT, [TDFV_SRC].[iAllowICPurchases] , 1) AS [iAllowICPurchases]
		, CONVERT(INT, [TDFV_SRC].[iMBReportingCategoryID] , 1) AS [iMBReportingCategoryID]
		, CONVERT(INT, [TDFV_SRC].[iMBCashFlowCategoryID] , 1) AS [iMBCashFlowCategoryID]
		, CONVERT(BIT, [TDFV_SRC].[bMBIsAsset] , 1) AS [bMBIsAsset]
		, CONVERT(BIT, [TDFV_SRC].[bMBIsGrant] , 1) AS [bMBIsGrant]
		, CONVERT(INT, [TDFV_SRC].[iMBAssetClassificationID] , 1) AS [iMBAssetClassificationID]
		, CONVERT(INT, [TDFV_SRC].[iMBAssetCategoryID] , 1) AS [iMBAssetCategoryID]
		, CONVERT(INT, [TDFV_SRC].[iMBAssetTypeID] , 1) AS [iMBAssetTypeID]
		, CONVERT(INT, [TDFV_SRC].[iMBGrantLevel1TypeID] , 1) AS [iMBGrantLevel1TypeID]
		, CONVERT(INT, [TDFV_SRC].[iMBGrantLevel2TypeID] , 1) AS [iMBGrantLevel2TypeID]
		, CONVERT(INT, [TDFV_SRC].[iMBGrantLevel3TypeID] , 1) AS [iMBGrantLevel3TypeID]
		, CONVERT(BIT, [TDFV_SRC].[bIsBranchLoanAccount] , 1) AS [bIsBranchLoanAccount]
		, CONVERT(INT, [TDFV_SRC].[iForeignBankCurrencyID] , 1) AS [iForeignBankCurrencyID]
		, CONVERT(INT, [TDFV_SRC].[iForeignBankPEXAccID] , 1) AS [iForeignBankPEXAccID]
		, CONVERT(INT, [TDFV_SRC].[iForeignBankLEXAccID] , 1) AS [iForeignBankLEXAccID]
		, CONVERT(BIT, [TDFV_SRC].[bRevalueWithSellingRate] , 1) AS [bRevalueWithSellingRate]
		, CONVERT(BIT, [TDFV_SRC].[bPaymentsBasedTax] , 1) AS [bPaymentsBasedTax]
		, [TDFV_SRC].[cBankName]  AS [cBankName]
		, [TDFV_SRC].[cBankAccountName]  AS [cBankAccountName]
		, [TDFV_SRC].[cBankCode]  AS [cBankCode]
		, [TDFV_SRC].[cBankAccountNumber]  AS [cBankAccountNumber]
		, [TDFV_SRC].[cBranchName]  AS [cBranchName]
		, [TDFV_SRC].[cSEPABranchCode]  AS [cSEPABranchCode]
		, [TDFV_SRC].[cBankRefNr]  AS [cBankRefNr]
		, CONVERT(INT, [TDFV_SRC].[iAttributeGroupID] , 1) AS [iAttributeGroupID]
		, [TDFV_SRC].[xAttribute]  AS [xAttribute]
		, CONVERT(BIT, [TDFV_SRC].[bForeignBankAcc] , 1) AS [bForeignBankAcc]
		, CONVERT(INT, [TDFV_SRC].[Accounts_iBranchID] , 1) AS [Accounts_iBranchID]
		, CONVERT(DATETIME2, [TDFV_SRC].[Accounts_dCreatedDate] , 103) AS [Accounts_dCreatedDate]
		, CONVERT(DATETIME2, [TDFV_SRC].[Accounts_dModifiedDate] , 103) AS [Accounts_dModifiedDate]
		, CONVERT(INT, [TDFV_SRC].[Accounts_iCreatedBranchID] , 1) AS [Accounts_iCreatedBranchID]
		, CONVERT(INT, [TDFV_SRC].[Accounts_iModifiedBranchID] , 1) AS [Accounts_iModifiedBranchID]
		, CONVERT(INT, [TDFV_SRC].[Accounts_iCreatedAgentID] , 1) AS [Accounts_iCreatedAgentID]
		, CONVERT(INT, [TDFV_SRC].[Accounts_iModifiedAgentID] , 1) AS [Accounts_iModifiedAgentID]
		, CONVERT(INT, [TDFV_SRC].[Accounts_iChangeSetID] , 1) AS [Accounts_iChangeSetID]
		, CAST([TDFV_SRC].[Accounts_Checksum]  AS BINARY) AS [Accounts_Checksum]
		, [TDFV_SRC].[cBCloudBankAccountID]  AS [cBCloudBankAccountID]
	FROM [dv_CSG_1_FOODS].[VW_Accounts] [TDFV_SRC]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  1 = 1
	WHERE  [MEX_SRC].[DATATYPE] = '#'
	;
END;


END;

 
 


GO
