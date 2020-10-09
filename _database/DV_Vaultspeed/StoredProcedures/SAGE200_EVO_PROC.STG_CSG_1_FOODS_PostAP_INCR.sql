SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_PostAP_INCR AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_stage].[PostAP];

	WITH [DIST_FK1] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC1].[Project] AS [Project]
		FROM [CSG_1_FOODS_ext].[PostAP] [EXT_DIS_SRC1]
	)
	, [DIST_FK2] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC2].[AccountLink] AS [AccountLink]
		FROM [CSG_1_FOODS_ext].[PostAP] [EXT_DIS_SRC2]
	)
	, [FIND_BK_FK1] AS 
	( 
		SELECT 
			  UPPER(REPLACE( [SAT_SRC1].[ProjectCode] ,'|','\' + '|')) AS [BK_ProjectCode]
			, UPPER(REPLACE( [SAT_SRC1].[ProjectName] ,'|','\' + '|')) AS [BK_ProjectName]
			, UPPER( CONVERT(VARCHAR, [SAT_SRC1].[ProjectLink] , 1)) AS [BK_ProjectLink]
			, [DIST_FK1].[Project] AS [Project]
		FROM [DIST_FK1]
		INNER JOIN [raw].[SAT_CSG_1_FOODS_Project] [SAT_SRC1] ON  [DIST_FK1].[Project] = [SAT_SRC1].[ProjectLink]
		INNER JOIN [raw].[HUB_Project] [HUB_SRC1] ON  [HUB_SRC1].[HK_Project] = [SAT_SRC1].[HK_Project]
		WHERE  [SAT_SRC1].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' , 103)
		UNION 
		SELECT 
			  [EXT_FKBK_SRC1].[BK_ProjectCode] AS [BK_ProjectCode]
			, [EXT_FKBK_SRC1].[BK_ProjectName] AS [BK_ProjectName]
			, [EXT_FKBK_SRC1].[BK_ProjectLink] AS [BK_ProjectLink]
			, [DIST_FK1].[Project] AS [Project]
		FROM [DIST_FK1]
		INNER JOIN [CSG_1_FOODS_ext].[Project] [EXT_FKBK_SRC1] ON  [DIST_FK1].[Project] = [EXT_FKBK_SRC1].[ProjectLink]
	)
	, [FIND_BK_FK2] AS 
	( 
		SELECT 
			  UPPER(REPLACE( [SAT_SRC2].[Account] ,'|','\' + '|')) AS [BK_Account]
			, UPPER( CONVERT(VARCHAR, [SAT_SRC2].[DCLink] , 1)) AS [BK_DCLink]
			, [DIST_FK2].[AccountLink] AS [AccountLink]
		FROM [DIST_FK2]
		INNER JOIN [raw].[SAT_CSG_1_FOODS_Vendor] [SAT_SRC2] ON  [DIST_FK2].[AccountLink] = [SAT_SRC2].[DCLink]
		INNER JOIN [raw].[HUB_Vendor] [HUB_SRC2] ON  [HUB_SRC2].[HK_Vendor] = [SAT_SRC2].[HK_Vendor]
		WHERE  [SAT_SRC2].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' , 103)
		UNION 
		SELECT 
			  [EXT_FKBK_SRC2].[BK_Account] AS [BK_Account]
			, [EXT_FKBK_SRC2].[BK_DCLink] AS [BK_DCLink]
			, [DIST_FK2].[AccountLink] AS [AccountLink]
		FROM [DIST_FK2]
		INNER JOIN [CSG_1_FOODS_ext].[Vendor] [EXT_FKBK_SRC2] ON  [DIST_FK2].[AccountLink] = [EXT_FKBK_SRC2].[DCLink]
	)
	INSERT INTO [CSG_1_FOODS_stage].[PostAP](
		 [HK_APTransaction]
		,[HK_Project]
		,[HK_Vendor]
		,[HKLINK_APTransaction_Project]
		,[HKLINK_APTransaction_Vendor]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[SOURCE_SYSTEM]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[AutoIdx]
		,[Project]
		,[AccountLink]
		,[BK_APTransaction]
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
		  UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_cAuditNumber] + '|' +
			[EXT_SRC].[BK_Reference] + '|' +  [EXT_SRC].[BK_cReference2] + '|' +  [EXT_SRC].[BK_AutoIdx] + '|'),2)) AS [HK_APTransaction]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK1].[BK_ProjectCode],
			[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +  COALESCE([FIND_BK_FK1].[BK_ProjectName],
			[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +  COALESCE([FIND_BK_FK1].[BK_ProjectLink],
			[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HK_Project]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK2].[BK_Account],
			[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +  COALESCE([FIND_BK_FK2].[BK_DCLink],[MEX_SRC].[KEY_ATTRIBUTE_INT])+
			'|'),2)) AS [HK_Vendor]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_cAuditNumber] + '|' +
			[EXT_SRC].[BK_Reference] + '|' +  [EXT_SRC].[BK_cReference2] + '|' +  [EXT_SRC].[BK_AutoIdx] + '|' +
			'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK1].[BK_ProjectCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK1].[BK_ProjectName],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK1].[BK_ProjectLink],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HKLINK_APTransaction_Project]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_cAuditNumber] + '|' +
			[EXT_SRC].[BK_Reference] + '|' +  [EXT_SRC].[BK_cReference2] + '|' +  [EXT_SRC].[BK_AutoIdx] + '|' +
			'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK2].[BK_Account],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK2].[BK_DCLink],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HKLINK_APTransaction_Vendor]
		, [EXT_SRC].[LOADDT] AS [LOADDT]
		, [EXT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, 'CSG_1_FOODS' AS [SOURCE_SYSTEM]
		, [EXT_SRC].[CHANGE_TYPE] AS [CHANGE_TYPE]
		, [EXT_SRC].[DATATYPE] AS [DATATYPE]
		, [EXT_SRC].[AutoIdx] AS [AutoIdx]
		, [EXT_SRC].[Project] AS [Project]
		, [EXT_SRC].[AccountLink] AS [AccountLink]
		, [EXT_SRC].[BK_cAuditNumber] + '|' +  [EXT_SRC].[BK_Reference] + '|' +  [EXT_SRC].[BK_cReference2] + '|' +
			[EXT_SRC].[BK_AutoIdx] AS [BK_APTransaction]
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
		, [EXT_SRC].[CRCCheck] AS [CRCCheck]
		, [EXT_SRC].[DTStamp] AS [DTStamp]
		, [EXT_SRC].[UserName] AS [UserName]
		, [EXT_SRC].[iTaxPeriodID] AS [iTaxPeriodID]
		, [EXT_SRC].[iAge] AS [iAge]
		, [EXT_SRC].[dDateAged] AS [dDateAged]
		, [EXT_SRC].[iPostSettlementTermsID] AS [iPostSettlementTermsID]
		, [EXT_SRC].[iTxBranchID] AS [iTxBranchID]
		, [EXT_SRC].[bPBTPaid] AS [bPBTPaid]
		, [EXT_SRC].[iGLTaxAccountID] AS [iGLTaxAccountID]
		, [EXT_SRC].[bTxOnHold] AS [bTxOnHold]
		, [EXT_SRC].[PostAP_iBranchID] AS [PostAP_iBranchID]
		, [EXT_SRC].[PostAP_dCreatedDate] AS [PostAP_dCreatedDate]
		, [EXT_SRC].[PostAP_dModifiedDate] AS [PostAP_dModifiedDate]
		, [EXT_SRC].[PostAP_iCreatedBranchID] AS [PostAP_iCreatedBranchID]
		, [EXT_SRC].[PostAP_iModifiedBranchID] AS [PostAP_iModifiedBranchID]
		, [EXT_SRC].[PostAP_iCreatedAgentID] AS [PostAP_iCreatedAgentID]
		, [EXT_SRC].[PostAP_iModifiedAgentID] AS [PostAP_iModifiedAgentID]
		, [EXT_SRC].[PostAP_iChangeSetID] AS [PostAP_iChangeSetID]
		, [EXT_SRC].[PostAP_Checksum] AS [PostAP_Checksum]
		, [EXT_SRC].[SagePayExtra1] AS [SagePayExtra1]
		, [EXT_SRC].[SagePayExtra2] AS [SagePayExtra2]
		, [EXT_SRC].[SagePayExtra3] AS [SagePayExtra3]
		, [EXT_SRC].[iTaxBadDebtState] AS [iTaxBadDebtState]
		, [EXT_SRC].[bReverseChargeApplied] AS [bReverseChargeApplied]
		, [EXT_SRC].[bReverseChargeCustoms] AS [bReverseChargeCustoms]
		, [EXT_SRC].[cReverseChargeAuditNr] AS [cReverseChargeAuditNr]
	FROM [CSG_1_FOODS_ext].[PostAP] [EXT_SRC]
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [MEX_SRC].[DATATYPE] = 'NA'
	LEFT OUTER JOIN [FIND_BK_FK1] ON  [EXT_SRC].[Project] = [FIND_BK_FK1].[Project]
	LEFT OUTER JOIN [FIND_BK_FK2] ON  [EXT_SRC].[AccountLink] = [FIND_BK_FK2].[AccountLink]
	;
END;


END;

 
 


GO
