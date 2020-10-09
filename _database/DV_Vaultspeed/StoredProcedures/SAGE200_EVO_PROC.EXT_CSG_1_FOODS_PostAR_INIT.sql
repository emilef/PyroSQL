SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].EXT_CSG_1_FOODS_PostAR_INIT AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_ext].[PostAR];

	WITH [PREP_EXCEP] AS 
	( 
		SELECT 
			  '+' AS [CHANGE_TYPE]
			, 'SRC' AS [DATATYPE]
			, NULL AS [LOAD_CYCLE_ID]
			, COALESCE( CONVERT(BIGINT, REPLACE([INI_SRC].[AutoIdx],',','') , 1), CONVERT(BIGINT,
				[MEX_INR_SRC].[KEY_ATTRIBUTE_BIGINT] , 1)) AS [AutoIdx]
			, COALESCE( CONVERT(INT, REPLACE([INI_SRC].[AccountLink],',','') , 1), CONVERT(INT,
				[MEX_INR_SRC].[KEY_ATTRIBUTE_INT] , 1)) AS [AccountLink]
			, COALESCE( CONVERT(INT, REPLACE([INI_SRC].[Project],',','') , 1), CONVERT(INT,
				[MEX_INR_SRC].[KEY_ATTRIBUTE_INT] , 1)) AS [Project]
			, [INI_SRC].[Reference]  AS [Reference]
			, [INI_SRC].[cAuditNumber]  AS [cAuditNumber]
			, [INI_SRC].[cReference2]  AS [cReference2]
			, CONVERT(DATETIME2, [INI_SRC].[TxDate] , 103) AS [TxDate]
			, [INI_SRC].[Id]  AS [Id]
			, CONVERT(INT, [INI_SRC].[TrCodeID] , 1) AS [TrCodeID]
			, CONVERT(FLOAT, [INI_SRC].[Debit] , 1) AS [Debit]
			, CONVERT(FLOAT, [INI_SRC].[Credit] , 1) AS [Credit]
			, CONVERT(INT, [INI_SRC].[iCurrencyID] , 1) AS [iCurrencyID]
			, CONVERT(FLOAT, [INI_SRC].[fExchangeRate] , 1) AS [fExchangeRate]
			, CONVERT(FLOAT, [INI_SRC].[fForeignDebit] , 1) AS [fForeignDebit]
			, CONVERT(FLOAT, [INI_SRC].[fForeignCredit] , 1) AS [fForeignCredit]
			, [INI_SRC].[Description]  AS [Description]
			, CONVERT(INT, [INI_SRC].[TaxTypeID] , 1) AS [TaxTypeID]
			, [INI_SRC].[Order_No]  AS [Order_No]
			, [INI_SRC].[ExtOrderNum]  AS [ExtOrderNum]
			, CONVERT(FLOAT, [INI_SRC].[Tax_Amount] , 1) AS [Tax_Amount]
			, CONVERT(FLOAT, [INI_SRC].[fForeignTax] , 1) AS [fForeignTax]
			, CONVERT(FLOAT, [INI_SRC].[Outstanding] , 1) AS [Outstanding]
			, CONVERT(FLOAT, [INI_SRC].[fForeignOutstanding] , 1) AS [fForeignOutstanding]
			, [INI_SRC].[cAllocs]  AS [cAllocs]
			, CONVERT(BIGINT, [INI_SRC].[InvNumKey] , 1) AS [InvNumKey]
			, CONVERT(INT, [INI_SRC].[RepID] , 1) AS [RepID]
			, CONVERT(INT, [INI_SRC].[LinkAccCode] , 1) AS [LinkAccCode]
			, CONVERT(INT, [INI_SRC].[TillID] , 1) AS [TillID]
			, CONVERT(FLOAT, [INI_SRC].[CRCCheck] , 1) AS [CRCCheck]
			, CONVERT(DATETIME2, [INI_SRC].[DTStamp] , 103) AS [DTStamp]
			, [INI_SRC].[UserName]  AS [UserName]
			, CONVERT(INT, [INI_SRC].[iTaxPeriodID] , 1) AS [iTaxPeriodID]
			, CONVERT(FLOAT, [INI_SRC].[fJCRepCost] , 1) AS [fJCRepCost]
			, CONVERT(INT, [INI_SRC].[iAge] , 1) AS [iAge]
			, CONVERT(DATETIME2, [INI_SRC].[dDateAged] , 103) AS [dDateAged]
			, CONVERT(INT, [INI_SRC].[iPostSettlementTermsID] , 1) AS [iPostSettlementTermsID]
			, CONVERT(INT, [INI_SRC].[iTxBranchID] , 1) AS [iTxBranchID]
			, CONVERT(INT, [INI_SRC].[iMBPropertyID] , 1) AS [iMBPropertyID]
			, CONVERT(INT, [INI_SRC].[iMBPortionID] , 1) AS [iMBPortionID]
			, CONVERT(INT, [INI_SRC].[iMBServiceID] , 1) AS [iMBServiceID]
			, CONVERT(INT, [INI_SRC].[iMBMeterID] , 1) AS [iMBMeterID]
			, CONVERT(INT, [INI_SRC].[iMBPropertyPortionServiceID] , 1) AS [iMBPropertyPortionServiceID]
			, CONVERT(BIT, [INI_SRC].[bPBTPaid] , 1) AS [bPBTPaid]
			, CONVERT(INT, [INI_SRC].[iGLTaxAccountID] , 1) AS [iGLTaxAccountID]
			, CONVERT(INT, [INI_SRC].[iTransactionType] , 1) AS [iTransactionType]
			, CONVERT(INT, [INI_SRC].[PostAR_iBranchID] , 1) AS [PostAR_iBranchID]
			, CONVERT(DATETIME2, [INI_SRC].[PostAR_dCreatedDate] , 103) AS [PostAR_dCreatedDate]
			, CONVERT(DATETIME2, [INI_SRC].[PostAR_dModifiedDate] , 103) AS [PostAR_dModifiedDate]
			, CONVERT(INT, [INI_SRC].[PostAR_iCreatedBranchID] , 1) AS [PostAR_iCreatedBranchID]
			, CONVERT(INT, [INI_SRC].[PostAR_iModifiedBranchID] , 1) AS [PostAR_iModifiedBranchID]
			, CONVERT(INT, [INI_SRC].[PostAR_iCreatedAgentID] , 1) AS [PostAR_iCreatedAgentID]
			, CONVERT(INT, [INI_SRC].[PostAR_iModifiedAgentID] , 1) AS [PostAR_iModifiedAgentID]
			, CONVERT(INT, [INI_SRC].[PostAR_iChangeSetID] , 1) AS [PostAR_iChangeSetID]
			, CAST([INI_SRC].[PostAR_Checksum]  AS BINARY) AS [PostAR_Checksum]
			, [INI_SRC].[SagePayExtra1]  AS [SagePayExtra1]
			, [INI_SRC].[SagePayExtra2]  AS [SagePayExtra2]
			, [INI_SRC].[SagePayExtra3]  AS [SagePayExtra3]
			, CONVERT(INT, [INI_SRC].[iMajorIndustryCodeID] , 1) AS [iMajorIndustryCodeID]
			, CONVERT(INT, [INI_SRC].[iTaxBadDebtState] , 1) AS [iTaxBadDebtState]
		FROM [CSG_1_FOODS].[PostAR] [INI_SRC]
		INNER JOIN [dc].[EXECEPTION] [MEX_INR_SRC] ON  [MEX_INR_SRC].[DATATYPE] = '#'
		UNION 
		SELECT 
			  '+' AS [CHANGE_TYPE]
			, [MEX_EXT_SRC].[DATATYPE] AS [DATATYPE]
			, CONVERT(int, [MEX_EXT_SRC].[LOAD_CYCLE_ID] ) AS [LOAD_CYCLE_ID]
			, CONVERT(BIGINT, [MEX_EXT_SRC].[KEY_ATTRIBUTE_BIGINT] , 1) AS [AutoIdx]
			, CONVERT(INT, [MEX_EXT_SRC].[KEY_ATTRIBUTE_INT] , 1) AS [AccountLink]
			, CONVERT(INT, [MEX_EXT_SRC].[KEY_ATTRIBUTE_INT] , 1) AS [Project]
			, [MEX_EXT_SRC].[KEY_ATTRIBUTE_VARCHAR]  AS [Reference]
			, [MEX_EXT_SRC].[KEY_ATTRIBUTE_VARCHAR]  AS [cAuditNumber]
			, [MEX_EXT_SRC].[KEY_ATTRIBUTE_VARCHAR]  AS [cReference2]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[ATTRIBUTE_DATETIME2] , 103) AS [TxDate]
			, [MEX_EXT_SRC].[ATTRIBUTE_VARCHAR]  AS [Id]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [TrCodeID]
			, CONVERT(FLOAT, [MEX_EXT_SRC].[ATTRIBUTE_FLOAT] , 1) AS [Debit]
			, CONVERT(FLOAT, [MEX_EXT_SRC].[ATTRIBUTE_FLOAT] , 1) AS [Credit]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iCurrencyID]
			, CONVERT(FLOAT, [MEX_EXT_SRC].[ATTRIBUTE_FLOAT] , 1) AS [fExchangeRate]
			, CONVERT(FLOAT, [MEX_EXT_SRC].[ATTRIBUTE_FLOAT] , 1) AS [fForeignDebit]
			, CONVERT(FLOAT, [MEX_EXT_SRC].[ATTRIBUTE_FLOAT] , 1) AS [fForeignCredit]
			, [MEX_EXT_SRC].[ATTRIBUTE_VARCHAR]  AS [Description]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [TaxTypeID]
			, [MEX_EXT_SRC].[ATTRIBUTE_VARCHAR]  AS [Order_No]
			, [MEX_EXT_SRC].[ATTRIBUTE_VARCHAR]  AS [ExtOrderNum]
			, CONVERT(FLOAT, [MEX_EXT_SRC].[ATTRIBUTE_FLOAT] , 1) AS [Tax_Amount]
			, CONVERT(FLOAT, [MEX_EXT_SRC].[ATTRIBUTE_FLOAT] , 1) AS [fForeignTax]
			, CONVERT(FLOAT, [MEX_EXT_SRC].[ATTRIBUTE_FLOAT] , 1) AS [Outstanding]
			, CONVERT(FLOAT, [MEX_EXT_SRC].[ATTRIBUTE_FLOAT] , 1) AS [fForeignOutstanding]
			, [MEX_EXT_SRC].[ATTRIBUTE_NVARCHAR]  AS [cAllocs]
			, CONVERT(BIGINT, [MEX_EXT_SRC].[ATTRIBUTE_BIGINT] , 1) AS [InvNumKey]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [RepID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [LinkAccCode]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [TillID]
			, CONVERT(FLOAT, [MEX_EXT_SRC].[ATTRIBUTE_FLOAT] , 1) AS [CRCCheck]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[ATTRIBUTE_DATETIME2] , 103) AS [DTStamp]
			, [MEX_EXT_SRC].[ATTRIBUTE_VARCHAR]  AS [UserName]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iTaxPeriodID]
			, CONVERT(FLOAT, [MEX_EXT_SRC].[ATTRIBUTE_FLOAT] , 1) AS [fJCRepCost]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iAge]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[ATTRIBUTE_DATETIME2] , 103) AS [dDateAged]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iPostSettlementTermsID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iTxBranchID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iMBPropertyID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iMBPortionID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iMBServiceID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iMBMeterID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iMBPropertyPortionServiceID]
			, CONVERT(BIT, [MEX_EXT_SRC].[ATTRIBUTE_BIT] , 1) AS [bPBTPaid]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iGLTaxAccountID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iTransactionType]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [PostAR_iBranchID]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[ATTRIBUTE_DATETIME2] , 103) AS [PostAR_dCreatedDate]
			, CONVERT(DATETIME2, [MEX_EXT_SRC].[ATTRIBUTE_DATETIME2] , 103) AS [PostAR_dModifiedDate]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [PostAR_iCreatedBranchID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [PostAR_iModifiedBranchID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [PostAR_iCreatedAgentID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [PostAR_iModifiedAgentID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [PostAR_iChangeSetID]
			, CAST([MEX_EXT_SRC].[ATTRIBUTE_BINARY]  AS BINARY) AS [PostAR_Checksum]
			, [MEX_EXT_SRC].[ATTRIBUTE_VARCHAR]  AS [SagePayExtra1]
			, [MEX_EXT_SRC].[ATTRIBUTE_VARCHAR]  AS [SagePayExtra2]
			, [MEX_EXT_SRC].[ATTRIBUTE_VARCHAR]  AS [SagePayExtra3]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iMajorIndustryCodeID]
			, CONVERT(INT, [MEX_EXT_SRC].[ATTRIBUTE_INT] , 1) AS [iTaxBadDebtState]
		FROM [dc].[EXECEPTION] [MEX_EXT_SRC]
	)
	INSERT INTO [CSG_1_FOODS_ext].[PostAR](
		 [LOAD_CYCLE_ID]
		,[LOADDT]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[AutoIdx]
		,[AccountLink]
		,[Project]
		,[BK_cAuditNumber]
		,[BK_Reference]
		,[BK_cReference2]
		,[BK_AutoIdx]
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
		  COALESCE([PREP_EXCEP].[LOAD_CYCLE_ID],[LCI_SRC].[LOAD_CYCLE_ID]) AS [LOAD_CYCLE_ID]
		, [LCI_SRC].[LOADDT] AS [LOADDT]
		, [PREP_EXCEP].[CHANGE_TYPE] AS [CHANGE_TYPE]
		, [PREP_EXCEP].[DATATYPE] AS [DATATYPE]
		, [PREP_EXCEP].[AutoIdx] AS [AutoIdx]
		, [PREP_EXCEP].[AccountLink] AS [AccountLink]
		, [PREP_EXCEP].[Project] AS [Project]
		, COALESCE(UPPER(REPLACE([PREP_EXCEP].[cAuditNumber],'|','\' + '|')),[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR]) AS [BK_cAuditNumber]
		, COALESCE(UPPER(REPLACE([PREP_EXCEP].[Reference],'|','\' + '|')),[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR]) AS [BK_Reference]
		, COALESCE(UPPER(REPLACE([PREP_EXCEP].[cReference2],'|','\' + '|')),[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR]) AS [BK_cReference2]
		, COALESCE(UPPER( CONVERT(VARCHAR, [PREP_EXCEP].[AutoIdx] , 1)),[MEX_SRC].[KEY_ATTRIBUTE_BIGINT]) AS [BK_AutoIdx]
		, [PREP_EXCEP].[Reference] AS [Reference]
		, [PREP_EXCEP].[cAuditNumber] AS [cAuditNumber]
		, [PREP_EXCEP].[cReference2] AS [cReference2]
		, [PREP_EXCEP].[TxDate] AS [TxDate]
		, [PREP_EXCEP].[Id] AS [Id]
		, [PREP_EXCEP].[TrCodeID] AS [TrCodeID]
		, [PREP_EXCEP].[Debit] AS [Debit]
		, [PREP_EXCEP].[Credit] AS [Credit]
		, [PREP_EXCEP].[iCurrencyID] AS [iCurrencyID]
		, [PREP_EXCEP].[fExchangeRate] AS [fExchangeRate]
		, [PREP_EXCEP].[fForeignDebit] AS [fForeignDebit]
		, [PREP_EXCEP].[fForeignCredit] AS [fForeignCredit]
		, [PREP_EXCEP].[Description] AS [Description]
		, [PREP_EXCEP].[TaxTypeID] AS [TaxTypeID]
		, [PREP_EXCEP].[Order_No] AS [Order_No]
		, [PREP_EXCEP].[ExtOrderNum] AS [ExtOrderNum]
		, [PREP_EXCEP].[Tax_Amount] AS [Tax_Amount]
		, [PREP_EXCEP].[fForeignTax] AS [fForeignTax]
		, [PREP_EXCEP].[Outstanding] AS [Outstanding]
		, [PREP_EXCEP].[fForeignOutstanding] AS [fForeignOutstanding]
		, [PREP_EXCEP].[cAllocs] AS [cAllocs]
		, [PREP_EXCEP].[InvNumKey] AS [InvNumKey]
		, [PREP_EXCEP].[RepID] AS [RepID]
		, [PREP_EXCEP].[LinkAccCode] AS [LinkAccCode]
		, [PREP_EXCEP].[TillID] AS [TillID]
		, [PREP_EXCEP].[CRCCheck] AS [CRCCheck]
		, [PREP_EXCEP].[DTStamp] AS [DTStamp]
		, [PREP_EXCEP].[UserName] AS [UserName]
		, [PREP_EXCEP].[iTaxPeriodID] AS [iTaxPeriodID]
		, [PREP_EXCEP].[fJCRepCost] AS [fJCRepCost]
		, [PREP_EXCEP].[iAge] AS [iAge]
		, [PREP_EXCEP].[dDateAged] AS [dDateAged]
		, [PREP_EXCEP].[iPostSettlementTermsID] AS [iPostSettlementTermsID]
		, [PREP_EXCEP].[iTxBranchID] AS [iTxBranchID]
		, [PREP_EXCEP].[iMBPropertyID] AS [iMBPropertyID]
		, [PREP_EXCEP].[iMBPortionID] AS [iMBPortionID]
		, [PREP_EXCEP].[iMBServiceID] AS [iMBServiceID]
		, [PREP_EXCEP].[iMBMeterID] AS [iMBMeterID]
		, [PREP_EXCEP].[iMBPropertyPortionServiceID] AS [iMBPropertyPortionServiceID]
		, [PREP_EXCEP].[bPBTPaid] AS [bPBTPaid]
		, [PREP_EXCEP].[iGLTaxAccountID] AS [iGLTaxAccountID]
		, [PREP_EXCEP].[iTransactionType] AS [iTransactionType]
		, [PREP_EXCEP].[PostAR_iBranchID] AS [PostAR_iBranchID]
		, [PREP_EXCEP].[PostAR_dCreatedDate] AS [PostAR_dCreatedDate]
		, [PREP_EXCEP].[PostAR_dModifiedDate] AS [PostAR_dModifiedDate]
		, [PREP_EXCEP].[PostAR_iCreatedBranchID] AS [PostAR_iCreatedBranchID]
		, [PREP_EXCEP].[PostAR_iModifiedBranchID] AS [PostAR_iModifiedBranchID]
		, [PREP_EXCEP].[PostAR_iCreatedAgentID] AS [PostAR_iCreatedAgentID]
		, [PREP_EXCEP].[PostAR_iModifiedAgentID] AS [PostAR_iModifiedAgentID]
		, [PREP_EXCEP].[PostAR_iChangeSetID] AS [PostAR_iChangeSetID]
		, [PREP_EXCEP].[PostAR_Checksum] AS [PostAR_Checksum]
		, [PREP_EXCEP].[SagePayExtra1] AS [SagePayExtra1]
		, [PREP_EXCEP].[SagePayExtra2] AS [SagePayExtra2]
		, [PREP_EXCEP].[SagePayExtra3] AS [SagePayExtra3]
		, [PREP_EXCEP].[iMajorIndustryCodeID] AS [iMajorIndustryCodeID]
		, [PREP_EXCEP].[iTaxBadDebtState] AS [iTaxBadDebtState]
	FROM [PREP_EXCEP]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  1 = 1
	WHERE  [MEX_SRC].[DATATYPE] = '#'
	;
END;


END;

 
 


GO
