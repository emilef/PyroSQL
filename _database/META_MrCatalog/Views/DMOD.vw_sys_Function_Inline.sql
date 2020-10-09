SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE   VIEW [DMOD].[vw_sys_Function_Inline]
AS

	SELECT 
		o.[object_id] AS ObjectID
	,	o.[name] AS FunctionName
	,	s.[schema_id] AS SchemaID
	,	s.[name] AS SchemaName
	,	o.[type] AS ObjectType
    ,	o.[type_desc] AS ObjectTypeDescription
	,	o.[create_date]  AS CreatedDT
	,	o.[modify_date] AS UpdatedDT
	,	OBJECT_DEFINITION(sm.[object_id]) AS FunctionDefinition
	,	LEN(OBJECT_DEFINITION(sm.[object_id]))- LEN(REPLACE(OBJECT_DEFINITION(sm.[object_id]),CHAR(10),'')) AS LinesOfCode
	FROM 
		sys.objects AS o 	 
	INNER JOIN 
		sys.sql_modules AS sm 
		ON sm.[object_id] = o.[object_id] 
	INNER JOIN 
		sys.schemas AS s
		ON s.[schema_id] = o.[schema_id]
	WHERE 
		o.[type] = 'IF'
	AND
		o.[is_ms_shipped] = 0


GO
