SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [META].[SqlObjectDefinitionCompoment](
	[SqlObjectDefinitionCompomentID] [int] IDENTITY(1,1) NOT NULL,
	[SqlObjectDefinitionCompomentName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SqlObjectDefinitionCompomentDescription] [varchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SqlObjectDefinitionID] [int] NOT NULL
) ON [PRIMARY]

GO
