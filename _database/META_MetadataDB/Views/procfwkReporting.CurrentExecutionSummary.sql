SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [procfwkReporting].[CurrentExecutionSummary]
AS

SELECT 
	ISNULL([PipelineStatus], 'Not Started') AS 'PipelineStatus',
	COUNT(0) AS 'RecordCount'
FROM 
	[procfwk].[CurrentExecution]
GROUP BY
	[PipelineStatus]

GO
