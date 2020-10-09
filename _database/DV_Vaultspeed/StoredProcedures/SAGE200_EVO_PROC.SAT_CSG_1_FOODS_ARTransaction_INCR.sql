SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].SAT_CSG_1_FOODS_ARTransaction_INCR AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_ARTransaction];

	WITH [DIST_STG] AS 
	( 
		SELECT DISTINCT 
 			  [STG_DIS_SRC].[HK_ARTransaction] AS [HK_ARTransaction]
			, [STG_DIS_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		FROM [CSG_1_FOODS_stage].[PostAR] [STG_DIS_SRC]
	)
	, [TEMP_TABLE_SET] AS 
	( 
		SELECT 
			  [STG_TEMP_SRC].[HK_ARTransaction] AS [HK_ARTransaction]
			, [STG_TEMP_SRC].[LOADDT] AS [LOADDT]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, [STG_TEMP_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, [STG_TEMP_SRC].[DATATYPE] AS [DATATYPE]
			, 'STG' AS [SRC]
			, 1 AS [ORIGIN_ID]
			, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1',
				COALESCE(REPLACE(REPLACE(RTRIM(REPLACE(REPLACE( REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[TxDate] , 103)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Id] ),'#')
				,'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[TrCodeID] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Debit] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Credit] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iCurrencyID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[fExchangeRate] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[fForeignDebit] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[fForeignCredit] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Description] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[TaxTypeID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Order_No] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[ExtOrderNum] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Tax_Amount] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[fForeignTax] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Outstanding] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[fForeignOutstanding] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[InvNumKey] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[RepID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[LinkAccCode] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[TillID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[CRCCheck] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[DTStamp] , 103)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[UserName] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iTaxPeriodID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[fJCRepCost] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iAge] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[dDateAged] , 103)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iPostSettlementTermsID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iTxBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iMBPropertyID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iMBPortionID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iMBServiceID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iMBMeterID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iMBPropertyPortionServiceID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bPBTPaid] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iGLTaxAccountID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iTransactionType] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[PostAR_iBranchID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[PostAR_dCreatedDate] , 103)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[PostAR_dModifiedDate] , 103)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[PostAR_iCreatedBranchID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[PostAR_iModifiedBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[PostAR_iCreatedAgentID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[PostAR_iModifiedAgentID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[PostAR_iChangeSetID] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CAST([STG_TEMP_SRC].[PostAR_Checksum]  AS VARCHAR)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[SagePayExtra1] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[SagePayExtra2] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[SagePayExtra3] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iMajorIndustryCodeID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iTaxBadDebtState] , 1)),'#'),'|','\' + '|')+
				'|',' ','#' + '|'),'|' + '#',' ')),' ','|' + '#'),'#' + '|',' '),'#')),2)) AS [HASHDIFF]
			, CASE WHEN [STG_TEMP_SRC].[CHANGE_TYPE] = '-' THEN 'Y'  ELSE 'N'  END AS [ISDELETED]
			, [STG_TEMP_SRC].[AutoIdx] AS [AutoIdx]
			, [STG_TEMP_SRC].[AccountLink] AS [AccountLink]
			, [STG_TEMP_SRC].[Project] AS [Project]
			, [STG_TEMP_SRC].[Reference] AS [Reference]
			, [STG_TEMP_SRC].[cAuditNumber] AS [cAuditNumber]
			, [STG_TEMP_SRC].[cReference2] AS [cReference2]
			, [STG_TEMP_SRC].[TxDate] AS [TxDate]
			, [STG_TEMP_SRC].[Id] AS [Id]
			, [STG_TEMP_SRC].[TrCodeID] AS [TrCodeID]
			, [STG_TEMP_SRC].[Debit] AS [Debit]
			, [STG_TEMP_SRC].[Credit] AS [Credit]
			, [STG_TEMP_SRC].[iCurrencyID] AS [iCurrencyID]
			, [STG_TEMP_SRC].[fExchangeRate] AS [fExchangeRate]
			, [STG_TEMP_SRC].[fForeignDebit] AS [fForeignDebit]
			, [STG_TEMP_SRC].[fForeignCredit] AS [fForeignCredit]
			, [STG_TEMP_SRC].[Description] AS [Description]
			, [STG_TEMP_SRC].[TaxTypeID] AS [TaxTypeID]
			, [STG_TEMP_SRC].[Order_No] AS [Order_No]
			, [STG_TEMP_SRC].[ExtOrderNum] AS [ExtOrderNum]
			, [STG_TEMP_SRC].[Tax_Amount] AS [Tax_Amount]
			, [STG_TEMP_SRC].[fForeignTax] AS [fForeignTax]
			, [STG_TEMP_SRC].[Outstanding] AS [Outstanding]
			, [STG_TEMP_SRC].[fForeignOutstanding] AS [fForeignOutstanding]
			, [STG_TEMP_SRC].[cAllocs] AS [cAllocs]
			, [STG_TEMP_SRC].[InvNumKey] AS [InvNumKey]
			, [STG_TEMP_SRC].[RepID] AS [RepID]
			, [STG_TEMP_SRC].[LinkAccCode] AS [LinkAccCode]
			, [STG_TEMP_SRC].[TillID] AS [TillID]
			, [STG_TEMP_SRC].[CRCCheck] AS [CRCCheck]
			, [STG_TEMP_SRC].[DTStamp] AS [DTStamp]
			, [STG_TEMP_SRC].[UserName] AS [UserName]
			, [STG_TEMP_SRC].[iTaxPeriodID] AS [iTaxPeriodID]
			, [STG_TEMP_SRC].[fJCRepCost] AS [fJCRepCost]
			, [STG_TEMP_SRC].[iAge] AS [iAge]
			, [STG_TEMP_SRC].[dDateAged] AS [dDateAged]
			, [STG_TEMP_SRC].[iPostSettlementTermsID] AS [iPostSettlementTermsID]
			, [STG_TEMP_SRC].[iTxBranchID] AS [iTxBranchID]
			, [STG_TEMP_SRC].[iMBPropertyID] AS [iMBPropertyID]
			, [STG_TEMP_SRC].[iMBPortionID] AS [iMBPortionID]
			, [STG_TEMP_SRC].[iMBServiceID] AS [iMBServiceID]
			, [STG_TEMP_SRC].[iMBMeterID] AS [iMBMeterID]
			, [STG_TEMP_SRC].[iMBPropertyPortionServiceID] AS [iMBPropertyPortionServiceID]
			, [STG_TEMP_SRC].[bPBTPaid] AS [bPBTPaid]
			, [STG_TEMP_SRC].[iGLTaxAccountID] AS [iGLTaxAccountID]
			, [STG_TEMP_SRC].[iTransactionType] AS [iTransactionType]
			, [STG_TEMP_SRC].[PostAR_iBranchID] AS [PostAR_iBranchID]
			, [STG_TEMP_SRC].[PostAR_dCreatedDate] AS [PostAR_dCreatedDate]
			, [STG_TEMP_SRC].[PostAR_dModifiedDate] AS [PostAR_dModifiedDate]
			, [STG_TEMP_SRC].[PostAR_iCreatedBranchID] AS [PostAR_iCreatedBranchID]
			, [STG_TEMP_SRC].[PostAR_iModifiedBranchID] AS [PostAR_iModifiedBranchID]
			, [STG_TEMP_SRC].[PostAR_iCreatedAgentID] AS [PostAR_iCreatedAgentID]
			, [STG_TEMP_SRC].[PostAR_iModifiedAgentID] AS [PostAR_iModifiedAgentID]
			, [STG_TEMP_SRC].[PostAR_iChangeSetID] AS [PostAR_iChangeSetID]
			, [STG_TEMP_SRC].[PostAR_Checksum] AS [PostAR_Checksum]
			, [STG_TEMP_SRC].[SagePayExtra1] AS [SagePayExtra1]
			, [STG_TEMP_SRC].[SagePayExtra2] AS [SagePayExtra2]
			, [STG_TEMP_SRC].[SagePayExtra3] AS [SagePayExtra3]
			, [STG_TEMP_SRC].[iMajorIndustryCodeID] AS [iMajorIndustryCodeID]
			, [STG_TEMP_SRC].[iTaxBadDebtState] AS [iTaxBadDebtState]
		FROM [CSG_1_FOODS_stage].[PostAR] [STG_TEMP_SRC]
		WHERE  [STG_TEMP_SRC].[DATATYPE] = 'SRC'
		UNION ALL 
		SELECT 
			  [SAT_SRC].[HK_ARTransaction] AS [HK_ARTransaction]
			, [SAT_SRC].[LOADDT] AS [LOADDT]
			, [SAT_SRC].[LOADENDDT] AS [LOADENDDT]
			, [SAT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, 'SAT' AS [DATATYPE]
			, 'SAT' AS [SRC]
			, 0 AS [ORIGIN_ID]
			, [SAT_SRC].[HASHDIFF] AS [HASHDIFF]
			, [SAT_SRC].[ISDELETED] AS [ISDELETED]
			, [SAT_SRC].[AutoIdx] AS [AutoIdx]
			, [SAT_SRC].[AccountLink] AS [AccountLink]
			, [SAT_SRC].[Project] AS [Project]
			, [SAT_SRC].[Reference] AS [Reference]
			, [SAT_SRC].[cAuditNumber] AS [cAuditNumber]
			, [SAT_SRC].[cReference2] AS [cReference2]
			, [SAT_SRC].[TxDate] AS [TxDate]
			, [SAT_SRC].[Id] AS [Id]
			, [SAT_SRC].[TrCodeID] AS [TrCodeID]
			, [SAT_SRC].[Debit] AS [Debit]
			, [SAT_SRC].[Credit] AS [Credit]
			, [SAT_SRC].[iCurrencyID] AS [iCurrencyID]
			, [SAT_SRC].[fExchangeRate] AS [fExchangeRate]
			, [SAT_SRC].[fForeignDebit] AS [fForeignDebit]
			, [SAT_SRC].[fForeignCredit] AS [fForeignCredit]
			, [SAT_SRC].[Description] AS [Description]
			, [SAT_SRC].[TaxTypeID] AS [TaxTypeID]
			, [SAT_SRC].[Order_No] AS [Order_No]
			, [SAT_SRC].[ExtOrderNum] AS [ExtOrderNum]
			, [SAT_SRC].[Tax_Amount] AS [Tax_Amount]
			, [SAT_SRC].[fForeignTax] AS [fForeignTax]
			, [SAT_SRC].[Outstanding] AS [Outstanding]
			, [SAT_SRC].[fForeignOutstanding] AS [fForeignOutstanding]
			, [SAT_SRC].[cAllocs] AS [cAllocs]
			, [SAT_SRC].[InvNumKey] AS [InvNumKey]
			, [SAT_SRC].[RepID] AS [RepID]
			, [SAT_SRC].[LinkAccCode] AS [LinkAccCode]
			, [SAT_SRC].[TillID] AS [TillID]
			, [SAT_SRC].[CRCCheck] AS [CRCCheck]
			, [SAT_SRC].[DTStamp] AS [DTStamp]
			, [SAT_SRC].[UserName] AS [UserName]
			, [SAT_SRC].[iTaxPeriodID] AS [iTaxPeriodID]
			, [SAT_SRC].[fJCRepCost] AS [fJCRepCost]
			, [SAT_SRC].[iAge] AS [iAge]
			, [SAT_SRC].[dDateAged] AS [dDateAged]
			, [SAT_SRC].[iPostSettlementTermsID] AS [iPostSettlementTermsID]
			, [SAT_SRC].[iTxBranchID] AS [iTxBranchID]
			, [SAT_SRC].[iMBPropertyID] AS [iMBPropertyID]
			, [SAT_SRC].[iMBPortionID] AS [iMBPortionID]
			, [SAT_SRC].[iMBServiceID] AS [iMBServiceID]
			, [SAT_SRC].[iMBMeterID] AS [iMBMeterID]
			, [SAT_SRC].[iMBPropertyPortionServiceID] AS [iMBPropertyPortionServiceID]
			, [SAT_SRC].[bPBTPaid] AS [bPBTPaid]
			, [SAT_SRC].[iGLTaxAccountID] AS [iGLTaxAccountID]
			, [SAT_SRC].[iTransactionType] AS [iTransactionType]
			, [SAT_SRC].[PostAR_iBranchID] AS [PostAR_iBranchID]
			, [SAT_SRC].[PostAR_dCreatedDate] AS [PostAR_dCreatedDate]
			, [SAT_SRC].[PostAR_dModifiedDate] AS [PostAR_dModifiedDate]
			, [SAT_SRC].[PostAR_iCreatedBranchID] AS [PostAR_iCreatedBranchID]
			, [SAT_SRC].[PostAR_iModifiedBranchID] AS [PostAR_iModifiedBranchID]
			, [SAT_SRC].[PostAR_iCreatedAgentID] AS [PostAR_iCreatedAgentID]
			, [SAT_SRC].[PostAR_iModifiedAgentID] AS [PostAR_iModifiedAgentID]
			, [SAT_SRC].[PostAR_iChangeSetID] AS [PostAR_iChangeSetID]
			, [SAT_SRC].[PostAR_Checksum] AS [PostAR_Checksum]
			, [SAT_SRC].[SagePayExtra1] AS [SagePayExtra1]
			, [SAT_SRC].[SagePayExtra2] AS [SagePayExtra2]
			, [SAT_SRC].[SagePayExtra3] AS [SagePayExtra3]
			, [SAT_SRC].[iMajorIndustryCodeID] AS [iMajorIndustryCodeID]
			, [SAT_SRC].[iTaxBadDebtState] AS [iTaxBadDebtState]
		FROM [raw].[SAT_CSG_1_FOODS_ARTransaction] [SAT_SRC]
		INNER JOIN [DIST_STG] ON  [SAT_SRC].[HK_ARTransaction] = [DIST_STG].[HK_ARTransaction]
		WHERE  [SAT_SRC].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	INSERT INTO [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_ARTransaction](
		 [HK_ARTransaction]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[DATATYPE]
		,[SRC]
		,[EQUAL]
		,[HASHDIFF]
		,[ISDELETED]
		,[AutoIdx]
		,[AccountLink]
		,[Project]
		,[Reference]
		,[cAuditNumber]
		,[cReference2]
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
		,[RepID]
		,[LinkAccCode]
		,[TillID]
		,[CRCCheck]
		,[DTStamp]
		,[UserName]
		,[iTaxPeriodID]
		,[fJCRepCost]
		,[iAge]
		,[dDateAged]
		,[iPostSettlementTermsID]
		,[iTxBranchID]
		,[iMBPropertyID]
		,[iMBPortionID]
		,[iMBServiceID]
		,[iMBMeterID]
		,[iMBPropertyPortionServiceID]
		,[bPBTPaid]
		,[iGLTaxAccountID]
		,[iTransactionType]
		,[PostAR_iBranchID]
		,[PostAR_dCreatedDate]
		,[PostAR_dModifiedDate]
		,[PostAR_iCreatedBranchID]
		,[PostAR_iModifiedBranchID]
		,[PostAR_iCreatedAgentID]
		,[PostAR_iModifiedAgentID]
		,[PostAR_iChangeSetID]
		,[PostAR_Checksum]
		,[SagePayExtra1]
		,[SagePayExtra2]
		,[SagePayExtra3]
		,[iMajorIndustryCodeID]
		,[iTaxBadDebtState]
	)
	SELECT
		  [TEMP_TABLE_SET].[HK_ARTransaction] AS [HK_ARTransaction]
		, [TEMP_TABLE_SET].[LOADDT] AS [LOADDT]
		, [TEMP_TABLE_SET].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [TEMP_TABLE_SET].[LOADENDDT] AS [LOADENDDT]
		, [TEMP_TABLE_SET].[DATATYPE] AS [DATATYPE]
		, [TEMP_TABLE_SET].[SRC] AS [SRC]
		, CASE WHEN [TEMP_TABLE_SET].[SRC] = 'STG' AND CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HASHDIFF]  AS VARCHAR) = LAG( CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HASHDIFF]  AS VARCHAR),1)
			OVER(PARTITION BY [TEMP_TABLE_SET].[HK_ARTransaction] ORDER BY [TEMP_TABLE_SET].[LOADDT],
			[TEMP_TABLE_SET].[ORIGIN_ID])THEN 1 ELSE 0 END AS [EQUAL]
		, [TEMP_TABLE_SET].[HASHDIFF] AS [HASHDIFF]
		, [TEMP_TABLE_SET].[ISDELETED] AS [ISDELETED]
		, [TEMP_TABLE_SET].[AutoIdx] AS [AutoIdx]
		, [TEMP_TABLE_SET].[AccountLink] AS [AccountLink]
		, [TEMP_TABLE_SET].[Project] AS [Project]
		, [TEMP_TABLE_SET].[Reference] AS [Reference]
		, [TEMP_TABLE_SET].[cAuditNumber] AS [cAuditNumber]
		, [TEMP_TABLE_SET].[cReference2] AS [cReference2]
		, [TEMP_TABLE_SET].[TxDate] AS [TxDate]
		, [TEMP_TABLE_SET].[Id] AS [Id]
		, [TEMP_TABLE_SET].[TrCodeID] AS [TrCodeID]
		, [TEMP_TABLE_SET].[Debit] AS [Debit]
		, [TEMP_TABLE_SET].[Credit] AS [Credit]
		, [TEMP_TABLE_SET].[iCurrencyID] AS [iCurrencyID]
		, [TEMP_TABLE_SET].[fExchangeRate] AS [fExchangeRate]
		, [TEMP_TABLE_SET].[fForeignDebit] AS [fForeignDebit]
		, [TEMP_TABLE_SET].[fForeignCredit] AS [fForeignCredit]
		, [TEMP_TABLE_SET].[Description] AS [Description]
		, [TEMP_TABLE_SET].[TaxTypeID] AS [TaxTypeID]
		, [TEMP_TABLE_SET].[Order_No] AS [Order_No]
		, [TEMP_TABLE_SET].[ExtOrderNum] AS [ExtOrderNum]
		, [TEMP_TABLE_SET].[Tax_Amount] AS [Tax_Amount]
		, [TEMP_TABLE_SET].[fForeignTax] AS [fForeignTax]
		, [TEMP_TABLE_SET].[Outstanding] AS [Outstanding]
		, [TEMP_TABLE_SET].[fForeignOutstanding] AS [fForeignOutstanding]
		, [TEMP_TABLE_SET].[cAllocs] AS [cAllocs]
		, [TEMP_TABLE_SET].[InvNumKey] AS [InvNumKey]
		, [TEMP_TABLE_SET].[RepID] AS [RepID]
		, [TEMP_TABLE_SET].[LinkAccCode] AS [LinkAccCode]
		, [TEMP_TABLE_SET].[TillID] AS [TillID]
		, [TEMP_TABLE_SET].[CRCCheck] AS [CRCCheck]
		, [TEMP_TABLE_SET].[DTStamp] AS [DTStamp]
		, [TEMP_TABLE_SET].[UserName] AS [UserName]
		, [TEMP_TABLE_SET].[iTaxPeriodID] AS [iTaxPeriodID]
		, [TEMP_TABLE_SET].[fJCRepCost] AS [fJCRepCost]
		, [TEMP_TABLE_SET].[iAge] AS [iAge]
		, [TEMP_TABLE_SET].[dDateAged] AS [dDateAged]
		, [TEMP_TABLE_SET].[iPostSettlementTermsID] AS [iPostSettlementTermsID]
		, [TEMP_TABLE_SET].[iTxBranchID] AS [iTxBranchID]
		, [TEMP_TABLE_SET].[iMBPropertyID] AS [iMBPropertyID]
		, [TEMP_TABLE_SET].[iMBPortionID] AS [iMBPortionID]
		, [TEMP_TABLE_SET].[iMBServiceID] AS [iMBServiceID]
		, [TEMP_TABLE_SET].[iMBMeterID] AS [iMBMeterID]
		, [TEMP_TABLE_SET].[iMBPropertyPortionServiceID] AS [iMBPropertyPortionServiceID]
		, [TEMP_TABLE_SET].[bPBTPaid] AS [bPBTPaid]
		, [TEMP_TABLE_SET].[iGLTaxAccountID] AS [iGLTaxAccountID]
		, [TEMP_TABLE_SET].[iTransactionType] AS [iTransactionType]
		, [TEMP_TABLE_SET].[PostAR_iBranchID] AS [PostAR_iBranchID]
		, [TEMP_TABLE_SET].[PostAR_dCreatedDate] AS [PostAR_dCreatedDate]
		, [TEMP_TABLE_SET].[PostAR_dModifiedDate] AS [PostAR_dModifiedDate]
		, [TEMP_TABLE_SET].[PostAR_iCreatedBranchID] AS [PostAR_iCreatedBranchID]
		, [TEMP_TABLE_SET].[PostAR_iModifiedBranchID] AS [PostAR_iModifiedBranchID]
		, [TEMP_TABLE_SET].[PostAR_iCreatedAgentID] AS [PostAR_iCreatedAgentID]
		, [TEMP_TABLE_SET].[PostAR_iModifiedAgentID] AS [PostAR_iModifiedAgentID]
		, [TEMP_TABLE_SET].[PostAR_iChangeSetID] AS [PostAR_iChangeSetID]
		, [TEMP_TABLE_SET].[PostAR_Checksum] AS [PostAR_Checksum]
		, [TEMP_TABLE_SET].[SagePayExtra1] AS [SagePayExtra1]
		, [TEMP_TABLE_SET].[SagePayExtra2] AS [SagePayExtra2]
		, [TEMP_TABLE_SET].[SagePayExtra3] AS [SagePayExtra3]
		, [TEMP_TABLE_SET].[iMajorIndustryCodeID] AS [iMajorIndustryCodeID]
		, [TEMP_TABLE_SET].[iTaxBadDebtState] AS [iTaxBadDebtState]
	FROM [TEMP_TABLE_SET]
	;
