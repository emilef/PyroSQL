SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [raw].[LINKSAT_CSG_1_FOODS_ARTransaction_Project](
	[HKLINK_ARTransaction_Project] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[LOADDT] [datetime2](7) NOT NULL,
	[LOADENDDT] [datetime2](7) NOT NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NOT NULL,
	[ISDELETED] [varchar](2) COLLATE Latin1_General_CI_AS NOT NULL,
	[HK_ARTransaction] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[HK_Project] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[AutoIdx] [bigint] NULL,
	[Project] [int] NULL
) ON [PRIMARY]

GO
