SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[_etblPeriodYear](
	[idYear] [int] NOT NULL,
	[cYearDescription] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[dYearStartDate] [datetime] NOT NULL,
	[bArchived] [bit] NOT NULL,
	[bPurged] [bit] NOT NULL,
	[_etblPeriodYear_iBranchID] [int] NULL,
	[_etblPeriodYear_dCreatedDate] [datetime] NULL,
	[_etblPeriodYear_dModifiedDate] [datetime] NULL,
	[_etblPeriodYear_iCreatedBranchID] [int] NULL,
	[_etblPeriodYear_iModifiedBranchID] [int] NULL,
	[_etblPeriodYear_iCreatedAgentID] [int] NULL,
	[_etblPeriodYear_iModifiedAgentID] [int] NULL,
	[_etblPeriodYear_iChangeSetID] [int] NULL,
	[_etblPeriodYear_Checksum] [binary](20) NULL
) ON [PRIMARY]

GO
