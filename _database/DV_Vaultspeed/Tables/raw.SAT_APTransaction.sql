SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [raw].[SAT_CSG_1_FOODS_APTransaction](
	[HK_APTransaction] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[LOADDT] [datetime2](7) NOT NULL,
	[LOADENDDT] [datetime2](7) NOT NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NOT NULL,
	[HASHDIFF] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[ISDELETED] [varchar](2) COLLATE Latin1_General_CI_AS NOT NULL,
	[Reference] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
	[cAuditNumber] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
	[cReference2] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
	[AutoIdx] [bigint] NULL,
	[Project] [int] NULL,
	[AccountLink] [int] NULL,
	[TxDate] [datetime2](7) NULL,
	[Id] [varchar](15) COLLATE Latin1_General_CI_AS NULL,
	[TrCodeID] [int] NULL,
	[Debit] [float] NULL,
	[Credit] [float] NULL,
	[iCurrencyID] [int] NULL,
	[fExchangeRate] [float] NULL,
	[fForeignDebit] [float] NULL,
	[fForeignCredit] [float] NULL,
	[Description] [varchar](300) COLLATE Latin1_General_CI_AS NULL,
	[TaxTypeID] [int] NULL,
	[Order_No] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
	[ExtOrderNum] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
	[Tax_Amount] [float] NULL,
	[fForeignTax] [float] NULL,
	[Outstanding] [float] NULL,
	[fForeignOutstanding] [float] NULL,
	[cAllocs] [nvarchar](4000) COLLATE Latin1_General_CI_AS NULL,
	[InvNumKey] [bigint] NULL,
	[CRCCheck] [float] NULL,
	[DTStamp] [datetime2](7) NULL,
	[UserName] [varchar](150) COLLATE Latin1_General_CI_AS NULL,
	[iTaxPeriodID] [int] NULL,
	[iAge] [int] NULL,
	[dDateAged] [datetime2](7) NULL,
	[iPostSettlementTermsID] [int] NULL,
	[iTxBranchID] [int] NULL,
	[bPBTPaid] [bit] NULL,
	[iGLTaxAccountID] [int] NULL,
	[bTxOnHold] [bit] NULL,
	[PostAP_iBranchID] [int] NULL,
	[PostAP_dCreatedDate] [datetime2](7) NULL,
	[PostAP_dModifiedDate] [datetime2](7) NULL,
	[PostAP_iCreatedBranchID] [int] NULL,
	[PostAP_iModifiedBranchID] [int] NULL,
	[PostAP_iCreatedAgentID] [int] NULL,
	[PostAP_iModifiedAgentID] [int] NULL,
	[PostAP_iChangeSetID] [int] NULL,
	[PostAP_Checksum] [binary](20) NULL,
	[SagePayExtra1] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[SagePayExtra2] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[SagePayExtra3] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iTaxBadDebtState] [int] NULL,
	[bReverseChargeApplied] [bit] NULL,
	[bReverseChargeCustoms] [bit] NULL,
	[cReverseChargeAuditNr] [varchar](150) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]

GO
