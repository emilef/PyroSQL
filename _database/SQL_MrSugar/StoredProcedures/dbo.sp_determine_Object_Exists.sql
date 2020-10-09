SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE   PROCEDURE dbo.sp_determine_Object_Exists
AS
BEGIN

	IF OBJECT_ID('dbo.Model', 'U') IS NOT NULL
	BEGIN
		PRINT ('Do Nothing')
	END

	ELSE
	BEGIN

		CREATE TABLE dbo.Model (
			ID INT IDENTITY (1, 1)
		)

	END

END
GO
