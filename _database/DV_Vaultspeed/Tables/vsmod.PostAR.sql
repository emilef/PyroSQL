SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [CSG_Modelling_VaultSpeed].[PostAR](
	[AutoIdx] [bigint] IDENTITY(1,1) NOT NULL,
	[TxDate] [smalldatetime] NULL,
	[Id] [varchar](5) COLLATE Latin1_General_CI_AS NOT NULL,
	[AccountLink] [int] NULL,
	[TrCodeID] [int] NULL,
	[Debit] [float] NULL,
	[Credit] [float] NULL,
	[iCurrencyID] [int] NULL,
	[fExchangeRate] [float] NULL,
	[fForeignDebit] [float] NULL,
	[fForeignCredit] [float] NULL,
	[Description] [varchar](100) COLLATE Latin1_General_CI_AS NULL,
	[TaxTypeID] [int] NULL,
	[Reference] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[Order_No] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[ExtOrderNum] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[cAuditNumber] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[Tax_Amount] [float] NULL,
	[fForeignTax] [float] NULL,
	[Project] [int] NULL,
	[Outstanding] [float] NULL,
	[fForeignOutstanding] [float] NULL,
	[cAllocs] [text] COLLATE Latin1_General_CI_AS NULL,
	[InvNumKey] [bigint] NULL,
	[RepID] [int] NULL,
	[LinkAccCode] [int] NULL,
	[TillID] [int] NULL,
	[CRCCheck] [float] NULL,
	[DTStamp] [datetime] NULL,
	[UserName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[iTaxPeriodID] [int] NULL,
	[cReference2] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[fJCRepCost] [float] NULL,
	[iAge] [int] NULL,
	[dDateAged] [datetime] NULL,
	[iPostSettlementTermsID] [int] NOT NULL,
	[iTxBranchID] [int] NULL,
	[iMBPropertyID] [int] NOT NULL,
	[iMBPortionID] [int] NOT NULL,
	[iMBServiceID] [int] NOT NULL,
	[iMBMeterID] [int] NOT NULL,
	[iMBPropertyPortionServiceID] [int] NOT NULL,
	[bPBTPaid] [bit] NOT NULL,
	[iGLTaxAccountID] [int] NULL,
	[iTransactionType] [int] NOT NULL,
	[PostAR_iBranchID] [int] NULL,
	[PostAR_dCreatedDate] [datetime] NULL,
	[PostAR_dModifiedDate] [datetime] NULL,
	[PostAR_iCreatedBranchID] [int] NULL,
	[PostAR_iModifiedBranchID] [int] NULL,
	[PostAR_iCreatedAgentID] [int] NULL,
	[PostAR_iModifiedAgentID] [int] NULL,
	[PostAR_iChangeSetID] [int] NULL,
	[PostAR_Checksum] [binary](20) NULL,
	[SagePayExtra1] [varchar](max) COLLATE Latin1_General_CI_AS NULL,
	[SagePayExtra2] [varchar](max) COLLATE Latin1_General_CI_AS NULL,
	[SagePayExtra3] [varchar](max) COLLATE Latin1_General_CI_AS NULL,
	[iMajorIndustryCodeID] [int] NULL,
	[iTaxBadDebtState] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
