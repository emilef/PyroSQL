SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [raw].[LINK_GLTransaction_FinancialPeriod](
	[HKLINK_GLTransaction_FinancialPeriod] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[LOADDT] [datetime2](7) NOT NULL,
	[LOAD_CYCLE_ID] [int] NOT NULL,
	[HK_GLTransaction] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[HK_FinancialPeriod] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]

GO
