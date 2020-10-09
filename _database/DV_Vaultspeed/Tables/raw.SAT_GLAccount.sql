SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [raw].[SAT_CSG_1_FOODS_GLAccount](
	[HK_GLAccount] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[LOADDT] [datetime2](7) NOT NULL,
	[LOADENDDT] [datetime2](7) NOT NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NOT NULL,
	[HASHDIFF] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[ISDELETED] [varchar](2) COLLATE Latin1_General_CI_AS NOT NULL,
	[Account] [varchar](273) COLLATE Latin1_General_CI_AS NULL,
	[AccountLink] [int] NULL,
	[iGLSegment0ID] [int] NULL,
	[iGLSegment1ID] [int] NULL,
	[iGLSegment2ID] [int] NULL,
	[iGLSegment3ID] [int] NULL,
	[iGLSegment4ID] [int] NULL,
	[iGLSegment5ID] [int] NULL,
	[iGLSegment6ID] [int] NULL,
	[iGLSegment7ID] [int] NULL,
	[iGLSegment8ID] [int] NULL,
	[iGLSegment9ID] [int] NULL,
	[Master_Sub_Account] [varchar](273) COLLATE Latin1_General_CI_AS NULL,
	[AccountLevel] [int] NULL,
	[iAccountType] [int] NULL,
	[SubAccOfLink] [int] NULL,
	[Dept] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
	[Brch] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
	[Jr] [bit] NULL,
	[Description] [varchar](765) COLLATE Latin1_General_CI_AS NULL,
	[CaseAcc] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
	[ActiveAccount] [bit] NULL,
	[dAccountsTimeStamp] [datetime2](7) NULL,
	[cNextChequeNum] [varchar](60) COLLATE Latin1_General_CI_AS NULL,
	[iReportCategoryID] [int] NULL,
	[fBankStatementBalance] [float] NULL,
	[cExtDescription] [varchar](765) COLLATE Latin1_General_CI_AS NULL,
	[iTaxTypeINVID] [int] NULL,
	[iTaxTypeCRNID] [int] NULL,
	[iTaxTypeGRVID] [int] NULL,
	[iTaxTypeRTSID] [int] NULL,
	[iAllowICSales] [bit] NULL,
	[iAllowICPurchases] [bit] NULL,
	[iMBReportingCategoryID] [int] NULL,
	[iMBCashFlowCategoryID] [int] NULL,
	[bMBIsAsset] [bit] NULL,
	[bMBIsGrant] [bit] NULL,
	[iMBAssetClassificationID] [int] NULL,
	[iMBAssetCategoryID] [int] NULL,
	[iMBAssetTypeID] [int] NULL,
	[iMBGrantLevel1TypeID] [int] NULL,
	[iMBGrantLevel2TypeID] [int] NULL,
	[iMBGrantLevel3TypeID] [int] NULL,
	[bIsBranchLoanAccount] [bit] NULL,
	[iForeignBankCurrencyID] [int] NULL,
	[iForeignBankPEXAccID] [int] NULL,
	[iForeignBankLEXAccID] [int] NULL,
	[bRevalueWithSellingRate] [bit] NULL,
	[bPaymentsBasedTax] [bit] NULL,
	[cBankName] [varchar](120) COLLATE Latin1_General_CI_AS NULL,
	[cBankAccountName] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
	[cBankCode] [varchar](45) COLLATE Latin1_General_CI_AS NULL,
	[cBankAccountNumber] [varchar](120) COLLATE Latin1_General_CI_AS NULL,
	[cBranchName] [varchar](90) COLLATE Latin1_General_CI_AS NULL,
	[cSEPABranchCode] [varchar](90) COLLATE Latin1_General_CI_AS NULL,
	[cBankRefNr] [varchar](90) COLLATE Latin1_General_CI_AS NULL,
	[iAttributeGroupID] [int] NULL,
	[xAttribute] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[bForeignBankAcc] [bit] NULL,
	[Accounts_iBranchID] [int] NULL,
	[Accounts_dCreatedDate] [datetime2](7) NULL,
	[Accounts_dModifiedDate] [datetime2](7) NULL,
	[Accounts_iCreatedBranchID] [int] NULL,
	[Accounts_iModifiedBranchID] [int] NULL,
	[Accounts_iCreatedAgentID] [int] NULL,
	[Accounts_iModifiedAgentID] [int] NULL,
	[Accounts_iChangeSetID] [int] NULL,
	[Accounts_Checksum] [binary](20) NULL,
	[cBCloudBankAccountID] [varchar](150) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]

GO
