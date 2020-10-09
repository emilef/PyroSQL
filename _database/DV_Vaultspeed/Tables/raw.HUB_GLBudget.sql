SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [raw].[HUB_GLBudget](
	[HK_GLBudget] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[LOADDT] [datetime2](7) NOT NULL,
	[LOAD_CYCLE_ID] [int] NOT NULL,
	[SOURCE_SYSTEM] [varchar](200) COLLATE Latin1_General_CI_AS NOT NULL,
	[BK_idBudgets] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
	[BK_iBudgetAccountID] [varchar](500) COLLATE Latin1_General_CI_AS NULL,
	[BK_iBudgetProjectID] [varchar](500) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]

GO
