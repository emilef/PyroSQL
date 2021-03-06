SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
-- Create By	: Emile Fraser
-- Date			: 2021-01-02
-- Description	: Sets an External Data Source

-- Test			EXEC [inout].[SetExternalDataSource] 
									@ExternalDatasourceName					= 'MySaecDataSource'
								,	@ExternalDatasourceType					= 'BLOB_STORAGE'
								,	@ExternalDatasourceLocation				= 'https://acazsancustblob.blob.core.windows.net/saec'
								,	@ExternalDatasourceCredentialName		= 'MyAzureBlobStorageCredential'
								,	@IsDropRecreateDatasource				= 1

-- /arm/adf/arm_template.json



-- SELECT * FROM sys.database_scoped_credentials
-- SELECT * FROM sys.external_data_sources
*/
CREATE OR ALTER PROCEDURE [inout].[SetExternalDataSource]
	@ExternalDatasourceName					NVARCHAR(128)
,	@ExternalDatasourceType					NVARCHAR(128)
,	@ExternalDatasourceLocation				NVARCHAR(MAX)
,	@ExternalDatasourceCredentialName		NVARCHAR(128)
,	@IsDropRecreateDatasource				BIT				= 0
AS
BEGIN

	-- Variables for Proc Control
	DECLARE
		@sql_debug 						BIT = 1
	,   @sql_execute 					BIT = 1

	-- Dynamic Procedure Variables
	DECLARE
		@sql_statement 					NVARCHAR(MAX)
	,	@sql_parameter 					NVARCHAR(MAX)
	,	@sql_message 					NVARCHAR(MAX)
	,	@sql_return						INT
	,	@sql_error						NVARCHAR(MAX)
	,   @sql_tab						NVARCHAR(1) = CHAR(9)
	,	@sql_crlf 						NVARCHAR(2) = CHAR(13) + CHAR(10)

	-- Variables for the Scoped Credential
	DECLARE 
		@scoped_credential_id			INT

	-- Cursor Variable
	DECLARE 
		@cursor_exec 					CURSOR

	-- Gets Credential ID if it exists  
	SET @sql_statement = '
		-- Gets the credential ID
		SELECT @scoped_credential_id = 
			credential_id
		FROM 
			sys.database_scoped_credentials
		WHERE
			name = ''' + @ExternalDatasourceCredentialName + ''''

	SET @sql_parameter = '@scoped_credential_id NVARCHAR(128) OUTPUT'

	-- Debug Prints if flag on
	IF (@sql_debug = 1)
	BEGIN
		SET @sql_message = '{{statement}}' + @sql_crlf + @sql_statement + @sql_crlf + CONCAT('{{',@sql_parameter,'}}')
		RAISERROR(@sql_message, 0, 1) WITH NOWAIT
	END

	-- Executes the first statement
	IF (@sql_execute = 1)
	BEGIN
		BEGIN TRY
			EXEC @sql_return = sp_executesql
				   @stmt						= @sql_statement
				,  @param						= @sql_parameter
				,  @scoped_credential_id		= @scoped_credential_id OUTPUT

		END TRY
        
		BEGIN CATCH
			SET @sql_error = ERROR_MESSAGE()
			RAISERROR(@sql_error, 0, 1) WITH NOWAIT
		END CATCH
	END

	-- If the scoped credential is not found, return error
	IF (@scoped_credential_id IS NULL)
	BEGIN
		SET @sql_message = 'Scoped Credential (' + @ExternalDatasourceCredentialName + ') is not found, create it first!'
		RAISERROR(@sql_message, 0, 1) WITH NOWAIT
	END

	-- Scoped credential found, create the external data source
	ELSE
	BEGIN

		IF EXISTS (
			SELECT 1 FROM sys.external_data_sources WHERE name =  @ExternalDatasourceName
		) AND @IsDropRecreateDatasource = 0
		BEGIN
			SET @sql_message = 'External Datasource (' + @ExternalDatasourceName + ') already exists. Please specify @IsDropRecreateDatasource = 1 or choose another name!'
			RAISERROR(@sql_message, 0, 1) WITH NOWAIT
		END

		ELSE IF EXISTS (
			SELECT 1 FROM sys.external_data_sources WHERE name =  @ExternalDatasourceName
		) AND @IsDropRecreateDatasource = 1
		BEGIN
			-- DROPS THE CURRENT External Data Sources linked to the scoped credential
			SET @sql_statement = '
				-- Drops the external data sources linked to credential
				DROP EXTERNAL DATA SOURCE ' + @ExternalDatasourceName		

			SET @sql_parameter = ''

			-- Debug Prints if flag on
			IF (@sql_debug = 1)
			BEGIN
				SET @sql_message = '{{statement}}' + @sql_crlf + @sql_statement + @sql_crlf + CONCAT('{{',@sql_parameter,'}}')
				RAISERROR(@sql_message, 0, 1) WITH NOWAIT
			END

			-- Executes the first statement
			IF (@sql_execute = 1)
			BEGIN
				BEGIN TRY
					EXEC @sql_return = sp_executesql
						   @stmt						= @sql_statement
						,  @param						= @sql_parameter

				END TRY
        
				BEGIN CATCH
					SET @sql_error = ERROR_MESSAGE()
					RAISERROR(@sql_error, 0, 1) WITH NOWAIT
				END CATCH
			END -- IF (@sql_execute = 1)


			-- NOW Creates the new external data source
			-- CREDENTIAL is not required if a blob storage is public!
			SET @sql_statement = '
				-- Creates the new external data source
				CREATE EXTERNAL DATA SOURCE '	+ @ExternalDatasourceName + '
				WITH (	
					TYPE = '					+ @ExternalDatasourceType + ', 
					LOCATION = '''				+ @ExternalDatasourceLocation + ''', 
					CREDENTIAL = '				+ @ExternalDatasourceCredentialName + '
				);'
		
			SET @sql_parameter = ''

			-- DO NOT ATTEMPT TO RAISERROR ON THIS AS IT GIVES FORMAT SPEC ERROR
			IF (@sql_debug = 1)
			BEGIN
				SET @sql_message = '{{statement}}' + @sql_crlf + @sql_statement + @sql_crlf + CONCAT('{{',@sql_parameter,'}}')
				PRINT @sql_message
			END -- IF (@sql_debug = 1)

			-- Executes the drop statement
			IF (@sql_execute = 1)
			BEGIN
				BEGIN TRY
					EXEC @sql_return = sp_executesql
						   @stmt						= @sql_statement
						,  @param						= @sql_parameter
				END TRY
        
				BEGIN CATCH
					SET @sql_error = ERROR_MESSAGE()
					RAISERROR(@sql_error, 0, 1) WITH NOWAIT
				END CATCH
			
			END -- IF (@sql_execute = 1)

		END -- IF ALREADY EXISTS 
		ELSE
		BEGIN

		-- CREDENTIAL is not required if a blob storage is public!
			SET @sql_statement = '
				-- Creates the new external data source
				CREATE EXTERNAL DATA SOURCE '	+ @ExternalDatasourceName + '
				WITH (	
					TYPE = '					+ @ExternalDatasourceType + ', 
					LOCATION = '''				+ @ExternalDatasourceLocation + ''', 
					CREDENTIAL = '				+ @ExternalDatasourceCredentialName + '
				);'
		
			SET @sql_parameter = ''

			-- DO NOT ATTEMPT TO RAISERROR ON THIS AS IT GIVES FORMAT SPEC ERROR
			IF (@sql_debug = 1)
			BEGIN
				SET @sql_message = '{{statement}}' + @sql_crlf + @sql_statement + @sql_crlf + CONCAT('{{',@sql_parameter,'}}')
				PRINT @sql_message
			END -- IF (@sql_debug = 1)

			-- Executes the drop statement
			IF (@sql_execute = 1)
			BEGIN
				BEGIN TRY
					EXEC @sql_return = sp_executesql
						   @stmt						= @sql_statement
						,  @param						= @sql_parameter
				END TRY
        
				BEGIN CATCH
					SET @sql_error = ERROR_MESSAGE()
					RAISERROR(@sql_error, 0, 1) WITH NOWAIT
				END CATCH
			
			END -- IF (@sql_execute = 1)

		END -- ELSE

	END -- SCOPED CREDENTIAL

END -- PROCEDURE