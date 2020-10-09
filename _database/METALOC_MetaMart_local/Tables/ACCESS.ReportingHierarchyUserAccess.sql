SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [ACCESS].[ReportingHierarchyUserAccess](
	[HashKey] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CompanyID] [int] NULL,
	[ReportingHierarchyTypeID] [int] NULL,
	[ReportingHierarchyTypeCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReportingHierarchyTypeName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReportingHierarchyItemID] [int] NULL,
	[ReportingHierarchyItemCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReportingHierarchyItemName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParentReportingHierarchyItemID] [int] NULL,
	[ParentReportingHierarchyItemCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParentReportingHierarchyItemName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BusinessKey] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DataCatalogFieldID] [int] NULL,
	[FieldName] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDefaultHierarchyItem] [bit] NULL,
	[DomainAccount] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Surname] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsFullAccessUser] [bit] NULL,
	[L1] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L2] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L3] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L4] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L5] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L6] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L7] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L8] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L9] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L10] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[L1SortOrder] [int] NULL,
	[L2SortOrder] [int] NULL,
	[L3SortOrder] [int] NULL,
	[L4SortOrder] [int] NULL,
	[L5SortOrder] [int] NULL,
	[L6SortOrder] [int] NULL,
	[L7SortOrder] [int] NULL,
	[L8SortOrder] [int] NULL,
	[L9SortOrder] [int] NULL,
	[L10SortOrder] [int] NULL
) ON [PRIMARY]

GO
