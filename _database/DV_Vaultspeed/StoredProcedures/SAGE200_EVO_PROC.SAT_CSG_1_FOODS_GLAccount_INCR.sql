SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].SAT_CSG_1_FOODS_GLAccount_INCR AS 
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
BEGIN -- SAT_TEMP_TGT

	TRUNCATE TABLE [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_GLAccount];

	WITH [DIST_STG] AS 
	( 
		SELECT DISTINCT 
 			  [STG_DIS_SRC].[HK_GLAccount] AS [HK_GLAccount]
			, [STG_DIS_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		FROM [CSG_1_FOODS_stage].[Accounts] [STG_DIS_SRC]
	)
	, [TEMP_TABLE_SET] AS 
	( 
		SELECT 
			  [STG_TEMP_SRC].[HK_GLAccount] AS [HK_GLAccount]
			, [STG_TEMP_SRC].[LOADDT] AS [LOADDT]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, [STG_TEMP_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, [STG_TEMP_SRC].[DATATYPE] AS [DATATYPE]
			, 'STG' AS [SRC]
			, 1 AS [ORIGIN_ID]
			, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1',
				COALESCE(REPLACE(REPLACE(RTRIM(REPLACE(REPLACE( REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Master_Sub_Account] ),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[AccountLevel] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Account] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iAccountType] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[SubAccOfLink] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Dept] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Brch] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Jr] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Description] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[CaseAcc] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[ActiveAccount] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[dAccountsTimeStamp] , 103)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cNextChequeNum] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iReportCategoryID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[fBankStatementBalance] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cExtDescription] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iTaxTypeINVID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iTaxTypeCRNID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iTaxTypeGRVID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iTaxTypeRTSID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iAllowICSales] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iAllowICPurchases] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iMBReportingCategoryID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iMBCashFlowCategoryID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bMBIsAsset] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bMBIsGrant] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iMBAssetClassificationID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iMBAssetCategoryID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iMBAssetTypeID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iMBGrantLevel1TypeID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iMBGrantLevel2TypeID] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iMBGrantLevel3TypeID] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bIsBranchLoanAccount] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iForeignBankCurrencyID] ,
				1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[iForeignBankPEXAccID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iForeignBankLEXAccID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bRevalueWithSellingRate] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bPaymentsBasedTax] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cBankName] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cBankAccountName] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cBankCode] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cBankAccountNumber] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cBranchName] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cSEPABranchCode] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cBankRefNr] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iAttributeGroupID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bForeignBankAcc] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Accounts_iBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Accounts_dCreatedDate] , 103)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Accounts_dModifiedDate] , 103)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Accounts_iCreatedBranchID] , 1)),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Accounts_iModifiedBranchID] ,
				1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[Accounts_iCreatedAgentID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Accounts_iModifiedAgentID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Accounts_iChangeSetID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CAST([STG_TEMP_SRC].[Accounts_Checksum]  AS VARCHAR)),'#'),'|','\' + '|')
				+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cBCloudBankAccountID] ),'#'),'|','\' + '|')+ '|',' ','#' +
				'|'),'|' + '#',' ')),' ','|' + '#'),'#' + '|',' '),'#')),2)) AS [HASHDIFF]
			, CASE WHEN [STG_TEMP_SRC].[CHANGE_TYPE] = '-' THEN 'Y'  ELSE 'N'  END AS [ISDELETED]
			, [STG_TEMP_SRC].[AccountLink] AS [AccountLink]
			, [STG_TEMP_SRC].[iGLSegment0ID] AS [iGLSegment0ID]
			, [STG_TEMP_SRC].[iGLSegment1ID] AS [iGLSegment1ID]
			, [STG_TEMP_SRC].[iGLSegment2ID] AS [iGLSegment2ID]
			, [STG_TEMP_SRC].[iGLSegment3ID] AS [iGLSegment3ID]
			, [STG_TEMP_SRC].[iGLSegment4ID] AS [iGLSegment4ID]
			, [STG_TEMP_SRC].[iGLSegment5ID] AS [iGLSegment5ID]
			, [STG_TEMP_SRC].[iGLSegment6ID] AS [iGLSegment6ID]
			, [STG_TEMP_SRC].[iGLSegment7ID] AS [iGLSegment7ID]
			, [STG_TEMP_SRC].[iGLSegment8ID] AS [iGLSegment8ID]
			, [STG_TEMP_SRC].[iGLSegment9ID] AS [iGLSegment9ID]
			, [STG_TEMP_SRC].[Account] AS [Account]
			, [STG_TEMP_SRC].[Master_Sub_Account] AS [Master_Sub_Account]
			, [STG_TEMP_SRC].[AccountLevel] AS [AccountLevel]
			, [STG_TEMP_SRC].[iAccountType] AS [iAccountType]
			, [STG_TEMP_SRC].[SubAccOfLink] AS [SubAccOfLink]
			, [STG_TEMP_SRC].[Dept] AS [Dept]
			, [STG_TEMP_SRC].[Brch] AS [Brch]
			, [STG_TEMP_SRC].[Jr] AS [Jr]
			, [STG_TEMP_SRC].[Description] AS [Description]
			, [STG_TEMP_SRC].[CaseAcc] AS [CaseAcc]
			, [STG_TEMP_SRC].[ActiveAccount] AS [ActiveAccount]
			, [STG_TEMP_SRC].[dAccountsTimeStamp] AS [dAccountsTimeStamp]
			, [STG_TEMP_SRC].[cNextChequeNum] AS [cNextChequeNum]
			, [STG_TEMP_SRC].[iReportCategoryID] AS [iReportCategoryID]
			, [STG_TEMP_SRC].[fBankStatementBalance] AS [fBankStatementBalance]
			, [STG_TEMP_SRC].[cExtDescription] AS [cExtDescription]
			, [STG_TEMP_SRC].[iTaxTypeINVID] AS [iTaxTypeINVID]
			, [STG_TEMP_SRC].[iTaxTypeCRNID] AS [iTaxTypeCRNID]
			, [STG_TEMP_SRC].[iTaxTypeGRVID] AS [iTaxTypeGRVID]
			, [STG_TEMP_SRC].[iTaxTypeRTSID] AS [iTaxTypeRTSID]
			, [STG_TEMP_SRC].[iAllowICSales] AS [iAllowICSales]
			, [STG_TEMP_SRC].[iAllowICPurchases] AS [iAllowICPurchases]
			, [STG_TEMP_SRC].[iMBReportingCategoryID] AS [iMBReportingCategoryID]
			, [STG_TEMP_SRC].[iMBCashFlowCategoryID] AS [iMBCashFlowCategoryID]
			, [STG_TEMP_SRC].[bMBIsAsset] AS [bMBIsAsset]
			, [STG_TEMP_SRC].[bMBIsGrant] AS [bMBIsGrant]
			, [STG_TEMP_SRC].[iMBAssetClassificationID] AS [iMBAssetClassificationID]
			, [STG_TEMP_SRC].[iMBAssetCategoryID] AS [iMBAssetCategoryID]
			, [STG_TEMP_SRC].[iMBAssetTypeID] AS [iMBAssetTypeID]
			, [STG_TEMP_SRC].[iMBGrantLevel1TypeID] AS [iMBGrantLevel1TypeID]
			, [STG_TEMP_SRC].[iMBGrantLevel2TypeID] AS [iMBGrantLevel2TypeID]
			, [STG_TEMP_SRC].[iMBGrantLevel3TypeID] AS [iMBGrantLevel3TypeID]
			, [STG_TEMP_SRC].[bIsBranchLoanAccount] AS [bIsBranchLoanAccount]
			, [STG_TEMP_SRC].[iForeignBankCurrencyID] AS [iForeignBankCurrencyID]
			, [STG_TEMP_SRC].[iForeignBankPEXAccID] AS [iForeignBankPEXAccID]
			, [STG_TEMP_SRC].[iForeignBankLEXAccID] AS [iForeignBankLEXAccID]
			, [STG_TEMP_SRC].[bRevalueWithSellingRate] AS [bRevalueWithSellingRate]
			, [STG_TEMP_SRC].[bPaymentsBasedTax] AS [bPaymentsBasedTax]
			, [STG_TEMP_SRC].[cBankName] AS [cBankName]
			, [STG_TEMP_SRC].[cBankAccountName] AS [cBankAccountName]
			, [STG_TEMP_SRC].[cBankCode] AS [cBankCode]
			, [STG_TEMP_SRC].[cBankAccountNumber] AS [cBankAccountNumber]
			, [STG_TEMP_SRC].[cBranchName] AS [cBranchName]
			, [STG_TEMP_SRC].[cSEPABranchCode] AS [cSEPABranchCode]
			, [STG_TEMP_SRC].[cBankRefNr] AS [cBankRefNr]
			, [STG_TEMP_SRC].[iAttributeGroupID] AS [iAttributeGroupID]
			, [STG_TEMP_SRC].[xAttribute] AS [xAttribute]
			, [STG_TEMP_SRC].[bForeignBankAcc] AS [bForeignBankAcc]
			, [STG_TEMP_SRC].[Accounts_iBranchID] AS [Accounts_iBranchID]
			, [STG_TEMP_SRC].[Accounts_dCreatedDate] AS [Accounts_dCreatedDate]
			, [STG_TEMP_SRC].[Accounts_dModifiedDate] AS [Accounts_dModifiedDate]
			, [STG_TEMP_SRC].[Accounts_iCreatedBranchID] AS [Accounts_iCreatedBranchID]
			, [STG_TEMP_SRC].[Accounts_iModifiedBranchID] AS [Accounts_iModifiedBranchID]
			, [STG_TEMP_SRC].[Accounts_iCreatedAgentID] AS [Accounts_iCreatedAgentID]
			, [STG_TEMP_SRC].[Accounts_iModifiedAgentID] AS [Accounts_iModifiedAgentID]
			, [STG_TEMP_SRC].[Accounts_iChangeSetID] AS [Accounts_iChangeSetID]
			, [STG_TEMP_SRC].[Accounts_Checksum] AS [Accounts_Checksum]
			, [STG_TEMP_SRC].[cBCloudBankAccountID] AS [cBCloudBankAccountID]
		FROM [CSG_1_FOODS_stage].[Accounts] [STG_TEMP_SRC]
		WHERE  [STG_TEMP_SRC].[DATATYPE] = 'SRC'
		UNION ALL 
		SELECT 
			  [SAT_SRC].[HK_GLAccount] AS [HK_GLAccount]
			, [SAT_SRC].[LOADDT] AS [LOADDT]
			, [SAT_SRC].[LOADENDDT] AS [LOADENDDT]
			, [SAT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, 'SAT' AS [DATATYPE]
			, 'SAT' AS [SRC]
			, 0 AS [ORIGIN_ID]
			, [SAT_SRC].[HASHDIFF] AS [HASHDIFF]
			, [SAT_SRC].[ISDELETED] AS [ISDELETED]
			, [SAT_SRC].[AccountLink] AS [AccountLink]
			, [SAT_SRC].[iGLSegment0ID] AS [iGLSegment0ID]
			, [SAT_SRC].[iGLSegment1ID] AS [iGLSegment1ID]
			, [SAT_SRC].[iGLSegment2ID] AS [iGLSegment2ID]
			, [SAT_SRC].[iGLSegment3ID] AS [iGLSegment3ID]
			, [SAT_SRC].[iGLSegment4ID] AS [iGLSegment4ID]
			, [SAT_SRC].[iGLSegment5ID] AS [iGLSegment5ID]
			, [SAT_SRC].[iGLSegment6ID] AS [iGLSegment6ID]
			, [SAT_SRC].[iGLSegment7ID] AS [iGLSegment7ID]
			, [SAT_SRC].[iGLSegment8ID] AS [iGLSegment8ID]
			, [SAT_SRC].[iGLSegment9ID] AS [iGLSegment9ID]
			, [SAT_SRC].[Account] AS [Account]
			, [SAT_SRC].[Master_Sub_Account] AS [Master_Sub_Account]
			, [SAT_SRC].[AccountLevel] AS [AccountLevel]
			, [SAT_SRC].[iAccountType] AS [iAccountType]
			, [SAT_SRC].[SubAccOfLink] AS [SubAccOfLink]
			, [SAT_SRC].[Dept] AS [Dept]
			, [SAT_SRC].[Brch] AS [Brch]
			, [SAT_SRC].[Jr] AS [Jr]
			, [SAT_SRC].[Description] AS [Description]
			, [SAT_SRC].[CaseAcc] AS [CaseAcc]
			, [SAT_SRC].[ActiveAccount] AS [ActiveAccount]
			, [SAT_SRC].[dAccountsTimeStamp] AS [dAccountsTimeStamp]
			, [SAT_SRC].[cNextChequeNum] AS [cNextChequeNum]
			, [SAT_SRC].[iReportCategoryID] AS [iReportCategoryID]
			, [SAT_SRC].[fBankStatementBalance] AS [fBankStatementBalance]
			, [SAT_SRC].[cExtDescription] AS [cExtDescription]
			, [SAT_SRC].[iTaxTypeINVID] AS [iTaxTypeINVID]
			, [SAT_SRC].[iTaxTypeCRNID] AS [iTaxTypeCRNID]
			, [SAT_SRC].[iTaxTypeGRVID] AS [iTaxTypeGRVID]
			, [SAT_SRC].[iTaxTypeRTSID] AS [iTaxTypeRTSID]
			, [SAT_SRC].[iAllowICSales] AS [iAllowICSales]
			, [SAT_SRC].[iAllowICPurchases] AS [iAllowICPurchases]
			, [SAT_SRC].[iMBReportingCategoryID] AS [iMBReportingCategoryID]
			, [SAT_SRC].[iMBCashFlowCategoryID] AS [iMBCashFlowCategoryID]
			, [SAT_SRC].[bMBIsAsset] AS [bMBIsAsset]
			, [SAT_SRC].[bMBIsGrant] AS [bMBIsGrant]
			, [SAT_SRC].[iMBAssetClassificationID] AS [iMBAssetClassificationID]
			, [SAT_SRC].[iMBAssetCategoryID] AS [iMBAssetCategoryID]
			, [SAT_SRC].[iMBAssetTypeID] AS [iMBAssetTypeID]
			, [SAT_SRC].[iMBGrantLevel1TypeID] AS [iMBGrantLevel1TypeID]
			, [SAT_SRC].[iMBGrantLevel2TypeID] AS [iMBGrantLevel2TypeID]
			, [SAT_SRC].[iMBGrantLevel3TypeID] AS [iMBGrantLevel3TypeID]
			, [SAT_SRC].[bIsBranchLoanAccount] AS [bIsBranchLoanAccount]
			, [SAT_SRC].[iForeignBankCurrencyID] AS [iForeignBankCurrencyID]
			, [SAT_SRC].[iForeignBankPEXAccID] AS [iForeignBankPEXAccID]
			, [SAT_SRC].[iForeignBankLEXAccID] AS [iForeignBankLEXAccID]
			, [SAT_SRC].[bRevalueWithSellingRate] AS [bRevalueWithSellingRate]
			, [SAT_SRC].[bPaymentsBasedTax] AS [bPaymentsBasedTax]
			, [SAT_SRC].[cBankName] AS [cBankName]
			, [SAT_SRC].[cBankAccountName] AS [cBankAccountName]
			, [SAT_SRC].[cBankCode] AS [cBankCode]
			, [SAT_SRC].[cBankAccountNumber] AS [cBankAccountNumber]
			, [SAT_SRC].[cBranchName] AS [cBranchName]
			, [SAT_SRC].[cSEPABranchCode] AS [cSEPABranchCode]
			, [SAT_SRC].[cBankRefNr] AS [cBankRefNr]
			, [SAT_SRC].[iAttributeGroupID] AS [iAttributeGroupID]
			, [SAT_SRC].[xAttribute] AS [xAttribute]
			, [SAT_SRC].[bForeignBankAcc] AS [bForeignBankAcc]
			, [SAT_SRC].[Accounts_iBranchID] AS [Accounts_iBranchID]
			, [SAT_SRC].[Accounts_dCreatedDate] AS [Accounts_dCreatedDate]
			, [SAT_SRC].[Accounts_dModifiedDate] AS [Accounts_dModifiedDate]
			, [SAT_SRC].[Accounts_iCreatedBranchID] AS [Accounts_iCreatedBranchID]
			, [SAT_SRC].[Accounts_iModifiedBranchID] AS [Accounts_iModifiedBranchID]
			, [SAT_SRC].[Accounts_iCreatedAgentID] AS [Accounts_iCreatedAgentID]
			, [SAT_SRC].[Accounts_iModifiedAgentID] AS [Accounts_iModifiedAgentID]
			, [SAT_SRC].[Accounts_iChangeSetID] AS [Accounts_iChangeSetID]
			, [SAT_SRC].[Accounts_Checksum] AS [Accounts_Checksum]
			, [SAT_SRC].[cBCloudBankAccountID] AS [cBCloudBankAccountID]
		FROM [raw].[SAT_CSG_1_FOODS_GLAccount] [SAT_SRC]
		INNER JOIN [DIST_STG] ON  [SAT_SRC].[HK_GLAccount] = [DIST_STG].[HK_GLAccount]
		WHERE  [SAT_SRC].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	INSERT INTO [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_GLAccount](
		 [HK_GLAccount]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[DATATYPE]
		,[SRC]
		,[EQUAL]
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
		  [TEMP_TABLE_SET].[HK_GLAccount] AS [HK_GLAccount]
		, [TEMP_TABLE_SET].[LOADDT] AS [LOADDT]
		, [TEMP_TABLE_SET].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [TEMP_TABLE_SET].[LOADENDDT] AS [LOADENDDT]
		, [TEMP_TABLE_SET].[DATATYPE] AS [DATATYPE]
		, [TEMP_TABLE_SET].[SRC] AS [SRC]
		, CASE WHEN [TEMP_TABLE_SET].[SRC] = 'STG' AND CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HASHDIFF]  AS VARCHAR) = LAG( CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HASHDIFF]  AS VARCHAR),1)
			OVER(PARTITION BY [TEMP_TABLE_SET].[HK_GLAccount] ORDER BY [TEMP_TABLE_SET].[LOADDT],
			[TEMP_TABLE_SET].[ORIGIN_ID])THEN 1 ELSE 0 END AS [EQUAL]
		, [TEMP_TABLE_SET].[HASHDIFF] AS [HASHDIFF]
		, [TEMP_TABLE_SET].[ISDELETED] AS [ISDELETED]
		, [TEMP_TABLE_SET].[AccountLink] AS [AccountLink]
		, [TEMP_TABLE_SET].[iGLSegment0ID] AS [iGLSegment0ID]
		, [TEMP_TABLE_SET].[iGLSegment1ID] AS [iGLSegment1ID]
		, [TEMP_TABLE_SET].[iGLSegment2ID] AS [iGLSegment2ID]
		, [TEMP_TABLE_SET].[iGLSegment3ID] AS [iGLSegment3ID]
		, [TEMP_TABLE_SET].[iGLSegment4ID] AS [iGLSegment4ID]
		, [TEMP_TABLE_SET].[iGLSegment5ID] AS [iGLSegment5ID]
		, [TEMP_TABLE_SET].[iGLSegment6ID] AS [iGLSegment6ID]
		, [TEMP_TABLE_SET].[iGLSegment7ID] AS [iGLSegment7ID]
		, [TEMP_TABLE_SET].[iGLSegment8ID] AS [iGLSegment8ID]
		, [TEMP_TABLE_SET].[iGLSegment9ID] AS [iGLSegment9ID]
		, [TEMP_TABLE_SET].[Account] AS [Account]
		, [TEMP_TABLE_SET].[Master_Sub_Account] AS [Master_Sub_Account]
		, [TEMP_TABLE_SET].[AccountLevel] AS [AccountLevel]
		, [TEMP_TABLE_SET].[iAccountType] AS [iAccountType]
		, [TEMP_TABLE_SET].[SubAccOfLink] AS [SubAccOfLink]
		, [TEMP_TABLE_SET].[Dept] AS [Dept]
		, [TEMP_TABLE_SET].[Brch] AS [Brch]
		, [TEMP_TABLE_SET].[Jr] AS [Jr]
		, [TEMP_TABLE_SET].[Description] AS [Description]
		, [TEMP_TABLE_SET].[CaseAcc] AS [CaseAcc]
		, [TEMP_TABLE_SET].[ActiveAccount] AS [ActiveAccount]
		, [TEMP_TABLE_SET].[dAccountsTimeStamp] AS [dAccountsTimeStamp]
		, [TEMP_TABLE_SET].[cNextChequeNum] AS [cNextChequeNum]
		, [TEMP_TABLE_SET].[iReportCategoryID] AS [iReportCategoryID]
		, [TEMP_TABLE_SET].[fBankStatementBalance] AS [fBankStatementBalance]
		, [TEMP_TABLE_SET].[cExtDescription] AS [cExtDescription]
		, [TEMP_TABLE_SET].[iTaxTypeINVID] AS [iTaxTypeINVID]
		, [TEMP_TABLE_SET].[iTaxTypeCRNID] AS [iTaxTypeCRNID]
		, [TEMP_TABLE_SET].[iTaxTypeGRVID] AS [iTaxTypeGRVID]
		, [TEMP_TABLE_SET].[iTaxTypeRTSID] AS [iTaxTypeRTSID]
		, [TEMP_TABLE_SET].[iAllowICSales] AS [iAllowICSales]
		, [TEMP_TABLE_SET].[iAllowICPurchases] AS [iAllowICPurchases]
		, [TEMP_TABLE_SET].[iMBReportingCategoryID] AS [iMBReportingCategoryID]
		, [TEMP_TABLE_SET].[iMBCashFlowCategoryID] AS [iMBCashFlowCategoryID]
		, [TEMP_TABLE_SET].[bMBIsAsset] AS [bMBIsAsset]
		, [TEMP_TABLE_SET].[bMBIsGrant] AS [bMBIsGrant]
		, [TEMP_TABLE_SET].[iMBAssetClassificationID] AS [iMBAssetClassificationID]
		, [TEMP_TABLE_SET].[iMBAssetCategoryID] AS [iMBAssetCategoryID]
		, [TEMP_TABLE_SET].[iMBAssetTypeID] AS [iMBAssetTypeID]
		, [TEMP_TABLE_SET].[iMBGrantLevel1TypeID] AS [iMBGrantLevel1TypeID]
		, [TEMP_TABLE_SET].[iMBGrantLevel2TypeID] AS [iMBGrantLevel2TypeID]
		, [TEMP_TABLE_SET].[iMBGrantLevel3TypeID] AS [iMBGrantLevel3TypeID]
		, [TEMP_TABLE_SET].[bIsBranchLoanAccount] AS [bIsBranchLoanAccount]
		, [TEMP_TABLE_SET].[iForeignBankCurrencyID] AS [iForeignBankCurrencyID]
		, [TEMP_TABLE_SET].[iForeignBankPEXAccID] AS [iForeignBankPEXAccID]
		, [TEMP_TABLE_SET].[iForeignBankLEXAccID] AS [iForeignBankLEXAccID]
		, [TEMP_TABLE_SET].[bRevalueWithSellingRate] AS [bRevalueWithSellingRate]
		, [TEMP_TABLE_SET].[bPaymentsBasedTax] AS [bPaymentsBasedTax]
		, [TEMP_TABLE_SET].[cBankName] AS [cBankName]
		, [TEMP_TABLE_SET].[cBankAccountName] AS [cBankAccountName]
		, [TEMP_TABLE_SET].[cBankCode] AS [cBankCode]
		, [TEMP_TABLE_SET].[cBankAccountNumber] AS [cBankAccountNumber]
		, [TEMP_TABLE_SET].[cBranchName] AS [cBranchName]
		, [TEMP_TABLE_SET].[cSEPABranchCode] AS [cSEPABranchCode]
		, [TEMP_TABLE_SET].[cBankRefNr] AS [cBankRefNr]
		, [TEMP_TABLE_SET].[iAttributeGroupID] AS [iAttributeGroupID]
		, [TEMP_TABLE_SET].[xAttribute] AS [xAttribute]
		, [TEMP_TABLE_SET].[bForeignBankAcc] AS [bForeignBankAcc]
		, [TEMP_TABLE_SET].[Accounts_iBranchID] AS [Accounts_iBranchID]
		, [TEMP_TABLE_SET].[Accounts_dCreatedDate] AS [Accounts_dCreatedDate]
		, [TEMP_TABLE_SET].[Accounts_dModifiedDate] AS [Accounts_dModifiedDate]
		, [TEMP_TABLE_SET].[Accounts_iCreatedBranchID] AS [Accounts_iCreatedBranchID]
		, [TEMP_TABLE_SET].[Accounts_iModifiedBranchID] AS [Accounts_iModifiedBranchID]
		, [TEMP_TABLE_SET].[Accounts_iCreatedAgentID] AS [Accounts_iCreatedAgentID]
		, [TEMP_TABLE_SET].[Accounts_iModifiedAgentID] AS [Accounts_iModifiedAgentID]
		, [TEMP_TABLE_SET].[Accounts_iChangeSetID] AS [Accounts_iChangeSetID]
		, [TEMP_TABLE_SET].[Accounts_Checksum] AS [Accounts_Checksum]
		, [TEMP_TABLE_SET].[cBCloudBankAccountID] AS [cBCloudBankAccountID]
	FROM [TEMP_TABLE_SET]
	;
