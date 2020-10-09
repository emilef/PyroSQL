SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


/*
-- Author:      Emile Fraser
-- Create Date: 6 June 2019

-- Sample Execution Statement
--	Select [DMOD].[udf_get_DataVaultSchemaName](100)
-- Select [DMOD].[udf_get_DataVaultSchemaName](157)
-- Select [DMOD].[udf_get_DataVaultSchemaName](100)
*/
CREATE FUNCTION [DMOD].[udf_get_DataVaultSchemaName](
	@LoadConfigID INT
)
RETURNS VARCHAR(MAX)
AS
BEGIN

	--DECLARE @LoadConfigID INT = 157
	DECLARE @DataVaultSchemaName VARCHAR(MAX)
	
	DECLARE @SourceDataEntityID INT
	DECLARE @TargetDataEntityID INT
	DECLARE @SourceDatabaseID INT
	DECLARE @TargetDatabaseID INT
	DECLARE @SourceDatabasePurpose VARCHAR(MAX)
	DECLARE @TargetDatabasePurpose VARCHAR(MAX)
	
	SET @SourceDataEntityID = (SELECT SourceDataEntityID FROM DMOD.LoadConfig WHERE LoadConfigID = @LoadConfigID)
	SET @TargetDataEntityID = (SELECT TargetDataEntityID FROM DMOD.LoadConfig WHERE LoadConfigID = @LoadConfigID)

	SET @SourceDatabaseID = (SELECT [DC].[udf_get_DatabaseID_from_DataEntityID](@SourceDataEntityID))
	SET @TargetDatabaseID = (SELECT [DC].[udf_get_DatabaseID_from_DataEntityID](@TargetDataEntityID))
	
	SET @SourceDatabasePurpose = (SELECT DC.udf_get_DatabasePurposeCode(@SourceDatabaseID))
	SET @TargetDatabasePurpose = (SELECT DC.udf_get_DatabasePurposeCode(@TargetDatabaseID))

	IF(@SourceDatabasePurpose = 'DataVault')
		SET @DataVaultSchemaName = 
		(
			SELECT DC.udf_GetSchemaNameForDataEntityID(@SourceDataEntityID)
		)

	ELSE IF(@TargetDatabasePurpose = 'DataVault')
		SET @DataVaultSchemaName = 
		(
			SELECT DC.udf_GetSchemaNameForDataEntityID(@TargetDataEntityID)
		)

	IF @DataVaultSchemaName IS NULL 
			SET @DataVaultSchemaName = 'raw'

	RETURN QUOTENAME(@DataVaultSchemaName)

END

GO
