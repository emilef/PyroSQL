SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [raw].[SAT_CSG_1_FOODS_VendorClass](
	[HK_VendorClass] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[LOADDT] [datetime2](7) NOT NULL,
	[LOADENDDT] [datetime2](7) NOT NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NOT NULL,
	[HASHDIFF] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[ISDELETED] [varchar](2) COLLATE Latin1_General_CI_AS NOT NULL,
	[Code] [varchar](60) COLLATE Latin1_General_CI_AS NULL,
	[idVenClass] [int] NULL,
	[Description] [varchar](300) COLLATE Latin1_General_CI_AS NULL,
	[DiscMtrxRow] [int] NULL,
	[dGroupTimeStamp] [datetime2](7) NULL,
	[iAccountsIDControlAcc] [int] NULL,
	[iAccountsIDProfitAcc] [int] NULL,
	[iAccountsIDLossAcc] [int] NULL,
	[iTaxControlAccID] [int] NULL,
	[iRevProfitAcc] [int] NULL,
	[iRevLossAcc] [int] NULL,
	[iProvForRevAcc] [int] NULL,
	[iInvoiceDocProfileID] [int] NULL,
	[iSOInvoiceDocProfileID] [int] NULL,
	[iCreditNoteDocProfileID] [int] NULL,
	[iJCInvoiceDocProfileID] [int] NULL,
	[VenClass_iBranchID] [int] NULL,
	[VenClass_dCreatedDate] [datetime2](7) NULL,
	[VenClass_dModifiedDate] [datetime2](7) NULL,
	[VenClass_iCreatedBranchID] [int] NULL,
	[VenClass_iModifiedBranchID] [int] NULL,
	[VenClass_iCreatedAgentID] [int] NULL,
	[VenClass_iModifiedAgentID] [int] NULL,
	[VenClass_iChangeSetID] [int] NULL,
	[VenClass_Checksum] [binary](20) NULL
) ON [PRIMARY]

GO
