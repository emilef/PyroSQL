SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [DC].[Field_Archive](
	[FieldID] [int] NOT NULL,
	[FieldName] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DataType] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MaxLength] [int] NULL,
	[Precision] [int] NULL,
	[Scale] [int] NULL,
	[StringLength] [int] NULL,
	[Description] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsPrimaryKey] [bit] NULL,
	[IsForeignKey] [bit] NULL,
	[DefaultValue] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SystemGenerated] [bit] NULL,
	[DataQualityScore] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dpNullCount] [decimal](18, 2) NULL,
	[dpNullCountPerc] [decimal](18, 2) NULL,
	[dpDistinctCount] [decimal](18, 2) NULL,
	[dpDuplicateCount] [decimal](18, 2) NULL,
	[dpDuplicatCountPerc] [decimal](18, 2) NULL,
	[dpOrphanedChildrenCount] [decimal](18, 2) NULL,
	[dpOrphanedChildrenCountPerc] [decimal](18, 2) NULL,
	[dpMinimum] [decimal](18, 2) NULL,
	[dpMaximum] [decimal](18, 2) NULL,
	[dpAverage] [decimal](18, 2) NULL,
	[dpMedian] [decimal](18, 2) NULL,
	[dpStandardDeviation] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DataEntityID] [int] NULL,
	[SystemEntityID] [int] NULL,
	[IsSystemEntityDefinedAtRecordLevel] [bit] NULL,
	[DQScore] [decimal](18, 2) NULL,
	[DBColumnID] [int] NULL,
	[CreatedDT] [datetime2](7) NULL,
	[UpdatedDT] [datetime2](7) NULL,
	[DataEntitySize] [decimal](18, 3) NULL,
	[DatabaseSize] [decimal](18, 3) NULL,
	[IsActive] [bit] NULL,
	[FieldSortOrder] [int] NULL,
	[FriendlyName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastSeenDT] [datetime2](7) NULL,
	[ArchiveDT] [datetime2](7) NOT NULL
) ON [PRIMARY]

GO