END;


BEGIN -- SAT_INUR_TGT

	INSERT INTO [raw].[SAT_CSG_1_FOODS_ARTransaction](
		 [HK_ARTransaction]
		,[LOADDT]
		,[LOADENDDT]
		,[LOAD_CYCLE_ID]
		,[ISDELETED]
		,[HASHDIFF]
		,[AutoIdx]
		,[AccountLink]
		,[Project]
		,[Reference]
		,[cAuditNumber]
		,[cReference2]
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
		,[RepID]
		,[LinkAccCode]
		,[TillID]
		,[CRCCheck]
		,[DTStamp]
		,[UserName]
		,[iTaxPeriodID]
		,[fJCRepCost]
		,[iAge]
		,[dDateAged]
		,[iPostSettlementTermsID]
		,[iTxBranchID]
		,[iMBPropertyID]
		,[iMBPortionID]
		,[iMBServiceID]
		,[iMBMeterID]
		,[iMBPropertyPortionServiceID]
		,[bPBTPaid]
		,[iGLTaxAccountID]
		,[iTransactionType]
		,[PostAR_iBranchID]
		,[PostAR_dCreatedDate]
		,[PostAR_dModifiedDate]
		,[PostAR_iCreatedBranchID]
		,[PostAR_iModifiedBranchID]
		,[PostAR_iCreatedAgentID]
		,[PostAR_iModifiedAgentID]
		,[PostAR_iChangeSetID]
		,[PostAR_Checksum]
		,[SagePayExtra1]
		,[SagePayExtra2]
		,[SagePayExtra3]
		,[iMajorIndustryCodeID]
		,[iTaxBadDebtState]
	)
	SELECT
		  [SAT_TEMP_SRC_INUR].[HK_ARTransaction] AS [HK_ARTransaction]
		, [SAT_TEMP_SRC_INUR].[LOADDT] AS [LOADDT]
		, [SAT_TEMP_SRC_INUR].[LOADENDDT] AS [LOADENDDT]
		, [SAT_TEMP_SRC_INUR].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [SAT_TEMP_SRC_INUR].[ISDELETED] AS [ISDELETED]
		, [SAT_TEMP_SRC_INUR].[HASHDIFF] AS [HASHDIFF]
		, [SAT_TEMP_SRC_INUR].[AutoIdx] AS [AutoIdx]
		, [SAT_TEMP_SRC_INUR].[AccountLink] AS [AccountLink]
		, [SAT_TEMP_SRC_INUR].[Project] AS [Project]
		, [SAT_TEMP_SRC_INUR].[Reference] AS [Reference]
		, [SAT_TEMP_SRC_INUR].[cAuditNumber] AS [cAuditNumber]
		, [SAT_TEMP_SRC_INUR].[cReference2] AS [cReference2]
		, [SAT_TEMP_SRC_INUR].[TxDate] AS [TxDate]
		, [SAT_TEMP_SRC_INUR].[Id] AS [Id]
		, [SAT_TEMP_SRC_INUR].[TrCodeID] AS [TrCodeID]
		, [SAT_TEMP_SRC_INUR].[Debit] AS [Debit]
		, [SAT_TEMP_SRC_INUR].[Credit] AS [Credit]
		, [SAT_TEMP_SRC_INUR].[iCurrencyID] AS [iCurrencyID]
		, [SAT_TEMP_SRC_INUR].[fExchangeRate] AS [fExchangeRate]
		, [SAT_TEMP_SRC_INUR].[fForeignDebit] AS [fForeignDebit]
		, [SAT_TEMP_SRC_INUR].[fForeignCredit] AS [fForeignCredit]
		, [SAT_TEMP_SRC_INUR].[Description] AS [Description]
		, [SAT_TEMP_SRC_INUR].[TaxTypeID] AS [TaxTypeID]
		, [SAT_TEMP_SRC_INUR].[Order_No] AS [Order_No]
		, [SAT_TEMP_SRC_INUR].[ExtOrderNum] AS [ExtOrderNum]
		, [SAT_TEMP_SRC_INUR].[Tax_Amount] AS [Tax_Amount]
		, [SAT_TEMP_SRC_INUR].[fForeignTax] AS [fForeignTax]
		, [SAT_TEMP_SRC_INUR].[Outstanding] AS [Outstanding]
		, [SAT_TEMP_SRC_INUR].[fForeignOutstanding] AS [fForeignOutstanding]
		, [SAT_TEMP_SRC_INUR].[cAllocs] AS [cAllocs]
		, [SAT_TEMP_SRC_INUR].[InvNumKey] AS [InvNumKey]
		, [SAT_TEMP_SRC_INUR].[RepID] AS [RepID]
		, [SAT_TEMP_SRC_INUR].[LinkAccCode] AS [LinkAccCode]
		, [SAT_TEMP_SRC_INUR].[TillID] AS [TillID]
		, [SAT_TEMP_SRC_INUR].[CRCCheck] AS [CRCCheck]
		, [SAT_TEMP_SRC_INUR].[DTStamp] AS [DTStamp]
		, [SAT_TEMP_SRC_INUR].[UserName] AS [UserName]
		, [SAT_TEMP_SRC_INUR].[iTaxPeriodID] AS [iTaxPeriodID]
		, [SAT_TEMP_SRC_INUR].[fJCRepCost] AS [fJCRepCost]
		, [SAT_TEMP_SRC_INUR].[iAge] AS [iAge]
		, [SAT_TEMP_SRC_INUR].[dDateAged] AS [dDateAged]
		, [SAT_TEMP_SRC_INUR].[iPostSettlementTermsID] AS [iPostSettlementTermsID]
		, [SAT_TEMP_SRC_INUR].[iTxBranchID] AS [iTxBranchID]
		, [SAT_TEMP_SRC_INUR].[iMBPropertyID] AS [iMBPropertyID]
		, [SAT_TEMP_SRC_INUR].[iMBPortionID] AS [iMBPortionID]
		, [SAT_TEMP_SRC_INUR].[iMBServiceID] AS [iMBServiceID]
		, [SAT_TEMP_SRC_INUR].[iMBMeterID] AS [iMBMeterID]
		, [SAT_TEMP_SRC_INUR].[iMBPropertyPortionServiceID] AS [iMBPropertyPortionServiceID]
		, [SAT_TEMP_SRC_INUR].[bPBTPaid] AS [bPBTPaid]
		, [SAT_TEMP_SRC_INUR].[iGLTaxAccountID] AS [iGLTaxAccountID]
		, [SAT_TEMP_SRC_INUR].[iTransactionType] AS [iTransactionType]
		, [SAT_TEMP_SRC_INUR].[PostAR_iBranchID] AS [PostAR_iBranchID]
		, [SAT_TEMP_SRC_INUR].[PostAR_dCreatedDate] AS [PostAR_dCreatedDate]
		, [SAT_TEMP_SRC_INUR].[PostAR_dModifiedDate] AS [PostAR_dModifiedDate]
		, [SAT_TEMP_SRC_INUR].[PostAR_iCreatedBranchID] AS [PostAR_iCreatedBranchID]
		, [SAT_TEMP_SRC_INUR].[PostAR_iModifiedBranchID] AS [PostAR_iModifiedBranchID]
		, [SAT_TEMP_SRC_INUR].[PostAR_iCreatedAgentID] AS [PostAR_iCreatedAgentID]
		, [SAT_TEMP_SRC_INUR].[PostAR_iModifiedAgentID] AS [PostAR_iModifiedAgentID]
		, [SAT_TEMP_SRC_INUR].[PostAR_iChangeSetID] AS [PostAR_iChangeSetID]
		, [SAT_TEMP_SRC_INUR].[PostAR_Checksum] AS [PostAR_Checksum]
		, [SAT_TEMP_SRC_INUR].[SagePayExtra1] AS [SagePayExtra1]
		, [SAT_TEMP_SRC_INUR].[SagePayExtra2] AS [SagePayExtra2]
		, [SAT_TEMP_SRC_INUR].[SagePayExtra3] AS [SagePayExtra3]
		, [SAT_TEMP_SRC_INUR].[iMajorIndustryCodeID] AS [iMajorIndustryCodeID]
		, [SAT_TEMP_SRC_INUR].[iTaxBadDebtState] AS [iTaxBadDebtState]
	FROM [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_ARTransaction] [SAT_TEMP_SRC_INUR]
	WHERE  [SAT_TEMP_SRC_INUR].[SRC] = 'STG' AND [SAT_TEMP_SRC_INUR].[EQUAL] = 0
	;
