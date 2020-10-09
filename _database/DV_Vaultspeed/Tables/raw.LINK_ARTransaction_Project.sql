SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [raw].[LINK_ARTransaction_Project](
	[HKLINK_ARTransaction_Project] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[LOADDT] [datetime2](7) NOT NULL,
	[LOAD_CYCLE_ID] [int] NOT NULL,
	[HK_ARTransaction] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[HK_Project] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]

GO
