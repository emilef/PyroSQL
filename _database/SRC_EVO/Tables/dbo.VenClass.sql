SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[VenClass](
	[idVenClass] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) COLLATE Latin1_General_CI_AS NULL,
	[Description] [varchar](100) COLLATE Latin1_General_CI_AS NULL,
	[DiscMtrxRow] [int] NULL,
	[dGroupTimeStamp] [datetime] NULL,
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
	[VenClass_dCreatedDate] [datetime] NULL,
	[VenClass_dModifiedDate] [datetime] NULL,
	[VenClass_iCreatedBranchID] [int] NULL,
	[VenClass_iModifiedBranchID] [int] NULL,
	[VenClass_iCreatedAgentID] [int] NULL,
	[VenClass_iModifiedAgentID] [int] NULL,
	[VenClass_iChangeSetID] [int] NULL,
	[VenClass_Checksum] [binary](20) NULL
) ON [PRIMARY]

GO
