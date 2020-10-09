SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [ACCESS].[ReportingHierarchyAccessRole](
	[IsDefaultHierarchyItem] [bit] NOT NULL,
	[RoleDescription] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SortOrder] [int] NOT NULL
) ON [PRIMARY]

GO
