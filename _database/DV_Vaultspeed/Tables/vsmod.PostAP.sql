SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [CSG_Modelling_VaultSpeed].[PostAP](
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
	[CRCCheck] [float] NULL,
	[DTStamp] [datetime] NULL,
	[UserName] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[iTaxPeriodID] [int] NULL,
	[cReference2] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[iAge] [int] NULL,
	[dDateAged] [datetime] NULL,
	[iPostSettlementTermsID] [int] NOT NULL,
	[iTxBranchID] [int] NULL,
	[bPBTPaid] [bit] NOT NULL,
	[iGLTaxAccountID] [int] NULL,
	[bTxOnHold] [bit] NOT NULL,
	[PostAP_iBranchID] [int] NULL,
	[PostAP_dCreatedDate] [datetime] NULL,
	[PostAP_dModifiedDate] [datetime] NULL,
	[PostAP_iCreatedBranchID] [int] NULL,
	[PostAP_iModifiedBranchID] [int] NULL,
	[PostAP_iCreatedAgentID] [int] NULL,
	[PostAP_iModifiedAgentID] [int] NULL,
	[PostAP_iChangeSetID] [int] NULL,
	[PostAP_Checksum] [binary](20) NULL,
	[SagePayExtra1] [varchar](max) COLLATE Latin1_General_CI_AS NULL,
	[SagePayExtra2] [varchar](max) COLLATE Latin1_General_CI_AS NULL,
	[SagePayExtra3] [varchar](max) COLLATE Latin1_General_CI_AS NULL,
	[iTaxBadDebtState] [int] NOT NULL,
	[bReverseChargeApplied] [bit] NOT NULL,
	[bReverseChargeCustoms] [bit] NOT NULL,
	[cReverseChargeAuditNr] [varchar](50) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
