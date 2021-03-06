USE [MetricsVault]
GO
/****** Object:  StoredProcedure [dbo].[sp_handle_EnsambleMetric]    Script Date: 2020/06/01 4:48:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	Written By: Emile Fraser
	Date: 2020-05-20
	Function: Acts as the central handler of the Metrics Vault Population. Gets configs, 
				constructs the proc to execute in VARCHAR format and then finally execute and logs the 
					execution of the procedure

	Execution Example:

	DECLARE 
		@ServerName			SYSNAME			= 'TSABISQL02\STAGSSIS'
	,	@DatabaseName		SYSNAME			= 'DataVault'
	,	@SchemaName			SYSNAME			= 'RAW'
	,	@ProcedureName		SYSNAME			= 'sp_loadhub_XT_Terminal'

	EXEC [dbo].[sp_handle_EnsambleMetric]
		@ServerName							= @ServerName
	,	@DatabaseName						= @DatabaseName
	,	@SchemaName							= @SchemaName	
	,	@ProcedureName						= @ProcedureName
*/

-- Inserts plain count of rows to Ensambles
ALTER     PROCEDURE [dbo].[sp_handle_EnsambleMetric]
	@ServerName							SYSNAME
,	@DatabaseName						SYSNAME
,	@SchemaName							SYSNAME
,	@ProcedureName						SYSNAME
AS
BEGIN
	-- Dynamic SQL level 1 
	DECLARE 
		@sql_statement					NVARCHAR(MAX)
	,	@sql_parameter					NVARCHAR(MAX)
	,	@sql_message					NVARCHAR(MAX)
	,	@sql_crlf						NVARCHAR(2) = CHAR(13) + CHAR(10)
	,	@sql_tab						NVARCHAR(1) = CHAR(9)
	,	@sql_isdebug					BIT = 0
	,	@sql_isexecute					BIT = 1

	-- Dynamic SQL level 2 (Inception phase)
	DECLARE 
		@sql_statement_incep			NVARCHAR(MAX)
		@sql_parameter_incep			NVARCHAR(MAX)

	DECLARE  
		@ElementID						SMALLINT
	,	@EnsambleID						SMALLINT
	,	@EnsambleName					VARCHAR(100)
	,	@EntityType						VARCHAR(30)
	,	@DataEntityName					SYSNAME
	,	@FullyQualifiedEntityName		NVARCHAR(523)   -- (128 * 4) + (2 * 4) + (1 * 3)  -- SYSNAME + BRACKEETS + DOTS

	DECLARE 
		@config_cursor					CURSOR
	,	@MetricTypeID					SMALLINT
	,	@ScheduleID						SMALLINT
	,	@TimegrainID					SMALLINT
	,	@ConfigID						SMALLINT
	,	@GroupBy_FieldName				NVARCHAR(MAX)
	,	@MetricProcedureName			SYSNAME
	,	@Additional_Parameters			NVARCHAR(MAX)
	,	@Additional_Parameters_Inject	NVARCHAR(MAX)
	,	@Additional_Parameters_Output	NVARCHAR(MAX)
	,	@Additional_Parameters_Incep	NVARCHAR(MAX)
	,	@return_status					SMALLINT

	-- Sets the DT that  
	DECLARE @CreatedDT DATETIME2(7) = GETDATE()
	DECLARE @CurrentLogStatus SMALLINT = 0

	-- Gets the Entity type being loaded by the Procedure as well as the entity ultimately loaded 
	SET @EntityType			= (SELECT UPPER(REPLACE(Item, 'load','')) FROM  dbo.udf_split_String(@ProcedureName,'_',2))
	SET @EnsambleName		= (SELECT Item FROM dbo.udf_split_String(@ProcedureName,'_',4))
	SET @DataEntityName		= @EntityType + '_' + @EnsambleName

	-- Fully Qualified Name to figure out on what entity to run the test and then what ElementID relates to the FullyQualifiedName
	SET @FullyQualifiedEntityName = CONCAT_WS('.', QUOTENAME(@ServerName), QUOTENAME(@DatabaseName), QUOTENAME(@SchemaName), QUOTENAME(@DataEntityName))
	SET @ElementID = (SELECT ElementID FROM dbo.Ensamble_Element WHERE [ElementFullyQualified] = @FullyQualifiedEntityName)
	
	IF (@sql_isdebug = 1)
	BEGIN
		SET @sql_message = '@FullyQualifiedEntityName = ' + @FullyQualifiedEntityName + ' (@ElementID = ' + CONVERT(NVARCHAR(MAX), @ElementID) + ')'
		RAISERROR(@sql_message, 0 , 1) WITH NOWAIT
	END

	-- Now Get all the Configs that are set for this specific Element, as well as the metrics they relate to
	-- The MetricTypeID is needed to figure out what parameters to send to the ultimate procedures
	SET @config_cursor = CURSOR FOR 
	SELECT 
		ec.[ConfigID]
	,	ec.[MetricTypeID]
	FROM 
		[MetricsVault].[dbo].[Ensamble_Config] AS ec
	WHERE
		ec.[ElementID] = @ElementID
	AND	
		ec.[IsActive] = 1

	OPEN @config_cursor
	
	FETCH NEXT FROM @config_cursor
	INTO @ConfigID, @MetricTypeID

	-- Start loopoing throught the metrics one for one, combine the test they need to run
	-- Fire the test and then logs the Execution status of the tests run
	WHILE (@@FETCH_STATUS = 0)
	BEGIN

		IF (@sql_isdebug = 1)
		BEGIN
			SET @sql_message = '@config_cursor with ' + '@ConfigID = ' + CONVERT(NVARCHAR(MAX), @ConfigID) + ' & ' + '@MetricTypeID = ' + CONVERT(NVARCHAR(MAX), @MetricTypeID)
			RAISERROR(@sql_message, 0 , 1) WITH NOWAIT
		END

		-- Gets the procedure name to be executed as well as any additional fields we will require
		-- to perform the tests (any group by, value fields specified)
		SELECT 
			@MetricProcedureName = emt.ProcedureName
		,	@Additional_Parameters = emt.AdditionalParameters
		FROM 
			dbo.Ensamble_MetricType AS emt
		WHERE 
			MetricTypeID =  @MetricTypeID

		-- Prints out the ProcName and the Additional params needed
		-- Multiple Additional parameters are possible as well as whether they are mandatory denoted by {} or optional denoted by []
		IF (@sql_isdebug = 1)
		BEGIN
			SET @sql_message = '@ConfigID = ' + @MetricProcedureName + ' & ' + '@Additional_Parameters = ' + CONVERT(NVARCHAR(MAX), @Additional_Parameters)
			RAISERROR(@sql_message, 0 , 1) WITH NOWAIT
		END
		

		--SELECT * FROM udf_split_String('{Value_FieldName},{AggregationTypeID},[GroupBy_FieldName]',',', 0)
		--DECLARE @Additional_Parameters_Inject NVARCHAR(MAX)
		SET @Additional_Parameters_Inject = ''
		SELECT @Additional_Parameters_Inject = @Additional_Parameters_Inject 
					+  '@' + REPLACE(REPLACE(REPLACE(REPLACE(Item, '{',''),'}',''),'[',''),']','') 
					+ ' = ' 
					+ QUOTENAME(REPLACE(REPLACE(REPLACE(REPLACE(Item, '{',''),'}',''),'[',''),']',''))
					+ ', ' + CHAR(13)
		FROM dbo.udf_split_String(@Additional_Parameters,',', 0)	
		SET @Additional_Parameters_Inject = SUBSTRING(@Additional_Parameters_Inject, 1, LEN(@Additional_Parameters_Inject) - 3) + CHAR(13)
		--SELECT @Additional_Parameters_Inject


		-- Gets the Additional Parameters we will need from the relevant config columns
		-- These can also contain multiple values (liek the GroupBy_FieldName)
		SET @sql_statement = N'
			SELECT ' + CHAR(13) +
				@Additional_Parameters_Inject + '
			FROM 
				dbo.Ensamble_Config
			WHERE
				ConfigID = @ConfigID
		'

		-- This is done to be able to produce the sql_parameter portion of the query to execute
		SET @Additional_Parameters_Output = ''
		SELECT @Additional_Parameters_Output = @Additional_Parameters_Output 
					+ ', ' + '@' + REPLACE(REPLACE(REPLACE(REPLACE(Item, '{',''),'}',''),'[',''),']','') + ' NVARCHAR(MAX) OUTPUT'
		FROM 
			dbo.udf_split_String(@Additional_Parameters,',', 0)	

		SET @sql_parameter = N'@ConfigID SMALLINT' + @Additional_Parameters_Output

		IF(@sql_isdebug = 1)
			RAISERROR(@sql_statement, 0, 1)

		-- Here due to a sliding number of parmeters specified and returned will have to do deep. Inception phase, dynamic inside dynamic
		--Need to first construct the inception parameters (easier to actually)
		SET @Additional_Parameters_Incep = ''
		SELECT @Additional_Parameters_Incep = @Additional_Parameters_Incep
				+ ', @' 
				+ REPLACE(REPLACE(REPLACE(REPLACE(Item, '{',''),'}',''),'[',''),']','') 
				+ ' = ' 
				+ REPLACE(REPLACE(REPLACE(REPLACE(Item, '{',''),'}',''),'[',''),']','') 
				+ ' OUTPUT' 
				+ CHAR(13)

		IF(@sql_isexecute = 1)
		BEGIN
			SET @sql_statement_incep = '				
				EXEC sp_executesql 
					@stmt				= ' + @sql_statement + '
				,	@param				= ' + @sql_parameter + '		
				,	@ConfigID			= ' + @ConfigID + CHAR(13) +
						 @Additional_Parameters_Incep

			IF(@sql_isdebug = 1)
				RAISERROR(@sql_statement, 0, 1)
		
		END






		-- Write the Open Log Position to the Logfile
		EXEC dbo.sp_insert_Ensamble_Log
			@MetricProcedureCalled	=	@MetricProcedureName	
		,	@ConfigID				=	@ConfigID
		,	@LogStatusTypeID		=	0


		-- Now finally compose the test string to execute and fire
		SET @sql_statement = 'EXEC ' + QUOTENAME(N'dbo') + '.' + QUOTENAME(@MetricProcedureName) + @sql_crlf + @sql_tab + 
									N'    @ConfigID' + N' = ''' + CONVERT(NVARCHAR(5), @ConfigID) + N'''' + @sql_crlf + @sql_tab + 
									N',   @GroupBy_FieldName' + N' = ''' + @GroupBy_FieldName + N''''
		SET @sql_parameter = N''

		IF(@sql_isdebug = 1)
			RAISERROR(@sql_statement, 0, 1)

		IF(@sql_isexecute = 1)
		BEGIN

			-- EXECUTES the Actual Metric Capturing
			EXEC @return_status = sp_executesql 
							@stmt  = @sql_statement
						,	@param = @sql_parameter


			-- If any error is returned (non 0 @retrun status, set error to -1) 
			SET @return_status = IIF(@return_status <> 0, -1, 1)

			-- Write the Close Log Position to the Logfile
				EXEC dbo.sp_insert_Ensamble_Log
					@MetricProcedureCalled	=	@MetricProcedureName	
				,	@ConfigID				=	@ConfigID
				,	@LogStatusTypeID		=	@return_status
		
		END

		FETCH NEXT FROM @config_cursor
		INTO @ConfigID, @MetricTypeID
		
	END
END
