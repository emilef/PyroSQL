SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].SAT_CSG_1_FOODS_GLTransaction_INIT AS 
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

	DELETE FROM [raw].[SAT_CSG_1_FOODS_GLTransaction] 
	WHERE  1 = 1
	;
END;


BEGIN -- SAT_TGT

	WITH [STG_SRC] AS 
	( 
		SELECT
			  [STG_INR_SRC].[HK_GLTransaction] AS [HK_GLTransaction]
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
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[TaxTypeID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Order_No] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[ExtOrderNum] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cAuditNumber] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Tax_Amount] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[fForeignTax] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[DrCrAccount] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[JobCodeLink] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[CRCCheck] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[DTStamp] , 103)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[UserName] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iTaxPeriodID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cPayeeName] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bPrintCheque] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[RepID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[fJCRepCost] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iMFPID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bIsJCDocLine] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bIsSTGLDocLine] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iInvLineID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iTxBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cBankRef] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bPBTPaid] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iGLTaxAccountID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bReconciled] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[PostGL_iBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[PostGL_dCreatedDate] , 103)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[PostGL_dModifiedDate] , 103)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[PostGL_iCreatedBranchID] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[PostGL_iModifiedBranchID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[PostGL_iCreatedAgentID] ,
				1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[PostGL_iModifiedAgentID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[PostGL_iChangeSetID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CAST([STG_INR_SRC].[PostGL_Checksum]  AS VARCHAR)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iMajorIndustryCodeID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iImportDeclarationID] , 1)),'#'),'|','\' + '|')+ '|',
				' ','#' + '|'),'|' + '#',' ')),' ','|' + '#'),'#' + '|',' '),'#')),2)) AS [HASHDIFF]
			, 'N'  AS [ISDELETED]
			, [STG_INR_SRC].[AutoIdx] AS [AutoIdx]
			, [STG_INR_SRC].[AccountLink] AS [AccountLink]
			, [STG_INR_SRC].[Period] AS [Period]
			, [STG_INR_SRC].[Project] AS [Project]
			, [STG_INR_SRC].[Description] AS [Description]
			, [STG_INR_SRC].[Reference] AS [Reference]
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
			, [STG_INR_SRC].[TaxTypeID] AS [TaxTypeID]
			, [STG_INR_SRC].[Order_No] AS [Order_No]
			, [STG_INR_SRC].[ExtOrderNum] AS [ExtOrderNum]
			, [STG_INR_SRC].[cAuditNumber] AS [cAuditNumber]
			, [STG_INR_SRC].[Tax_Amount] AS [Tax_Amount]
			, [STG_INR_SRC].[fForeignTax] AS [fForeignTax]
			, [STG_INR_SRC].[DrCrAccount] AS [DrCrAccount]
			, [STG_INR_SRC].[JobCodeLink] AS [JobCodeLink]
			, [STG_INR_SRC].[CRCCheck] AS [CRCCheck]
			, [STG_INR_SRC].[DTStamp] AS [DTStamp]
			, [STG_INR_SRC].[UserName] AS [UserName]
			, [STG_INR_SRC].[iTaxPeriodID] AS [iTaxPeriodID]
			, [STG_INR_SRC].[cPayeeName] AS [cPayeeName]
			, [STG_INR_SRC].[bPrintCheque] AS [bPrintCheque]
			, [STG_INR_SRC].[RepID] AS [RepID]
			, [STG_INR_SRC].[fJCRepCost] AS [fJCRepCost]
			, [STG_INR_SRC].[iMFPID] AS [iMFPID]
			, [STG_INR_SRC].[bIsJCDocLine] AS [bIsJCDocLine]
			, [STG_INR_SRC].[bIsSTGLDocLine] AS [bIsSTGLDocLine]
			, [STG_INR_SRC].[iInvLineID] AS [iInvLineID]
			, [STG_INR_SRC].[iTxBranchID] AS [iTxBranchID]
			, [STG_INR_SRC].[cBankRef] AS [cBankRef]
			, [STG_INR_SRC].[bPBTPaid] AS [bPBTPaid]
			, [STG_INR_SRC].[iGLTaxAccountID] AS [iGLTaxAccountID]
			, [STG_INR_SRC].[bReconciled] AS [bReconciled]
			, [STG_INR_SRC].[xAttribute] AS [xAttribute]
			, [STG_INR_SRC].[PostGL_iBranchID] AS [PostGL_iBranchID]
			, [STG_INR_SRC].[PostGL_dCreatedDate] AS [PostGL_dCreatedDate]
			, [STG_INR_SRC].[PostGL_dModifiedDate] AS [PostGL_dModifiedDate]
			, [STG_INR_SRC].[PostGL_iCreatedBranchID] AS [PostGL_iCreatedBranchID]
			, [STG_INR_SRC].[PostGL_iModifiedBranchID] AS [PostGL_iModifiedBranchID]
			, [STG_INR_SRC].[PostGL_iCreatedAgentID] AS [PostGL_iCreatedAgentID]
			, [STG_INR_SRC].[PostGL_iModifiedAgentID] AS [PostGL_iModifiedAgentID]
			, [STG_INR_SRC].[PostGL_iChangeSetID] AS [PostGL_iChangeSetID]
			, [STG_INR_SRC].[PostGL_Checksum] AS [PostGL_Checksum]
			, [STG_INR_SRC].[iMajorIndustryCodeID] AS [iMajorIndustryCodeID]
			, [STG_INR_SRC].[iImportDeclarationID] AS [iImportDeclarationID]
			, ROW_NUMBER()OVER(PARTITION BY [STG_INR_SRC].[HK_GLTransaction] ORDER BY [STG_INR_SRC].[LOADDT]) AS [DUMMY]
		FROM [CSG_1_FOODS_stage].[PostGL] [STG_INR_SRC]
	)
	INSERT INTO [raw].[SAT_CSG_1_FOODS_GLTransaction](
		 [HK_GLTransaction]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[HASHDIFF]
		,[ISDELETED]
		,[AutoIdx]
		,[AccountLink]
		,[Period]
		,[Project]
		,[Description]
		,[Reference]
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
		  [STG_SRC].[HK_GLTransaction] AS [HK_GLTransaction]
		, [STG_SRC].[LOADDT] AS [LOADDT]
		, [STG_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [STG_SRC].[LOADENDDT] AS [LOADENDDT]
		, [STG_SRC].[HASHDIFF] AS [HASHDIFF]
		, [STG_SRC].[ISDELETED] AS [ISDELETED]
		, [STG_SRC].[AutoIdx] AS [AutoIdx]
		, [STG_SRC].[AccountLink] AS [AccountLink]
		, [STG_SRC].[Period] AS [Period]
		, [STG_SRC].[Project] AS [Project]
		, [STG_SRC].[Description] AS [Description]
		, [STG_SRC].[Reference] AS [Reference]
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
		, [STG_SRC].[TaxTypeID] AS [TaxTypeID]
		, [STG_SRC].[Order_No] AS [Order_No]
		, [STG_SRC].[ExtOrderNum] AS [ExtOrderNum]
		, [STG_SRC].[cAuditNumber] AS [cAuditNumber]
		, [STG_SRC].[Tax_Amount] AS [Tax_Amount]
		, [STG_SRC].[fForeignTax] AS [fForeignTax]
		, [STG_SRC].[DrCrAccount] AS [DrCrAccount]
		, [STG_SRC].[JobCodeLink] AS [JobCodeLink]
		, [STG_SRC].[CRCCheck] AS [CRCCheck]
		, [STG_SRC].[DTStamp] AS [DTStamp]
		, [STG_SRC].[UserName] AS [UserName]
		, [STG_SRC].[iTaxPeriodID] AS [iTaxPeriodID]
		, [STG_SRC].[cPayeeName] AS [cPayeeName]
		, [STG_SRC].[bPrintCheque] AS [bPrintCheque]
		, [STG_SRC].[RepID] AS [RepID]
		, [STG_SRC].[fJCRepCost] AS [fJCRepCost]
		, [STG_SRC].[iMFPID] AS [iMFPID]
		, [STG_SRC].[bIsJCDocLine] AS [bIsJCDocLine]
		, [STG_SRC].[bIsSTGLDocLine] AS [bIsSTGLDocLine]
		, [STG_SRC].[iInvLineID] AS [iInvLineID]
		, [STG_SRC].[iTxBranchID] AS [iTxBranchID]
		, [STG_SRC].[cBankRef] AS [cBankRef]
		, [STG_SRC].[bPBTPaid] AS [bPBTPaid]
		, [STG_SRC].[iGLTaxAccountID] AS [iGLTaxAccountID]
		, [STG_SRC].[bReconciled] AS [bReconciled]
		, [STG_SRC].[xAttribute] AS [xAttribute]
		, [STG_SRC].[PostGL_iBranchID] AS [PostGL_iBranchID]
		, [STG_SRC].[PostGL_dCreatedDate] AS [PostGL_dCreatedDate]
		, [STG_SRC].[PostGL_dModifiedDate] AS [PostGL_dModifiedDate]
		, [STG_SRC].[PostGL_iCreatedBranchID] AS [PostGL_iCreatedBranchID]
		, [STG_SRC].[PostGL_iModifiedBranchID] AS [PostGL_iModifiedBranchID]
		, [STG_SRC].[PostGL_iCreatedAgentID] AS [PostGL_iCreatedAgentID]
		, [STG_SRC].[PostGL_iModifiedAgentID] AS [PostGL_iModifiedAgentID]
		, [STG_SRC].[PostGL_iChangeSetID] AS [PostGL_iChangeSetID]
		, [STG_SRC].[PostGL_Checksum] AS [PostGL_Checksum]
		, [STG_SRC].[iMajorIndustryCodeID] AS [iMajorIndustryCodeID]
		, [STG_SRC].[iImportDeclarationID] AS [iImportDeclarationID]
	FROM [STG_SRC]
	WHERE  [STG_SRC].[DUMMY] = 1
	;
END;


END;

 
 


GO
