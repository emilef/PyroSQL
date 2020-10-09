SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].SAT_CSG_1_FOODS_GLAccount_INIT AS 
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

	DELETE FROM [raw].[SAT_CSG_1_FOODS_GLAccount] 
	WHERE  1 = 1
	;
END;


BEGIN -- SAT_TGT

	WITH [STG_SRC] AS 
	( 
		SELECT
			  [STG_INR_SRC].[HK_GLAccount] AS [HK_GLAccount]
			, [STG_INR_SRC].[LOADDT] AS [LOADDT]
			, [STG_INR_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1',
				COALESCE(REPLACE(REPLACE(RTRIM(REPLACE(REPLACE( REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Master_Sub_Account] ),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[AccountLevel] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Account] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iAccountType] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[SubAccOfLink] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Dept] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Brch] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Jr] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Description] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[CaseAcc] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[ActiveAccount] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[dAccountsTimeStamp] , 103)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cNextChequeNum] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iReportCategoryID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[fBankStatementBalance] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cExtDescription] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iTaxTypeINVID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iTaxTypeCRNID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iTaxTypeGRVID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iTaxTypeRTSID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iAllowICSales] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iAllowICPurchases] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iMBReportingCategoryID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iMBCashFlowCategoryID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bMBIsAsset] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bMBIsGrant] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iMBAssetClassificationID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iMBAssetCategoryID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iMBAssetTypeID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iMBGrantLevel1TypeID] , 1)),'#'),'|','\' + '|')
				+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iMBGrantLevel2TypeID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iMBGrantLevel3TypeID] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bIsBranchLoanAccount] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iForeignBankCurrencyID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iForeignBankPEXAccID] , 1)
				),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iForeignBankLEXAccID] ,
				1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[bRevalueWithSellingRate] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bPaymentsBasedTax] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cBankName] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cBankAccountName] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cBankCode] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cBankAccountNumber] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cBranchName] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cSEPABranchCode] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cBankRefNr] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iAttributeGroupID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bForeignBankAcc] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Accounts_iBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Accounts_dCreatedDate] , 103)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Accounts_dModifiedDate] , 103)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Accounts_iCreatedBranchID] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Accounts_iModifiedBranchID] ,
				1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[Accounts_iCreatedAgentID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Accounts_iModifiedAgentID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Accounts_iChangeSetID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CAST([STG_INR_SRC].[Accounts_Checksum]  AS VARCHAR)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cBCloudBankAccountID] ),'#'),'|','\' + '|')+ '|',' ','#' + '|'),
				'|' + '#',' ')),' ','|' + '#'),'#' + '|',' '),'#')),2)) AS [HASHDIFF]
			, 'N'  AS [ISDELETED]
			, [STG_INR_SRC].[AccountLink] AS [AccountLink]
			, [STG_INR_SRC].[iGLSegment0ID] AS [iGLSegment0ID]
			, [STG_INR_SRC].[iGLSegment1ID] AS [iGLSegment1ID]
			, [STG_INR_SRC].[iGLSegment2ID] AS [iGLSegment2ID]
			, [STG_INR_SRC].[iGLSegment3ID] AS [iGLSegment3ID]
			, [STG_INR_SRC].[iGLSegment4ID] AS [iGLSegment4ID]
			, [STG_INR_SRC].[iGLSegment5ID] AS [iGLSegment5ID]
			, [STG_INR_SRC].[iGLSegment6ID] AS [iGLSegment6ID]
			, [STG_INR_SRC].[iGLSegment7ID] AS [iGLSegment7ID]
			, [STG_INR_SRC].[iGLSegment8ID] AS [iGLSegment8ID]
			, [STG_INR_SRC].[iGLSegment9ID] AS [iGLSegment9ID]
			, [STG_INR_SRC].[Account] AS [Account]
			, [STG_INR_SRC].[Master_Sub_Account] AS [Master_Sub_Account]
			, [STG_INR_SRC].[AccountLevel] AS [AccountLevel]
			, [STG_INR_SRC].[iAccountType] AS [iAccountType]
			, [STG_INR_SRC].[SubAccOfLink] AS [SubAccOfLink]
			, [STG_INR_SRC].[Dept] AS [Dept]
			, [STG_INR_SRC].[Brch] AS [Brch]
			, [STG_INR_SRC].[Jr] AS [Jr]
			, [STG_INR_SRC].[Description] AS [Description]
			, [STG_INR_SRC].[CaseAcc] AS [CaseAcc]
			, [STG_INR_SRC].[ActiveAccount] AS [ActiveAccount]
			, [STG_INR_SRC].[dAccountsTimeStamp] AS [dAccountsTimeStamp]
			, [STG_INR_SRC].[cNextChequeNum] AS [cNextChequeNum]
			, [STG_INR_SRC].[iReportCategoryID] AS [iReportCategoryID]
			, [STG_INR_SRC].[fBankStatementBalance] AS [fBankStatementBalance]
			, [STG_INR_SRC].[cExtDescription] AS [cExtDescription]
			, [STG_INR_SRC].[iTaxTypeINVID] AS [iTaxTypeINVID]
			, [STG_INR_SRC].[iTaxTypeCRNID] AS [iTaxTypeCRNID]
			, [STG_INR_SRC].[iTaxTypeGRVID] AS [iTaxTypeGRVID]
			, [STG_INR_SRC].[iTaxTypeRTSID] AS [iTaxTypeRTSID]
			, [STG_INR_SRC].[iAllowICSales] AS [iAllowICSales]
			, [STG_INR_SRC].[iAllowICPurchases] AS [iAllowICPurchases]
			, [STG_INR_SRC].[iMBReportingCategoryID] AS [iMBReportingCategoryID]
			, [STG_INR_SRC].[iMBCashFlowCategoryID] AS [iMBCashFlowCategoryID]
			, [STG_INR_SRC].[bMBIsAsset] AS [bMBIsAsset]
			, [STG_INR_SRC].[bMBIsGrant] AS [bMBIsGrant]
			, [STG_INR_SRC].[iMBAssetClassificationID] AS [iMBAssetClassificationID]
			, [STG_INR_SRC].[iMBAssetCategoryID] AS [iMBAssetCategoryID]
			, [STG_INR_SRC].[iMBAssetTypeID] AS [iMBAssetTypeID]
			, [STG_INR_SRC].[iMBGrantLevel1TypeID] AS [iMBGrantLevel1TypeID]
			, [STG_INR_SRC].[iMBGrantLevel2TypeID] AS [iMBGrantLevel2TypeID]
			, [STG_INR_SRC].[iMBGrantLevel3TypeID] AS [iMBGrantLevel3TypeID]
			, [STG_INR_SRC].[bIsBranchLoanAccount] AS [bIsBranchLoanAccount]
			, [STG_INR_SRC].[iForeignBankCurrencyID] AS [iForeignBankCurrencyID]
			, [STG_INR_SRC].[iForeignBankPEXAccID] AS [iForeignBankPEXAccID]
			, [STG_INR_SRC].[iForeignBankLEXAccID] AS [iForeignBankLEXAccID]
			, [STG_INR_SRC].[bRevalueWithSellingRate] AS [bRevalueWithSellingRate]
			, [STG_INR_SRC].[bPaymentsBasedTax] AS [bPaymentsBasedTax]
			, [STG_INR_SRC].[cBankName] AS [cBankName]
			, [STG_INR_SRC].[cBankAccountName] AS [cBankAccountName]
			, [STG_INR_SRC].[cBankCode] AS [cBankCode]
			, [STG_INR_SRC].[cBankAccountNumber] AS [cBankAccountNumber]
			, [STG_INR_SRC].[cBranchName] AS [cBranchName]
			, [STG_INR_SRC].[cSEPABranchCode] AS [cSEPABranchCode]
			, [STG_INR_SRC].[cBankRefNr] AS [cBankRefNr]
			, [STG_INR_SRC].[iAttributeGroupID] AS [iAttributeGroupID]
			, [STG_INR_SRC].[xAttribute] AS [xAttribute]
			, [STG_INR_SRC].[bForeignBankAcc] AS [bForeignBankAcc]
			, [STG_INR_SRC].[Accounts_iBranchID] AS [Accounts_iBranchID]
			, [STG_INR_SRC].[Accounts_dCreatedDate] AS [Accounts_dCreatedDate]
			, [STG_INR_SRC].[Accounts_dModifiedDate] AS [Accounts_dModifiedDate]
			, [STG_INR_SRC].[Accounts_iCreatedBranchID] AS [Accounts_iCreatedBranchID]
			, [STG_INR_SRC].[Accounts_iModifiedBranchID] AS [Accounts_iModifiedBranchID]
			, [STG_INR_SRC].[Accounts_iCreatedAgentID] AS [Accounts_iCreatedAgentID]
			, [STG_INR_SRC].[Accounts_iModifiedAgentID] AS [Accounts_iModifiedAgentID]
			, [STG_INR_SRC].[Accounts_iChangeSetID] AS [Accounts_iChangeSetID]
			, [STG_INR_SRC].[Accounts_Checksum] AS [Accounts_Checksum]
			, [STG_INR_SRC].[cBCloudBankAccountID] AS [cBCloudBankAccountID]
			, ROW_NUMBER()OVER(PARTITION BY [STG_INR_SRC].[HK_GLAccount] ORDER BY [STG_INR_SRC].[LOADDT]) AS [DUMMY]
		FROM [CSG_1_FOODS_stage].[Accounts] [STG_INR_SRC]
	)
	INSERT INTO [raw].[SAT_CSG_1_FOODS_GLAccount](
		 [HK_GLAccount]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[HASHDIFF]
		,[ISDELETED]
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
		,[Account]
		,[Master_Sub_Account]
		,[AccountLevel]
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
		  [STG_SRC].[HK_GLAccount] AS [HK_GLAccount]
		, [STG_SRC].[LOADDT] AS [LOADDT]
		, [STG_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [STG_SRC].[LOADENDDT] AS [LOADENDDT]
		, [STG_SRC].[HASHDIFF] AS [HASHDIFF]
		, [STG_SRC].[ISDELETED] AS [ISDELETED]
		, [STG_SRC].[AccountLink] AS [AccountLink]
		, [STG_SRC].[iGLSegment0ID] AS [iGLSegment0ID]
		, [STG_SRC].[iGLSegment1ID] AS [iGLSegment1ID]
		, [STG_SRC].[iGLSegment2ID] AS [iGLSegment2ID]
		, [STG_SRC].[iGLSegment3ID] AS [iGLSegment3ID]
		, [STG_SRC].[iGLSegment4ID] AS [iGLSegment4ID]
		, [STG_SRC].[iGLSegment5ID] AS [iGLSegment5ID]
		, [STG_SRC].[iGLSegment6ID] AS [iGLSegment6ID]
		, [STG_SRC].[iGLSegment7ID] AS [iGLSegment7ID]
		, [STG_SRC].[iGLSegment8ID] AS [iGLSegment8ID]
		, [STG_SRC].[iGLSegment9ID] AS [iGLSegment9ID]
		, [STG_SRC].[Account] AS [Account]
		, [STG_SRC].[Master_Sub_Account] AS [Master_Sub_Account]
		, [STG_SRC].[AccountLevel] AS [AccountLevel]
		, [STG_SRC].[iAccountType] AS [iAccountType]
		, [STG_SRC].[SubAccOfLink] AS [SubAccOfLink]
		, [STG_SRC].[Dept] AS [Dept]
		, [STG_SRC].[Brch] AS [Brch]
		, [STG_SRC].[Jr] AS [Jr]
		, [STG_SRC].[Description] AS [Description]
		, [STG_SRC].[CaseAcc] AS [CaseAcc]
		, [STG_SRC].[ActiveAccount] AS [ActiveAccount]
		, [STG_SRC].[dAccountsTimeStamp] AS [dAccountsTimeStamp]
		, [STG_SRC].[cNextChequeNum] AS [cNextChequeNum]
		, [STG_SRC].[iReportCategoryID] AS [iReportCategoryID]
		, [STG_SRC].[fBankStatementBalance] AS [fBankStatementBalance]
		, [STG_SRC].[cExtDescription] AS [cExtDescription]
		, [STG_SRC].[iTaxTypeINVID] AS [iTaxTypeINVID]
		, [STG_SRC].[iTaxTypeCRNID] AS [iTaxTypeCRNID]
		, [STG_SRC].[iTaxTypeGRVID] AS [iTaxTypeGRVID]
		, [STG_SRC].[iTaxTypeRTSID] AS [iTaxTypeRTSID]
		, [STG_SRC].[iAllowICSales] AS [iAllowICSales]
		, [STG_SRC].[iAllowICPurchases] AS [iAllowICPurchases]
		, [STG_SRC].[iMBReportingCategoryID] AS [iMBReportingCategoryID]
		, [STG_SRC].[iMBCashFlowCategoryID] AS [iMBCashFlowCategoryID]
		, [STG_SRC].[bMBIsAsset] AS [bMBIsAsset]
		, [STG_SRC].[bMBIsGrant] AS [bMBIsGrant]
		, [STG_SRC].[iMBAssetClassificationID] AS [iMBAssetClassificationID]
		, [STG_SRC].[iMBAssetCategoryID] AS [iMBAssetCategoryID]
		, [STG_SRC].[iMBAssetTypeID] AS [iMBAssetTypeID]
		, [STG_SRC].[iMBGrantLevel1TypeID] AS [iMBGrantLevel1TypeID]
		, [STG_SRC].[iMBGrantLevel2TypeID] AS [iMBGrantLevel2TypeID]
		, [STG_SRC].[iMBGrantLevel3TypeID] AS [iMBGrantLevel3TypeID]
		, [STG_SRC].[bIsBranchLoanAccount] AS [bIsBranchLoanAccount]
		, [STG_SRC].[iForeignBankCurrencyID] AS [iForeignBankCurrencyID]
		, [STG_SRC].[iForeignBankPEXAccID] AS [iForeignBankPEXAccID]
		, [STG_SRC].[iForeignBankLEXAccID] AS [iForeignBankLEXAccID]
		, [STG_SRC].[bRevalueWithSellingRate] AS [bRevalueWithSellingRate]
		, [STG_SRC].[bPaymentsBasedTax] AS [bPaymentsBasedTax]
		, [STG_SRC].[cBankName] AS [cBankName]
		, [STG_SRC].[cBankAccountName] AS [cBankAccountName]
		, [STG_SRC].[cBankCode] AS [cBankCode]
		, [STG_SRC].[cBankAccountNumber] AS [cBankAccountNumber]
		, [STG_SRC].[cBranchName] AS [cBranchName]
		, [STG_SRC].[cSEPABranchCode] AS [cSEPABranchCode]
		, [STG_SRC].[cBankRefNr] AS [cBankRefNr]
		, [STG_SRC].[iAttributeGroupID] AS [iAttributeGroupID]
		, [STG_SRC].[xAttribute] AS [xAttribute]
		, [STG_SRC].[bForeignBankAcc] AS [bForeignBankAcc]
		, [STG_SRC].[Accounts_iBranchID] AS [Accounts_iBranchID]
		, [STG_SRC].[Accounts_dCreatedDate] AS [Accounts_dCreatedDate]
		, [STG_SRC].[Accounts_dModifiedDate] AS [Accounts_dModifiedDate]
		, [STG_SRC].[Accounts_iCreatedBranchID] AS [Accounts_iCreatedBranchID]
		, [STG_SRC].[Accounts_iModifiedBranchID] AS [Accounts_iModifiedBranchID]
		, [STG_SRC].[Accounts_iCreatedAgentID] AS [Accounts_iCreatedAgentID]
		, [STG_SRC].[Accounts_iModifiedAgentID] AS [Accounts_iModifiedAgentID]
		, [STG_SRC].[Accounts_iChangeSetID] AS [Accounts_iChangeSetID]
		, [STG_SRC].[Accounts_Checksum] AS [Accounts_Checksum]
		, [STG_SRC].[cBCloudBankAccountID] AS [cBCloudBankAccountID]
	FROM [STG_SRC]
	WHERE  [STG_SRC].[DUMMY] = 1
	;
END;


END;

 
 


GO
