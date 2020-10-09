SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [CSG_1_FOODS_ext].[CliClass](
	[LOADDT] [datetime2](7) NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NULL,
	[CHANGE_TYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[DATATYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[IdCliClass] [int] NULL,
	[BK_IdCliClass] [varchar](750) COLLATE Latin1_General_CI_AS NULL,
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
