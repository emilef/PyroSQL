SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_Client_PREP_DELETE AS 
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
BEGIN -- STG_PREP_DEL_TGT

	INSERT INTO [CSG_1_FOODS_stage].[Client](
		 [HK_Client]
		,[HKLINK_Client_ClientClass]
		,[HK_ClientClass]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[LOAD_CYCLE_ID]
		,[LOADDT]
		,[DCLink]
		,[Account]
		,[BK_Client]
		,[iClassID]
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
		,[RepID]
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
		,[MainAccLink]
		,[CashDebtor]
		,[DCBalance]
		,[CheckTerms]
		,[UseEmail]
		,[iIncidentTypeID]
		,[iBusTypeID]
		,[iBusClassID]
		,[iCountryID]
		,[iAgentID]
		,[dTimeStamp]
		,[cAccDescription]
		,[cWebPage]
		,[iAreasID]
		,[cBankRefNr]
		,[iCurrencyID]
		,[bStatPrint]
		,[bStatEmail]
		,[cStatEmailPass]
		,[bForCurAcc]
		,[fForeignBalance]
		,[bTaxPrompt]
		,[iARPriceListNameID]
		,[iSettlementTermsID]
		,[bSourceDocPrint]
		,[bSourceDocEmail]
		,[iEUCountryID]
		,[iDefTaxTypeID]
		,[bCODAccount]
		,[iAgeingTermID]
		,[bElecDocAcceptance]
		,[iBankDetailType]
		,[cBankAccHolder]
		,[cIDNumber]
		,[cPassportNumber]
		,[bInsuranceCustomer]
		,[cBankCode]
		,[cSwiftCode]
		,[iSPQueueID]
		,[Client_iBranchID]
		,[Client_dCreatedDate]
		,[Client_dModifiedDate]
		,[Client_iCreatedBranchID]
		,[Client_iModifiedBranchID]
		,[Client_iCreatedAgentID]
		,[Client_iModifiedAgentID]
		,[Client_iChangeSetID]
		,[Client_Checksum]
		,[bCustomerZoneEnabled]
		,[bOnlineToolsEnabled]
		,[bTaxVerified]
		,[dDateTaxVerified]
		,[bBadDebtRelief]
		,[iTaxState]
		,[bObjectToProcess]
	)
	SELECT
		  [HUB_SRC].[HK_Client] AS [HK_Client]
		, [LNK_SRC1].[HKLINK_Client_ClientClass] AS [HKLINK_Client_ClientClass]
		, [LNK_SRC1].[HK_ClientClass] AS [HK_ClientClass]
		, '-' AS [CHANGE_TYPE]
		, 'SRC' AS [DATATYPE]
		, [LCI_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [LCI_SRC].[LOADDT] AS [LOADDT]
		, [SAT_SRC1].[DCLink] AS [DCLink]
		, [SAT_SRC1].[Account] AS [Account]
		, [HUB_SRC].[BK_Client] AS [BK_Client]
		, [LKS_SRC1].[iClassID] AS [iClassID]
		, [SAT_SRC1].[Name] AS [Name]
		, [SAT_SRC1].[Title] AS [Title]
		, [SAT_SRC1].[Init] AS [Init]
		, [SAT_SRC1].[Contact_Person] AS [Contact_Person]
		, [SAT_SRC1].[Physical1] AS [Physical1]
		, [SAT_SRC1].[Physical2] AS [Physical2]
		, [SAT_SRC1].[Physical3] AS [Physical3]
		, [SAT_SRC1].[Physical4] AS [Physical4]
		, [SAT_SRC1].[Physical5] AS [Physical5]
		, [SAT_SRC1].[PhysicalPC] AS [PhysicalPC]
		, [SAT_SRC1].[Addressee] AS [Addressee]
		, [SAT_SRC1].[Post1] AS [Post1]
		, [SAT_SRC1].[Post2] AS [Post2]
		, [SAT_SRC1].[Post3] AS [Post3]
		, [SAT_SRC1].[Post4] AS [Post4]
		, [SAT_SRC1].[Post5] AS [Post5]
		, [SAT_SRC1].[PostPC] AS [PostPC]
		, [SAT_SRC1].[Delivered_To] AS [Delivered_To]
		, [SAT_SRC1].[Telephone] AS [Telephone]
		, [SAT_SRC1].[Telephone2] AS [Telephone2]
		, [SAT_SRC1].[Fax1] AS [Fax1]
		, [SAT_SRC1].[Fax2] AS [Fax2]
		, [SAT_SRC1].[AccountTerms] AS [AccountTerms]
		, [SAT_SRC1].[CT] AS [CT]
		, [SAT_SRC1].[Tax_Number] AS [Tax_Number]
		, [SAT_SRC1].[Registration] AS [Registration]
		, [SAT_SRC1].[Credit_Limit] AS [Credit_Limit]
		, [SAT_SRC1].[RepID] AS [RepID]
		, [SAT_SRC1].[Interest_Rate] AS [Interest_Rate]
		, [SAT_SRC1].[Discount] AS [Discount]
		, [SAT_SRC1].[On_Hold] AS [On_Hold]
		, [SAT_SRC1].[BFOpenType] AS [BFOpenType]
		, [SAT_SRC1].[EMail] AS [EMail]
		, [SAT_SRC1].[BankLink] AS [BankLink]
		, [SAT_SRC1].[BranchCode] AS [BranchCode]
		, [SAT_SRC1].[BankAccNum] AS [BankAccNum]
		, [SAT_SRC1].[BankAccType] AS [BankAccType]
		, [SAT_SRC1].[AutoDisc] AS [AutoDisc]
		, [SAT_SRC1].[DiscMtrxRow] AS [DiscMtrxRow]
		, [SAT_SRC1].[MainAccLink] AS [MainAccLink]
		, [SAT_SRC1].[CashDebtor] AS [CashDebtor]
		, [SAT_SRC1].[DCBalance] AS [DCBalance]
		, [SAT_SRC1].[CheckTerms] AS [CheckTerms]
		, [SAT_SRC1].[UseEmail] AS [UseEmail]
		, [SAT_SRC1].[iIncidentTypeID] AS [iIncidentTypeID]
		, [SAT_SRC1].[iBusTypeID] AS [iBusTypeID]
		, [SAT_SRC1].[iBusClassID] AS [iBusClassID]
		, [SAT_SRC1].[iCountryID] AS [iCountryID]
		, [SAT_SRC1].[iAgentID] AS [iAgentID]
		, [SAT_SRC1].[dTimeStamp] AS [dTimeStamp]
		, [SAT_SRC1].[cAccDescription] AS [cAccDescription]
		, [SAT_SRC1].[cWebPage] AS [cWebPage]
		, [SAT_SRC1].[iAreasID] AS [iAreasID]
		, [SAT_SRC1].[cBankRefNr] AS [cBankRefNr]
		, [SAT_SRC1].[iCurrencyID] AS [iCurrencyID]
		, [SAT_SRC1].[bStatPrint] AS [bStatPrint]
		, [SAT_SRC1].[bStatEmail] AS [bStatEmail]
		, [SAT_SRC1].[cStatEmailPass] AS [cStatEmailPass]
		, [SAT_SRC1].[bForCurAcc] AS [bForCurAcc]
		, [SAT_SRC1].[fForeignBalance] AS [fForeignBalance]
		, [SAT_SRC1].[bTaxPrompt] AS [bTaxPrompt]
		, [SAT_SRC1].[iARPriceListNameID] AS [iARPriceListNameID]
		, [SAT_SRC1].[iSettlementTermsID] AS [iSettlementTermsID]
		, [SAT_SRC1].[bSourceDocPrint] AS [bSourceDocPrint]
		, [SAT_SRC1].[bSourceDocEmail] AS [bSourceDocEmail]
		, [SAT_SRC1].[iEUCountryID] AS [iEUCountryID]
		, [SAT_SRC1].[iDefTaxTypeID] AS [iDefTaxTypeID]
		, [SAT_SRC1].[bCODAccount] AS [bCODAccount]
		, [SAT_SRC1].[iAgeingTermID] AS [iAgeingTermID]
		, [SAT_SRC1].[bElecDocAcceptance] AS [bElecDocAcceptance]
		, [SAT_SRC1].[iBankDetailType] AS [iBankDetailType]
		, [SAT_SRC1].[cBankAccHolder] AS [cBankAccHolder]
		, [SAT_SRC1].[cIDNumber] AS [cIDNumber]
		, [SAT_SRC1].[cPassportNumber] AS [cPassportNumber]
		, [SAT_SRC1].[bInsuranceCustomer] AS [bInsuranceCustomer]
		, [SAT_SRC1].[cBankCode] AS [cBankCode]
		, [SAT_SRC1].[cSwiftCode] AS [cSwiftCode]
		, [SAT_SRC1].[iSPQueueID] AS [iSPQueueID]
		, [SAT_SRC1].[Client_iBranchID] AS [Client_iBranchID]
		, [SAT_SRC1].[Client_dCreatedDate] AS [Client_dCreatedDate]
		, [SAT_SRC1].[Client_dModifiedDate] AS [Client_dModifiedDate]
		, [SAT_SRC1].[Client_iCreatedBranchID] AS [Client_iCreatedBranchID]
		, [SAT_SRC1].[Client_iModifiedBranchID] AS [Client_iModifiedBranchID]
		, [SAT_SRC1].[Client_iCreatedAgentID] AS [Client_iCreatedAgentID]
		, [SAT_SRC1].[Client_iModifiedAgentID] AS [Client_iModifiedAgentID]
		, [SAT_SRC1].[Client_iChangeSetID] AS [Client_iChangeSetID]
		, [SAT_SRC1].[Client_Checksum] AS [Client_Checksum]
		, [SAT_SRC1].[bCustomerZoneEnabled] AS [bCustomerZoneEnabled]
		, [SAT_SRC1].[bOnlineToolsEnabled] AS [bOnlineToolsEnabled]
		, [SAT_SRC1].[bTaxVerified] AS [bTaxVerified]
		, [SAT_SRC1].[dDateTaxVerified] AS [dDateTaxVerified]
		, [SAT_SRC1].[bBadDebtRelief] AS [bBadDebtRelief]
		, [SAT_SRC1].[iTaxState] AS [iTaxState]
		, [SAT_SRC1].[bObjectToProcess] AS [bObjectToProcess]
	FROM [raw].[HUB_Client] [HUB_SRC]
	INNER JOIN [raw].[SAT_CSG_1_FOODS_Client] [SAT_SRC1] ON  [SAT_SRC1].[HK_Client] = [HUB_SRC].[HK_Client] AND [SAT_SRC1].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' ,
		103) AND [SAT_SRC1].[ISDELETED] = 'N'
	INNER JOIN [raw].[LINK_Client_ClientClass] [LNK_SRC1] ON  [LNK_SRC1].[HK_Client] = [HUB_SRC].[HK_Client]
	INNER JOIN [raw].[LINKSAT_CSG_1_FOODS_Client_ClientClass] [LKS_SRC1] ON  [LKS_SRC1].[HKLINK_Client_ClientClass] = [LNK_SRC1].[HKLINK_Client_ClientClass] AND [LKS_SRC1].[LOADENDDT] =
		CONVERT(DATETIME2, '31/12/2999' , 103) AND [LKS_SRC1].[ISDELETED] = 'N'
	LEFT OUTER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [HUB_SRC].[LOAD_CYCLE_ID] = CONVERT(int, [MEX_SRC].[LOAD_CYCLE_ID] )
	INNER JOIN [dc].[LOAD_CYCLE_HIST] [LCI_SRC] ON  1 = 1
	LEFT OUTER JOIN [CSG_1_FOODS_stage].[Client] [STG_SRC] ON  [HUB_SRC].[HK_Client] = [STG_SRC].[HK_Client] AND [HUB_SRC].[SOURCE_SYSTEM] = [STG_SRC].[SOURCE_SYSTEM]
	WHERE  [STG_SRC].[LOAD_CYCLE_ID] IS NULL AND [MEX_SRC].[LOAD_CYCLE_ID] IS NULL
	;
END;


END;

 
 


GO
