SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].SAT_CSG_1_FOODS_Client_INCR AS 
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
BEGIN -- SAT_TEMP_TGT

	TRUNCATE TABLE [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_Client];

	WITH [DIST_STG] AS 
	( 
		SELECT DISTINCT 
 			  [STG_DIS_SRC].[HK_Client] AS [HK_Client]
			, [STG_DIS_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		FROM [CSG_1_FOODS_stage].[Client] [STG_DIS_SRC]
	)
	, [TEMP_TABLE_SET] AS 
	( 
		SELECT 
			  [STG_TEMP_SRC].[HK_Client] AS [HK_Client]
			, [STG_TEMP_SRC].[LOADDT] AS [LOADDT]
			, CONVERT(DATETIME2, '31/12/2999' , 103) AS [LOADENDDT]
			, [STG_TEMP_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, [STG_TEMP_SRC].[DATATYPE] AS [DATATYPE]
			, 'STG' AS [SRC]
			, 1 AS [ORIGIN_ID]
			, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1',
				COALESCE(REPLACE(REPLACE(RTRIM(REPLACE(REPLACE( REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Name] ),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Title] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Init] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Contact_Person] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Physical1] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Physical2] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Physical3] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Physical4] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Physical5] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[PhysicalPC] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Addressee] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Post1] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Post2] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Post3] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Post4] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Post5] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[PostPC] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Delivered_To] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Telephone] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Telephone2] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Fax1] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Fax2] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[AccountTerms] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[CT] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Tax_Number] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[Registration] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Credit_Limit] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[RepID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Interest_Rate] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Discount] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[On_Hold] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[BFOpenType] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[EMail] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[BankLink] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[BranchCode] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[BankAccNum] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[BankAccType] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[AutoDisc] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[DiscMtrxRow] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[MainAccLink] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[CashDebtor] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[DCBalance] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[CheckTerms] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[UseEmail] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iIncidentTypeID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iBusTypeID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iBusClassID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iCountryID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iAgentID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[dTimeStamp] , 103)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cAccDescription] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cWebPage] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iAreasID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cBankRefNr] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iCurrencyID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bStatPrint] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bStatEmail] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cStatEmailPass] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bForCurAcc] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[fForeignBalance] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bTaxPrompt] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iARPriceListNameID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iSettlementTermsID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bSourceDocPrint] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bSourceDocEmail] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iEUCountryID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iDefTaxTypeID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bCODAccount] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iAgeingTermID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bElecDocAcceptance] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iBankDetailType] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cBankAccHolder] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cIDNumber] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cPassportNumber] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bInsuranceCustomer] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cBankCode] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( [STG_TEMP_SRC].[cSwiftCode] ),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iSPQueueID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Client_iBranchID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Client_dCreatedDate] , 103)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Client_dModifiedDate] , 103)),'#'),'|','\' +
				'|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Client_iCreatedBranchID] , 1)),'#'),'|',
				'\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Client_iModifiedBranchID] , 1)),
				'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Client_iCreatedAgentID] ,
				1)),'#'),'|','\' + '|')+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR,
				[STG_TEMP_SRC].[Client_iModifiedAgentID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[Client_iChangeSetID] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CAST([STG_TEMP_SRC].[Client_Checksum]  AS VARCHAR)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bCustomerZoneEnabled] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bOnlineToolsEnabled] , 1)),'#'),'|','\' + '|')
				+ '|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bTaxVerified] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[dDateTaxVerified] , 103)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bBadDebtRelief] , 1)),'#'),'|','\' + '|')+
				'|' +  REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[iTaxState] , 1)),'#'),'|','\' + '|')+ '|' +
				REPLACE(COALESCE([SAGE200_EVO_PROC].[TRIM]( CONVERT(VARCHAR, [STG_TEMP_SRC].[bObjectToProcess] , 1)),'#'),'|','\' + '|')+ '|',' ',
				'#' + '|'),'|' + '#',' ')),' ','|' + '#'),'#' + '|',' '),'#')),2)) AS [HASHDIFF]
			, CASE WHEN [STG_TEMP_SRC].[CHANGE_TYPE] = '-' THEN 'Y'  ELSE 'N'  END AS [ISDELETED]
			, [STG_TEMP_SRC].[DCLink] AS [DCLink]
			, [STG_TEMP_SRC].[iClassID] AS [iClassID]
			, [STG_TEMP_SRC].[Account] AS [Account]
			, [STG_TEMP_SRC].[Name] AS [Name]
			, [STG_TEMP_SRC].[Title] AS [Title]
			, [STG_TEMP_SRC].[Init] AS [Init]
			, [STG_TEMP_SRC].[Contact_Person] AS [Contact_Person]
			, [STG_TEMP_SRC].[Physical1] AS [Physical1]
			, [STG_TEMP_SRC].[Physical2] AS [Physical2]
			, [STG_TEMP_SRC].[Physical3] AS [Physical3]
			, [STG_TEMP_SRC].[Physical4] AS [Physical4]
			, [STG_TEMP_SRC].[Physical5] AS [Physical5]
			, [STG_TEMP_SRC].[PhysicalPC] AS [PhysicalPC]
			, [STG_TEMP_SRC].[Addressee] AS [Addressee]
			, [STG_TEMP_SRC].[Post1] AS [Post1]
			, [STG_TEMP_SRC].[Post2] AS [Post2]
			, [STG_TEMP_SRC].[Post3] AS [Post3]
			, [STG_TEMP_SRC].[Post4] AS [Post4]
			, [STG_TEMP_SRC].[Post5] AS [Post5]
			, [STG_TEMP_SRC].[PostPC] AS [PostPC]
			, [STG_TEMP_SRC].[Delivered_To] AS [Delivered_To]
			, [STG_TEMP_SRC].[Telephone] AS [Telephone]
			, [STG_TEMP_SRC].[Telephone2] AS [Telephone2]
			, [STG_TEMP_SRC].[Fax1] AS [Fax1]
			, [STG_TEMP_SRC].[Fax2] AS [Fax2]
			, [STG_TEMP_SRC].[AccountTerms] AS [AccountTerms]
			, [STG_TEMP_SRC].[CT] AS [CT]
			, [STG_TEMP_SRC].[Tax_Number] AS [Tax_Number]
			, [STG_TEMP_SRC].[Registration] AS [Registration]
			, [STG_TEMP_SRC].[Credit_Limit] AS [Credit_Limit]
			, [STG_TEMP_SRC].[RepID] AS [RepID]
			, [STG_TEMP_SRC].[Interest_Rate] AS [Interest_Rate]
			, [STG_TEMP_SRC].[Discount] AS [Discount]
			, [STG_TEMP_SRC].[On_Hold] AS [On_Hold]
			, [STG_TEMP_SRC].[BFOpenType] AS [BFOpenType]
			, [STG_TEMP_SRC].[EMail] AS [EMail]
			, [STG_TEMP_SRC].[BankLink] AS [BankLink]
			, [STG_TEMP_SRC].[BranchCode] AS [BranchCode]
			, [STG_TEMP_SRC].[BankAccNum] AS [BankAccNum]
			, [STG_TEMP_SRC].[BankAccType] AS [BankAccType]
			, [STG_TEMP_SRC].[AutoDisc] AS [AutoDisc]
			, [STG_TEMP_SRC].[DiscMtrxRow] AS [DiscMtrxRow]
			, [STG_TEMP_SRC].[MainAccLink] AS [MainAccLink]
			, [STG_TEMP_SRC].[CashDebtor] AS [CashDebtor]
			, [STG_TEMP_SRC].[DCBalance] AS [DCBalance]
			, [STG_TEMP_SRC].[CheckTerms] AS [CheckTerms]
			, [STG_TEMP_SRC].[UseEmail] AS [UseEmail]
			, [STG_TEMP_SRC].[iIncidentTypeID] AS [iIncidentTypeID]
			, [STG_TEMP_SRC].[iBusTypeID] AS [iBusTypeID]
			, [STG_TEMP_SRC].[iBusClassID] AS [iBusClassID]
			, [STG_TEMP_SRC].[iCountryID] AS [iCountryID]
			, [STG_TEMP_SRC].[iAgentID] AS [iAgentID]
			, [STG_TEMP_SRC].[dTimeStamp] AS [dTimeStamp]
			, [STG_TEMP_SRC].[cAccDescription] AS [cAccDescription]
			, [STG_TEMP_SRC].[cWebPage] AS [cWebPage]
			, [STG_TEMP_SRC].[iAreasID] AS [iAreasID]
			, [STG_TEMP_SRC].[cBankRefNr] AS [cBankRefNr]
			, [STG_TEMP_SRC].[iCurrencyID] AS [iCurrencyID]
			, [STG_TEMP_SRC].[bStatPrint] AS [bStatPrint]
			, [STG_TEMP_SRC].[bStatEmail] AS [bStatEmail]
			, [STG_TEMP_SRC].[cStatEmailPass] AS [cStatEmailPass]
			, [STG_TEMP_SRC].[bForCurAcc] AS [bForCurAcc]
			, [STG_TEMP_SRC].[fForeignBalance] AS [fForeignBalance]
			, [STG_TEMP_SRC].[bTaxPrompt] AS [bTaxPrompt]
			, [STG_TEMP_SRC].[iARPriceListNameID] AS [iARPriceListNameID]
			, [STG_TEMP_SRC].[iSettlementTermsID] AS [iSettlementTermsID]
			, [STG_TEMP_SRC].[bSourceDocPrint] AS [bSourceDocPrint]
			, [STG_TEMP_SRC].[bSourceDocEmail] AS [bSourceDocEmail]
			, [STG_TEMP_SRC].[iEUCountryID] AS [iEUCountryID]
			, [STG_TEMP_SRC].[iDefTaxTypeID] AS [iDefTaxTypeID]
			, [STG_TEMP_SRC].[bCODAccount] AS [bCODAccount]
			, [STG_TEMP_SRC].[iAgeingTermID] AS [iAgeingTermID]
			, [STG_TEMP_SRC].[bElecDocAcceptance] AS [bElecDocAcceptance]
			, [STG_TEMP_SRC].[iBankDetailType] AS [iBankDetailType]
			, [STG_TEMP_SRC].[cBankAccHolder] AS [cBankAccHolder]
			, [STG_TEMP_SRC].[cIDNumber] AS [cIDNumber]
			, [STG_TEMP_SRC].[cPassportNumber] AS [cPassportNumber]
			, [STG_TEMP_SRC].[bInsuranceCustomer] AS [bInsuranceCustomer]
			, [STG_TEMP_SRC].[cBankCode] AS [cBankCode]
			, [STG_TEMP_SRC].[cSwiftCode] AS [cSwiftCode]
			, [STG_TEMP_SRC].[iSPQueueID] AS [iSPQueueID]
			, [STG_TEMP_SRC].[Client_iBranchID] AS [Client_iBranchID]
			, [STG_TEMP_SRC].[Client_dCreatedDate] AS [Client_dCreatedDate]
			, [STG_TEMP_SRC].[Client_dModifiedDate] AS [Client_dModifiedDate]
			, [STG_TEMP_SRC].[Client_iCreatedBranchID] AS [Client_iCreatedBranchID]
			, [STG_TEMP_SRC].[Client_iModifiedBranchID] AS [Client_iModifiedBranchID]
			, [STG_TEMP_SRC].[Client_iCreatedAgentID] AS [Client_iCreatedAgentID]
			, [STG_TEMP_SRC].[Client_iModifiedAgentID] AS [Client_iModifiedAgentID]
			, [STG_TEMP_SRC].[Client_iChangeSetID] AS [Client_iChangeSetID]
			, [STG_TEMP_SRC].[Client_Checksum] AS [Client_Checksum]
			, [STG_TEMP_SRC].[bCustomerZoneEnabled] AS [bCustomerZoneEnabled]
			, [STG_TEMP_SRC].[bOnlineToolsEnabled] AS [bOnlineToolsEnabled]
			, [STG_TEMP_SRC].[bTaxVerified] AS [bTaxVerified]
			, [STG_TEMP_SRC].[dDateTaxVerified] AS [dDateTaxVerified]
			, [STG_TEMP_SRC].[bBadDebtRelief] AS [bBadDebtRelief]
			, [STG_TEMP_SRC].[iTaxState] AS [iTaxState]
			, [STG_TEMP_SRC].[bObjectToProcess] AS [bObjectToProcess]
		FROM [CSG_1_FOODS_stage].[Client] [STG_TEMP_SRC]
		WHERE  [STG_TEMP_SRC].[DATATYPE] = 'SRC'
		UNION ALL 
		SELECT 
			  [SAT_SRC].[HK_Client] AS [HK_Client]
			, [SAT_SRC].[LOADDT] AS [LOADDT]
			, [SAT_SRC].[LOADENDDT] AS [LOADENDDT]
			, [SAT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
			, 'SAT' AS [DATATYPE]
			, 'SAT' AS [SRC]
			, 0 AS [ORIGIN_ID]
			, [SAT_SRC].[HASHDIFF] AS [HASHDIFF]
			, [SAT_SRC].[ISDELETED] AS [ISDELETED]
			, [SAT_SRC].[DCLink] AS [DCLink]
			, [SAT_SRC].[iClassID] AS [iClassID]
			, [SAT_SRC].[Account] AS [Account]
			, [SAT_SRC].[Name] AS [Name]
			, [SAT_SRC].[Title] AS [Title]
			, [SAT_SRC].[Init] AS [Init]
			, [SAT_SRC].[Contact_Person] AS [Contact_Person]
			, [SAT_SRC].[Physical1] AS [Physical1]
			, [SAT_SRC].[Physical2] AS [Physical2]
			, [SAT_SRC].[Physical3] AS [Physical3]
			, [SAT_SRC].[Physical4] AS [Physical4]
			, [SAT_SRC].[Physical5] AS [Physical5]
			, [SAT_SRC].[PhysicalPC] AS [PhysicalPC]
			, [SAT_SRC].[Addressee] AS [Addressee]
			, [SAT_SRC].[Post1] AS [Post1]
			, [SAT_SRC].[Post2] AS [Post2]
			, [SAT_SRC].[Post3] AS [Post3]
			, [SAT_SRC].[Post4] AS [Post4]
			, [SAT_SRC].[Post5] AS [Post5]
			, [SAT_SRC].[PostPC] AS [PostPC]
			, [SAT_SRC].[Delivered_To] AS [Delivered_To]
			, [SAT_SRC].[Telephone] AS [Telephone]
			, [SAT_SRC].[Telephone2] AS [Telephone2]
			, [SAT_SRC].[Fax1] AS [Fax1]
			, [SAT_SRC].[Fax2] AS [Fax2]
			, [SAT_SRC].[AccountTerms] AS [AccountTerms]
			, [SAT_SRC].[CT] AS [CT]
			, [SAT_SRC].[Tax_Number] AS [Tax_Number]
			, [SAT_SRC].[Registration] AS [Registration]
			, [SAT_SRC].[Credit_Limit] AS [Credit_Limit]
			, [SAT_SRC].[RepID] AS [RepID]
			, [SAT_SRC].[Interest_Rate] AS [Interest_Rate]
			, [SAT_SRC].[Discount] AS [Discount]
			, [SAT_SRC].[On_Hold] AS [On_Hold]
			, [SAT_SRC].[BFOpenType] AS [BFOpenType]
			, [SAT_SRC].[EMail] AS [EMail]
			, [SAT_SRC].[BankLink] AS [BankLink]
			, [SAT_SRC].[BranchCode] AS [BranchCode]
			, [SAT_SRC].[BankAccNum] AS [BankAccNum]
			, [SAT_SRC].[BankAccType] AS [BankAccType]
			, [SAT_SRC].[AutoDisc] AS [AutoDisc]
			, [SAT_SRC].[DiscMtrxRow] AS [DiscMtrxRow]
			, [SAT_SRC].[MainAccLink] AS [MainAccLink]
			, [SAT_SRC].[CashDebtor] AS [CashDebtor]
			, [SAT_SRC].[DCBalance] AS [DCBalance]
			, [SAT_SRC].[CheckTerms] AS [CheckTerms]
			, [SAT_SRC].[UseEmail] AS [UseEmail]
			, [SAT_SRC].[iIncidentTypeID] AS [iIncidentTypeID]
			, [SAT_SRC].[iBusTypeID] AS [iBusTypeID]
			, [SAT_SRC].[iBusClassID] AS [iBusClassID]
			, [SAT_SRC].[iCountryID] AS [iCountryID]
			, [SAT_SRC].[iAgentID] AS [iAgentID]
			, [SAT_SRC].[dTimeStamp] AS [dTimeStamp]
			, [SAT_SRC].[cAccDescription] AS [cAccDescription]
			, [SAT_SRC].[cWebPage] AS [cWebPage]
			, [SAT_SRC].[iAreasID] AS [iAreasID]
			, [SAT_SRC].[cBankRefNr] AS [cBankRefNr]
			, [SAT_SRC].[iCurrencyID] AS [iCurrencyID]
			, [SAT_SRC].[bStatPrint] AS [bStatPrint]
			, [SAT_SRC].[bStatEmail] AS [bStatEmail]
			, [SAT_SRC].[cStatEmailPass] AS [cStatEmailPass]
			, [SAT_SRC].[bForCurAcc] AS [bForCurAcc]
			, [SAT_SRC].[fForeignBalance] AS [fForeignBalance]
			, [SAT_SRC].[bTaxPrompt] AS [bTaxPrompt]
			, [SAT_SRC].[iARPriceListNameID] AS [iARPriceListNameID]
			, [SAT_SRC].[iSettlementTermsID] AS [iSettlementTermsID]
			, [SAT_SRC].[bSourceDocPrint] AS [bSourceDocPrint]
			, [SAT_SRC].[bSourceDocEmail] AS [bSourceDocEmail]
			, [SAT_SRC].[iEUCountryID] AS [iEUCountryID]
			, [SAT_SRC].[iDefTaxTypeID] AS [iDefTaxTypeID]
			, [SAT_SRC].[bCODAccount] AS [bCODAccount]
			, [SAT_SRC].[iAgeingTermID] AS [iAgeingTermID]
			, [SAT_SRC].[bElecDocAcceptance] AS [bElecDocAcceptance]
			, [SAT_SRC].[iBankDetailType] AS [iBankDetailType]
			, [SAT_SRC].[cBankAccHolder] AS [cBankAccHolder]
			, [SAT_SRC].[cIDNumber] AS [cIDNumber]
			, [SAT_SRC].[cPassportNumber] AS [cPassportNumber]
			, [SAT_SRC].[bInsuranceCustomer] AS [bInsuranceCustomer]
			, [SAT_SRC].[cBankCode] AS [cBankCode]
			, [SAT_SRC].[cSwiftCode] AS [cSwiftCode]
			, [SAT_SRC].[iSPQueueID] AS [iSPQueueID]
			, [SAT_SRC].[Client_iBranchID] AS [Client_iBranchID]
			, [SAT_SRC].[Client_dCreatedDate] AS [Client_dCreatedDate]
			, [SAT_SRC].[Client_dModifiedDate] AS [Client_dModifiedDate]
			, [SAT_SRC].[Client_iCreatedBranchID] AS [Client_iCreatedBranchID]
			, [SAT_SRC].[Client_iModifiedBranchID] AS [Client_iModifiedBranchID]
			, [SAT_SRC].[Client_iCreatedAgentID] AS [Client_iCreatedAgentID]
			, [SAT_SRC].[Client_iModifiedAgentID] AS [Client_iModifiedAgentID]
			, [SAT_SRC].[Client_iChangeSetID] AS [Client_iChangeSetID]
			, [SAT_SRC].[Client_Checksum] AS [Client_Checksum]
			, [SAT_SRC].[bCustomerZoneEnabled] AS [bCustomerZoneEnabled]
			, [SAT_SRC].[bOnlineToolsEnabled] AS [bOnlineToolsEnabled]
			, [SAT_SRC].[bTaxVerified] AS [bTaxVerified]
			, [SAT_SRC].[dDateTaxVerified] AS [dDateTaxVerified]
			, [SAT_SRC].[bBadDebtRelief] AS [bBadDebtRelief]
			, [SAT_SRC].[iTaxState] AS [iTaxState]
			, [SAT_SRC].[bObjectToProcess] AS [bObjectToProcess]
		FROM [raw].[SAT_CSG_1_FOODS_Client] [SAT_SRC]
		INNER JOIN [DIST_STG] ON  [SAT_SRC].[HK_Client] = [DIST_STG].[HK_Client]
		WHERE  [SAT_SRC].[LOADENDDT] = CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	INSERT INTO [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_Client](
		 [HK_Client]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[LOADENDDT]
		,[DATATYPE]
		,[SRC]
		,[EQUAL]
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
		  [TEMP_TABLE_SET].[HK_Client] AS [HK_Client]
		, [TEMP_TABLE_SET].[LOADDT] AS [LOADDT]
		, [TEMP_TABLE_SET].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [TEMP_TABLE_SET].[LOADENDDT] AS [LOADENDDT]
		, [TEMP_TABLE_SET].[DATATYPE] AS [DATATYPE]
		, [TEMP_TABLE_SET].[SRC] AS [SRC]
		, CASE WHEN [TEMP_TABLE_SET].[SRC] = 'STG' AND CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HASHDIFF]  AS VARCHAR) = LAG( CAST([TEMP_TABLE_SET].[ISDELETED]  AS VARCHAR) +
			CAST([TEMP_TABLE_SET].[HASHDIFF]  AS VARCHAR),1)
			OVER(PARTITION BY [TEMP_TABLE_SET].[HK_Client] ORDER BY [TEMP_TABLE_SET].[LOADDT],[TEMP_TABLE_SET].[ORIGIN_ID])
			THEN 1 ELSE 0 END AS [EQUAL]
		, [TEMP_TABLE_SET].[HASHDIFF] AS [HASHDIFF]
		, [TEMP_TABLE_SET].[ISDELETED] AS [ISDELETED]
		, [TEMP_TABLE_SET].[DCLink] AS [DCLink]
		, [TEMP_TABLE_SET].[iClassID] AS [iClassID]
		, [TEMP_TABLE_SET].[Account] AS [Account]
		, [TEMP_TABLE_SET].[Name] AS [Name]
		, [TEMP_TABLE_SET].[Title] AS [Title]
		, [TEMP_TABLE_SET].[Init] AS [Init]
		, [TEMP_TABLE_SET].[Contact_Person] AS [Contact_Person]
		, [TEMP_TABLE_SET].[Physical1] AS [Physical1]
		, [TEMP_TABLE_SET].[Physical2] AS [Physical2]
		, [TEMP_TABLE_SET].[Physical3] AS [Physical3]
		, [TEMP_TABLE_SET].[Physical4] AS [Physical4]
		, [TEMP_TABLE_SET].[Physical5] AS [Physical5]
		, [TEMP_TABLE_SET].[PhysicalPC] AS [PhysicalPC]
		, [TEMP_TABLE_SET].[Addressee] AS [Addressee]
		, [TEMP_TABLE_SET].[Post1] AS [Post1]
		, [TEMP_TABLE_SET].[Post2] AS [Post2]
		, [TEMP_TABLE_SET].[Post3] AS [Post3]
		, [TEMP_TABLE_SET].[Post4] AS [Post4]
		, [TEMP_TABLE_SET].[Post5] AS [Post5]
		, [TEMP_TABLE_SET].[PostPC] AS [PostPC]
		, [TEMP_TABLE_SET].[Delivered_To] AS [Delivered_To]
		, [TEMP_TABLE_SET].[Telephone] AS [Telephone]
		, [TEMP_TABLE_SET].[Telephone2] AS [Telephone2]
		, [TEMP_TABLE_SET].[Fax1] AS [Fax1]
		, [TEMP_TABLE_SET].[Fax2] AS [Fax2]
		, [TEMP_TABLE_SET].[AccountTerms] AS [AccountTerms]
		, [TEMP_TABLE_SET].[CT] AS [CT]
		, [TEMP_TABLE_SET].[Tax_Number] AS [Tax_Number]
		, [TEMP_TABLE_SET].[Registration] AS [Registration]
		, [TEMP_TABLE_SET].[Credit_Limit] AS [Credit_Limit]
		, [TEMP_TABLE_SET].[RepID] AS [RepID]
		, [TEMP_TABLE_SET].[Interest_Rate] AS [Interest_Rate]
		, [TEMP_TABLE_SET].[Discount] AS [Discount]
		, [TEMP_TABLE_SET].[On_Hold] AS [On_Hold]
		, [TEMP_TABLE_SET].[BFOpenType] AS [BFOpenType]
		, [TEMP_TABLE_SET].[EMail] AS [EMail]
		, [TEMP_TABLE_SET].[BankLink] AS [BankLink]
		, [TEMP_TABLE_SET].[BranchCode] AS [BranchCode]
		, [TEMP_TABLE_SET].[BankAccNum] AS [BankAccNum]
		, [TEMP_TABLE_SET].[BankAccType] AS [BankAccType]
		, [TEMP_TABLE_SET].[AutoDisc] AS [AutoDisc]
		, [TEMP_TABLE_SET].[DiscMtrxRow] AS [DiscMtrxRow]
		, [TEMP_TABLE_SET].[MainAccLink] AS [MainAccLink]
		, [TEMP_TABLE_SET].[CashDebtor] AS [CashDebtor]
		, [TEMP_TABLE_SET].[DCBalance] AS [DCBalance]
		, [TEMP_TABLE_SET].[CheckTerms] AS [CheckTerms]
		, [TEMP_TABLE_SET].[UseEmail] AS [UseEmail]
		, [TEMP_TABLE_SET].[iIncidentTypeID] AS [iIncidentTypeID]
		, [TEMP_TABLE_SET].[iBusTypeID] AS [iBusTypeID]
		, [TEMP_TABLE_SET].[iBusClassID] AS [iBusClassID]
		, [TEMP_TABLE_SET].[iCountryID] AS [iCountryID]
		, [TEMP_TABLE_SET].[iAgentID] AS [iAgentID]
		, [TEMP_TABLE_SET].[dTimeStamp] AS [dTimeStamp]
		, [TEMP_TABLE_SET].[cAccDescription] AS [cAccDescription]
		, [TEMP_TABLE_SET].[cWebPage] AS [cWebPage]
		, [TEMP_TABLE_SET].[iAreasID] AS [iAreasID]
		, [TEMP_TABLE_SET].[cBankRefNr] AS [cBankRefNr]
		, [TEMP_TABLE_SET].[iCurrencyID] AS [iCurrencyID]
		, [TEMP_TABLE_SET].[bStatPrint] AS [bStatPrint]
		, [TEMP_TABLE_SET].[bStatEmail] AS [bStatEmail]
		, [TEMP_TABLE_SET].[cStatEmailPass] AS [cStatEmailPass]
		, [TEMP_TABLE_SET].[bForCurAcc] AS [bForCurAcc]
		, [TEMP_TABLE_SET].[fForeignBalance] AS [fForeignBalance]
		, [TEMP_TABLE_SET].[bTaxPrompt] AS [bTaxPrompt]
		, [TEMP_TABLE_SET].[iARPriceListNameID] AS [iARPriceListNameID]
		, [TEMP_TABLE_SET].[iSettlementTermsID] AS [iSettlementTermsID]
		, [TEMP_TABLE_SET].[bSourceDocPrint] AS [bSourceDocPrint]
		, [TEMP_TABLE_SET].[bSourceDocEmail] AS [bSourceDocEmail]
		, [TEMP_TABLE_SET].[iEUCountryID] AS [iEUCountryID]
		, [TEMP_TABLE_SET].[iDefTaxTypeID] AS [iDefTaxTypeID]
		, [TEMP_TABLE_SET].[bCODAccount] AS [bCODAccount]
		, [TEMP_TABLE_SET].[iAgeingTermID] AS [iAgeingTermID]
		, [TEMP_TABLE_SET].[bElecDocAcceptance] AS [bElecDocAcceptance]
		, [TEMP_TABLE_SET].[iBankDetailType] AS [iBankDetailType]
		, [TEMP_TABLE_SET].[cBankAccHolder] AS [cBankAccHolder]
		, [TEMP_TABLE_SET].[cIDNumber] AS [cIDNumber]
		, [TEMP_TABLE_SET].[cPassportNumber] AS [cPassportNumber]
		, [TEMP_TABLE_SET].[bInsuranceCustomer] AS [bInsuranceCustomer]
		, [TEMP_TABLE_SET].[cBankCode] AS [cBankCode]
		, [TEMP_TABLE_SET].[cSwiftCode] AS [cSwiftCode]
		, [TEMP_TABLE_SET].[iSPQueueID] AS [iSPQueueID]
		, [TEMP_TABLE_SET].[Client_iBranchID] AS [Client_iBranchID]
		, [TEMP_TABLE_SET].[Client_dCreatedDate] AS [Client_dCreatedDate]
		, [TEMP_TABLE_SET].[Client_dModifiedDate] AS [Client_dModifiedDate]
		, [TEMP_TABLE_SET].[Client_iCreatedBranchID] AS [Client_iCreatedBranchID]
		, [TEMP_TABLE_SET].[Client_iModifiedBranchID] AS [Client_iModifiedBranchID]
		, [TEMP_TABLE_SET].[Client_iCreatedAgentID] AS [Client_iCreatedAgentID]
		, [TEMP_TABLE_SET].[Client_iModifiedAgentID] AS [Client_iModifiedAgentID]
		, [TEMP_TABLE_SET].[Client_iChangeSetID] AS [Client_iChangeSetID]
		, [TEMP_TABLE_SET].[Client_Checksum] AS [Client_Checksum]
		, [TEMP_TABLE_SET].[bCustomerZoneEnabled] AS [bCustomerZoneEnabled]
		, [TEMP_TABLE_SET].[bOnlineToolsEnabled] AS [bOnlineToolsEnabled]
		, [TEMP_TABLE_SET].[bTaxVerified] AS [bTaxVerified]
		, [TEMP_TABLE_SET].[dDateTaxVerified] AS [dDateTaxVerified]
		, [TEMP_TABLE_SET].[bBadDebtRelief] AS [bBadDebtRelief]
		, [TEMP_TABLE_SET].[iTaxState] AS [iTaxState]
		, [TEMP_TABLE_SET].[bObjectToProcess] AS [bObjectToProcess]
	FROM [TEMP_TABLE_SET]
	;
