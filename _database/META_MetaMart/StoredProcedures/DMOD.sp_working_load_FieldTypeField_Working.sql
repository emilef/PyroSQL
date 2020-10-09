SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:      Frans Germishuizen
-- Create Date: 2018-12-19
-- Description: Load [DMOD].[FieldTypeField_Working] for a new session
-- Tables:		[DMOD].[FieldTypeField_Working]
-- =============================================

CREATE PROCEDURE [DMOD].[sp_working_load_FieldTypeField_Working]
	@SessionID int
AS
BEGIN
	--======================================================================================================================
	--Variable declerations
	Declare @CheckExists_Session int

		--------------------------------------------------------------------------------------------------------------------
		/*
		-- Testing variables (comment out after use and testing)
		declare @Username varchar(100)

		set		@Username = SUSER_NAME() --Stage Area dbo_DEPARTMENT
		
		------------------------------------------------------------------------------------------------------------------*/
	--======================================================================================================================

	--======================================================================================================================
	--Check if entries for this session exists
	--======================================================================================================================

	select	@CheckExists_Session = COUNT(1)
	from	[DMOD].[FieldTypeField_Working]
	where	SessionID = @SessionID
	
	--======================================================================================================================
	--If no entries exists, add entry to tables, else give error messages
	--======================================================================================================================
	
	IF (@CheckExists_Session = 0)
	BEGIN
		--------------------------------------------
		--Insert Session entry
		--------------------------------------------
		INSERT INTO [DMOD].[FieldTypeField_Working]
				   ([FieldTypeFieldID]
				   ,[FieldID]
				   ,[FieldTypeID]
				   ,[SessionID])
		select	[FieldTypeFieldID]
				, [FieldID]
				, [FieldTypeID]
				, @SessionID
		from	[DC].[FieldTypeField] fieldtypefield
	END

END

GO
