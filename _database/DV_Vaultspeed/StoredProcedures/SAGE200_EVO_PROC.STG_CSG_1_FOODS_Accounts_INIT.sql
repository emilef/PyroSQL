SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [SAGE200_EVO_PROC].STG_CSG_1_FOODS_Accounts_INIT AS 
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

	TRUNCATE TABLE [CSG_1_FOODS_stage].[Accounts];

	WITH [DIST_FK1] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC1].[iGLSegment0ID] AS [iGLSegment0ID]
		FROM [CSG_1_FOODS_ext].[Accounts] [EXT_DIS_SRC1]
	)
	, [DIST_FK2] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC2].[iGLSegment1ID] AS [iGLSegment1ID]
		FROM [CSG_1_FOODS_ext].[Accounts] [EXT_DIS_SRC2]
	)
	, [DIST_FK3] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC3].[iGLSegment2ID] AS [iGLSegment2ID]
		FROM [CSG_1_FOODS_ext].[Accounts] [EXT_DIS_SRC3]
	)
	, [DIST_FK4] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC4].[iGLSegment3ID] AS [iGLSegment3ID]
		FROM [CSG_1_FOODS_ext].[Accounts] [EXT_DIS_SRC4]
	)
	, [DIST_FK5] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC5].[iGLSegment4ID] AS [iGLSegment4ID]
		FROM [CSG_1_FOODS_ext].[Accounts] [EXT_DIS_SRC5]
	)
	, [DIST_FK6] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC6].[iGLSegment5ID] AS [iGLSegment5ID]
		FROM [CSG_1_FOODS_ext].[Accounts] [EXT_DIS_SRC6]
	)
	, [DIST_FK7] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC7].[iGLSegment6ID] AS [iGLSegment6ID]
		FROM [CSG_1_FOODS_ext].[Accounts] [EXT_DIS_SRC7]
	)
	, [DIST_FK8] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC8].[iGLSegment7ID] AS [iGLSegment7ID]
		FROM [CSG_1_FOODS_ext].[Accounts] [EXT_DIS_SRC8]
	)
	, [DIST_FK9] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC9].[iGLSegment8ID] AS [iGLSegment8ID]
		FROM [CSG_1_FOODS_ext].[Accounts] [EXT_DIS_SRC9]
	)
	, [DIST_FK10] AS 
	( 
		SELECT DISTINCT 
 			  [EXT_DIS_SRC10].[iGLSegment9ID] AS [iGLSegment9ID]
		FROM [CSG_1_FOODS_ext].[Accounts] [EXT_DIS_SRC10]
	)
	, [FIND_BK_FK1] AS 
	( 
		SELECT
			  [EXT_FKBK_SRC1].[BK_iSegmentNo] AS [BK_iSegmentNo]
			, [EXT_FKBK_SRC1].[BK_cCode] AS [BK_cCode]
			, [EXT_FKBK_SRC1].[BK_idSegment] AS [BK_idSegment]
			, [DIST_FK1].[iGLSegment0ID] AS [iGLSegment0ID]
		FROM [DIST_FK1]
		INNER JOIN [CSG_1_FOODS_ext].[_etblGLSegment] [EXT_FKBK_SRC1] ON  [DIST_FK1].[iGLSegment0ID] = [EXT_FKBK_SRC1].[idSegment]
	)
	, [FIND_BK_FK2] AS 
	( 
		SELECT
			  [EXT_FKBK_SRC2].[BK_iSegmentNo] AS [BK_iSegmentNo]
			, [EXT_FKBK_SRC2].[BK_cCode] AS [BK_cCode]
			, [EXT_FKBK_SRC2].[BK_idSegment] AS [BK_idSegment]
			, [DIST_FK2].[iGLSegment1ID] AS [iGLSegment1ID]
		FROM [DIST_FK2]
		INNER JOIN [CSG_1_FOODS_ext].[_etblGLSegment] [EXT_FKBK_SRC2] ON  [DIST_FK2].[iGLSegment1ID] = [EXT_FKBK_SRC2].[idSegment]
	)
	, [FIND_BK_FK3] AS 
	( 
		SELECT
			  [EXT_FKBK_SRC3].[BK_iSegmentNo] AS [BK_iSegmentNo]
			, [EXT_FKBK_SRC3].[BK_cCode] AS [BK_cCode]
			, [EXT_FKBK_SRC3].[BK_idSegment] AS [BK_idSegment]
			, [DIST_FK3].[iGLSegment2ID] AS [iGLSegment2ID]
		FROM [DIST_FK3]
		INNER JOIN [CSG_1_FOODS_ext].[_etblGLSegment] [EXT_FKBK_SRC3] ON  [DIST_FK3].[iGLSegment2ID] = [EXT_FKBK_SRC3].[idSegment]
	)
	, [FIND_BK_FK4] AS 
	( 
		SELECT
			  [EXT_FKBK_SRC4].[BK_iSegmentNo] AS [BK_iSegmentNo]
			, [EXT_FKBK_SRC4].[BK_cCode] AS [BK_cCode]
			, [EXT_FKBK_SRC4].[BK_idSegment] AS [BK_idSegment]
			, [DIST_FK4].[iGLSegment3ID] AS [iGLSegment3ID]
		FROM [DIST_FK4]
		INNER JOIN [CSG_1_FOODS_ext].[_etblGLSegment] [EXT_FKBK_SRC4] ON  [DIST_FK4].[iGLSegment3ID] = [EXT_FKBK_SRC4].[idSegment]
	)
	, [FIND_BK_FK5] AS 
	( 
		SELECT
			  [EXT_FKBK_SRC5].[BK_iSegmentNo] AS [BK_iSegmentNo]
			, [EXT_FKBK_SRC5].[BK_cCode] AS [BK_cCode]
			, [EXT_FKBK_SRC5].[BK_idSegment] AS [BK_idSegment]
			, [DIST_FK5].[iGLSegment4ID] AS [iGLSegment4ID]
		FROM [DIST_FK5]
		INNER JOIN [CSG_1_FOODS_ext].[_etblGLSegment] [EXT_FKBK_SRC5] ON  [DIST_FK5].[iGLSegment4ID] = [EXT_FKBK_SRC5].[idSegment]
	)
	, [FIND_BK_FK6] AS 
	( 
		SELECT
			  [EXT_FKBK_SRC6].[BK_iSegmentNo] AS [BK_iSegmentNo]
			, [EXT_FKBK_SRC6].[BK_cCode] AS [BK_cCode]
			, [EXT_FKBK_SRC6].[BK_idSegment] AS [BK_idSegment]
			, [DIST_FK6].[iGLSegment5ID] AS [iGLSegment5ID]
		FROM [DIST_FK6]
		INNER JOIN [CSG_1_FOODS_ext].[_etblGLSegment] [EXT_FKBK_SRC6] ON  [DIST_FK6].[iGLSegment5ID] = [EXT_FKBK_SRC6].[idSegment]
	)
	, [FIND_BK_FK7] AS 
	( 
		SELECT
			  [EXT_FKBK_SRC7].[BK_iSegmentNo] AS [BK_iSegmentNo]
			, [EXT_FKBK_SRC7].[BK_cCode] AS [BK_cCode]
			, [EXT_FKBK_SRC7].[BK_idSegment] AS [BK_idSegment]
			, [DIST_FK7].[iGLSegment6ID] AS [iGLSegment6ID]
		FROM [DIST_FK7]
		INNER JOIN [CSG_1_FOODS_ext].[_etblGLSegment] [EXT_FKBK_SRC7] ON  [DIST_FK7].[iGLSegment6ID] = [EXT_FKBK_SRC7].[idSegment]
	)
	, [FIND_BK_FK8] AS 
	( 
		SELECT
			  [EXT_FKBK_SRC8].[BK_iSegmentNo] AS [BK_iSegmentNo]
			, [EXT_FKBK_SRC8].[BK_cCode] AS [BK_cCode]
			, [EXT_FKBK_SRC8].[BK_idSegment] AS [BK_idSegment]
			, [DIST_FK8].[iGLSegment7ID] AS [iGLSegment7ID]
		FROM [DIST_FK8]
		INNER JOIN [CSG_1_FOODS_ext].[_etblGLSegment] [EXT_FKBK_SRC8] ON  [DIST_FK8].[iGLSegment7ID] = [EXT_FKBK_SRC8].[idSegment]
	)
	, [FIND_BK_FK9] AS 
	( 
		SELECT
			  [EXT_FKBK_SRC9].[BK_iSegmentNo] AS [BK_iSegmentNo]
			, [EXT_FKBK_SRC9].[BK_cCode] AS [BK_cCode]
			, [EXT_FKBK_SRC9].[BK_idSegment] AS [BK_idSegment]
			, [DIST_FK9].[iGLSegment8ID] AS [iGLSegment8ID]
		FROM [DIST_FK9]
		INNER JOIN [CSG_1_FOODS_ext].[_etblGLSegment] [EXT_FKBK_SRC9] ON  [DIST_FK9].[iGLSegment8ID] = [EXT_FKBK_SRC9].[idSegment]
	)
	, [FIND_BK_FK10] AS 
	( 
		SELECT
			  [EXT_FKBK_SRC10].[BK_iSegmentNo] AS [BK_iSegmentNo]
			, [EXT_FKBK_SRC10].[BK_cCode] AS [BK_cCode]
			, [EXT_FKBK_SRC10].[BK_idSegment] AS [BK_idSegment]
			, [DIST_FK10].[iGLSegment9ID] AS [iGLSegment9ID]
		FROM [DIST_FK10]
		INNER JOIN [CSG_1_FOODS_ext].[_etblGLSegment] [EXT_FKBK_SRC10] ON  [DIST_FK10].[iGLSegment9ID] = [EXT_FKBK_SRC10].[idSegment]
	)
	INSERT INTO [CSG_1_FOODS_stage].[Accounts](
		 [HK_GLAccount]
		,[HK_GLSegment_Segment0]
		,[HK_GLSegment_Segment1]
		,[HK_GLSegment_Segment2]
		,[HK_GLSegment_Segment3]
		,[HK_GLSegment_Segment4]
		,[HK_GLSegment_Segment5]
		,[HK_GLSegment_Segment6]
		,[HK_GLSegment_Segment7]
		,[HK_GLSegment_Segment8]
		,[HK_GLSegment_Segment9]
		,[HKLINK_GLAccount_GLSegment_Segment0]
		,[HKLINK_GLAccount_GLSegment_Segment1]
		,[HKLINK_GLAccount_GLSegment_Segment2]
		,[HKLINK_GLAccount_GLSegment_Segment3]
		,[HKLINK_GLAccount_GLSegment_Segment4]
		,[HKLINK_GLAccount_GLSegment_Segment5]
		,[HKLINK_GLAccount_GLSegment_Segment6]
		,[HKLINK_GLAccount_GLSegment_Segment7]
		,[HKLINK_GLAccount_GLSegment_Segment8]
		,[HKLINK_GLAccount_GLSegment_Segment9]
		,[LOADDT]
		,[LOAD_CYCLE_ID]
		,[SOURCE_SYSTEM]
		,[CHANGE_TYPE]
		,[DATATYPE]
		,[AccountLink]
		,[iGLSegment0ID]
		,[iGLSegment1ID]
		,[iGLSegment2ID]
		,[iGLSegment3ID]
		,[iGLSegment4ID]
		,[iGLSegment5ID]
		,[iGLSegment6ID]
		,[iGLSegment7ID]
		,[iGLSegment8ID]
		,[iGLSegment9ID]
		,[BK_GLAccount]
		,[Master_Sub_Account]
		,[AccountLevel]
		,[Account]
		,[iAccountType]
		,[SubAccOfLink]
		,[Dept]
		,[Brch]
		,[Jr]
		,[Description]
		,[CaseAcc]
		,[ActiveAccount]
		,[dAccountsTimeStamp]
		,[cNextChequeNum]
		,[iReportCategoryID]
		,[fBankStatementBalance]
		,[cExtDescription]
		,[iTaxTypeINVID]
		,[iTaxTypeCRNID]
		,[iTaxTypeGRVID]
		,[iTaxTypeRTSID]
		,[iAllowICSales]
		,[iAllowICPurchases]
		,[iMBReportingCategoryID]
		,[iMBCashFlowCategoryID]
		,[bMBIsAsset]
		,[bMBIsGrant]
		,[iMBAssetClassificationID]
		,[iMBAssetCategoryID]
		,[iMBAssetTypeID]
		,[iMBGrantLevel1TypeID]
		,[iMBGrantLevel2TypeID]
		,[iMBGrantLevel3TypeID]
		,[bIsBranchLoanAccount]
		,[iForeignBankCurrencyID]
		,[iForeignBankPEXAccID]
		,[iForeignBankLEXAccID]
		,[bRevalueWithSellingRate]
		,[bPaymentsBasedTax]
		,[cBankName]
		,[cBankAccountName]
		,[cBankCode]
		,[cBankAccountNumber]
		,[cBranchName]
		,[cSEPABranchCode]
		,[cBankRefNr]
		,[iAttributeGroupID]
		,[xAttribute]
		,[bForeignBankAcc]
		,[Accounts_iBranchID]
		,[Accounts_dCreatedDate]
		,[Accounts_dModifiedDate]
		,[Accounts_iCreatedBranchID]
		,[Accounts_iModifiedBranchID]
		,[Accounts_iCreatedAgentID]
		,[Accounts_iModifiedAgentID]
		,[Accounts_iChangeSetID]
		,[Accounts_Checksum]
		,[cBCloudBankAccountID]
	)
	SELECT
		  UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_AccountLink] + '|'),2)) AS [HK_GLAccount]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK1].[BK_iSegmentNo],
			[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +  COALESCE([FIND_BK_FK1].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+
			'|' +  COALESCE([FIND_BK_FK1].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HK_GLSegment_Segment0]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK2].[BK_iSegmentNo],
			[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +  COALESCE([FIND_BK_FK2].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+
			'|' +  COALESCE([FIND_BK_FK2].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HK_GLSegment_Segment1]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK3].[BK_iSegmentNo],
			[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +  COALESCE([FIND_BK_FK3].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+
			'|' +  COALESCE([FIND_BK_FK3].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HK_GLSegment_Segment2]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK4].[BK_iSegmentNo],
			[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +  COALESCE([FIND_BK_FK4].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+
			'|' +  COALESCE([FIND_BK_FK4].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HK_GLSegment_Segment3]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK5].[BK_iSegmentNo],
			[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +  COALESCE([FIND_BK_FK5].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+
			'|' +  COALESCE([FIND_BK_FK5].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HK_GLSegment_Segment4]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK6].[BK_iSegmentNo],
			[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +  COALESCE([FIND_BK_FK6].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+
			'|' +  COALESCE([FIND_BK_FK6].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HK_GLSegment_Segment5]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK7].[BK_iSegmentNo],
			[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +  COALESCE([FIND_BK_FK7].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+
			'|' +  COALESCE([FIND_BK_FK7].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HK_GLSegment_Segment6]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK8].[BK_iSegmentNo],
			[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +  COALESCE([FIND_BK_FK8].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+
			'|' +  COALESCE([FIND_BK_FK8].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HK_GLSegment_Segment7]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK9].[BK_iSegmentNo],
			[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +  COALESCE([FIND_BK_FK9].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+
			'|' +  COALESCE([FIND_BK_FK9].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HK_GLSegment_Segment8]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK10].[BK_iSegmentNo],
			[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +  COALESCE([FIND_BK_FK10].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+
			'|' +  COALESCE([FIND_BK_FK10].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HK_GLSegment_Segment9]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_AccountLink] + '|' +
			'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK1].[BK_iSegmentNo],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +
			COALESCE([FIND_BK_FK1].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK1].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HKLINK_GLAccount_GLSegment_Segment0]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_AccountLink] + '|' +
			'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK2].[BK_iSegmentNo],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +
			COALESCE([FIND_BK_FK2].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK2].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HKLINK_GLAccount_GLSegment_Segment1]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_AccountLink] + '|' +
			'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK3].[BK_iSegmentNo],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +
			COALESCE([FIND_BK_FK3].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK3].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HKLINK_GLAccount_GLSegment_Segment2]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_AccountLink] + '|' +
			'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK4].[BK_iSegmentNo],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +
			COALESCE([FIND_BK_FK4].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK4].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HKLINK_GLAccount_GLSegment_Segment3]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_AccountLink] + '|' +
			'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK5].[BK_iSegmentNo],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +
			COALESCE([FIND_BK_FK5].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK5].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HKLINK_GLAccount_GLSegment_Segment4]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_AccountLink] + '|' +
			'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK6].[BK_iSegmentNo],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +
			COALESCE([FIND_BK_FK6].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK6].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HKLINK_GLAccount_GLSegment_Segment5]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_AccountLink] + '|' +
			'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK7].[BK_iSegmentNo],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +
			COALESCE([FIND_BK_FK7].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK7].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HKLINK_GLAccount_GLSegment_Segment6]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_AccountLink] + '|' +
			'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK8].[BK_iSegmentNo],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +
			COALESCE([FIND_BK_FK8].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK8].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HKLINK_GLAccount_GLSegment_Segment7]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_AccountLink] + '|' +
			'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK9].[BK_iSegmentNo],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +
			COALESCE([FIND_BK_FK9].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK9].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HKLINK_GLAccount_GLSegment_Segment8]
		, UPPER(CONVERT(VARCHAR(40),HASHBYTES('SHA1', 'CSG_1_FOODS' + '|' + [EXT_SRC].[BK_AccountLink] + '|' +
			'CSG_1_FOODS' + '|' + COALESCE([FIND_BK_FK10].[BK_iSegmentNo],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|' +
			COALESCE([FIND_BK_FK10].[BK_cCode],[MEX_SRC].[KEY_ATTRIBUTE_VARCHAR])+ '|' +
			COALESCE([FIND_BK_FK10].[BK_idSegment],[MEX_SRC].[KEY_ATTRIBUTE_INT])+ '|'),2)) AS [HKLINK_GLAccount_GLSegment_Segment9]
		, [EXT_SRC].[LOADDT] AS [LOADDT]
		, [EXT_SRC].[LOAD_CYCLE_ID] AS [LOAD_CYCLE_ID]
		, 'CSG_1_FOODS' AS [SOURCE_SYSTEM]
		, [EXT_SRC].[CHANGE_TYPE] AS [CHANGE_TYPE]
		, [EXT_SRC].[DATATYPE] AS [DATATYPE]
		, [EXT_SRC].[AccountLink] AS [AccountLink]
		, [EXT_SRC].[iGLSegment0ID] AS [iGLSegment0ID]
		, [EXT_SRC].[iGLSegment1ID] AS [iGLSegment1ID]
		, [EXT_SRC].[iGLSegment2ID] AS [iGLSegment2ID]
		, [EXT_SRC].[iGLSegment3ID] AS [iGLSegment3ID]
		, [EXT_SRC].[iGLSegment4ID] AS [iGLSegment4ID]
		, [EXT_SRC].[iGLSegment5ID] AS [iGLSegment5ID]
		, [EXT_SRC].[iGLSegment6ID] AS [iGLSegment6ID]
		, [EXT_SRC].[iGLSegment7ID] AS [iGLSegment7ID]
		, [EXT_SRC].[iGLSegment8ID] AS [iGLSegment8ID]
		, [EXT_SRC].[iGLSegment9ID] AS [iGLSegment9ID]
		, [EXT_SRC].[BK_AccountLink] AS [BK_GLAccount]
		, [EXT_SRC].[Master_Sub_Account] AS [Master_Sub_Account]
		, [EXT_SRC].[AccountLevel] AS [AccountLevel]
		, [EXT_SRC].[Account] AS [Account]
		, [EXT_SRC].[iAccountType] AS [iAccountType]
		, [EXT_SRC].[SubAccOfLink] AS [SubAccOfLink]
		, [EXT_SRC].[Dept] AS [Dept]
		, [EXT_SRC].[Brch] AS [Brch]
		, [EXT_SRC].[Jr] AS [Jr]
		, [EXT_SRC].[Description] AS [Description]
		, [EXT_SRC].[CaseAcc] AS [CaseAcc]
		, [EXT_SRC].[ActiveAccount] AS [ActiveAccount]
		, [EXT_SRC].[dAccountsTimeStamp] AS [dAccountsTimeStamp]
		, [EXT_SRC].[cNextChequeNum] AS [cNextChequeNum]
		, [EXT_SRC].[iReportCategoryID] AS [iReportCategoryID]
		, [EXT_SRC].[fBankStatementBalance] AS [fBankStatementBalance]
		, [EXT_SRC].[cExtDescription] AS [cExtDescription]
		, [EXT_SRC].[iTaxTypeINVID] AS [iTaxTypeINVID]
		, [EXT_SRC].[iTaxTypeCRNID] AS [iTaxTypeCRNID]
		, [EXT_SRC].[iTaxTypeGRVID] AS [iTaxTypeGRVID]
		, [EXT_SRC].[iTaxTypeRTSID] AS [iTaxTypeRTSID]
		, [EXT_SRC].[iAllowICSales] AS [iAllowICSales]
		, [EXT_SRC].[iAllowICPurchases] AS [iAllowICPurchases]
		, [EXT_SRC].[iMBReportingCategoryID] AS [iMBReportingCategoryID]
		, [EXT_SRC].[iMBCashFlowCategoryID] AS [iMBCashFlowCategoryID]
		, [EXT_SRC].[bMBIsAsset] AS [bMBIsAsset]
		, [EXT_SRC].[bMBIsGrant] AS [bMBIsGrant]
		, [EXT_SRC].[iMBAssetClassificationID] AS [iMBAssetClassificationID]
		, [EXT_SRC].[iMBAssetCategoryID] AS [iMBAssetCategoryID]
		, [EXT_SRC].[iMBAssetTypeID] AS [iMBAssetTypeID]
		, [EXT_SRC].[iMBGrantLevel1TypeID] AS [iMBGrantLevel1TypeID]
		, [EXT_SRC].[iMBGrantLevel2TypeID] AS [iMBGrantLevel2TypeID]
		, [EXT_SRC].[iMBGrantLevel3TypeID] AS [iMBGrantLevel3TypeID]
		, [EXT_SRC].[bIsBranchLoanAccount] AS [bIsBranchLoanAccount]
		, [EXT_SRC].[iForeignBankCurrencyID] AS [iForeignBankCurrencyID]
		, [EXT_SRC].[iForeignBankPEXAccID] AS [iForeignBankPEXAccID]
		, [EXT_SRC].[iForeignBankLEXAccID] AS [iForeignBankLEXAccID]
		, [EXT_SRC].[bRevalueWithSellingRate] AS [bRevalueWithSellingRate]
		, [EXT_SRC].[bPaymentsBasedTax] AS [bPaymentsBasedTax]
		, [EXT_SRC].[cBankName] AS [cBankName]
		, [EXT_SRC].[cBankAccountName] AS [cBankAccountName]
		, [EXT_SRC].[cBankCode] AS [cBankCode]
		, [EXT_SRC].[cBankAccountNumber] AS [cBankAccountNumber]
		, [EXT_SRC].[cBranchName] AS [cBranchName]
		, [EXT_SRC].[cSEPABranchCode] AS [cSEPABranchCode]
		, [EXT_SRC].[cBankRefNr] AS [cBankRefNr]
		, [EXT_SRC].[iAttributeGroupID] AS [iAttributeGroupID]
		, [EXT_SRC].[xAttribute] AS [xAttribute]
		, [EXT_SRC].[bForeignBankAcc] AS [bForeignBankAcc]
		, [EXT_SRC].[Accounts_iBranchID] AS [Accounts_iBranchID]
		, [EXT_SRC].[Accounts_dCreatedDate] AS [Accounts_dCreatedDate]
		, [EXT_SRC].[Accounts_dModifiedDate] AS [Accounts_dModifiedDate]
		, [EXT_SRC].[Accounts_iCreatedBranchID] AS [Accounts_iCreatedBranchID]
		, [EXT_SRC].[Accounts_iModifiedBranchID] AS [Accounts_iModifiedBranchID]
		, [EXT_SRC].[Accounts_iCreatedAgentID] AS [Accounts_iCreatedAgentID]
		, [EXT_SRC].[Accounts_iModifiedAgentID] AS [Accounts_iModifiedAgentID]
		, [EXT_SRC].[Accounts_iChangeSetID] AS [Accounts_iChangeSetID]
		, [EXT_SRC].[Accounts_Checksum] AS [Accounts_Checksum]
		, [EXT_SRC].[cBCloudBankAccountID] AS [cBCloudBankAccountID]
	FROM [CSG_1_FOODS_ext].[Accounts] [EXT_SRC]
	INNER JOIN [dc].[EXECEPTION] [MEX_SRC] ON  [MEX_SRC].[DATATYPE] = 'NA'
	LEFT OUTER JOIN [FIND_BK_FK1] ON  [EXT_SRC].[iGLSegment0ID] = [FIND_BK_FK1].[iGLSegment0ID]
	LEFT OUTER JOIN [FIND_BK_FK2] ON  [EXT_SRC].[iGLSegment1ID] = [FIND_BK_FK2].[iGLSegment1ID]
	LEFT OUTER JOIN [FIND_BK_FK3] ON  [EXT_SRC].[iGLSegment2ID] = [FIND_BK_FK3].[iGLSegment2ID]
	LEFT OUTER JOIN [FIND_BK_FK4] ON  [EXT_SRC].[iGLSegment3ID] = [FIND_BK_FK4].[iGLSegment3ID]
	LEFT OUTER JOIN [FIND_BK_FK5] ON  [EXT_SRC].[iGLSegment4ID] = [FIND_BK_FK5].[iGLSegment4ID]
	LEFT OUTER JOIN [FIND_BK_FK6] ON  [EXT_SRC].[iGLSegment5ID] = [FIND_BK_FK6].[iGLSegment5ID]
	LEFT OUTER JOIN [FIND_BK_FK7] ON  [EXT_SRC].[iGLSegment6ID] = [FIND_BK_FK7].[iGLSegment6ID]
	LEFT OUTER JOIN [FIND_BK_FK8] ON  [EXT_SRC].[iGLSegment7ID] = [FIND_BK_FK8].[iGLSegment7ID]
	LEFT OUTER JOIN [FIND_BK_FK9] ON  [EXT_SRC].[iGLSegment8ID] = [FIND_BK_FK9].[iGLSegment8ID]
	LEFT OUTER JOIN [FIND_BK_FK10] ON  [EXT_SRC].[iGLSegment9ID] = [FIND_BK_FK10].[iGLSegment9ID]
	;
END;


END;

 
 


GO
