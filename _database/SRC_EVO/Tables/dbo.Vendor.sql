SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Vendor](
	[DCLink] [int] IDENTITY(1,1) NOT NULL,
	[Account] [varchar](20) COLLATE Latin1_General_CI_AS NULL,
	[Name] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
	[Title] [varchar](5) COLLATE Latin1_General_CI_AS NULL,
	[Init] [varchar](6) COLLATE Latin1_General_CI_AS NULL,
	[Contact_Person] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
	[Physical1] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[Physical2] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[Physical3] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[Physical4] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[Physical5] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[PhysicalPC] [varchar](15) COLLATE Latin1_General_CI_AS NULL,
	[Addressee] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
	[Post1] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[Post2] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[Post3] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[Post4] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[Post5] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[PostPC] [varchar](15) COLLATE Latin1_General_CI_AS NULL,
	[Delivered_To] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
	[Telephone] [varchar](25) COLLATE Latin1_General_CI_AS NULL,
	[Telephone2] [varchar](25) COLLATE Latin1_General_CI_AS NULL,
	[Fax1] [varchar](25) COLLATE Latin1_General_CI_AS NULL,
	[Fax2] [varchar](25) COLLATE Latin1_General_CI_AS NULL,
	[AccountTerms] [int] NULL,
	[CT] [bit] NOT NULL,
	[Tax_Number] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[Registration] [varchar](20) COLLATE Latin1_General_CI_AS NULL,
	[Credit_Limit] [float] NULL,
	[Interest_Rate] [float] NULL,
	[Discount] [float] NULL,
	[On_Hold] [bit] NOT NULL,
	[BFOpenType] [int] NULL,
	[EMail] [varchar](200) COLLATE Latin1_General_CI_AS NULL,
	[BankLink] [int] NULL,
	[BranchCode] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
	[BankAccNum] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
	[BankAccType] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
	[AutoDisc] [float] NULL,
	[DiscMtrxRow] [int] NULL,
	[DCBalance] [float] NULL,
	[CheckTerms] [bit] NOT NULL,
	[UseEmail] [bit] NOT NULL,
	[iBusTypeID] [int] NULL,
	[iBusClassID] [int] NULL,
	[iCountryID] [int] NULL,
	[cAccDescription] [varchar](80) COLLATE Latin1_General_CI_AS NULL,
	[cWebPage] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[dTimeStamp] [datetime] NULL,
	[iClassID] [int] NULL,
	[iAreasID] [int] NULL,
	[cBankRefNr] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
	[iCurrencyID] [int] NULL,
	[bStatPrint] [bit] NOT NULL,
	[bStatEmail] [bit] NOT NULL,
	[cStatEmailPass] [varchar](160) COLLATE Latin1_General_CI_AS NULL,
	[bForCurAcc] [bit] NOT NULL,
	[bRemittanceChequeEFTS] [bit] NOT NULL,
	[fForeignBalance] [float] NULL,
	[iSettlementTermsID] [int] NOT NULL,
	[bSourceDocPrint] [bit] NOT NULL,
	[bSourceDocEmail] [bit] NOT NULL,
	[iEUCountryID] [int] NOT NULL,
	[iDefTaxTypeID] [int] NOT NULL,
	[iAgeingTermID] [int] NULL,
	[iBankDetailType] [tinyint] NULL,
	[cBankAccHolder] [varchar](30) COLLATE Latin1_General_CI_AS NULL,
	[cIDNumber] [varchar](20) COLLATE Latin1_General_CI_AS NULL,
	[cPassportNumber] [varchar](20) COLLATE Latin1_General_CI_AS NULL,
	[cBankCode] [varchar](15) COLLATE Latin1_General_CI_AS NULL,
	[cSwiftCode] [varchar](11) COLLATE Latin1_General_CI_AS NULL,
	[iSPQueueID] [int] NULL,
	[iBankDetailID] [int] NULL,
	[Vendor_iBranchID] [int] NULL,
	[Vendor_dCreatedDate] [datetime] NULL,
	[Vendor_dModifiedDate] [datetime] NULL,
	[Vendor_iCreatedBranchID] [int] NULL,
	[Vendor_iModifiedBranchID] [int] NULL,
	[Vendor_iCreatedAgentID] [int] NULL,
	[Vendor_iModifiedAgentID] [int] NULL,
	[Vendor_iChangeSetID] [int] NULL,
	[Vendor_Checksum] [binary](20) NULL,
	[bTaxVerified] [bit] NOT NULL,
	[dDateTaxVerified] [datetime] NULL,
	[cRMCDApprovalNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[dRMCDApprovalDate] [datetime] NULL,
	[iTaxState] [int] NOT NULL,
	[bObjectToProcess] [bit] NOT NULL
) ON [PRIMARY]

GO
