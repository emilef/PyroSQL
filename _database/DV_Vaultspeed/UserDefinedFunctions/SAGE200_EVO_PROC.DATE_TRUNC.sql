SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION [SAGE200_EVO_PROC].[DATE_TRUNC](
			@timestamp DATETIME2,
			@level nvarchar(100))
	    RETURNS DATETIME2
			AS
			BEGIN
			RETURN
		CASE
		WHEN @level = 'year' THEN
			CONVERT(DATETIME, CONVERT(VARCHAR(4), @timestamp, 120) + '-01-01')
		WHEN @level = 'month' THEN
			CONVERT(DATETIME, CONVERT(VARCHAR(7), @timestamp, 120) + '-01')
		WHEN @level = 'week' THEN
			CONVERT(DATETIME, CONVERT(VARCHAR(10), @timestamp, 120)) - DATEPART(dw,@timestamp) + 1
		WHEN @level = 'day' THEN
			CONVERT(DATETIME, CONVERT(VARCHAR(10), @timestamp, 120))
		WHEN @level = 'hour' THEN
			CONVERT(DATETIME, CONVERT(VARCHAR(13), @timestamp, 120) + ':00:00')
		WHEN @level = 'minute' THEN
			CONVERT(DATETIME, CONVERT(VARCHAR(16), @timestamp, 120) + ':00')
		ELSE
			@timestamp
		END
	    END;

GO
