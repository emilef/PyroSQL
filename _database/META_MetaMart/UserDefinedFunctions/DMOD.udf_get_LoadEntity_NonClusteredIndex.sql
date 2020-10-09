SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/*
Author:      Emile Fraser
Create Date: 6 June 2019
Description: Generate a record SourceDataEntityID

SELECT [DMOD].[udf_get_LoadEntity_PKName](23)
*/
CREATE FUNCTION [DMOD].[udf_get_LoadEntity_NonClusteredIndex](
	@LoadConfigID INT
)
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @NonClusteredIndex  VARCHAR(MAX)

	 --QUOTENAME('PK_' +  REPLACE(REPLACE(@StageAreaSchemaName,']',''),'[','') + '_' + REPLACE(REPLACE(@StageAreaTableName,']',''),'[',''))

	SELECT @NonClusteredIndex = QUOTENAME('ncidx_' + s.SchemaName + '_' + de.DataEntityName)
			FROM [DMOD].[LoadConfig] AS lc
			  INNER JOIN [DC].[DataEntity] AS de
			  ON de.DataEntityID = lc.TargetDataEntityID
			  INNER JOIN [DC].[Schema] AS s
			  ON de.SchemaID = s.SchemaID
			  WHERE lc.LoadConfigID = @LoadConfigID


	RETURN @NonClusteredIndex
END;

GO
