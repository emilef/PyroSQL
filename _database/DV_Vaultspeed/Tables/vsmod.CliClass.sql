SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [CSG_Modelling_VaultSpeed].[CliClass](
	[IdCliClass] [int] IDENTITY(1,1) NOT NULL,
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
	[CliClass_iBranchID] [int] NULL,
	[CliClass_dCreatedDate] [datetime] NULL,
	[CliClass_dModifiedDate] [datetime] NULL,
	[CliClass_iCreatedBranchID] [int] NULL,
	[CliClass_iModifiedBranchID] [int] NULL,
	[CliClass_iCreatedAgentID] [int] NULL,
	[CliClass_iModifiedAgentID] [int] NULL,
	[CliClass_iChangeSetID] [int] NULL,
	[CliClass_Checksum] [binary](20) NULL
) ON [PRIMARY]

GO
