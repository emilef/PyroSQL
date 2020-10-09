SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].EXT_CSG_1_FOODS_PostGL_INCR AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_ext].[PostGL];

	INSERT INTO [CSG_1_FOODS_ext].[PostGL](
		 [LOAD_CYCLE_ID]
		,[LOADDT]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[AutoIdx]
		,[AccountLink]
		,[Project]
		,[Period]
		,[BK_AutoIdx]
		,[BK_Description]
		,[BK_Reference]
		,[BK_cReference2]
		,[Description]
		,[Reference]
		,[cReference2]
		,[BK_FK_AccountLink_AccountLink]
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
		  [LCI_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, dateadd(MICROSECOND, 2*row_number() over (order by [LCI_SRC].[LOADDT]), SYSDATETIME()) AS [LOADDT]
		, [MEX_SRC].[ATTRIBUTE_VARCHAR] AS [CHANGE_TYPE]
		, [TDFV_SRC].[DATATYPE] AS [DATATYPE]
		, CONVERT(BIGINT, [TDFV_SRC].[AutoIdx] , 1) AS [AutoIdx]
		, CONVERT(INT, [TDFV_SRC].[AccountLink] , 1) AS [AccountLink]
		, CONVERT(INT, [TDFV_SRC].[Project] , 1) AS [Project]
		, CONVERT(INT, [TDFV_SRC].[Period] , 1) AS [Period]
		, COALESCE(UPPER([TDFV_SRC].[AutoIdx]),[MEX_SRC].[KEY_ATTRIBUTE_BIGINT]) AS [BK_AutoIdx]
		, COALESCE(UPPER(REPLACE([TDFV_SRC].[Description],'|','\' + '|')),[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR]) AS [BK_Description]
		, COALESCE(UPPER(REPLACE([TDFV_SRC].[Reference],'|','\' + '|')),[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR]) AS [BK_Reference]
		, COALESCE(UPPER(REPLACE([TDFV_SRC].[cReference2],'|','\' + '|')),[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR]) AS [BK_cReference2]
		, [TDFV_SRC].[Description]  AS [Description]
		, [TDFV_SRC].[Reference]  AS [Reference]
		, [TDFV_SRC].[cReference2]  AS [cReference2]
		, UPPER([TDFV_SRC].[AccountLink]) AS [BK_FK_AccountLink_AccountLink]
		, CONVERT(DATETIME2, [TDFV_SRC].[TxDate] , 103) AS [TxDate]
		, [TDFV_SRC].[Id]  AS [Id]
		, CONVERT(INT, [TDFV_SRC].[TrCodeID] , 1) AS [TrCodeID]
		, CONVERT(FLOAT, [TDFV_SRC].[Debit] , 1) AS [Debit]
		, CONVERT(FLOAT, [TDFV_SRC].[Credit] , 1) AS [Credit]
		, CONVERT(INT, [TDFV_SRC].[iCurrencyID] , 1) AS [iCurrencyID]
		, CONVERT(FLOAT, [TDFV_SRC].[fExchangeRate] , 1) AS [fExchangeRate]
		, CONVERT(FLOAT, [TDFV_SRC].[fForeignDebit] , 1) AS [fForeignDebit]
		, CONVERT(FLOAT, [TDFV_SRC].[fForeignCredit] , 1) AS [fForeignCredit]
		, CONVERT(INT, [TDFV_SRC].[TaxTypeID] , 1) AS [TaxTypeID]
		, [TDFV_SRC].[Order_No]  AS [Order_No]
		, [TDFV_SRC].[ExtOrderNum]  AS [ExtOrderNum]
		, [TDFV_SRC].[cAuditNumber]  AS [cAuditNumber]
		, CONVERT(FLOAT, [TDFV_SRC].[Tax_Amount] , 1) AS [Tax_Amount]
		, CONVERT(FLOAT, [TDFV_SRC].[fForeignTax] , 1) AS [fForeignTax]
		, CONVERT(INT, [TDFV_SRC].[DrCrAccount] , 1) AS [DrCrAccount]
		, CONVERT(INT, [TDFV_SRC].[JobCodeLink] , 1) AS [JobCodeLink]
		, CONVERT(FLOAT, [TDFV_SRC].[CRCCheck] , 1) AS [CRCCheck]
		, CONVERT(DATETIME2, [TDFV_SRC].[DTStamp] , 103) AS [DTStamp]
		, [TDFV_SRC].[UserName]  AS [UserName]
		, CONVERT(INT, [TDFV_SRC].[iTaxPeriodID] , 1) AS [iTaxPeriodID]
		, [TDFV_SRC].[cPayeeName]  AS [cPayeeName]
		, CONVERT(BIT, [TDFV_SRC].[bPrintCheque] , 1) AS [bPrintCheque]
		, CONVERT(INT, [TDFV_SRC].[RepID] , 1) AS [RepID]
		, CONVERT(FLOAT, [TDFV_SRC].[fJCRepCost] , 1) AS [fJCRepCost]
		, CONVERT(INT, [TDFV_SRC].[iMFPID] , 1) AS [iMFPID]
		, CONVERT(BIT, [TDFV_SRC].[bIsJCDocLine] , 1) AS [bIsJCDocLine]
		, CONVERT(BIT, [TDFV_SRC].[bIsSTGLDocLine] , 1) AS [bIsSTGLDocLine]
		, CONVERT(BIGINT, [TDFV_SRC].[iInvLineID] , 1) AS [iInvLineID]
		, CONVERT(INT, [TDFV_SRC].[iTxBranchID] , 1) AS [iTxBranchID]
		, [TDFV_SRC].[cBankRef]  AS [cBankRef]
		, CONVERT(BIT, [TDFV_SRC].[bPBTPaid] , 1) AS [bPBTPaid]
		, CONVERT(INT, [TDFV_SRC].[iGLTaxAccountID] , 1) AS [iGLTaxAccountID]
		, CONVERT(BIT, [TDFV_SRC].[bReconciled] , 1) AS [bReconciled]
		, [TDFV_SRC].[xAttribute]  AS [xAttribute]
		, CONVERT(INT, [TDFV_SRC].[PostGL_iBranchID] , 1) AS [PostGL_iBranchID]
		, CONVERT(DATETIME2, [TDFV_SRC].[PostGL_dCreatedDate] , 103) AS [PostGL_dCreatedDate]
		, CONVERT(DATETIME2, [TDFV_SRC].[PostGL_dModifiedDate] , 103) AS [PostGL_dModifiedDate]
		, CONVERT(INT, [TDFV_SRC].[PostGL_iCreatedBranchID] , 1) AS [PostGL_iCreatedBranchID]
		, CONVERT(INT, [TDFV_SRC].[PostGL_iModifiedBranchID] , 1) AS [PostGL_iModifiedBranchID]
		, CONVERT(INT, [TDFV_SRC].[PostGL_iCreatedAgentID] , 1) AS [PostGL_iCreatedAgentID]
		, CONVERT(INT, [TDFV_SRC].[PostGL_iModifiedAgentID] , 1) AS [PostGL_iModifiedAgentID]
		, CONVERT(INT, [TDFV_SRC].[PostGL_iChangeSetID] , 1) AS [PostGL_iChangeSetID]
		, CAST([TDFV_SRC].[PostGL_Checksum]  AS BINARY) AS [PostGL_Checksum]
		, CONVERT(INT, [TDFV_SRC].[iMajorIndustryCodeID] , 1) AS [iMajorIndustryCodeID]
		, CONVERT(INT, [TDFV_SRC].[iImportDeclarationID] , 1) AS [iImportDeclarationID]
	FROM [dv_CSG_1_FOODS].[VW_PostGL] [TDFV_SRC]
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  1 = 1
	WHERE  [MEX_SRC].[DATATYPE] = '#'
	;
END;


END;

 
 


GO
