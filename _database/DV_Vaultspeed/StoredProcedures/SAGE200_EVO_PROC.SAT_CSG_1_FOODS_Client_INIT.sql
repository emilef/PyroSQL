SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].SAT_CSG_1_FOODS_Client_INIT AS 
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

	DELETE FROM [raw].[SAT_CSG_1_FOODS_Client] 
	WHERE  1 = 1
	;
END;


BEGIN -- SAT_TGT

	WITH [STG_SRC] AS 
	( 
		SELECT
			  [STG_INR_SRC].[HK_Client] AS [HK_Client]
			, [STG_INR_SRC].[LOADDT] AS [LOADDT]
			, [STG_INR_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1',
				COALESCE(REPLACE(REPLACE(RTRIM(REPLACE(REPLACE( REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Name] ),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Title] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Init] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Contact_Person] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Physical1] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Physical2] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Physical3] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Physical4] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Physical5] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[PhysicalPC] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Addressee] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Post1] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Post2] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Post3] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Post4] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Post5] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[PostPC] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Delivered_To] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Telephone] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Telephone2] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Fax1] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Fax2] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[AccountTerms] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[CT] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Tax_Number] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[Registration] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Credit_Limit] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[RepID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Interest_Rate] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Discount] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[On_Hold] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[BFOpenType] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[EMail] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[BankLink] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[BranchCode] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[BankAccNum] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[BankAccType] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[AutoDisc] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[DiscMtrxRow] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[MainAccLink] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[CashDebtor] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[DCBalance] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[CheckTerms] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[UseEmail] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iIncidentTypeID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iBusTypeID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iBusClassID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iCountryID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iAgentID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[dTimeStamp] , 103)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cAccDescription] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cWebPage] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iAreasID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cBankRefNr] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iCurrencyID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bStatPrint] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bStatEmail] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cStatEmailPass] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bForCurAcc] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[fForeignBalance] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bTaxPrompt] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iARPriceListNameID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iSettlementTermsID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bSourceDocPrint] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bSourceDocEmail] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iEUCountryID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iDefTaxTypeID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bCODAccount] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iAgeingTermID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bElecDocAcceptance] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iBankDetailType] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cBankAccHolder] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cIDNumber] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cPassportNumber] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bInsuranceCustomer] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cBankCode] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_INR_SRC].[cSwiftCode] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iSPQueueID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Client_iBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Client_dCreatedDate] , 103)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Client_dModifiedDate] , 103)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Client_iCreatedBranchID] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Client_iModifiedBranchID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Client_iCreatedAgentID] ,
				1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_INR_SRC].[Client_iModifiedAgentID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[Client_iChangeSetID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CAST([STG_INR_SRC].[Client_Checksum]  AS VARCHAR)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bCustomerZoneEnabled] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bOnlineToolsEnabled] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bTaxVerified] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[dDateTaxVerified] , 103)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bBadDebtRelief] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[iTaxState] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_INR_SRC].[bObjectToProcess] , 1)),'#'),'|','\' + '|')+ '|',' ',
				'#' + '|'),'|' + '#',' ')),' ','|' + '#'),'#' + '|',' '),'#')),2)) AS [HASHDIFF]
			, 'N'  AS [ISDELETED]
			, [STG_INR_SRC].[DCLink] AS [DCLink]
			, [STG_INR_SRC].[iClassID] AS [iClassID]
			, [STG_INR_SRC].[Account] AS [Account]
			, [STG_INR_SRC].[Name] AS [Name]
			, [STG_INR_SRC].[Title] AS [Title]
			, [STG_INR_SRC].[Init] AS [Init]
			, [STG_INR_SRC].[Contact_Person] AS [Contact_Person]
			, [STG_INR_SRC].[Physical1] AS [Physical1]
			, [STG_INR_SRC].[Physical2] AS [Physical2]
			, [STG_INR_SRC].[Physical3] AS [Physical3]
			, [STG_INR_SRC].[Physical4] AS [Physical4]
			, [STG_INR_SRC].[Physical5] AS [Physical5]
			, [STG_INR_SRC].[PhysicalPC] AS [PhysicalPC]
			, [STG_INR_SRC].[Addressee] AS [Addressee]
			, [STG_INR_SRC].[Post1] AS [Post1]
			, [STG_INR_SRC].[Post2] AS [Post2]
			, [STG_INR_SRC].[Post3] AS [Post3]
			, [STG_INR_SRC].[Post4] AS [Post4]
			, [STG_INR_SRC].[Post5] AS [Post5]
			, [STG_INR_SRC].[PostPC] AS [PostPC]
			, [STG_INR_SRC].[Delivered_To] AS [Delivered_To]
			, [STG_INR_SRC].[Telephone] AS [Telephone]
			, [STG_INR_SRC].[Telephone2] AS [Telephone2]
			, [STG_INR_SRC].[Fax1] AS [Fax1]
			, [STG_INR_SRC].[Fax2] AS [Fax2]
			, [STG_INR_SRC].[AccountTerms] AS [AccountTerms]
			, [STG_INR_SRC].[CT] AS [CT]
			, [STG_INR_SRC].[Tax_Number] AS [Tax_Number]
			, [STG_INR_SRC].[Registration] AS [Registration]
			, [STG_INR_SRC].[Credit_Limit] AS [Credit_Limit]
			, [STG_INR_SRC].[RepID] AS [RepID]
			, [STG_INR_SRC].[Interest_Rate] AS [Interest_Rate]
			, [STG_INR_SRC].[Discount] AS [Discount]
			, [STG_INR_SRC].[On_Hold] AS [On_Hold]
			, [STG_INR_SRC].[BFOpenType] AS [BFOpenType]
			, [STG_INR_SRC].[EMail] AS [EMail]
			, [STG_INR_SRC].[BankLink] AS [BankLink]
			, [STG_INR_SRC].[BranchCode] AS [BranchCode]
			, [STG_INR_SRC].[BankAccNum] AS [BankAccNum]
			, [STG_INR_SRC].[BankAccType] AS [BankAccType]
			, [STG_INR_SRC].[AutoDisc] AS [AutoDisc]
			, [STG_INR_SRC].[DiscMtrxRow] AS [DiscMtrxRow]
			, [STG_INR_SRC].[MainAccLink] AS [MainAccLink]
			, [STG_INR_SRC].[CashDebtor] AS [CashDebtor]
			, [STG_INR_SRC].[DCBalance] AS [DCBalance]
			, [STG_INR_SRC].[CheckTerms] AS [CheckTerms]
			, [STG_INR_SRC].[UseEmail] AS [UseEmail]
			, [STG_INR_SRC].[iIncidentTypeID] AS [iIncidentTypeID]
			, [STG_INR_SRC].[iBusTypeID] AS [iBusTypeID]
			, [STG_INR_SRC].[iBusClassID] AS [iBusClassID]
			, [STG_INR_SRC].[iCountryID] AS [iCountryID]
			, [STG_INR_SRC].[iAgentID] AS [iAgentID]
			, [STG_INR_SRC].[dTimeStamp] AS [dTimeStamp]
			, [STG_INR_SRC].[cAccDescription] AS [cAccDescription]
			, [STG_INR_SRC].[cWebPage] AS [cWebPage]
			, [STG_INR_SRC].[iAreasID] AS [iAreasID]
			, [STG_INR_SRC].[cBankRefNr] AS [cBankRefNr]
			, [STG_INR_SRC].[iCurrencyID] AS [iCurrencyID]
			, [STG_INR_SRC].[bStatPrint] AS [bStatPrint]
			, [STG_INR_SRC].[bStatEmail] AS [bStatEmail]
			, [STG_INR_SRC].[cStatEmailPass] AS [cStatEmailPass]
			, [STG_INR_SRC].[bForCurAcc] AS [bForCurAcc]
			, [STG_INR_SRC].[fForeignBalance] AS [fForeignBalance]
			, [STG_INR_SRC].[bTaxPrompt] AS [bTaxPrompt]
			, [STG_INR_SRC].[iARPriceListNameID] AS [iARPriceListNameID]
			, [STG_INR_SRC].[iSettlementTermsID] AS [iSettlementTermsID]
			, [STG_INR_SRC].[bSourceDocPrint] AS [bSourceDocPrint]
			, [STG_INR_SRC].[bSourceDocEmail] AS [bSourceDocEmail]
			, [STG_INR_SRC].[iEUCountryID] AS [iEUCountryID]
			, [STG_INR_SRC].[iDefTaxTypeID] AS [iDefTaxTypeID]
			, [STG_INR_SRC].[bCODAccount] AS [bCODAccount]
			, [STG_INR_SRC].[iAgeingTermID] AS [iAgeingTermID]
			, [STG_INR_SRC].[bElecDocAcceptance] AS [bElecDocAcceptance]
			, [STG_INR_SRC].[iBankDetailType] AS [iBankDetailType]
			, [STG_INR_SRC].[cBankAccHolder] AS [cBankAccHolder]
			, [STG_INR_SRC].[cIDNumber] AS [cIDNumber]
			, [STG_INR_SRC].[cPassportNumber] AS [cPassportNumber]
			, [STG_INR_SRC].[bInsuranceCustomer] AS [bInsuranceCustomer]
			, [STG_INR_SRC].[cBankCode] AS [cBankCode]
			, [STG_INR_SRC].[cSwiftCode] AS [cSwiftCode]
			, [STG_INR_SRC].[iSPQueueID] AS [iSPQueueID]
			, [STG_INR_SRC].[Client_iBranchID] AS [Client_iBranchID]
			, [STG_INR_SRC].[Client_dCreatedDate] AS [Client_dCreatedDate]
			, [STG_INR_SRC].[Client_dModifiedDate] AS [Client_dModifiedDate]
			, [STG_INR_SRC].[Client_iCreatedBranchID] AS [Client_iCreatedBranchID]
			, [STG_INR_SRC].[Client_iModifiedBranchID] AS [Client_iModifiedBranchID]
			, [STG_INR_SRC].[Client_iCreatedAgentID] AS [Client_iCreatedAgentID]
			, [STG_INR_SRC].[Client_iModifiedAgentID] AS [Client_iModifiedAgentID]
			, [STG_INR_SRC].[Client_iChangeSetID] AS [Client_iChangeSetID]
			, [STG_INR_SRC].[Client_Checksum] AS [Client_Checksum]
			, [STG_INR_SRC].[bCustomerZoneEnabled] AS [bCustomerZoneEnabled]
			, [STG_INR_SRC].[bOnlineToolsEnabled] AS [bOnlineToolsEnabled]
			, [STG_INR_SRC].[bTaxVerified] AS [bTaxVerified]
			, [STG_INR_SRC].[dDateTaxVerified] AS [dDateTaxVerified]
			, [STG_INR_SRC].[bBadDebtRelief] AS [bBadDebtRelief]
			, [STG_INR_SRC].[iTaxState] AS [iTaxState]
			, [STG_INR_SRC].[bObjectToProcess] AS [bObjectToProcess]
			, ROW_NUMBER()OVER(PARTITION BY [STG_INR_SRC].[HK_Client] ORDER BY [STG_INR_SRC].[LOADDT]) AS [DUMMY]
		FROM [CSG_1_FOODS_stage].[Client] [STG_INR_SRC]
	)
	INSERT INTO [raw].[SAT_CSG_1_FOODS_Client](
		 [HK_Client]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[HASHDIFF]
		,[ISDELETED]
		,[DCLink]
		,[iClassID]
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
		  [STG_SRC].[HK_Client] AS [HK_Client]
		, [STG_SRC].[LOADDT] AS [LOADDT]
		, [STG_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [STG_SRC].[LOADENDDT] AS [LOADENDDT]
		, [STG_SRC].[HASHDIFF] AS [HASHDIFF]
		, [STG_SRC].[ISDELETED] AS [ISDELETED]
		, [STG_SRC].[DCLink] AS [DCLink]
		, [STG_SRC].[iClassID] AS [iClassID]
		, [STG_SRC].[Account] AS [Account]
		, [STG_SRC].[Name] AS [Name]
		, [STG_SRC].[Title] AS [Title]
		, [STG_SRC].[Init] AS [Init]
		, [STG_SRC].[Contact_Person] AS [Contact_Person]
		, [STG_SRC].[Physical1] AS [Physical1]
		, [STG_SRC].[Physical2] AS [Physical2]
		, [STG_SRC].[Physical3] AS [Physical3]
		, [STG_SRC].[Physical4] AS [Physical4]
		, [STG_SRC].[Physical5] AS [Physical5]
		, [STG_SRC].[PhysicalPC] AS [PhysicalPC]
		, [STG_SRC].[Addressee] AS [Addressee]
		, [STG_SRC].[Post1] AS [Post1]
		, [STG_SRC].[Post2] AS [Post2]
		, [STG_SRC].[Post3] AS [Post3]
		, [STG_SRC].[Post4] AS [Post4]
		, [STG_SRC].[Post5] AS [Post5]
		, [STG_SRC].[PostPC] AS [PostPC]
		, [STG_SRC].[Delivered_To] AS [Delivered_To]
		, [STG_SRC].[Telephone] AS [Telephone]
		, [STG_SRC].[Telephone2] AS [Telephone2]
		, [STG_SRC].[Fax1] AS [Fax1]
		, [STG_SRC].[Fax2] AS [Fax2]
		, [STG_SRC].[AccountTerms] AS [AccountTerms]
		, [STG_SRC].[CT] AS [CT]
		, [STG_SRC].[Tax_Number] AS [Tax_Number]
		, [STG_SRC].[Registration] AS [Registration]
		, [STG_SRC].[Credit_Limit] AS [Credit_Limit]
		, [STG_SRC].[RepID] AS [RepID]
		, [STG_SRC].[Interest_Rate] AS [Interest_Rate]
		, [STG_SRC].[Discount] AS [Discount]
		, [STG_SRC].[On_Hold] AS [On_Hold]
		, [STG_SRC].[BFOpenType] AS [BFOpenType]
		, [STG_SRC].[EMail] AS [EMail]
		, [STG_SRC].[BankLink] AS [BankLink]
		, [STG_SRC].[BranchCode] AS [BranchCode]
		, [STG_SRC].[BankAccNum] AS [BankAccNum]
		, [STG_SRC].[BankAccType] AS [BankAccType]
		, [STG_SRC].[AutoDisc] AS [AutoDisc]
		, [STG_SRC].[DiscMtrxRow] AS [DiscMtrxRow]
		, [STG_SRC].[MainAccLink] AS [MainAccLink]
		, [STG_SRC].[CashDebtor] AS [CashDebtor]
		, [STG_SRC].[DCBalance] AS [DCBalance]
		, [STG_SRC].[CheckTerms] AS [CheckTerms]
		, [STG_SRC].[UseEmail] AS [UseEmail]
		, [STG_SRC].[iIncidentTypeID] AS [iIncidentTypeID]
		, [STG_SRC].[iBusTypeID] AS [iBusTypeID]
		, [STG_SRC].[iBusClassID] AS [iBusClassID]
		, [STG_SRC].[iCountryID] AS [iCountryID]
		, [STG_SRC].[iAgentID] AS [iAgentID]
		, [STG_SRC].[dTimeStamp] AS [dTimeStamp]
		, [STG_SRC].[cAccDescription] AS [cAccDescription]
		, [STG_SRC].[cWebPage] AS [cWebPage]
		, [STG_SRC].[iAreasID] AS [iAreasID]
		, [STG_SRC].[cBankRefNr] AS [cBankRefNr]
		, [STG_SRC].[iCurrencyID] AS [iCurrencyID]
		, [STG_SRC].[bStatPrint] AS [bStatPrint]
		, [STG_SRC].[bStatEmail] AS [bStatEmail]
		, [STG_SRC].[cStatEmailPass] AS [cStatEmailPass]
		, [STG_SRC].[bForCurAcc] AS [bForCurAcc]
		, [STG_SRC].[fForeignBalance] AS [fForeignBalance]
		, [STG_SRC].[bTaxPrompt] AS [bTaxPrompt]
		, [STG_SRC].[iARPriceListNameID] AS [iARPriceListNameID]
		, [STG_SRC].[iSettlementTermsID] AS [iSettlementTermsID]
		, [STG_SRC].[bSourceDocPrint] AS [bSourceDocPrint]
		, [STG_SRC].[bSourceDocEmail] AS [bSourceDocEmail]
		, [STG_SRC].[iEUCountryID] AS [iEUCountryID]
		, [STG_SRC].[iDefTaxTypeID] AS [iDefTaxTypeID]
		, [STG_SRC].[bCODAccount] AS [bCODAccount]
		, [STG_SRC].[iAgeingTermID] AS [iAgeingTermID]
		, [STG_SRC].[bElecDocAcceptance] AS [bElecDocAcceptance]
		, [STG_SRC].[iBankDetailType] AS [iBankDetailType]
		, [STG_SRC].[cBankAccHolder] AS [cBankAccHolder]
		, [STG_SRC].[cIDNumber] AS [cIDNumber]
		, [STG_SRC].[cPassportNumber] AS [cPassportNumber]
		, [STG_SRC].[bInsuranceCustomer] AS [bInsuranceCustomer]
		, [STG_SRC].[cBankCode] AS [cBankCode]
		, [STG_SRC].[cSwiftCode] AS [cSwiftCode]
		, [STG_SRC].[iSPQueueID] AS [iSPQueueID]
		, [STG_SRC].[Client_iBranchID] AS [Client_iBranchID]
		, [STG_SRC].[Client_dCreatedDate] AS [Client_dCreatedDate]
		, [STG_SRC].[Client_dModifiedDate] AS [Client_dModifiedDate]
		, [STG_SRC].[Client_iCreatedBranchID] AS [Client_iCreatedBranchID]
		, [STG_SRC].[Client_iModifiedBranchID] AS [Client_iModifiedBranchID]
		, [STG_SRC].[Client_iCreatedAgentID] AS [Client_iCreatedAgentID]
		, [STG_SRC].[Client_iModifiedAgentID] AS [Client_iModifiedAgentID]
		, [STG_SRC].[Client_iChangeSetID] AS [Client_iChangeSetID]
		, [STG_SRC].[Client_Checksum] AS [Client_Checksum]
		, [STG_SRC].[bCustomerZoneEnabled] AS [bCustomerZoneEnabled]
		, [STG_SRC].[bOnlineToolsEnabled] AS [bOnlineToolsEnabled]
		, [STG_SRC].[bTaxVerified] AS [bTaxVerified]
		, [STG_SRC].[dDateTaxVerified] AS [dDateTaxVerified]
		, [STG_SRC].[bBadDebtRelief] AS [bBadDebtRelief]
		, [STG_SRC].[iTaxState] AS [iTaxState]
		, [STG_SRC].[bObjectToProcess] AS [bObjectToProcess]
	FROM [STG_SRC]
	WHERE  [STG_SRC].[DUMMY] = 1
	;
END;


END;

 
 


GO
