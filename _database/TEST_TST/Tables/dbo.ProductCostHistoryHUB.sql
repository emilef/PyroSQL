SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ProductCostHistoryHUB](
	[ProductCostHistoryVID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[StartDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
