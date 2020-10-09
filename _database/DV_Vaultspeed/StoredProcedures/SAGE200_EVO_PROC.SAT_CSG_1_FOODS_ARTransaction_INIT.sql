SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].SAT_CSG_1_FOODS_ARTransaction_INIT AS 
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

	DELETE FROM [raw].[SAT_CSG_1_FOODS_ARTransaction] 
	WHERE  1 = 1
	;
END;


BEGIN -- SAT_TGT

	WITH [STG_SRC] AS 
	( 
		SELECT
			  [STG_INR_SRC].[HK_ARTransaction] AS [HK_ARTransaction]
			, [STG_INR_SRC].[LOADDT] AS [LOADDT]
			, [STG_INR_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1',
				COALESCE(REPLACE(REPLACE(RTRIM(REPLACE(REPLACE( REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[TxDate] , 103)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Id] ),'#'),
				'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[TrCodeID] , 1)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Debit] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Credit] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iCurrencyID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[fExchangeRate] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[fForeignDebit] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[fForeignCredit] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Description] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[TaxTypeID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Order_No] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[ExtOrderNum] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Tax_Amount] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[fForeignTax] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Outstanding] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[fForeignOutstanding] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[InvNumKey] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[RepID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[LinkAccCode] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[TillID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[CRCCheck] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[DTStamp] , 103)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[UserName] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iTaxPeriodID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[fJCRepCost] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iAge] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[dDateAged] , 103)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iPostSettlementTermsID] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iTxBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iMBPropertyID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iMBPortionID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iMBServiceID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iMBMeterID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iMBPropertyPortionServiceID] , 1)),'#'),'|','\' + '|')
				+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bPBTPaid] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iGLTaxAccountID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iTransactionType] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[PostAR_iBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[PostAR_dCreatedDate] , 103)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[PostAR_dModifiedDate] , 103)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[PostAR_iCreatedBranchID] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[PostAR_iModifiedBranchID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[PostAR_iCreatedAgentID] ,
				1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[PostAR_iModifiedAgentID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[PostAR_iChangeSetID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CAST([STG_INR_SRC].[PostAR_Checksum]  AS VARCHAR)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[SagePayExtra1] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[SagePayExtra2] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[SagePayExtra3] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iMajorIndustryCodeID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iTaxBadDebtState] , 1)),'#'),'|','\' + '|')+ '|',' ',
				'#' + '|'),'|' + '#',' ')),' ','|' + '#'),'#' + '|',' '),'#')),2)) AS [HASHDIFF]
			, 'N'  AS [ISDELETED]
			, [STG_INR_SRC].[AutoIdx] AS [AutoIdx]
			, [STG_INR_SRC].[AccountLink] AS [AccountLink]
			, [STG_INR_SRC].[Project] AS [Project]
			, [STG_INR_SRC].[Reference] AS [Reference]
			, [STG_INR_SRC].[cAuditNumber] AS [cAuditNumber]
			, [STG_INR_SRC].[cReference2] AS [cReference2]
			, [STG_INR_SRC].[TxDate] AS [TxDate]
			, [STG_INR_SRC].[Id] AS [Id]
			, [STG_INR_SRC].[TrCodeID] AS [TrCodeID]
			, [STG_INR_SRC].[Debit] AS [Debit]
			, [STG_INR_SRC].[Credit] AS [Credit]
			, [STG_INR_SRC].[iCurrencyID] AS [iCurrencyID]
			, [STG_INR_SRC].[fExchangeRate] AS [fExchangeRate]
			, [STG_INR_SRC].[fForeignDebit] AS [fForeignDebit]
			, [STG_INR_SRC].[fForeignCredit] AS [fForeignCredit]
			, [STG_INR_SRC].[Description] AS [Description]
			, [STG_INR_SRC].[TaxTypeID] AS [TaxTypeID]
			, [STG_INR_SRC].[Order_No] AS [Order_No]
			, [STG_INR_SRC].[ExtOrderNum] AS [ExtOrderNum]
			, [STG_INR_SRC].[Tax_Amount] AS [Tax_Amount]
			, [STG_INR_SRC].[fForeignTax] AS [fForeignTax]
			, [STG_INR_SRC].[Outstanding] AS [Outstanding]
			, [STG_INR_SRC].[fForeignOutstanding] AS [fForeignOutstanding]
			, [STG_INR_SRC].[cAllocs] AS [cAllocs]
			, [STG_INR_SRC].[InvNumKey] AS [InvNumKey]
			, [STG_INR_SRC].[RepID] AS [RepID]
			, [STG_INR_SRC].[LinkAccCode] AS [LinkAccCode]
			, [STG_INR_SRC].[TillID] AS [TillID]
			, [STG_INR_SRC].[CRCCheck] AS [CRCCheck]
			, [STG_INR_SRC].[DTStamp] AS [DTStamp]
			, [STG_INR_SRC].[UserName] AS [UserName]
			, [STG_INR_SRC].[iTaxPeriodID] AS [iTaxPeriodID]
			, [STG_INR_SRC].[fJCRepCost] AS [fJCRepCost]
			, [STG_INR_SRC].[iAge] AS [iAge]
			, [STG_INR_SRC].[dDateAged] AS [dDateAged]
			, [STG_INR_SRC].[iPostSettlementTermsID] AS [iPostSettlementTermsID]
			, [STG_INR_SRC].[iTxBranchID] AS [iTxBranchID]
			, [STG_INR_SRC].[iMBPropertyID] AS [iMBPropertyID]
			, [STG_INR_SRC].[iMBPortionID] AS [iMBPortionID]
			, [STG_INR_SRC].[iMBServiceID] AS [iMBServiceID]
			, [STG_INR_SRC].[iMBMeterID] AS [iMBMeterID]
			, [STG_INR_SRC].[iMBPropertyPortionServiceID] AS [iMBPropertyPortionServiceID]
			, [STG_INR_SRC].[bPBTPaid] AS [bPBTPaid]
			, [STG_INR_SRC].[iGLTaxAccountID] AS [iGLTaxAccountID]
			, [STG_INR_SRC].[iTransactionType] AS [iTransactionType]
			, [STG_INR_SRC].[PostAR_iBranchID] AS [PostAR_iBranchID]
			, [STG_INR_SRC].[PostAR_dCreatedDate] AS [PostAR_dCreatedDate]
			, [STG_INR_SRC].[PostAR_dModifiedDate] AS [PostAR_dModifiedDate]
			, [STG_INR_SRC].[PostAR_iCreatedBranchID] AS [PostAR_iCreatedBranchID]
			, [STG_INR_SRC].[PostAR_iModifiedBranchID] AS [PostAR_iModifiedBranchID]
			, [STG_INR_SRC].[PostAR_iCreatedAgentID] AS [PostAR_iCreatedAgentID]
			, [STG_INR_SRC].[PostAR_iModifiedAgentID] AS [PostAR_iModifiedAgentID]
			, [STG_INR_SRC].[PostAR_iChangeSetID] AS [PostAR_iChangeSetID]
			, [STG_INR_SRC].[PostAR_Checksum] AS [PostAR_Checksum]
			, [STG_INR_SRC].[SagePayExtra1] AS [SagePayExtra1]
			, [STG_INR_SRC].[SagePayExtra2] AS [SagePayExtra2]
			, [STG_INR_SRC].[SagePayExtra3] AS [SagePayExtra3]
			, [STG_INR_SRC].[iMajorIndustryCodeID] AS [iMajorIndustryCodeID]
			, [STG_INR_SRC].[iTaxBadDebtState] AS [iTaxBadDebtState]
			, ROW_NUMBER()OVER(PARTITION BY [STG_INR_SRC].[HK_ARTransaction] ORDER BY [STG_INR_SRC].[LOADDT]) AS [DUMMY]
		FROM [CSG_1_FOODS_stage].[PostAR] [STG_INR_SRC]
	)
	INSERT INTO [raw].[SAT_CSG_1_FOODS_ARTransaction](
		 [HK_ARTransaction]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
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
		  [STG_SRC].[HK_ARTransaction] AS [HK_ARTransaction]
		, [STG_SRC].[LOADDT] AS [LOADDT]
		, [STG_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [STG_SRC].[LOADENDDT] AS [LOADENDDT]
		, [STG_SRC].[HASHDIFF] AS [HASHDIFF]
		, [STG_SRC].[ISDELETED] AS [ISDELETED]
		, [STG_SRC].[AutoIdx] AS [AutoIdx]
		, [STG_SRC].[AccountLink] AS [AccountLink]
		, [STG_SRC].[Project] AS [Project]
		, [STG_SRC].[Reference] AS [Reference]
		, [STG_SRC].[cAuditNumber] AS [cAuditNumber]
		, [STG_SRC].[cReference2] AS [cReference2]
		, [STG_SRC].[TxDate] AS [TxDate]
		, [STG_SRC].[Id] AS [Id]
		, [STG_SRC].[TrCodeID] AS [TrCodeID]
		, [STG_SRC].[Debit] AS [Debit]
		, [STG_SRC].[Credit] AS [Credit]
		, [STG_SRC].[iCurrencyID] AS [iCurrencyID]
		, [STG_SRC].[fExchangeRate] AS [fExchangeRate]
		, [STG_SRC].[fForeignDebit] AS [fForeignDebit]
		, [STG_SRC].[fForeignCredit] AS [fForeignCredit]
		, [STG_SRC].[Description] AS [Description]
		, [STG_SRC].[TaxTypeID] AS [TaxTypeID]
		, [STG_SRC].[Order_No] AS [Order_No]
		, [STG_SRC].[ExtOrderNum] AS [ExtOrderNum]
		, [STG_SRC].[Tax_Amount] AS [Tax_Amount]
		, [STG_SRC].[fForeignTax] AS [fForeignTax]
		, [STG_SRC].[Outstanding] AS [Outstanding]
		, [STG_SRC].[fForeignOutstanding] AS [fForeignOutstanding]
		, [STG_SRC].[cAllocs] AS [cAllocs]
		, [STG_SRC].[InvNumKey] AS [InvNumKey]
		, [STG_SRC].[RepID] AS [RepID]
		, [STG_SRC].[LinkAccCode] AS [LinkAccCode]
		, [STG_SRC].[TillID] AS [TillID]
		, [STG_SRC].[CRCCheck] AS [CRCCheck]
		, [STG_SRC].[DTStamp] AS [DTStamp]
		, [STG_SRC].[UserName] AS [UserName]
		, [STG_SRC].[iTaxPeriodID] AS [iTaxPeriodID]
		, [STG_SRC].[fJCRepCost] AS [fJCRepCost]
		, [STG_SRC].[iAge] AS [iAge]
		, [STG_SRC].[dDateAged] AS [dDateAged]
		, [STG_SRC].[iPostSettlementTermsID] AS [iPostSettlementTermsID]
		, [STG_SRC].[iTxBranchID] AS [iTxBranchID]
		, [STG_SRC].[iMBPropertyID] AS [iMBPropertyID]
		, [STG_SRC].[iMBPortionID] AS [iMBPortionID]
		, [STG_SRC].[iMBServiceID] AS [iMBServiceID]
		, [STG_SRC].[iMBMeterID] AS [iMBMeterID]
		, [STG_SRC].[iMBPropertyPortionServiceID] AS [iMBPropertyPortionServiceID]
		, [STG_SRC].[bPBTPaid] AS [bPBTPaid]
		, [STG_SRC].[iGLTaxAccountID] AS [iGLTaxAccountID]
		, [STG_SRC].[iTransactionType] AS [iTransactionType]
		, [STG_SRC].[PostAR_iBranchID] AS [PostAR_iBranchID]
		, [STG_SRC].[PostAR_dCreatedDate] AS [PostAR_dCreatedDate]
		, [STG_SRC].[PostAR_dModifiedDate] AS [PostAR_dModifiedDate]
		, [STG_SRC].[PostAR_iCreatedBranchID] AS [PostAR_iCreatedBranchID]
		, [STG_SRC].[PostAR_iModifiedBranchID] AS [PostAR_iModifiedBranchID]
		, [STG_SRC].[PostAR_iCreatedAgentID] AS [PostAR_iCreatedAgentID]
		, [STG_SRC].[PostAR_iModifiedAgentID] AS [PostAR_iModifiedAgentID]
		, [STG_SRC].[PostAR_iChangeSetID] AS [PostAR_iChangeSetID]
		, [STG_SRC].[PostAR_Checksum] AS [PostAR_Checksum]
		, [STG_SRC].[SagePayExtra1] AS [SagePayExtra1]
		, [STG_SRC].[SagePayExtra2] AS [SagePayExtra2]
		, [STG_SRC].[SagePayExtra3] AS [SagePayExtra3]
		, [STG_SRC].[iMajorIndustryCodeID] AS [iMajorIndustryCodeID]
		, [STG_SRC].[iTaxBadDebtState] AS [iTaxBadDebtState]
	FROM [STG_SRC]
	WHERE  [STG_SRC].[DUMMY] = 1
	;
END;


END;

 
 


GO
