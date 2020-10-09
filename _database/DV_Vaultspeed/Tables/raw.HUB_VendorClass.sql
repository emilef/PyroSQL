SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [raw].[HUB_VendorClass](
	[HK_VendorClass] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[LOADDT] [datetime2](7) NOT NULL,
	[LOAD_CYCLE_ID] [int] NOT NULL,
	[SOURCE_SYSTEM] [varchar](200) COLLATE Latin1_General_CI_AS NOT NULL,
	[BK_VendorClass] [varchar](1000) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]

GO
