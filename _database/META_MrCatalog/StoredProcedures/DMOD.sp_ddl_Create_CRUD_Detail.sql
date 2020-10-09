SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:      RJ Oosthuizen
-- Create Date: 27 February 2019
-- Description: Creates CRUD stored procedure from DataEntityID.
-- =============================================
-- Sample Execution: DMOD.sp_ddl_Create_CRUD_Detail @DataEntityID = 9907, @HeaderPrimaryKeyColumn = 'SortOrderGroupingID', @PrimaryKeyColumn = 'SortOrderValueID'
CREATE PROCEDURE [DMOD].[sp_ddl_Create_CRUD_Detail](
    @DataEntityID INT,
    @HeaderPrimaryKeyColumn VARCHAR(100), -- primary key column of the header table
    @PrimaryKeyColumn VARCHAR(100) -- primary key column of the table
	)
AS

BEGIN
--gets the table name of the provided dataentityid
DECLARE @InTable VARCHAR(20) = (SELECT TOP 1 DataEntityName 
									FROM dc.dataentity
									WHERE dataentityid = @DataEntityID)
--gets the schema name of the provided dataentityid
DECLARE @Schema VARCHAR(20) =  (SELECT TOP 1 SchemaName 
									FROM dc.[Schema] s
									JOIN dc.[DataEntity]de ON
										de.SchemaID = s.SchemaID
									WHERE dataentityid = @DataEntityID)


--proc name creation
DECLARE @SpName VARCHAR(100) = '[APP].[sp_CRUD_' + DMOD.udf_Split_On_Upper_Case(@InTable)  + ']' 
Set @SpName = REPLACE(@SpName, ' ', '_') -- string containing the right formatted name

--insert statement
DECLARE @InsertStatement VARCHAR(MAX) = (
	SELECT o.list
    FROM    DC.DataEntity de
	CROSS APPLY
		(SELECT
            FieldName + ', '
		    FROM DC.Field f WHERE f.DataEntityID = de.DataEntityID
		FOR XML PATH('')) o (list)
	LEFT JOIN
		DC.Field f
	ON  f.DataEntityID = de.DataEntityID
	AND f.IsPrimaryKey  = 1

	WHERE de.DataEntityID = @DataEntityID
) -- gets all fields

SET @InsertStatement = replace(@InsertStatement, '&#x0D;', '')
SET @InsertStatement = replace(@InsertStatement, @PrimaryKeyColumn, '') -- remove primary key column
SET @InsertStatement = replace(@InsertStatement, 'UpdatedDT,', '') -- remove updateddt column
SET @InsertStatement = ltrim(@InsertStatement)
SET @InsertStatement = substring(@InsertStatement, 2, len(@InsertStatement)) -- remove first comma after primary key column
SET @InsertStatement = rtrim(@InsertStatement)
SET @InsertStatement = reverse(substring(reverse(@InsertStatement), 2, len(@InsertStatement))) -- remove last comma

DECLARE @InsertStatementValues VARCHAR(MAX) = (
	SELECT o.list
    FROM    DC.DataEntity de
	CROSS APPLY
		(SELECT
            '@' + FieldName + ', '
		    FROM DC.Field f WHERE f.DataEntityID = de.DataEntityID
		FOR XML PATH('')) o (list)
	LEFT JOIN
		DC.Field f
	ON  f.DataEntityID = de.DataEntityID
	AND f.IsPrimaryKey  = 1

	WHERE de.DataEntityID = @DataEntityID
) -- gets all the fields and changes them to variables

SET @InsertStatementValues = replace(@InsertStatementValues, '&#x0D;', '')
SET @InsertStatementValues = replace(@InsertStatementValues, @PrimaryKeyColumn, '') -- remove primary key column value
SET @InsertStatementValues = replace(@InsertStatementValues, '@IsActive', '1') -- replace @isactive with value 1
SET @InsertStatementValues = replace(@InsertStatementValues, '@UpdatedDT,', '') -- remove @updateddt value
SET @InsertStatementValues = replace(@InsertStatementValues, '@CreatedDT', '@TransactionDT') -- replace @createddt with @transactiondt value
SET @InsertStatementValues = ltrim(@InsertStatementValues)
SET @InsertStatementValues = substring(@InsertStatementValues, 3, len(@InsertStatementValues)) -- remove first comma after primary key column
SET @InsertStatementValues = rtrim(@InsertStatementValues)
SET @InsertStatementValues = reverse(substring(reverse(@InsertStatementValues), 2, len(@InsertStatementValues))) -- remove last column

SET @InsertStatement = '(' + @InsertStatement + ')' + CHAR(10) + CHAR(13) + 'VALUES(' + @InsertStatementValues + ')' -- format create string correctly

