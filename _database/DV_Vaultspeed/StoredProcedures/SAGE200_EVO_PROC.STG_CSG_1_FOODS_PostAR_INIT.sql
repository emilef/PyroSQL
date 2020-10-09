SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_PostAR_INIT AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_stage].[PostAR];

	WITH [DIST_FK1] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC1].[AccountLink] AS [AccountLink]
		FROM [CSG_1_FOODS_ext].[PostAR] [EXT_DIS_SRC1]
	)
	, [DIST_FK2] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC2].[Project] AS [Project]
		FROM [CSG_1_FOODS_ext].[PostAR] [EXT_DIS_SRC2]
	)
	, [FIND_BK_FK1] AS 
	( 
		SELECT
			  [EXT_FKBK_SRC1].[BK_Account] AS [BK_Account]
			, [EXT_FKBK_SRC1].[BK_DCLink] AS [BK_DCLink]
			, [DIST_FK1].[AccountLink] AS [AccountLink]
		FROM [DIST_FK1]
		INNER JOIN [CSG_1_FOODS_ext].[Client] [EXT_FKBK_SRC1] ON  [DIST_FK1].[AccountLink] = [EXT_FKBK_SRC1].[DCLink]
	)
	, [FIND_BK_FK2] AS 
	( 
		SELECT
			  [EXT_FKBK_SRC2].[BK_ProjectCode] AS [BK_ProjectCode]
			, [EXT_FKBK_SRC2].[BK_ProjectName] AS [BK_ProjectName]
			, [EXT_FKBK_SRC2].[BK_ProjectLink] AS [BK_ProjectLink]
			, [DIST_FK2].[Project] AS [Project]
		FROM [DIST_FK2]
		INNER JOIN [CSG_1_FOODS_ext].[Project] [EXT_FKBK_SRC2] ON  [DIST_FK2].[Project] = [EXT_FKBK_SRC2].[ProjectLink]
	)
	INSERT INTO [CSG_1_FOODS_stage].[PostAR](
		 [HK_ARTransaction]
		,[HK_Client]
		,[HK_Project]
		,[HKLINK_ARTransaction_Client]
		,[HKLINK_ARTransaction_Project]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[SOURCE_SYSTEM]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[AutoIdx]
		,[AccountLink]
		,[Project]
		,[BK_ARTransaction]
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
		  UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_cAuditNumber] + '|' +
			[EXT_SRC].[BK_Reference] + '|' +  [EXT_SRC].[BK_cReference2] + '|' +  [EXT_SRC].[BK_AutoIdx] + '|'),2)) AS [HK_ARTransaction]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK1].[BK_Account],
			[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +  COALESCE([FIND_BK_FK1].[BK_DCLink],[MEX_SRC].[KEY_ATTRIBUTE_INT])+
			'|'),2)) AS [HK_Client]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK2].[BK_ProjectCode],
			[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +  COALESCE([FIND_BK_FK2].[BK_ProjectName],
			[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +  COALESCE([FIND_BK_FK2].[BK_ProjectLink],
			[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HK_Project]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_cAuditNumber] + '|' +
			[EXT_SRC].[BK_Reference] + '|' +  [EXT_SRC].[BK_cReference2] + '|' +  [EXT_SRC].[BK_AutoIdx] + '|' +
			'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK1].[BK_Account],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK1].[BK_DCLink],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HKLINK_ARTransaction_Client]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_cAuditNumber] + '|' +
			[EXT_SRC].[BK_Reference] + '|' +  [EXT_SRC].[BK_cReference2] + '|' +  [EXT_SRC].[BK_AutoIdx] + '|' +
			'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK2].[BK_ProjectCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK2].[BK_ProjectName],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK2].[BK_ProjectLink],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HKLINK_ARTransaction_Project]
		, [EXT_SRC].[LOADDT] AS [LOADDT]
		, [EXT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, 'CSG_1_FOODS' AS [SOURCE_SYSTEM]
		, [EXT_SRC].[CHANGE_TYPE] AS [CHANGE_TYPE]
		, [EXT_SRC].[DATATYPE] AS [DATATYPE]
		, [EXT_SRC].[AutoIdx] AS [AutoIdx]
		, [EXT_SRC].[AccountLink] AS [AccountLink]
		, [EXT_SRC].[Project] AS [Project]
		, [EXT_SRC].[BK_cAuditNumber] + '|' +  [EXT_SRC].[BK_Reference] + '|' +  [EXT_SRC].[BK_cReference2] + '|' +
			[EXT_SRC].[BK_AutoIdx] AS [BK_ARTransaction]
		, [EXT_SRC].[Reference] AS [Reference]
		, [EXT_SRC].[cAuditNumber] AS [cAuditNumber]
		, [EXT_SRC].[cReference2] AS [cReference2]
		, [EXT_SRC].[TxDate] AS [TxDate]
		, [EXT_SRC].[Id] AS [Id]
		, [EXT_SRC].[TrCodeID] AS [TrCodeID]
		, [EXT_SRC].[Debit] AS [Debit]
		, [EXT_SRC].[Credit] AS [Credit]
		, [EXT_SRC].[iCurrencyID] AS [iCurrencyID]
		, [EXT_SRC].[fExchangeRate] AS [fExchangeRate]
		, [EXT_SRC].[fForeignDebit] AS [fForeignDebit]
		, [EXT_SRC].[fForeignCredit] AS [fForeignCredit]
		, [EXT_SRC].[Description] AS [Description]
		, [EXT_SRC].[TaxTypeID] AS [TaxTypeID]
		, [EXT_SRC].[Order_No] AS [Order_No]
		, [EXT_SRC].[ExtOrderNum] AS [ExtOrderNum]
		, [EXT_SRC].[Tax_Amount] AS [Tax_Amount]
		, [EXT_SRC].[fForeignTax] AS [fForeignTax]
		, [EXT_SRC].[Outstanding] AS [Outstanding]
		, [EXT_SRC].[fForeignOutstanding] AS [fForeignOutstanding]
		, [EXT_SRC].[cAllocs] AS [cAllocs]
		, [EXT_SRC].[InvNumKey] AS [InvNumKey]
		, [EXT_SRC].[RepID] AS [RepID]
		, [EXT_SRC].[LinkAccCode] AS [LinkAccCode]
		, [EXT_SRC].[TillID] AS [TillID]
		, [EXT_SRC].[CRCCheck] AS [CRCCheck]
		, [EXT_SRC].[DTStamp] AS [DTStamp]
		, [EXT_SRC].[UserName] AS [UserName]
		, [EXT_SRC].[iTaxPeriodID] AS [iTaxPeriodID]
		, [EXT_SRC].[fJCRepCost] AS [fJCRepCost]
		, [EXT_SRC].[iAge] AS [iAge]
		, [EXT_SRC].[dDateAged] AS [dDateAged]
		, [EXT_SRC].[iPostSettlementTermsID] AS [iPostSettlementTermsID]
		, [EXT_SRC].[iTxBranchID] AS [iTxBranchID]
		, [EXT_SRC].[iMBPropertyID] AS [iMBPropertyID]
		, [EXT_SRC].[iMBPortionID] AS [iMBPortionID]
		, [EXT_SRC].[iMBServiceID] AS [iMBServiceID]
		, [EXT_SRC].[iMBMeterID] AS [iMBMeterID]
		, [EXT_SRC].[iMBPropertyPortionServiceID] AS [iMBPropertyPortionServiceID]
		, [EXT_SRC].[bPBTPaid] AS [bPBTPaid]
		, [EXT_SRC].[iGLTaxAccountID] AS [iGLTaxAccountID]
		, [EXT_SRC].[iTransactionType] AS [iTransactionType]
		, [EXT_SRC].[PostAR_iBranchID] AS [PostAR_iBranchID]
		, [EXT_SRC].[PostAR_dCreatedDate] AS [PostAR_dCreatedDate]
		, [EXT_SRC].[PostAR_dModifiedDate] AS [PostAR_dModifiedDate]
		, [EXT_SRC].[PostAR_iCreatedBranchID] AS [PostAR_iCreatedBranchID]
		, [EXT_SRC].[PostAR_iModifiedBranchID] AS [PostAR_iModifiedBranchID]
		, [EXT_SRC].[PostAR_iCreatedAgentID] AS [PostAR_iCreatedAgentID]
		, [EXT_SRC].[PostAR_iModifiedAgentID] AS [PostAR_iModifiedAgentID]
		, [EXT_SRC].[PostAR_iChangeSetID] AS [PostAR_iChangeSetID]
		, [EXT_SRC].[PostAR_Checksum] AS [PostAR_Checksum]
		, [EXT_SRC].[SagePayExtra1] AS [SagePayExtra1]
		, [EXT_SRC].[SagePayExtra2] AS [SagePayExtra2]
		, [EXT_SRC].[SagePayExtra3] AS [SagePayExtra3]
		, [EXT_SRC].[iMajorIndustryCodeID] AS [iMajorIndustryCodeID]
		, [EXT_SRC].[iTaxBadDebtState] AS [iTaxBadDebtState]
	FROM [CSG_1_FOODS_ext].[PostAR] [EXT_SRC]
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [MEX_SRC].[DATATYPE] = 'NA'
	LEFT OUTER JOIN [FIND_BK_FK1] ON  [EXT_SRC].[AccountLink] = [FIND_BK_FK1].[AccountLink]
	LEFT OUTER JOIN [FIND_BK_FK2] ON  [EXT_SRC].[Project] = [FIND_BK_FK2].[Project]
	;
END;


END;

 
 


GO
