SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [raw].[LINKSAT_CSG_1_FOODS_Client_ClientClass](
	[HKLINK_Client_ClientClass] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[LOADDT] [datetime2](7) NOT NULL,
	[LOADENDDT] [datetime2](7) NOT NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NOT NULL,
	[ISDELETED] [varchar](2) COLLATE Latin1_General_CI_AS NOT NULL,
	[HK_Client] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[HK_ClientClass] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[DCLink] [int] NULL,
	[iClassID] [int] NULL
) ON [PRIMARY]

GO
