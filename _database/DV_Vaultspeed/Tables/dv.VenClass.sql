SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dv_CSG_1_FOODS].[VenClass](
	[idVenClass] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[Code] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[Description] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[DiscMtrxRow] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[dGroupTimeStamp] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iAccountsIDControlAcc] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iAccountsIDProfitAcc] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iAccountsIDLossAcc] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iTaxControlAccID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iRevProfitAcc] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iRevLossAcc] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iProvForRevAcc] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iInvoiceDocProfileID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iSOInvoiceDocProfileID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iCreditNoteDocProfileID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[iJCInvoiceDocProfileID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[VenClass_iBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[VenClass_dCreatedDate] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[VenClass_dModifiedDate] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[VenClass_iCreatedBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[VenClass_iModifiedBranchID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[VenClass_iCreatedAgentID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[VenClass_iModifiedAgentID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[VenClass_iChangeSetID] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[VenClass_Checksum] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[CHANGE_TYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[DATATYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NULL,
	[LOADDT] [datetime2](7) NULL
) ON [PRIMARY]

GO
