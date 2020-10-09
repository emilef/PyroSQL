SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [CSG_1_FOODS_stage].[TMP_LINKSAT_CSG_1_FOODS_GLBudget_GLAccount](
	[HKLINK_GLBudget_GLAccount] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[LOADDT] [datetime2](7) NOT NULL,
	[LOADENDDT] [datetime2](7) NOT NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NOT NULL,
	[ISDELETED] [varchar](2) COLLATE Latin1_General_CI_AS NOT NULL,
	[HK_GLBudget] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[HK_GLAccount] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[idBudgets] [int] NULL,
	[iBudgetAccountID] [int] NULL,
	[SRC] [varchar](1000) COLLATE Latin1_General_CI_AS NULL,
	[EQUAL] [numeric](18, 0) NULL,
	[DATATYPE] [varchar](1000) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]

GO