--update statement
DECLARE @UpdateStatement VARCHAR(MAX) = (
	SELECT o.list
    FROM    DC.DataEntity de
	CROSS APPLY
		(SELECT
            FieldName + ' = ' + '@' + FieldName + ',' + CHAR(10) + CHAR(13)
		    FROM DC.Field f WHERE f.DataEntityID = de.DataEntityID
		FOR XML PATH('')) o (list)
	LEFT JOIN
		DC.Field f
	ON  f.DataEntityID = de.DataEntityID
	AND f.IsPrimaryKey  = 1

	WHERE de.DataEntityID = @DataEntityID
) -- gets all the fields and formats for update statement var = @var

SET @UpdateStatement = replace(@UpdateStatement, '&#x0D;', '')
SET @UpdateStatement = replace(@UpdateStatement, @PrimaryKeyColumn + ' = @' + @PrimaryKeyColumn + ',', '') -- remove primary key column
SET @UpdateStatement = replace(@UpdateStatement, @HeaderPrimaryKeyColumn + ' = @' + @HeaderPrimaryKeyColumn + ',', '') -- remove header primary key column
SET @UpdateStatement = replace(@UpdateStatement,  'CreatedDT = @CreatedDT,','') -- remove createddt
SET @UpdateStatement = replace(@UpdateStatement,  'UpdatedDT = @UpdatedDT,','') -- remove updateddt (already in template)
SET @UpdateStatement = replace(@UpdateStatement,  'IsActive = @IsActive,','') -- remove isactive

SET @UpdateStatement = 'SET ' + @UpdateStatement -- format correctly

--declare parameters
DECLARE @InsertParameters VARCHAR(MAX)
SET @InsertParameters = (SELECT  o.list 
		  	 FROM    DC.DataEntity de
			 CROSS APPLY
				(SELECT 
					'@'+FieldName+' ' + 
					DataType + CASE DataType
						WHEN 'int' THEN ''
						WHEN 'smallint' THEN ''
						WHEN 'decimal' THEN '(' + cast([precision] AS VARCHAR) + ', ' + CAST([scale] AS VARCHAR) + ')'
						ELSE coalesce('('+CASE WHEN [MaxLength] = -1 THEN 'MAX' ELSE cast([MaxLength] AS VARCHAR) END +')','') END +
						',' + CHAR(10) + CHAR(13)
		 

				  FROM DC.Field f WHERE f.DataEntityID = de.DataEntityID
				  FOR XML PATH('')
				    ) o (list)
					LEFT JOIN DC.Field f ON
					f.DataEntityID = de.DataEntityID
					   AND f.IsPrimaryKey  = 1

				  WHERE de.DataEntityID = @DataEntityID
	
				) -- gets fieldname + field type
--remove primary key
--SET @InsertParameters = trim(@InsertParameters)
--SET @InsertParameters = substring(@InsertParameters, 0, charindex('@' + @PrimaryKeyColumn, @InsertParameters))
--+ substring(@InsertParameters, charindex(',', @InsertParameters,  charindex('@' + @PrimaryKeyColumn, @InsertParameters)) + 1, len(@InsertParameters))

--remove header primary key
--SET @InsertParameters = trim(@InsertParameters)
--SET @InsertParameters = substring(@InsertParameters, 0, charindex('@' + @HeaderPrimaryKeyColumn, @InsertParameters))
--+ substring(@InsertParameters, charindex(',', @InsertParameters,  charindex('@' + @HeaderPrimaryKeyColumn, @InsertParameters)) + 1, len(@InsertParameters))

--remove createddt
SET @InsertParameters = trim(@InsertParameters)
SET @InsertParameters = substring(@InsertParameters, 0, charindex('@CreatedDT', @InsertParameters))
+ substring(@InsertParameters, charindex(',', @InsertParameters,  charindex('@CreatedDT', @InsertParameters)) + 1, len(@InsertParameters))

--remove updateddt
SET @InsertParameters = trim(@InsertParameters)
SET @InsertParameters = substring(@InsertParameters, 0, charindex('@UpdatedDT', @InsertParameters))
+ substring(@InsertParameters, charindex(',', @InsertParameters,  charindex('@UpdatedDT', @InsertParameters)) + 1, len(@InsertParameters))

--remove isactive
SET @InsertParameters = trim(@InsertParameters)
SET @InsertParameters = substring(@InsertParameters, 0, charindex('@IsActive', @InsertParameters))
+ substring(@InsertParameters, charindex(',', @InsertParameters,  charindex('@IsActive', @InsertParameters)) + 1, len(@InsertParameters))

SET @InsertParameters = trim(@InsertParameters) --format correctly

