SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [CSG_1_FOODS_ext].[VenClass](
	[LOADDT] [datetime2](7) NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NULL,
	[CHANGE_TYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[DATATYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[idVenClass] [int] NULL,
	[BK_idVenClass] [varchar](750) COLLATE Latin1_General_CI_AS NULL,
	[BK_Code] [varchar](750) COLLATE Latin1_General_CI_AS NULL,
	[Code] [varchar](60) COLLATE Latin1_General_CI_AS NULL,
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
