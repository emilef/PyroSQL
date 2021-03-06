USE [InfoMart]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ======================================================
-- Author:		Emile Fraser
-- Create date: 2020-03-05
-- Description:	Materialize tables needed for PowerBI Reporting
--			  : This is a very early draft version
-- ======================================================
-- Test: 
/*
    EXEC InfoMart.[dbo].[sp_materialise_InfoMartView] 
		@Source_SchemaName		= 'dbo'
	,	@Source_DataEntityName	= 'vw_FactEmployeeLeave'
	,	@IsCreateIndex			= 0
	,	@sql_IsDebug			= 1

*/
-- ======================================================
CREATE OR ALTER PROCEDURE [dbo].[sp_materialise_InfoMartView]
	@Source_SchemaName					SYSNAME
,	@Source_DataEntityName				SYSNAME
,	@Target_SchemaName					SYSNAME = NULL					-- If NULL Target schema passed will use dbo as Schem
,	@Target_DataEntityName				SYSNAME = NULL					-- If NULL Target schema passed will "derive" the materialized view name
,	@IsCreateIndex						BIT = 0
,	@NonClusteredIndex_Columns			NVARCHAR(MAX) = NULL			-- Will only allow for 1 index at the moment
,	@NonClusteredIndex_IncludedColumns  NVARCHAR(MAX) = NULL			-- Will only allow for 1 index at the moment
,	@sql_IsDebug						BIT = 0
AS
BEGIN
   -- Standard Pattern
	SET XACT_ABORT, NOCOUNT ON
	   
	BEGIN TRY
		
		BEGIN TRANSACTION

			-- Fixed to InfoMart for now
			DECLARE @DatabaseName SYSNAME = 'InfoMart'
			DECLARE @DataEntityName_Staged SYSNAME

			-- Variables used for dynamic sql part
            DECLARE 
				@sql_statement NVARCHAR(MAX)
			,	@sql_parameters NVARCHAR(MAX)
			,	@sql_message NVARCHAR(MAX)
			,	@sql_clrf NVARCHAR(2) = CHAR(13) + CHAR(10)
			,	@sql_tab NVARCHAR(1) = CHAR(9)

			-- Check if TargetdataEntity Passed IS NOT NULL
			-- TODO: Validity check if table name valid
			IF(@Target_DataEntityName IS NULL)
			BEGIN
				IF(CHARINDEX('vw_', @Source_DataEntityName) > 0)
				BEGIN
					SET @Target_DataEntityName = REPLACE(@Source_DataEntityName, 'vw_','')
				END
				ELSE
				BEGIN
					SET @Target_DataEntityName = 'presmat_' + @Source_DataEntityName
				END
			END

			-- Schema Checks and injetion when not passed
			SET @Target_SchemaName = ISNULL(ISNULL(@Target_SchemaName, @Source_SchemaName),'dbo')
			SET @DataEntityName_Staged = @Target_DataEntityName + '_Staged'

			--FIRST INSERT THE VIEW INTO A TEMP TABLE (IN case this takes a while, we do not want to just drop our table)
			-- DIE and then insert into
			SET @sql_statement = 'DROP TABLE IF EXISTS ' + QUOTENAME(@DatabaseName) + '.' + QUOTENAME(@Target_SchemaName) + '.' + QUOTENAME(@DataEntityName_Staged) + @sql_clrf + @sql_clrf
			
			SET @sql_parameters = '@DatabaseName SYSNAME, @Target_SchemaName SYSNAME, @DataEntityName_Staged SYSNAME'

			-- DEBUG PRINT
			IF(@sql_IsDebug = 1)
			BEGIN
				RAISERROR(@sql_statement, 0, 1)
			END

			--EXECUTE STATEMENT to drop the staged table if it exists
			EXEC sp_executesql @stmt = @sql_statment, @params = @sql_parameters
										, @DatabaseName = @DatabaseName
										, @Target_SchemaName = @Target_SchemaName
										, @DataEntityName_Staged = @DataEntityName_Staged

			
			-- Do Select INTO statement from source to this staged table
			SET @sql_statement = 
			   N'SELECT * INTO ' + @sql_clrf +
				+ @sql_tab +	QUOTENAME(@DatabaseName) + '.' + QUOTENAME(@Target_SchemaName) + '.' + QUOTENAME(@DataEntityName_Staged)  + @sql_clrf +
				'FROM ' + @sql_clrf + 
				+ @sql_tab + QUOTENAME(@DatabaseName) + '.' + QUOTENAME(@Source_SchemaName) + '.' + QUOTENAME(@Source_DataEntityName)  + @sql_clrf + @sql_clrf
          
			SET @sql_parameters = '@DatabaseName SYSNAME, @Source_SchemaName SYSNAME, @Source_DataEntityName SYSNAME, @Source_SchemaName SYSNAME, @DataEntityName_Staged SYSNAME'
									
			-- DEBUG PRINT
			IF(@sql_IsDebug = 1)
			BEGIN
				RAISERROR(@sql_statement, 0, 1)
			END

			--EXECUTE STATEMENT
			EXEC sp_executesql @stmt = @sql_statment, @params = @sql_parameters
										, @DatabaseName = @DatabaseName
										, @Source_SchemaName = @Source_SchemaName
										, @Source_DataEntityName = @Source_DataEntityName
										, @Target_SchemaName = @Target_SchemaName
										, @Target_DataEntityName = @DataEntityName_Staged
				
			-- TODO: Insert the Indexing part here

			-- Then we will do the swapout (seemlessly hopefully)
			-- Drop the existing table (from previous run... make sure we dont have logic in here that will drop other stuff)
			SET @sql_statement = 
			   N'DROP TABLE IF EXISTS ' + @sql_clrf
			    + @sql_tab + QUOTENAME(@DatabaseName) + '.' + QUOTENAME(@Target_SchemaName) + '.' + QUOTENAME(@Target_DataEntityName)  + @sql_clrf + @sql_clrf
			
			SET @sql_parameters = '@DatabaseName SYSNAME, @Target_SchemaName SYSNAME, @Target_DataEntityName SYSNAME'

			-- DEBUG PRINT
			IF(@sql_IsDebug = 1)
			BEGIN
				RAISERROR(@sql_statement, 0, 1)
			END

			-- EXECUTE STATEMENT
			--EXEC sp_executesql @stmt = @sql_statment, @params = @sql_parameters
			--							, @DatabaseName = @DatabaseName
			--							, @Target_SchemaName = @Target_SchemaName
			--							, @Target_DataEntityName = @Target_DataEntityName
			
			-- Put together the SELECT INTO Statement
			SET @sql_statement = 
			   N'SELECT * INTO ' + @sql_clrf +
				+ @sql_tab +	QUOTENAME(@DatabaseName) + '.' + QUOTENAME(@Target_SchemaName) + '.' + QUOTENAME(@Target_DataEntityName)  + @sql_clrf +
				'FROM ' + @sql_clrf + 
				+ @sql_tab + QUOTENAME(@DatabaseName) + '.' + QUOTENAME(@Source_SchemaName) + '.' + QUOTENAME(@Source_DataEntityName)  + @sql_clrf + @sql_clrf
          
			SET @sql_parameters = '@DatabaseName SYSNAME, @Source_SchemaName SYSNAME, @Source_DataEntityName SYSNAME, @Target_SchemaName SYSNAME, @Target_DataEntityName SYSNAME
									'
			-- DEBUG PRINT
			IF(@sql_IsDebug = 1)
			BEGIN
				RAISERROR(@sql_statement, 0, 1)
			END

			-- EXECUTE STATEMENT
			--EXEC sp_executesql @stmt = @sql_statment, @params = @sql_parameters
			--							, @DatabaseName = @DatabaseName
			--							, @Source_SchemaName = @Source_SchemaName
			--							, @Source_DataEntityName = @Source_DataEntityName
			--							, @Target_SchemaName = @Target_SchemaName
			--							, @Target_DataEntityName = @Target_DataEntityName
			--	


		COMMIT TRANSACTION
		
	END TRY
   
	BEGIN CATCH

	EXEC DataManager_Local.ERR.Error_Handle
                    @ProcedureID  = @@PROCID
                 ,  @IsReraiseError = 1

    END CATCH
END

