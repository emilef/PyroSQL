SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [raw].[LINKSAT_CSG_1_FOODS_GLAccount_GLSegment_Segment6](
	[HKLINK_GLAccount_GLSegment_Segment6] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[LOADDT] [datetime2](7) NOT NULL,
	[LOADENDDT] [datetime2](7) NOT NULL,
	[LOAD_CYCLE_ID] [numeric](18, 0) NOT NULL,
	[ISDELETED] [varchar](2) COLLATE Latin1_General_CI_AS NOT NULL,
	[HK_GLAccount] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[HK_GLSegment_Segment6] [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
	[AccountLink] [int] NULL,
	[iGLSegment6ID] [int] NULL
) ON [PRIMARY]

GO