--get primary key for create
DECLARE @GetPrimaryKeyForCreate VARCHAR(MAX) = (
	SELECT o.list
    FROM    DC.DataEntity de
	CROSS APPLY
		(SELECT
            FieldName + ' = ' + '@' + FieldName + CHAR(10) + CHAR(13) + 'AND '
		    FROM DC.Field f WHERE f.DataEntityID = de.DataEntityID
		FOR XML PATH('')) o (list)
	LEFT JOIN
		DC.Field f
	ON  f.DataEntityID = de.DataEntityID
	AND f.IsPrimaryKey  = 1

	WHERE de.DataEntityID = @DataEntityID
) -- gets all the fields and formats for get primary key on create statement where var = @var and var2 = @var2 and...
SET @GetPrimaryKeyForCreate = trim(@GetPrimaryKeyForCreate)
SET @GetPrimaryKeyForCreate = substring(@GetPrimaryKeyForCreate, 0, len(@GetPrimaryKeyForCreate) - 2) -- remove last and

--remove primary key
SET @GetPrimaryKeyForCreate = trim(@GetPrimaryKeyForCreate)
SET @GetPrimaryKeyForCreate = substring(@GetPrimaryKeyForCreate, 0, charindex(@PrimaryKeyColumn, @GetPrimaryKeyForCreate))
+ substring(@GetPrimaryKeyForCreate, charindex('AND', @GetPrimaryKeyForCreate,  charindex('@' + @PrimaryKeyColumn, @GetPrimaryKeyForCreate)) + 3, len(@GetPrimaryKeyForCreate))

----remove createddt
SET @GetPrimaryKeyForCreate = replace(@GetPrimaryKeyForCreate,'AND CreatedDT = @CreatedDT', '')

----remove updateddt
SET @GetPrimaryKeyForCreate = replace(@GetPrimaryKeyForCreate,'AND UpdatedDT = @UpdatedDT', '')


----remove isactive
SET @GetPrimaryKeyForCreate = replace(@GetPrimaryKeyForCreate,'AND IsActive = @IsActive', '')

SET @GetPrimaryKeyForCreate = 'WHERE ' + @GetPrimaryKeyForCreate

--CRUD template content
DECLARE @Content VARCHAR(MAX) = 
'SET ANSI_NULLS ON' + CHAR(10) + CHAR(13) +
'GO' + CHAR(10) + CHAR(13) +
'SET QUOTED_IDENTIFIER ON' + CHAR(10) + CHAR(13) +
'GO' + CHAR(10) + CHAR(13) +
'CREATE PROCEDURE SpNameReplace(' + CHAR(10) + CHAR(13) +
	'--all table fields, remove the ones you dont need' + CHAR(10) + CHAR(13) +
    ' InsertParametersReplace ' + CHAR(10) + CHAR(13) +
	'-- required params, please do not remove' + CHAR(10) + CHAR(13) +
	'@TransactionPerson varchar(80), -- who actioned' + CHAR(10) + CHAR(13) +
    '@MasterEntity varchar(50), -- from where actioned' + CHAR(10) + CHAR(13) +
    '@TransactionAction nvarchar(20) = null -- type of transaction, "Create", "Update", "Delete"' + CHAR(10) + CHAR(13) +
    ')' + CHAR(10) + CHAR(13) +
'AS' + CHAR(10) + CHAR(13) +

