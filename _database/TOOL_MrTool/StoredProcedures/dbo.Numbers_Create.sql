SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
/*
	EXEC PYROTOOLS.dbo.Numbers_Create
*/
CREATE   PROCEDURE dbo.Numbers_Create
AS

DROP TABLE IF EXISTS dbo.Numbers

CREATE TABLE dbo.Numbers(n BIGINT)

;WITH e1(n) AS
(
	SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL 
	SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL 
	SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1
)														-- 10
	,e2(n) AS (SELECT 1 FROM e1 CROSS JOIN e1 AS b)		-- 10*10
	,e3(n) AS (SELECT 1 FROM e1 CROSS JOIN e2 AS c)		-- 10*100
	,e4(n) AS (SELECT 1 FROM e1 CROSS JOIN e3 AS d)		-- 10*1000
	,e5(n) AS (SELECT 1 FROM e1 CROSS JOIN e4 AS e)		-- 10*10000
	,e6(n) AS (SELECT 1 FROM e1 CROSS JOIN e5 AS e)		-- 10*10000
INSERT  INTO 
	dbo.Numbers(n)
SELECT 
	n = ROW_NUMBER() OVER (ORDER BY n) 
FROM 
	e6 
ORDER BY 
	n

CREATE UNIQUE CLUSTERED INDEX 
	ucix_Numbers_n
ON 
	dbo.Numbers(n) 
WITH 
	(DATA_COMPRESSION = PAGE);
GO
