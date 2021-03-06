USE [DataManager]
GO
/****** Object:  StoredProcedure [ETL].[sp_insert_ExecutionLog]    Script Date: 2/17/2020 03:53:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Frans Germishuizen
-- Create date: 2019-04-15
-- Description:	Insert a log entry into the ETL.ExecutionLog_StoredProcedures table
-- =============================================

ALTER PROCEDURE [ETL].[sp_insert_ExecutionLog] 
	@DatabaseName                SYSNAME
,	@SchemaName                  SYSNAME
	--,@StoredProcedureName varchar(500)-- = NULL
,	@swStart_FinishLogEntry      TINYINT --This is to determine if the log entry is being started or finished when calling the stored procedure
,	@ExecutionLogID_In           INT-- = NULL -- The execution log entry that is passed in to update when it is finished executing
,	@ExecutionLogID_Out          INT OUTPUT
,	@LoadConfigID                INT
,	@QueuedForProcessingDT       DATETIME2(7) = NULL
,	@IsReload                    BIT          = 0
,	@ErrorMessage                VARCHAR(500) = NULL
,	@DataEntityName              SYSNAME
,	@NewRowCount                 BIGINT       = NULL
,	@IsError                     BIT          = NULL
,	@ErrorNumber                 INT          = NULL
,	@ErrorSeverity               INT          = NULL
,	@ErrorState                  INT          = NULL
,	@ErrorLine                   INT          = NULL
,	@LastProcessingKeyValue      VARCHAR(MAX) = NULL
,	@DeletedRowCount             BIGINT       = NULL
,	@SourceRowCount              BIGINT       = NULL
,	@SourceTableSizeBytes        BIGINT       = NULL
,	@TargetRowCount              BIGINT       = NULL
,	@TargetTableSizeBytes        BIGINT       = NULL
,	@UpdatedRowBytes             BIGINT       = NULL
,	@UpdatedRowCount             BIGINT       = NULL
,	@NewRowsBytes                BIGINT       = NULL
,	@RowsTransferred             BIGINT       = NULL
,	@InitialTargetRowCount       BIGINT       = NULL
,	@InitialTargetTableSizeBytes BIGINT       = NULL
AS
	SET XACT_ABORT, NOCOUNT ON    BEGIN TRY        BEGIN TRANSACTION  

	        --	BEGIN TRANSACTION
	        --WS: Code to log when a load failed
	        DECLARE 
		        @ERRORVAR INT
	        DECLARE 
		        @ERRORSTRING VARCHAR(50)
	        DECLARE 
		        @ExecutionLogID_return TABLE (
		        ExecutionLogID INT
	        )
	        DECLARE 
		        @LoadType VARCHAR(50)
	        SET @ERRORVAR = (SELECT         
						         COUNT(*)
					         FROM         
						         etl.
                                 
                                 s
					         WHERE
								         LOWER([Action]) LIKE '%error%'
								         AND [ExecutionLogID] = @ExecutionLogID_Out)

	        --SET @LoadType = (SELECT LoadType FROM ETL.LoadConfig WHERE LoadConfigID = @LoadConfigID)

	        IF
				        @ERRORVAR != 0
				        OR @IsError = 1
	        BEGIN
		        SET @ERRORSTRING = 'Execution Failed'
	        END
		        ELSE
	        BEGIN
		        IF @swStart_FinishLogEntry = 1
		        BEGIN
			        SET @ERRORSTRING = 'Execution In Progress'
		        END
			        ELSE
		        BEGIN
			        SET @ERRORSTRING = 'Execution Finished'
		        END
	        END

	        --END OF WS CODE
	        -- Remove the [] for logging
	        SET @DatabaseName = PARSENAME(@DatabaseName, 1)
	        SET @SchemaName = PARSENAME(@SchemaName, 1)
	        SET @DataEntityName = PARSENAME(@DataEntityName, 1)
	        IF @swStart_FinishLogEntry = 1
	        BEGIN
		        DECLARE 
			        @StartDT DATETIME2(7)= CONVERT(DATETIME2(7), GETDATE())

		        --Insert entry to start the execution of the stored procedure and to generate the ExecutionLogID
		        INSERT INTO ETL.ExecutionLog (
			        LoadConfigID
		          , DatabaseName
		          , SchemaName
		          , QueuedForProcessingDT
		          , StartDT
		          , LastProcessingKeyValue
		          , IsReload
		          , Result
		          , ErrorMessage
		          , DataEntityname
		          --, IsLastRunOfConfigID
		        ) 
		        OUTPUT 
			        INSERTED.ExecutionLogID
			           INTO @ExecutionLogID_return
		        VALUES (
			           @LoadConfigID
			         , @DatabaseName
			         , @SchemaName
			         , @QueuedForProcessingDT
			         , @StartDT
			         , @LastProcessingKeyValue
			         , @IsReload
			         , @ERRORSTRING --ws
			         , @ErrorMessage
			         , @DataEntityName
			        -- , 1
		        )

		        -- EF CHANGE TO get the OUTPUT paramater of this proc to keep it properly scoped 
		        SET @ExecutionLogID_Out = (
                        SELECT 
					        ExecutionLogID
				        FROM 
					        @ExecutionLogID_return
                )

		        --Insert log entry into the Analytics table
		        INSERT INTO ETL.ExecutionLogAnalysis (
			        ExecutionLogID
		        ) 
		        VALUES (
			           @ExecutionLogID_Out
		        )

		        ---- Update the IsLastRunForConfigID for this specific LoadConfigID to 0 for allother loadconfigs
		        ---- EF: Used in the PBI Report to identify LastLoad 
		        --UPDATE 
		        --	el
		        --SET
		        --	el.IsLastRunOfConfigID = 0
		        --FROM
		        --	[ETL].[ExecutionLog] AS el
		        --WHERE
		        --	el.ExecutionLogID != @ExecutionLogID_Out
		        --AND
		        --	el.LoadConfigID = @LoadConfigID
		        --AND
		        --	el.IsLastRunOfConfigID = 1

	        END
		        ELSE
	        BEGIN
		        DECLARE 
			        @FinishDT DATETIME2(7)= CONVERT(DATETIME2(7), GETDATE())
		        UPDATE ETL.ExecutionLog
		        SET    
			        FinishDT = @FinishDT
		          , Result = @ERRORSTRING --ws
		          , RowsTransferred = @RowsTransferred
		          , SourceRowCount = @SourceRowCount
		          , TargetRowCount = @TargetRowCount
		          , NewRowCount = @NewRowCount
		          , DeletedRowCount = @DeletedRowCount
		          , SourceTableSizeBytes = @SourceTableSizeBytes
		          , IsError = @IsError
		          , ErrorMessage = @ErrorMessage
		          , TargetTableSizeBytes = @TargetTableSizeBytes
		          , UpdatedRowBytes = @UpdatedRowBytes
		          , UpdatedRowCount = @UpdatedRowCount
		          , NewRowsBytes = @NewRowsBytes
		          , InitialTargetRowCount = @InitialTargetRowCount
		          , InitialTargetTableSizeBytes = @InitialTargetTableSizeBytes
		        WHERE    
			        ExecutionLogID = @ExecutionLogID_In --Wrong code: (Select MAX(ExecutionLogID) from  [ETL].[ExecutionLog])
		
                --Calculate Analysis for this log entry
		        UPDATE a
		        SET    
			        DurationSeconds = DATEDIFF(SECOND, log.StartDT, log.FinishDT)
		          , QueueSeconds = DATEDIFF(SECOND, log.QueuedForProcessingDT, log.StartDT)
		          , TotalExecutionTime = DATEDIFF(SECOND, log.QueuedForProcessingDT, log.FinishDT)
		          , IsDataIntegrityError = CASE
									           WHEN log.SourceRowCount != log.TargetRowCount THEN 1
									           ELSE 0
								           END
		        FROM   ETL.ExecutionLogAnalysis a
		        INNER JOIN
			        ETL.ExecutionLog AS log
			        ON log.ExecutionLogID = a.ExecutionLogID
		        WHERE    
			        log.ExecutionLogID = @ExecutionLogID_In
	        END
		        --COMMIT TRANSACTION
      

COMMIT TRANSACTIONEND TRY  


BEGIN CATCH

    EXEC DataManager_Local.ERR.Error_Handle @ProcedureID  = @@PROCID,   @IsReraiseError = 1

END CATCH  