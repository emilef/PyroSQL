SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].EXT_CSG_1_FOODS_PostAP_INCR AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_ext].[PostAP];

	INSERT INTO [CSG_1_FOODS_ext].[PostAP](
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
		  [LCI_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, dateadd(MICROSECOND, 2*row_number() over (order by [LCI_SRC].[LOADDT]), SYSDATETIME()) AS [LOADDT]
		, [MEX_SRC].[ATTRIBUTE_VARCHAR] AS [CHANGE_TYPE]
		, [TDFV_SRC].[DATATYPE] AS [DATATYPE]
		, CONVERT(BIGINT, [TDFV_SRC].[AutoIdx] , 1) AS [AutoIdx]
		, CONVERT(INT, [TDFV_SRC].[AccountLink] , 1) AS [AccountLink]
		, CONVERT(INT, [TDFV_SRC].[Project] , 1) AS [Project]
		, COALESCE(UPPER(REPLACE([TDFV_SRC].[cAuditNumber],'|','\' + '|')),[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR]) AS [BK_cAuditNumber]
		, COALESCE(UPPER(REPLACE([TDFV_SRC].[Reference],'|','\' + '|')),[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR]) AS [BK_Reference]
		, COALESCE(UPPER(REPLACE([TDFV_SRC].[cReference2],'|','\' + '|')),[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR]) AS [BK_cReference2]
		, COALESCE(UPPER([TDFV_SRC].[AutoIdx]),[MEX_SRC].[KEY_ATTRIBUTE_BIGINT]) AS [BK_AutoIdx]
		, [TDFV_SRC].[Reference]  AS [Reference]
		, [TDFV_SRC].[cAuditNumber]  AS [cAuditNumber]
		, [TDFV_SRC].[cReference2]  AS [cReference2]
		, CONVERT(DATETIME2, [TDFV_SRC].[TxDate] , 103) AS [TxDate]
		, [TDFV_SRC].[Id]  AS [Id]
		, CONVERT(INT, [TDFV_SRC].[TrCodeID] , 1) AS [TrCodeID]
		, CONVERT(FLOAT, [TDFV_SRC].[Debit] , 1) AS [Debit]
		, CONVERT(FLOAT, [TDFV_SRC].[Credit] , 1) AS [Credit]
		, CONVERT(INT, [TDFV_SRC].[iCurrencyID] , 1) AS [iCurrencyID]
		, CONVERT(FLOAT, [TDFV_SRC].[fExchangeRate] , 1) AS [fExchangeRate]
		, CONVERT(FLOAT, [TDFV_SRC].[fForeignDebit] , 1) AS [fForeignDebit]
		, CONVERT(FLOAT, [TDFV_SRC].[fForeignCredit] , 1) AS [fForeignCredit]
		, [TDFV_SRC].[Description]  AS [Description]
		, CONVERT(INT, [TDFV_SRC].[TaxTypeID] , 1) AS [TaxTypeID]
		, [TDFV_SRC].[Order_No]  AS [Order_No]
		, [TDFV_SRC].[ExtOrderNum]  AS [ExtOrderNum]
		, CONVERT(FLOAT, [TDFV_SRC].[Tax_Amount] , 1) AS [Tax_Amount]
		, CONVERT(FLOAT, [TDFV_SRC].[fForeignTax] , 1) AS [fForeignTax]
		, CONVERT(FLOAT, [TDFV_SRC].[Outstanding] , 1) AS [Outstanding]
		, CONVERT(FLOAT, [TDFV_SRC].[fForeignOutstanding] , 1) AS [fForeignOutstanding]
		, [TDFV_SRC].[cAllocs]  AS [cAllocs]
		, CONVERT(BIGINT, [TDFV_SRC].[InvNumKey] , 1) AS [InvNumKey]
		, CONVERT(FLOAT, [TDFV_SRC].[CRCCheck] , 1) AS [CRCCheck]
		, CONVERT(DATETIME2, [TDFV_SRC].[DTStamp] , 103) AS [DTStamp]
		, [TDFV_SRC].[UserName]  AS [UserName]
		, CONVERT(INT, [TDFV_SRC].[iTaxPeriodID] , 1) AS [iTaxPeriodID]
		, CONVERT(INT, [TDFV_SRC].[iAge] , 1) AS [iAge]
		, CONVERT(DATETIME2, [TDFV_SRC].[dDateAged] , 103) AS [dDateAged]
		, CONVERT(INT, [TDFV_SRC].[iPostSettlementTermsID] , 1) AS [iPostSettlementTermsID]
		, CONVERT(INT, [TDFV_SRC].[iTxBranchID] , 1) AS [iTxBranchID]
		, CONVERT(BIT, [TDFV_SRC].[bPBTPaid] , 1) AS [bPBTPaid]
		, CONVERT(INT, [TDFV_SRC].[iGLTaxAccountID] , 1) AS [iGLTaxAccountID]
		, CONVERT(BIT, [TDFV_SRC].[bTxOnHold] , 1) AS [bTxOnHold]
		, CONVERT(INT, [TDFV_SRC].[PostAP_iBranchID] , 1) AS [PostAP_iBranchID]
		, CONVERT(DATETIME2, [TDFV_SRC].[PostAP_dCreatedDate] , 103) AS [PostAP_dCreatedDate]
		, CONVERT(DATETIME2, [TDFV_SRC].[PostAP_dModifiedDate] , 103) AS [PostAP_dModifiedDate]
		, CONVERT(INT, [TDFV_SRC].[PostAP_iCreatedBranchID] , 1) AS [PostAP_iCreatedBranchID]
		, CONVERT(INT, [TDFV_SRC].[PostAP_iModifiedBranchID] , 1) AS [PostAP_iModifiedBranchID]
		, CONVERT(INT, [TDFV_SRC].[PostAP_iCreatedAgentID] , 1) AS [PostAP_iCreatedAgentID]
		, CONVERT(INT, [TDFV_SRC].[PostAP_iModifiedAgentID] , 1) AS [PostAP_iModifiedAgentID]
		, CONVERT(INT, [TDFV_SRC].[PostAP_iChangeSetID] , 1) AS [PostAP_iChangeSetID]
		, CAST([TDFV_SRC].[PostAP_Checksum]  AS BINARY) AS [PostAP_Checksum]
		, [TDFV_SRC].[SagePayExtra1]  AS [SagePayExtra1]
		, [TDFV_SRC].[SagePayExtra2]  AS [SagePayExtra2]
		, [TDFV_SRC].[SagePayExtra3]  AS [SagePayExtra3]
		, CONVERT(INT, [TDFV_SRC].[iTaxBadDebtState] , 1) AS [iTaxBadDebtState]
		, CONVERT(BIT, [TDFV_SRC].[bReverseChargeApplied] , 1) AS [bReverseChargeApplied]
		, CONVERT(BIT, [TDFV_SRC].[bReverseChargeCustoms] , 1) AS [bReverseChargeCustoms]
		, [TDFV_SRC].[cReverseChargeAuditNr]  AS [cReverseChargeAuditNr]
	FROM [dv_CSG_1_FOODS].[VW_PostAP] [TDFV_SRC]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  1 = 1
	WHERE  [MEX_SRC].[DATATYPE] = '#'
	;
END;


END;

 
 


GO
