SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ETL].[SAT_Job](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[JobID_SQL] [uniqueidentifier] NULL,
	[JobName_SQL] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Enabled] [bit] NULL,
	[DateCreated_SQL] [datetime] NULL,
	[DateModified_SQL] [datetime] NULL,
	[JobChecksum] [bigint] NOT NULL,
	[LoadDT] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ETL].[SAT_Job] ADD  DEFAULT (CONVERT([datetime2](7),getdate())) FOR [LoadDT]
GO