END;


BEGIN -- SAT_INUR_TGT

	INSERT INTO [raw].[SAT_CSG_1_FOODS_Client](
		 [HK_Client]
		,[LOADDT]
		,[LOADENDDT]
		,[LOAD_CYCLE_ID]
		,[ISDELETED]
		,[HASHDIFF]
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
		  [SAT_TEMP_SRC_INUR].[HK_Client] AS [HK_Client]
		, [SAT_TEMP_SRC_INUR].[LOADDT] AS [LOADDT]
		, [SAT_TEMP_SRC_INUR].[LOADENDDT] AS [LOADENDDT]
		, [SAT_TEMP_SRC_INUR].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, [SAT_TEMP_SRC_INUR].[ISDELETED] AS [ISDELETED]
		, [SAT_TEMP_SRC_INUR].[HASHDIFF] AS [HASHDIFF]
		, [SAT_TEMP_SRC_INUR].[DCLink] AS [DCLink]
		, [SAT_TEMP_SRC_INUR].[iClassID] AS [iClassID]
		, [SAT_TEMP_SRC_INUR].[Account] AS [Account]
		, [SAT_TEMP_SRC_INUR].[Name] AS [Name]
		, [SAT_TEMP_SRC_INUR].[Title] AS [Title]
		, [SAT_TEMP_SRC_INUR].[Init] AS [Init]
		, [SAT_TEMP_SRC_INUR].[Contact_Person] AS [Contact_Person]
		, [SAT_TEMP_SRC_INUR].[Physical1] AS [Physical1]
		, [SAT_TEMP_SRC_INUR].[Physical2] AS [Physical2]
		, [SAT_TEMP_SRC_INUR].[Physical3] AS [Physical3]
		, [SAT_TEMP_SRC_INUR].[Physical4] AS [Physical4]
		, [SAT_TEMP_SRC_INUR].[Physical5] AS [Physical5]
		, [SAT_TEMP_SRC_INUR].[PhysicalPC] AS [PhysicalPC]
		, [SAT_TEMP_SRC_INUR].[Addressee] AS [Addressee]
		, [SAT_TEMP_SRC_INUR].[Post1] AS [Post1]
		, [SAT_TEMP_SRC_INUR].[Post2] AS [Post2]
		, [SAT_TEMP_SRC_INUR].[Post3] AS [Post3]
		, [SAT_TEMP_SRC_INUR].[Post4] AS [Post4]
		, [SAT_TEMP_SRC_INUR].[Post5] AS [Post5]
		, [SAT_TEMP_SRC_INUR].[PostPC] AS [PostPC]
		, [SAT_TEMP_SRC_INUR].[Delivered_To] AS [Delivered_To]
		, [SAT_TEMP_SRC_INUR].[Telephone] AS [Telephone]
		, [SAT_TEMP_SRC_INUR].[Telephone2] AS [Telephone2]
		, [SAT_TEMP_SRC_INUR].[Fax1] AS [Fax1]
		, [SAT_TEMP_SRC_INUR].[Fax2] AS [Fax2]
		, [SAT_TEMP_SRC_INUR].[AccountTerms] AS [AccountTerms]
		, [SAT_TEMP_SRC_INUR].[CT] AS [CT]
		, [SAT_TEMP_SRC_INUR].[Tax_Number] AS [Tax_Number]
		, [SAT_TEMP_SRC_INUR].[Registration] AS [Registration]
		, [SAT_TEMP_SRC_INUR].[Credit_Limit] AS [Credit_Limit]
		, [SAT_TEMP_SRC_INUR].[RepID] AS [RepID]
		, [SAT_TEMP_SRC_INUR].[Interest_Rate] AS [Interest_Rate]
		, [SAT_TEMP_SRC_INUR].[Discount] AS [Discount]
		, [SAT_TEMP_SRC_INUR].[On_Hold] AS [On_Hold]
		, [SAT_TEMP_SRC_INUR].[BFOpenType] AS [BFOpenType]
		, [SAT_TEMP_SRC_INUR].[EMail] AS [EMail]
		, [SAT_TEMP_SRC_INUR].[BankLink] AS [BankLink]
		, [SAT_TEMP_SRC_INUR].[BranchCode] AS [BranchCode]
		, [SAT_TEMP_SRC_INUR].[BankAccNum] AS [BankAccNum]
		, [SAT_TEMP_SRC_INUR].[BankAccType] AS [BankAccType]
		, [SAT_TEMP_SRC_INUR].[AutoDisc] AS [AutoDisc]
		, [SAT_TEMP_SRC_INUR].[DiscMtrxRow] AS [DiscMtrxRow]
		, [SAT_TEMP_SRC_INUR].[MainAccLink] AS [MainAccLink]
		, [SAT_TEMP_SRC_INUR].[CashDebtor] AS [CashDebtor]
		, [SAT_TEMP_SRC_INUR].[DCBalance] AS [DCBalance]
		, [SAT_TEMP_SRC_INUR].[CheckTerms] AS [CheckTerms]
		, [SAT_TEMP_SRC_INUR].[UseEmail] AS [UseEmail]
		, [SAT_TEMP_SRC_INUR].[iIncidentTypeID] AS [iIncidentTypeID]
		, [SAT_TEMP_SRC_INUR].[iBusTypeID] AS [iBusTypeID]
		, [SAT_TEMP_SRC_INUR].[iBusClassID] AS [iBusClassID]
		, [SAT_TEMP_SRC_INUR].[iCountryID] AS [iCountryID]
		, [SAT_TEMP_SRC_INUR].[iAgentID] AS [iAgentID]
		, [SAT_TEMP_SRC_INUR].[dTimeStamp] AS [dTimeStamp]
		, [SAT_TEMP_SRC_INUR].[cAccDescription] AS [cAccDescription]
		, [SAT_TEMP_SRC_INUR].[cWebPage] AS [cWebPage]
		, [SAT_TEMP_SRC_INUR].[iAreasID] AS [iAreasID]
		, [SAT_TEMP_SRC_INUR].[cBankRefNr] AS [cBankRefNr]
		, [SAT_TEMP_SRC_INUR].[iCurrencyID] AS [iCurrencyID]
		, [SAT_TEMP_SRC_INUR].[bStatPrint] AS [bStatPrint]
		, [SAT_TEMP_SRC_INUR].[bStatEmail] AS [bStatEmail]
		, [SAT_TEMP_SRC_INUR].[cStatEmailPass] AS [cStatEmailPass]
		, [SAT_TEMP_SRC_INUR].[bForCurAcc] AS [bForCurAcc]
		, [SAT_TEMP_SRC_INUR].[fForeignBalance] AS [fForeignBalance]
		, [SAT_TEMP_SRC_INUR].[bTaxPrompt] AS [bTaxPrompt]
		, [SAT_TEMP_SRC_INUR].[iARPriceListNameID] AS [iARPriceListNameID]
		, [SAT_TEMP_SRC_INUR].[iSettlementTermsID] AS [iSettlementTermsID]
		, [SAT_TEMP_SRC_INUR].[bSourceDocPrint] AS [bSourceDocPrint]
		, [SAT_TEMP_SRC_INUR].[bSourceDocEmail] AS [bSourceDocEmail]
		, [SAT_TEMP_SRC_INUR].[iEUCountryID] AS [iEUCountryID]
		, [SAT_TEMP_SRC_INUR].[iDefTaxTypeID] AS [iDefTaxTypeID]
		, [SAT_TEMP_SRC_INUR].[bCODAccount] AS [bCODAccount]
		, [SAT_TEMP_SRC_INUR].[iAgeingTermID] AS [iAgeingTermID]
		, [SAT_TEMP_SRC_INUR].[bElecDocAcceptance] AS [bElecDocAcceptance]
		, [SAT_TEMP_SRC_INUR].[iBankDetailType] AS [iBankDetailType]
		, [SAT_TEMP_SRC_INUR].[cBankAccHolder] AS [cBankAccHolder]
		, [SAT_TEMP_SRC_INUR].[cIDNumber] AS [cIDNumber]
		, [SAT_TEMP_SRC_INUR].[cPassportNumber] AS [cPassportNumber]
		, [SAT_TEMP_SRC_INUR].[bInsuranceCustomer] AS [bInsuranceCustomer]
		, [SAT_TEMP_SRC_INUR].[cBankCode] AS [cBankCode]
		, [SAT_TEMP_SRC_INUR].[cSwiftCode] AS [cSwiftCode]
		, [SAT_TEMP_SRC_INUR].[iSPQueueID] AS [iSPQueueID]
		, [SAT_TEMP_SRC_INUR].[Client_iBranchID] AS [Client_iBranchID]
		, [SAT_TEMP_SRC_INUR].[Client_dCreatedDate] AS [Client_dCreatedDate]
		, [SAT_TEMP_SRC_INUR].[Client_dModifiedDate] AS [Client_dModifiedDate]
		, [SAT_TEMP_SRC_INUR].[Client_iCreatedBranchID] AS [Client_iCreatedBranchID]
		, [SAT_TEMP_SRC_INUR].[Client_iModifiedBranchID] AS [Client_iModifiedBranchID]
		, [SAT_TEMP_SRC_INUR].[Client_iCreatedAgentID] AS [Client_iCreatedAgentID]
		, [SAT_TEMP_SRC_INUR].[Client_iModifiedAgentID] AS [Client_iModifiedAgentID]
		, [SAT_TEMP_SRC_INUR].[Client_iChangeSetID] AS [Client_iChangeSetID]
		, [SAT_TEMP_SRC_INUR].[Client_Checksum] AS [Client_Checksum]
		, [SAT_TEMP_SRC_INUR].[bCustomerZoneEnabled] AS [bCustomerZoneEnabled]
		, [SAT_TEMP_SRC_INUR].[bOnlineToolsEnabled] AS [bOnlineToolsEnabled]
		, [SAT_TEMP_SRC_INUR].[bTaxVerified] AS [bTaxVerified]
		, [SAT_TEMP_SRC_INUR].[dDateTaxVerified] AS [dDateTaxVerified]
		, [SAT_TEMP_SRC_INUR].[bBadDebtRelief] AS [bBadDebtRelief]
		, [SAT_TEMP_SRC_INUR].[iTaxState] AS [iTaxState]
		, [SAT_TEMP_SRC_INUR].[bObjectToProcess] AS [bObjectToProcess]
	FROM [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_Client] [SAT_TEMP_SRC_INUR]
	WHERE  [SAT_TEMP_SRC_INUR].[SRC] = 'STG' AND [SAT_TEMP_SRC_INUR].[EQUAL] = 0
	;
END;


BEGIN -- SAT_ED_TGT

	WITH [CALC_LOAD_END_DATE] AS 
	( 
		SELECT
			  [SAT_TEMP_SRC_US].[HK_Client] AS [HK_Client]
			, [SAT_TEMP_SRC_US].[LOADDT] AS [LOADDT]
			, COALESCE(LEAD([SAT_TEMP_SRC_US].[LOADDT],1)
				OVER(PARTITION BY [SAT_TEMP_SRC_US].[HK_Client] ORDER BY [SAT_TEMP_SRC_US].[LOADDT]), CONVERT(DATETIME2,
				'31/12/2999' , 103)) AS [LOADENDDT]
		FROM [CSG_1_FOODS_stage].[TMP_SAT_CSG_1_FOODS_Client] [SAT_TEMP_SRC_US]
		WHERE  [SAT_TEMP_SRC_US].[EQUAL] = 0
	)
	, [FILTER_LOAD_END_DATE] AS 
	( 
		SELECT
			  [CALC_LOAD_END_DATE].[HK_Client] AS [HK_Client]
			, [CALC_LOAD_END_DATE].[LOADDT] AS [LOADDT]
			, [CALC_LOAD_END_DATE].[LOADENDDT] AS [LOADENDDT]
		FROM [CALC_LOAD_END_DATE]
		WHERE  [CALC_LOAD_END_DATE].[LOADENDDT] != CONVERT(DATETIME2, '31/12/2999' , 103)
	)
	UPDATE [SAT_ED_TGT]
	SET 
		 [LOADENDDT] =  [FILTER_LOAD_END_DATE].[LOADENDDT]
	FROM [FILTER_LOAD_END_DATE]
	JOIN [raw].[SAT_CSG_1_FOODS_Client] [SAT_ED_TGT] ON 1 = 1 
	WHERE [SAT_ED_TGT].[HK_Client] =  [FILTER_LOAD_END_DATE].[HK_Client]
	  AND [SAT_ED_TGT].[LOADDT] =  [FILTER_LOAD_END_DATE].[LOADDT]
	;
END;


END;

 
 


GO