END;


BEGIN -- SAT_ED_TGT

	WITH [CALC_LOAD_END_DATE] AS 
	( 
		SELECT
			  [SAT_TEMP_SRC_US].[HK_ARTransaction] AS [HK_ARTransaction]
			, [SAT_TEMP_SRC_US].[LOADDT] AS [LOADDT]
			, COALESCE(LEAD([SAT_TEMP_SRC_US].[LOADDT],1)
				OVER(PARTITION BY [SAT_TEMP_SRC_US].[HK_ARTransaction] ORDER BY [SAT_TEMP_SRC_US].[LOADDT]),
				CONVERT(DATETIME2, '31/12/2999' , 103)) AS [LOADENDDT]
		FROM [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_ARTransaction] [SAT_TEMP_SRC_US]
		WHERE  [SAT_TEMP_SRC_US].[EQUAL] = 0
	)
	, [FILTER_LOAD_END_DATE] AS 
	( 
		SELECT
			  [CALC_LOAD_END_DATE].[HK_ARTransaction] AS [HK_ARTransaction]
			, [CALC_LOAD_END_DATE].[LOADDT] AS [LOADDT]
			, [CALC_LOAD_END_DATE].[LOADENDDT] AS [LOADENDDT]
		FROM [CALC_LOAD_END_DATE]
		WHERE  [CALC_LOAD_END_DATE].[LOADENDDT] != CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	UPDATE [SAT_ED_TGT]
	SET 
		 [LOADENDDT] =  [FILTER_LOAD_END_DATE].[LOADENDDT]
	FROM [FILTER_LOAD_END_DATE]
	JOIN [raw].[SAT_CSG_1_FOODS_ARTransaction] [SAT_ED_TGT] ON 1 = 1 
	WHERE [SAT_ED_TGT].[HK_ARTransaction] =  [FILTER_LOAD_END_DATE].[HK_ARTransaction]
	  AND [SAT_ED_TGT].[LOADDT] =  [FILTER_LOAD_END_DATE].[LOADDT]
	;
END;


END;

 
 


GO
