SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [raw].[SAT_CSG_1_FOODS_ClientClass](
	[HK_ClientClass] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[LOADDT] [datetime2](7) NOT NULL,
	[LOADENDDT] [datetime2](7) NOT NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NOT NULL,
	[HASHDIFF] [varchar](40) COLLATE Latin1_General_CI_AS NULL,
	[ISDELETED] [varchar](2) COLLATE Latin1_General_CI_AS NOT NULL,
	[Code] [varchar](60) COLLATE Latin1_General_CI_AS NULL,
	[IdCliClass] [int] NULL,
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
	[CliClass_iBranchID] [int] NULL,
	[CliClass_dCreatedDate] [datetime2](7) NULL,
	[CliClass_dModifiedDate] [datetime2](7) NULL,
	[CliClass_iCreatedBranchID] [int] NULL,
	[CliClass_iModifiedBranchID] [int] NULL,
	[CliClass_iCreatedAgentID] [int] NULL,
	[CliClass_iModifiedAgentID] [int] NULL,
	[CliClass_iChangeSetID] [int] NULL,
	[CliClass_Checksum] [binary](20) NULL
) ON [PRIMARY]

GO
