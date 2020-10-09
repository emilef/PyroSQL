SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_Vendor_INCR AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_stage].[Vendor];

	WITH [DIST_FK1] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC1].[iClassID] AS [iClassID]
		FROM [CSG_1_FOODS_ext].[Vendor] [EXT_DIS_SRC1]
	)
	, [FIND_BK_FK1] AS 
	( 
		SELECT 
			  UPPER(REPLACE( [SAT_SRC1].[Code] ,'|','\' + '|')) AS [BK_Code]
			, UPPER( CONVERT(VARCHAR, [SAT_SRC1].[idVenClass] , 1)) AS [BK_idVenClass]
			, [DIST_FK1].[iClassID] AS [iClassID]
		FROM [DIST_FK1]
		INNER JOIN [raw].[SAT_CSG_1_FOODS_VendorClass] [SAT_SRC1] ON  [DIST_FK1].[iClassID] = [SAT_SRC1].[idVenClass]
		INNER JOIN [raw].[HUB_VendorClass] [HUB_SRC1] ON  [HUB_SRC1].[HK_VendorClass] = [SAT_SRC1].[HK_VendorClass]
		WHERE  [SAT_SRC1].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' , 103)
		UNION 
		SELECT 
			  [EXT_FKBK_SRC1].[BK_Code] AS [BK_Code]
			, [EXT_FKBK_SRC1].[BK_idVenClass] AS [BK_idVenClass]
			, [DIST_FK1].[iClassID] AS [iClassID]
		FROM [DIST_FK1]
		INNER JOIN [CSG_1_FOODS_ext].[VenClass] [EXT_FKBK_SRC1] ON  [DIST_FK1].[iClassID] = [EXT_FKBK_SRC1].[idVenClass]
	)
	INSERT INTO [CSG_1_FOODS_stage].[Vendor](
		 [HK_Vendor]
		,[HK_VendorClass]
		,[HKLINK_Vendor_VendorClass]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[SOURCE_SYSTEM]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[DCLink]
		,[iClassID]
		,[BK_Vendor]
		,[Account]
		,[Name]
		,[Title]
		,[Init]
		,[Contact_Person]
		,[Physical1]
		,[Physical2]
		,[Physical3]
		,[Physical4]
		,[Physical5]
		,[PhysicalPC]
		,[Addressee]
		,[Post1]
		,[Post2]
		,[Post3]
		,[Post4]
		,[Post5]
		,[PostPC]
		,[Delivered_To]
		,[Telephone]
		,[Telephone2]
		,[Fax1]
		,[Fax2]
		,[AccountTerms]
		,[CT]
		,[Tax_Number]
		,[Registration]
		,[Credit_Limit]
		,[Interest_Rate]
		,[Discount]
		,[On_Hold]
		,[BFOpenType]
		,[EMail]
		,[BankLink]
		,[BranchCode]
		,[BankAccNum]
		,[BankAccType]
		,[AutoDisc]
		,[DiscMtrxRow]
		,[DCBalance]
		,[CheckTerms]
		,[UseEmail]
		,[iBusTypeID]
		,[iBusClassID]
		,[iCountryID]
		,[cAccDescription]
		,[cWebPage]
		,[dTimeStamp]
		,[iAreasID]
		,[cBankRefNr]
		,[iCurrencyID]
		,[bStatPrint]
		,[bStatEmail]
		,[cStatEmailPass]
		,[bForCurAcc]
		,[bRemittanceChequeEFTS]
		,[fForeignBalance]
		,[iSettlementTermsID]
		,[bSourceDocPrint]
		,[bSourceDocEmail]
		,[iEUCountryID]
		,[iDefTaxTypeID]
		,[iAgeingTermID]
		,[iBankDetailType]
		,[cBankAccHolder]
		,[cIDNumber]
		,[cPassportNumber]
		,[cBankCode]
		,[cSwiftCode]
		,[iSPQueueID]
		,[iBankDetailID]
		,[Vendor_iBranchID]
		,[Vendor_dCreatedDate]
		,[Vendor_dModifiedDate]
		,[Vendor_iCreatedBranchID]
		,[Vendor_iModifiedBranchID]
		,[Vendor_iCreatedAgentID]
		,[Vendor_iModifiedAgentID]
		,[Vendor_iChangeSetID]
		,[Vendor_Checksum]
		,[bTaxVerified]
		,[dDateTaxVerified]
		,[cRMCDApprovalNumber]
		,[dRMCDApprovalDate]
		,[iTaxState]
		,[bObjectToProcess]
	)
	SELECT
		  UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_Account] + '|' +
			[EXT_SRC].[BK_DCLink] + '|'),2)) AS [HK_Vendor]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK1].[BK_Code],
			[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +  COALESCE([FIND_BK_FK1].[BK_idVenClass],
			[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HK_VendorClass]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_Account] + '|' +
			[EXT_SRC].[BK_DCLink] + '|' + 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK1].[BK_Code],
			[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +  COALESCE([FIND_BK_FK1].[BK_idVenClass],
			[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HKLINK_Vendor_VendorClass]
		, [EXT_SRC].[LOADDT] AS [LOADDT]
		, [EXT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, 'CSG_1_FOODS' AS [SOURCE_SYSTEM]
		, [EXT_SRC].[CHANGE_TYPE] AS [CHANGE_TYPE]
		, [EXT_SRC].[DATATYPE] AS [DATATYPE]
		, [EXT_SRC].[DCLink] AS [DCLink]
		, [EXT_SRC].[iClassID] AS [iClassID]
		, [EXT_SRC].[BK_Account] + '|' +  [EXT_SRC].[BK_DCLink] AS [BK_Vendor]
		, [EXT_SRC].[Account] AS [Account]
		, [EXT_SRC].[Name] AS [Name]
		, [EXT_SRC].[Title] AS [Title]
		, [EXT_SRC].[Init] AS [Init]
		, [EXT_SRC].[Contact_Person] AS [Contact_Person]
		, [EXT_SRC].[Physical1] AS [Physical1]
		, [EXT_SRC].[Physical2] AS [Physical2]
		, [EXT_SRC].[Physical3] AS [Physical3]
		, [EXT_SRC].[Physical4] AS [Physical4]
		, [EXT_SRC].[Physical5] AS [Physical5]
		, [EXT_SRC].[PhysicalPC] AS [PhysicalPC]
		, [EXT_SRC].[Addressee] AS [Addressee]
		, [EXT_SRC].[Post1] AS [Post1]
		, [EXT_SRC].[Post2] AS [Post2]
		, [EXT_SRC].[Post3] AS [Post3]
		, [EXT_SRC].[Post4] AS [Post4]
		, [EXT_SRC].[Post5] AS [Post5]
		, [EXT_SRC].[PostPC] AS [PostPC]
		, [EXT_SRC].[Delivered_To] AS [Delivered_To]
		, [EXT_SRC].[Telephone] AS [Telephone]
		, [EXT_SRC].[Telephone2] AS [Telephone2]
		, [EXT_SRC].[Fax1] AS [Fax1]
		, [EXT_SRC].[Fax2] AS [Fax2]
		, [EXT_SRC].[AccountTerms] AS [AccountTerms]
		, [EXT_SRC].[CT] AS [CT]
		, [EXT_SRC].[Tax_Number] AS [Tax_Number]
		, [EXT_SRC].[Registration] AS [Registration]
		, [EXT_SRC].[Credit_Limit] AS [Credit_Limit]
		, [EXT_SRC].[Interest_Rate] AS [Interest_Rate]
		, [EXT_SRC].[Discount] AS [Discount]
		, [EXT_SRC].[On_Hold] AS [On_Hold]
		, [EXT_SRC].[BFOpenType] AS [BFOpenType]
		, [EXT_SRC].[EMail] AS [EMail]
		, [EXT_SRC].[BankLink] AS [BankLink]
		, [EXT_SRC].[BranchCode] AS [BranchCode]
		, [EXT_SRC].[BankAccNum] AS [BankAccNum]
		, [EXT_SRC].[BankAccType] AS [BankAccType]
		, [EXT_SRC].[AutoDisc] AS [AutoDisc]
		, [EXT_SRC].[DiscMtrxRow] AS [DiscMtrxRow]
		, [EXT_SRC].[DCBalance] AS [DCBalance]
		, [EXT_SRC].[CheckTerms] AS [CheckTerms]
		, [EXT_SRC].[UseEmail] AS [UseEmail]
		, [EXT_SRC].[iBusTypeID] AS [iBusTypeID]
		, [EXT_SRC].[iBusClassID] AS [iBusClassID]
		, [EXT_SRC].[iCountryID] AS [iCountryID]
		, [EXT_SRC].[cAccDescription] AS [cAccDescription]
		, [EXT_SRC].[cWebPage] AS [cWebPage]
		, [EXT_SRC].[dTimeStamp] AS [dTimeStamp]
		, [EXT_SRC].[iAreasID] AS [iAreasID]
		, [EXT_SRC].[cBankRefNr] AS [cBankRefNr]
		, [EXT_SRC].[iCurrencyID] AS [iCurrencyID]
		, [EXT_SRC].[bStatPrint] AS [bStatPrint]
		, [EXT_SRC].[bStatEmail] AS [bStatEmail]
		, [EXT_SRC].[cStatEmailPass] AS [cStatEmailPass]
		, [EXT_SRC].[bForCurAcc] AS [bForCurAcc]
		, [EXT_SRC].[bRemittanceChequeEFTS] AS [bRemittanceChequeEFTS]
		, [EXT_SRC].[fForeignBalance] AS [fForeignBalance]
		, [EXT_SRC].[iSettlementTermsID] AS [iSettlementTermsID]
		, [EXT_SRC].[bSourceDocPrint] AS [bSourceDocPrint]
		, [EXT_SRC].[bSourceDocEmail] AS [bSourceDocEmail]
		, [EXT_SRC].[iEUCountryID] AS [iEUCountryID]
		, [EXT_SRC].[iDefTaxTypeID] AS [iDefTaxTypeID]
		, [EXT_SRC].[iAgeingTermID] AS [iAgeingTermID]
		, [EXT_SRC].[iBankDetailType] AS [iBankDetailType]
		, [EXT_SRC].[cBankAccHolder] AS [cBankAccHolder]
		, [EXT_SRC].[cIDNumber] AS [cIDNumber]
		, [EXT_SRC].[cPassportNumber] AS [cPassportNumber]
		, [EXT_SRC].[cBankCode] AS [cBankCode]
		, [EXT_SRC].[cSwiftCode] AS [cSwiftCode]
		, [EXT_SRC].[iSPQueueID] AS [iSPQueueID]
		, [EXT_SRC].[iBankDetailID] AS [iBankDetailID]
		, [EXT_SRC].[Vendor_iBranchID] AS [Vendor_iBranchID]
		, [EXT_SRC].[Vendor_dCreatedDate] AS [Vendor_dCreatedDate]
		, [EXT_SRC].[Vendor_dModifiedDate] AS [Vendor_dModifiedDate]
		, [EXT_SRC].[Vendor_iCreatedBranchID] AS [Vendor_iCreatedBranchID]
		, [EXT_SRC].[Vendor_iModifiedBranchID] AS [Vendor_iModifiedBranchID]
		, [EXT_SRC].[Vendor_iCreatedAgentID] AS [Vendor_iCreatedAgentID]
		, [EXT_SRC].[Vendor_iModifiedAgentID] AS [Vendor_iModifiedAgentID]
		, [EXT_SRC].[Vendor_iChangeSetID] AS [Vendor_iChangeSetID]
		, [EXT_SRC].[Vendor_Checksum] AS [Vendor_Checksum]
		, [EXT_SRC].[bTaxVerified] AS [bTaxVerified]
		, [EXT_SRC].[dDateTaxVerified] AS [dDateTaxVerified]
		, [EXT_SRC].[cRMCDApprovalNumber] AS [cRMCDApprovalNumber]
		, [EXT_SRC].[dRMCDApprovalDate] AS [dRMCDApprovalDate]
		, [EXT_SRC].[iTaxState] AS [iTaxState]
		, [EXT_SRC].[bObjectToProcess] AS [bObjectToProcess]
	FROM [CSG_1_FOODS_ext].[Vendor] [EXT_SRC]
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [MEX_SRC].[DATATYPE] = 'NA'
	LEFT OUTER JOIN [FIND_BK_FK1] ON  [EXT_SRC].[iClassID] = [FIND_BK_FK1].[iClassID]
	;
END;


END;

 
 


GO