END;


BEGIN -- SAT_INUR_TGT

	INSERT INTO [raw].[SAT_CSG_1_FOODS_GLAccount](
		 [HK_GLAccount]
		,[LOADDT]
		,[LOADENDDT]
		,[LOAD_CYCLE_ID]
		,[ISDELETED]
		,[HASHDIFF]
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
		  [SAT_TEMP_SRC_INUR].[HK_GLAccount] AS [HK_GLAccount]
		, [SAT_TEMP_SRC_INUR].[LOADDT] AS [LOADDT]
		, [SAT_TEMP_SRC_INUR].[LOADENDDT] AS [LOADENDDT]
		, [SAT_TEMP_SRC_INUR].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [SAT_TEMP_SRC_INUR].[ISDELETED] AS [ISDELETED]
		, [SAT_TEMP_SRC_INUR].[HASHDIFF] AS [HASHDIFF]
		, [SAT_TEMP_SRC_INUR].[AccountLink] AS [AccountLink]
		, [SAT_TEMP_SRC_INUR].[iGLSegment0ID] AS [iGLSegment0ID]
		, [SAT_TEMP_SRC_INUR].[iGLSegment1ID] AS [iGLSegment1ID]
		, [SAT_TEMP_SRC_INUR].[iGLSegment2ID] AS [iGLSegment2ID]
		, [SAT_TEMP_SRC_INUR].[iGLSegment3ID] AS [iGLSegment3ID]
		, [SAT_TEMP_SRC_INUR].[iGLSegment4ID] AS [iGLSegment4ID]
		, [SAT_TEMP_SRC_INUR].[iGLSegment5ID] AS [iGLSegment5ID]
		, [SAT_TEMP_SRC_INUR].[iGLSegment6ID] AS [iGLSegment6ID]
		, [SAT_TEMP_SRC_INUR].[iGLSegment7ID] AS [iGLSegment7ID]
		, [SAT_TEMP_SRC_INUR].[iGLSegment8ID] AS [iGLSegment8ID]
		, [SAT_TEMP_SRC_INUR].[iGLSegment9ID] AS [iGLSegment9ID]
		, [SAT_TEMP_SRC_INUR].[Account] AS [Account]
		, [SAT_TEMP_SRC_INUR].[Master_Sub_Account] AS [Master_Sub_Account]
		, [SAT_TEMP_SRC_INUR].[AccountLevel] AS [AccountLevel]
		, [SAT_TEMP_SRC_INUR].[iAccountType] AS [iAccountType]
		, [SAT_TEMP_SRC_INUR].[SubAccOfLink] AS [SubAccOfLink]
		, [SAT_TEMP_SRC_INUR].[Dept] AS [Dept]
		, [SAT_TEMP_SRC_INUR].[Brch] AS [Brch]
		, [SAT_TEMP_SRC_INUR].[Jr] AS [Jr]
		, [SAT_TEMP_SRC_INUR].[Description] AS [Description]
		, [SAT_TEMP_SRC_INUR].[CaseAcc] AS [CaseAcc]
		, [SAT_TEMP_SRC_INUR].[ActiveAccount] AS [ActiveAccount]
		, [SAT_TEMP_SRC_INUR].[dAccountsTimeStamp] AS [dAccountsTimeStamp]
		, [SAT_TEMP_SRC_INUR].[cNextChequeNum] AS [cNextChequeNum]
		, [SAT_TEMP_SRC_INUR].[iReportCategoryID] AS [iReportCategoryID]
		, [SAT_TEMP_SRC_INUR].[fBankStatementBalance] AS [fBankStatementBalance]
		, [SAT_TEMP_SRC_INUR].[cExtDescription] AS [cExtDescription]
		, [SAT_TEMP_SRC_INUR].[iTaxTypeINVID] AS [iTaxTypeINVID]
		, [SAT_TEMP_SRC_INUR].[iTaxTypeCRNID] AS [iTaxTypeCRNID]
		, [SAT_TEMP_SRC_INUR].[iTaxTypeGRVID] AS [iTaxTypeGRVID]
		, [SAT_TEMP_SRC_INUR].[iTaxTypeRTSID] AS [iTaxTypeRTSID]
		, [SAT_TEMP_SRC_INUR].[iAllowICSales] AS [iAllowICSales]
		, [SAT_TEMP_SRC_INUR].[iAllowICPurchases] AS [iAllowICPurchases]
		, [SAT_TEMP_SRC_INUR].[iMBReportingCategoryID] AS [iMBReportingCategoryID]
		, [SAT_TEMP_SRC_INUR].[iMBCashFlowCategoryID] AS [iMBCashFlowCategoryID]
		, [SAT_TEMP_SRC_INUR].[bMBIsAsset] AS [bMBIsAsset]
		, [SAT_TEMP_SRC_INUR].[bMBIsGrant] AS [bMBIsGrant]
		, [SAT_TEMP_SRC_INUR].[iMBAssetClassificationID] AS [iMBAssetClassificationID]
		, [SAT_TEMP_SRC_INUR].[iMBAssetCategoryID] AS [iMBAssetCategoryID]
		, [SAT_TEMP_SRC_INUR].[iMBAssetTypeID] AS [iMBAssetTypeID]
		, [SAT_TEMP_SRC_INUR].[iMBGrantLevel1TypeID] AS [iMBGrantLevel1TypeID]
		, [SAT_TEMP_SRC_INUR].[iMBGrantLevel2TypeID] AS [iMBGrantLevel2TypeID]
		, [SAT_TEMP_SRC_INUR].[iMBGrantLevel3TypeID] AS [iMBGrantLevel3TypeID]
		, [SAT_TEMP_SRC_INUR].[bIsBranchLoanAccount] AS [bIsBranchLoanAccount]
		, [SAT_TEMP_SRC_INUR].[iForeignBankCurrencyID] AS [iForeignBankCurrencyID]
		, [SAT_TEMP_SRC_INUR].[iForeignBankPEXAccID] AS [iForeignBankPEXAccID]
		, [SAT_TEMP_SRC_INUR].[iForeignBankLEXAccID] AS [iForeignBankLEXAccID]
		, [SAT_TEMP_SRC_INUR].[bRevalueWithSellingRate] AS [bRevalueWithSellingRate]
		, [SAT_TEMP_SRC_INUR].[bPaymentsBasedTax] AS [bPaymentsBasedTax]
		, [SAT_TEMP_SRC_INUR].[cBankName] AS [cBankName]
		, [SAT_TEMP_SRC_INUR].[cBankAccountName] AS [cBankAccountName]
		, [SAT_TEMP_SRC_INUR].[cBankCode] AS [cBankCode]
		, [SAT_TEMP_SRC_INUR].[cBankAccountNumber] AS [cBankAccountNumber]
		, [SAT_TEMP_SRC_INUR].[cBranchName] AS [cBranchName]
		, [SAT_TEMP_SRC_INUR].[cSEPABranchCode] AS [cSEPABranchCode]
		, [SAT_TEMP_SRC_INUR].[cBankRefNr] AS [cBankRefNr]
		, [SAT_TEMP_SRC_INUR].[iAttributeGroupID] AS [iAttributeGroupID]
		, [SAT_TEMP_SRC_INUR].[xAttribute] AS [xAttribute]
		, [SAT_TEMP_SRC_INUR].[bForeignBankAcc] AS [bForeignBankAcc]
		, [SAT_TEMP_SRC_INUR].[Accounts_iBranchID] AS [Accounts_iBranchID]
		, [SAT_TEMP_SRC_INUR].[Accounts_dCreatedDate] AS [Accounts_dCreatedDate]
		, [SAT_TEMP_SRC_INUR].[Accounts_dModifiedDate] AS [Accounts_dModifiedDate]
		, [SAT_TEMP_SRC_INUR].[Accounts_iCreatedBranchID] AS [Accounts_iCreatedBranchID]
		, [SAT_TEMP_SRC_INUR].[Accounts_iModifiedBranchID] AS [Accounts_iModifiedBranchID]
		, [SAT_TEMP_SRC_INUR].[Accounts_iCreatedAgentID] AS [Accounts_iCreatedAgentID]
		, [SAT_TEMP_SRC_INUR].[Accounts_iModifiedAgentID] AS [Accounts_iModifiedAgentID]
		, [SAT_TEMP_SRC_INUR].[Accounts_iChangeSetID] AS [Accounts_iChangeSetID]
		, [SAT_TEMP_SRC_INUR].[Accounts_Checksum] AS [Accounts_Checksum]
		, [SAT_TEMP_SRC_INUR].[cBCloudBankAccountID] AS [cBCloudBankAccountID]
	FROM [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_GLAccount] [SAT_TEMP_SRC_INUR]
	WHERE  [SAT_TEMP_SRC_INUR].[SRC] = 'STG' AND [SAT_TEMP_SRC_INUR].[EQUAL] = 0
	;
END;


BEGIN -- SAT_ED_TGT

	WITH [CALC_LOAD_END_DATE] AS 
	( 
		SELECT
			  [SAT_TEMP_SRC_US].[HK_GLAccount] AS [HK_GLAccount]
			, [SAT_TEMP_SRC_US].[LOADDT] AS [LOADDT]
			, COALESCE(LEAD([SAT_TEMP_SRC_US].[LOADDT],1)
				OVER(PARTITION BY [SAT_TEMP_SRC_US].[HK_GLAccount] ORDER BY [SAT_TEMP_SRC_US].[LOADDT]), CONVERT(DATETIME2,
				'31/12/2999' , 103)) AS [LOADENDDT]
		FROM [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_GLAccount] [SAT_TEMP_SRC_US]
		WHERE  [SAT_TEMP_SRC_US].[EQUAL] = 0
	)
	, [FILTER_LOAD_END_DATE] AS 
	( 
		SELECT
			  [CALC_LOAD_END_DATE].[HK_GLAccount] AS [HK_GLAccount]
			, [CALC_LOAD_END_DATE].[LOADDT] AS [LOADDT]
			, [CALC_LOAD_END_DATE].[LOADENDDT] AS [LOADENDDT]
		FROM [CALC_LOAD_END_DATE]
		WHERE  [CALC_LOAD_END_DATE].[LOADENDDT] != CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	UPDATE [SAT_ED_TGT]
	SET 
		 [LOADENDDT] =  [FILTER_LOAD_END_DATE].[LOADENDDT]
	FROM [FILTER_LOAD_END_DATE]
	JOIN [raw].[SAT_CSG_1_FOODS_GLAccount] [SAT_ED_TGT] ON 1 = 1 
	WHERE [SAT_ED_TGT].[HK_GLAccount] =  [FILTER_LOAD_END_DATE].[HK_GLAccount]
	  AND [SAT_ED_TGT].[LOADDT] =  [FILTER_LOAD_END_DATE].[LOADDT]
	;
END;


END;

 
 


GO
