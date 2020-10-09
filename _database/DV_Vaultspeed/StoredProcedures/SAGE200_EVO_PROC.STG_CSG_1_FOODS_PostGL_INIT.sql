SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_PostGL_INIT AS 
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
BEGIN -- STG_TGT

	TRUNCATE TABLE [CSG_1_FOODS_stage].[PostGL];

	WITH [DIST_FK2] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC2].[Period] AS [Period]
		FROM [CSG_1_FOODS_ext].[PostGL] [EXT_DIS_SRC2]
	)
	, [DIST_FK3] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC3].[Project] AS [Project]
		FROM [CSG_1_FOODS_ext].[PostGL] [EXT_DIS_SRC3]
	)
	, [FIND_BK_FK2] AS 
	( 
		SELECT
			  [EXT_FKBK_SRC2].[BK_dPeriodDate] AS [BK_dPeriodDate]
			, [EXT_FKBK_SRC2].[BK_idPeriod] AS [BK_idPeriod]
			, [DIST_FK2].[Period] AS [Period]
		FROM [DIST_FK2]
		INNER JOIN [CSG_1_FOODS_ext].[_etblPeriod] [EXT_FKBK_SRC2] ON  [DIST_FK2].[Period] = [EXT_FKBK_SRC2].[idPeriod]
	)
	, [FIND_BK_FK3] AS 
	( 
		SELECT
			  [EXT_FKBK_SRC3].[BK_ProjectCode] AS [BK_ProjectCode]
			, [EXT_FKBK_SRC3].[BK_ProjectName] AS [BK_ProjectName]
			, [EXT_FKBK_SRC3].[BK_ProjectLink] AS [BK_ProjectLink]
			, [DIST_FK3].[Project] AS [Project]
		FROM [DIST_FK3]
		INNER JOIN [CSG_1_FOODS_ext].[Project] [EXT_FKBK_SRC3] ON  [DIST_FK3].[Project] = [EXT_FKBK_SRC3].[ProjectLink]
	)
	INSERT INTO [CSG_1_FOODS_stage].[PostGL](
		 [HK_GLTransaction]
		,[HK_GLAccount]
		,[HK_FinancialPeriod]
		,[HK_Project]
		,[HKLINK_GLTransaction_GLAccount]
		,[HKLINK_GLTransaction_FinancialPeriod]
		,[HKLINK_GLTransaction_Project]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[SOURCE_SYSTEM]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[AutoIdx]
		,[AccountLink]
		,[Period]
		,[Project]
		,[BK_GLTransaction]
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
		  UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_AutoIdx] + '|' +
			[EXT_SRC].[BK_Description] + '|' +  [EXT_SRC].[BK_Reference] + '|' +  [EXT_SRC].[BK_cReference2] + '|'),2)) AS [HK_GLTransaction]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_FK_AccountLink_AccountLink] +
			'|'),2)) AS [HK_GLAccount]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK2].[BK_dPeriodDate],
			[MEX_SRC].[KEY_ATTRIBUTE_DATETIME2])+ '|' +  COALESCE([FIND_BK_FK2].[BK_idPeriod],
			[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HK_FinancialPeriod]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK3].[BK_ProjectCode],
			[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +  COALESCE([FIND_BK_FK3].[BK_ProjectName],
			[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +  COALESCE([FIND_BK_FK3].[BK_ProjectLink],
			[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HK_Project]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_AutoIdx] + '|' +
			[EXT_SRC].[BK_Description] + '|' +  [EXT_SRC].[BK_Reference] + '|' +  [EXT_SRC].[BK_cReference2] + '|' +
			'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_FK_AccountLink_AccountLink] + '|'),2)) AS [HKLINK_GLTransaction_GLAccount]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_AutoIdx] + '|' +
			[EXT_SRC].[BK_Description] + '|' +  [EXT_SRC].[BK_Reference] + '|' +  [EXT_SRC].[BK_cReference2] + '|' +
			'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK2].[BK_dPeriodDate],[MEX_SRC].[KEY_ATTRIBUTE_DATETIME2])+ '|' +
			COALESCE([FIND_BK_FK2].[BK_idPeriod],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HKLINK_GLTransaction_FinancialPeriod]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_AutoIdx] + '|' +
			[EXT_SRC].[BK_Description] + '|' +  [EXT_SRC].[BK_Reference] + '|' +  [EXT_SRC].[BK_cReference2] + '|' +
			'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK3].[BK_ProjectCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK3].[BK_ProjectName],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK3].[BK_ProjectLink],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HKLINK_GLTransaction_Project]
		, [EXT_SRC].[LOADDT] AS [LOADDT]
		, [EXT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, 'CSG_1_FOODS' AS [SOURCE_SYSTEM]
		, [EXT_SRC].[CHANGE_TYPE] AS [CHANGE_TYPE]
		, [EXT_SRC].[DATATYPE] AS [DATATYPE]
		, [EXT_SRC].[AutoIdx] AS [AutoIdx]
		, [EXT_SRC].[AccountLink] AS [AccountLink]
		, [EXT_SRC].[Period] AS [Period]
		, [EXT_SRC].[Project] AS [Project]
		, [EXT_SRC].[BK_AutoIdx] + '|' +  [EXT_SRC].[BK_Description] + '|' +  [EXT_SRC].[BK_Reference] + '|' +
			[EXT_SRC].[BK_cReference2] AS [BK_GLTransaction]
		, [EXT_SRC].[Description] AS [Description]
		, [EXT_SRC].[Reference] AS [Reference]
		, [EXT_SRC].[cReference2] AS [cReference2]
		, [EXT_SRC].[BK_FK_AccountLink_AccountLink] AS [BK_FK_AccountLink_AccountLink]
		, [EXT_SRC].[TxDate] AS [TxDate]
		, [EXT_SRC].[Id] AS [Id]
		, [EXT_SRC].[TrCodeID] AS [TrCodeID]
		, [EXT_SRC].[Debit] AS [Debit]
		, [EXT_SRC].[Credit] AS [Credit]
		, [EXT_SRC].[iCurrencyID] AS [iCurrencyID]
		, [EXT_SRC].[fExchangeRate] AS [fExchangeRate]
		, [EXT_SRC].[fForeignDebit] AS [fForeignDebit]
		, [EXT_SRC].[fForeignCredit] AS [fForeignCredit]
		, [EXT_SRC].[TaxTypeID] AS [TaxTypeID]
		, [EXT_SRC].[Order_No] AS [Order_No]
		, [EXT_SRC].[ExtOrderNum] AS [ExtOrderNum]
		, [EXT_SRC].[cAuditNumber] AS [cAuditNumber]
		, [EXT_SRC].[Tax_Amount] AS [Tax_Amount]
		, [EXT_SRC].[fForeignTax] AS [fForeignTax]
		, [EXT_SRC].[DrCrAccount] AS [DrCrAccount]
		, [EXT_SRC].[JobCodeLink] AS [JobCodeLink]
		, [EXT_SRC].[CRCCheck] AS [CRCCheck]
		, [EXT_SRC].[DTStamp] AS [DTStamp]
		, [EXT_SRC].[UserName] AS [UserName]
		, [EXT_SRC].[iTaxPeriodID] AS [iTaxPeriodID]
		, [EXT_SRC].[cPayeeName] AS [cPayeeName]
		, [EXT_SRC].[bPrintCheque] AS [bPrintCheque]
		, [EXT_SRC].[RepID] AS [RepID]
		, [EXT_SRC].[fJCRepCost] AS [fJCRepCost]
		, [EXT_SRC].[iMFPID] AS [iMFPID]
		, [EXT_SRC].[bIsJCDocLine] AS [bIsJCDocLine]
		, [EXT_SRC].[bIsSTGLDocLine] AS [bIsSTGLDocLine]
		, [EXT_SRC].[iInvLineID] AS [iInvLineID]
		, [EXT_SRC].[iTxBranchID] AS [iTxBranchID]
		, [EXT_SRC].[cBankRef] AS [cBankRef]
		, [EXT_SRC].[bPBTPaid] AS [bPBTPaid]
		, [EXT_SRC].[iGLTaxAccountID] AS [iGLTaxAccountID]
		, [EXT_SRC].[bReconciled] AS [bReconciled]
		, [EXT_SRC].[xAttribute] AS [xAttribute]
		, [EXT_SRC].[PostGL_iBranchID] AS [PostGL_iBranchID]
		, [EXT_SRC].[PostGL_dCreatedDate] AS [PostGL_dCreatedDate]
		, [EXT_SRC].[PostGL_dModifiedDate] AS [PostGL_dModifiedDate]
		, [EXT_SRC].[PostGL_iCreatedBranchID] AS [PostGL_iCreatedBranchID]
		, [EXT_SRC].[PostGL_iModifiedBranchID] AS [PostGL_iModifiedBranchID]
		, [EXT_SRC].[PostGL_iCreatedAgentID] AS [PostGL_iCreatedAgentID]
		, [EXT_SRC].[PostGL_iModifiedAgentID] AS [PostGL_iModifiedAgentID]
		, [EXT_SRC].[PostGL_iChangeSetID] AS [PostGL_iChangeSetID]
		, [EXT_SRC].[PostGL_Checksum] AS [PostGL_Checksum]
		, [EXT_SRC].[iMajorIndustryCodeID] AS [iMajorIndustryCodeID]
		, [EXT_SRC].[iImportDeclarationID] AS [iImportDeclarationID]
	FROM [CSG_1_FOODS_ext].[PostGL] [EXT_SRC]
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [MEX_SRC].[DATATYPE] = 'NA'
	LEFT OUTER JOIN [FIND_BK_FK2] ON  [EXT_SRC].[Period] = [FIND_BK_FK2].[Period]
	LEFT OUTER JOIN [FIND_BK_FK3] ON  [EXT_SRC].[Project] = [FIND_BK_FK3].[Project]
	;
END;


END;

 
 


GO
