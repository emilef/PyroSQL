SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE   PROCEDURE [procfwk].[GetStages]
	(
	@ExecutionId UNIQUEIDENTIFIER
	)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT DISTINCT 
		[StageId] 
	FROM 
		[procfwk].[CurrentExecution]
	WHERE
		[LocalExecutionId] = @ExecutionId
		AND ISNULL([PipelineStatus],'') <> 'Success'
	ORDER BY 
		[StageId] ASC
END;

GO