'BEGIN' + CHAR(10) + CHAR(13) +

    'DECLARE @TransactionDT datetime2(7) = getDate() -- date of transaction' + CHAR(10) + CHAR(13) +
    'DECLARE @isActive bit -- indicate soft delete' + CHAR(10) + CHAR(13) +
    'DECLARE @JSONData varchar(max) = null -- to store in audit table' + CHAR(10) + CHAR(13) +
    'DECLARE @PrimaryKeyID int = null -- primary key value for the table' + CHAR(10) + CHAR(13) +
    'DECLARE @TableName VARCHAR(50) = ''TableNameReplace'' -- table name' + CHAR(10) + CHAR(13) +

    '--create record' + CHAR(10) + CHAR(13) +
    'IF @TransactionAction = ''Create''' + CHAR(10) + CHAR(13) +
        'BEGIN' + CHAR(10) + CHAR(13) +
                    '--Insert new record' + CHAR(10) + CHAR(13) +
                    '--remove fields not needed, keep CreatedDT and IsActive' + CHAR(10) + CHAR(13) +
	                'INSERT INTO TableNameReplace InsertStatementReplace' + CHAR(10) + CHAR(13) +
            
			'--get primary key value to store in audit table' + CHAR(10) + CHAR(13) +
            'SET @PrimaryKeyID = (SELECT PrimaryKeyColumnReplace' + CHAR(10) + CHAR(13) +
                                'FROM TableNameReplace' + CHAR(10) + CHAR(13) + 
								'--remove fields not needed' + CHAR(10) + CHAR(13) +
								'GetPrimKeyReplace' + CHAR(10) + CHAR(13) +
                                ')' + CHAR(10) + CHAR(13) +
        'END' + CHAR(10) + CHAR(13) +

 '--update record' + CHAR(10) + CHAR(13) +
    'IF @TransactionAction = ''Update''' + CHAR(10) + CHAR(13) +
        'BEGIN' + CHAR(10) + CHAR(13) +
                    '--update existing record' + CHAR(10) + CHAR(13) +
                    '--remove fields that do not need updating' + CHAR(10) + CHAR(13) +
                    'UPDATE TableNameReplace ' + CHAR(10) + CHAR(13) +
                    'UpdateStatementReplace ' + CHAR(10) + CHAR(13) +
                    '--do not remove UpdatedDT' + CHAR(10) + CHAR(13) +
					'UpdatedDT = @TransactionDT' + CHAR(10) + CHAR(13) +
			        'WHERE PrimaryKeyColumnReplace = @PrimaryKeyColumnReplace' + CHAR(10) + CHAR(13) +

		'--get primary key value to store in audit table' + CHAR(10) + CHAR(13) +
			'SET @PrimaryKeyID = @PrimaryKeyColumnReplace' + CHAR(10) + CHAR(13) +
        'END' + CHAR(10) + CHAR(13) +

    '--delete record' + CHAR(10) + CHAR(13) +
    'IF @TransactionAction = ''Delete''' + CHAR(10) + CHAR(13) +
        'BEGIN' + CHAR(10) + CHAR(13) +
            '--set record status inactive = 0 (soft delete record)' + CHAR(10) + CHAR(13) +
            'Update TableNameReplace ' + CHAR(10) + CHAR(13) +
	        'SET IsActive = 0, ' + CHAR(10) + CHAR(13) +
            'UpdatedDT = @TransactionDT' + CHAR(10) + CHAR(13) +
		    'WHERE PrimaryKeyColumnReplace = @PrimaryKeyColumnReplace' + CHAR(10) + CHAR(13) +
			
			'--get primary key value to store in audit table
            SET @PrimaryKeyID = @PrimaryKeyColumnReplace
        END' + CHAR(10) + CHAR(13) +
        
	'--capture json data (get primary key value to store in audit table)' + CHAR(10) + CHAR(13) +
    'SET @JSONData = (SELECT *' + CHAR(10) + CHAR(13) +
                     'FROM TableNameReplace ' + CHAR(10) + CHAR(13) +
                     'WHERE PrimaryKeyColumnReplace = @PrimaryKeyColumnReplace' + CHAR(10) + CHAR(13) +
                     'FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER )' + CHAR(10) + CHAR(13) +

    '--call sp to store json audit data in table' + CHAR(10) + CHAR(13) +
    'EXEC [APP].sp_Audit_Trail_Insert @TransactionPerson = @TransactionPerson,' + CHAR(10) + CHAR(13) +
                                    '@TransactionAction = @TransactionAction,' + CHAR(10) + CHAR(13) +
                                    '@MasterEntity = @MasterEntity,' + CHAR(10) + CHAR(13) +
                                    '@JSONData = @JSONData,' + CHAR(10) + CHAR(13) +
                                    '@TransactionDT = @TransactionDT,' + CHAR(10) + CHAR(13) +
                                    '@PrimaryKeyID = @PrimaryKeyID,' + CHAR(10) + CHAR(13) +
                                    '@TableName = @TableName' + CHAR(10) + CHAR(13) +

'END' + CHAR(10) + CHAR(13)

SET @Content = REPLACE(@Content, 'SpNameReplace', @SpName) -- insert sp header name
SET @Content = REPLACE(@Content, 'TableNameReplace', @Schema + '.' + @InTable) -- insert table name
SET @Content = REPLACE(@Content, 'PrimaryKeyColumnReplace', @PrimaryKeyColumn) -- insert primary key id
SET @Content = REPLACE(@Content, 'InsertStatementReplace', @InsertStatement) -- insert insert statement fields + values
SET @Content = REPLACE(@Content, 'UpdateStatementReplace', @UpdateStatement) -- insert update statement fields + values
SET @Content = REPLACE(@Content, 'InsertParametersReplace', @InsertParameters) -- insert parameters
SET @Content = REPLACE(@Content, 'GetPrimKeyReplace', @GetPrimaryKeyForCreate) -- insert parameters
SET @Content = replace(@Content, '&#x0D;', '')

select @Content

END

GO
