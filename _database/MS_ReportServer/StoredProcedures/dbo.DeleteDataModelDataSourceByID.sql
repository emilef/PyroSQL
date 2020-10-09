SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[DeleteDataModelDataSourceByID]
    @DataSourceID UNIQUEIDENTIFIER  
AS

BEGIN
DELETE FROM [dbo].[DataModelDataSource] WHERE [DataSourceID] = @DataSourceID
END
GO
