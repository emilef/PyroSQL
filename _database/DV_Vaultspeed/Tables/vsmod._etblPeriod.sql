SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [CSG_Modelling_VaultSpeed].[_etblPeriod](
	[idPeriod] [int] NOT NULL,
	[dPeriodDate] [datetime] NOT NULL,
	[bBlocked] [bit] NOT NULL,
	[bPBTProcessed] [bit] NOT NULL,
	[bPeriodProcessed] [bit] NOT NULL,
	[iYearID] [int] NOT NULL,
	[_etblPeriod_iBranchID] [int] NULL,
	[_etblPeriod_dCreatedDate] [datetime] NULL,
	[_etblPeriod_dModifiedDate] [datetime] NULL,
	[_etblPeriod_iCreatedBranchID] [int] NULL,
	[_etblPeriod_iModifiedBranchID] [int] NULL,
	[_etblPeriod_iCreatedAgentID] [int] NULL,
	[_etblPeriod_iModifiedAgentID] [int] NULL,
	[_etblPeriod_iChangeSetID] [int] NULL,
	[_etblPeriod_Checksum] [binary](20) NULL
) ON [PRIMARY]

GO
