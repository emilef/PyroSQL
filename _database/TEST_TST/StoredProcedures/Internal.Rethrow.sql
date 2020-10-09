SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- =======================================================================
-- PROCEDURE Rethrow
-- Implements the Rethrow functionality 
-- =======================================================================
CREATE PROCEDURE Internal.Rethrow
AS
BEGIN

   -- Return if there is no error information to retrieve.
   IF (ERROR_NUMBER() IS NULL) RETURN;

   DECLARE @ErrorMessage    nvarchar(4000)
   DECLARE @ErrorNumber     int
   DECLARE @ErrorSeverity   int
   DECLARE @ErrorState      int
   DECLARE @ErrorProcedure  nvarchar(200)
   DECLARE @ErrorLine       int

   -- Assign error-handling functions that capture the error information to variables.
   SELECT 
      @ErrorNumber       = ERROR_NUMBER()                ,
      @ErrorSeverity     = ERROR_SEVERITY()              ,
      @ErrorState        = ERROR_STATE()                 ,
      @ErrorProcedure    = ISNULL(ERROR_PROCEDURE(), 'N/A'),
      @ErrorLine         = ERROR_LINE()                  

   -- Build the message string that will contain the original error information.
   SELECT @ErrorMessage = 'Error %d, Level %d, State %d, Procedure %s, Line %d, Message: ' + ERROR_MESSAGE();

   -- Raise an error: msg_str parameter of RAISERROR will contain the original error information.
   -- Raise an error: msg_str parameter of RAISERROR will contain the original error information.
   RAISERROR (
      @ErrorMessage, 
      @ErrorSeverity, 
      1,               
      @ErrorNumber,    -- parameter: original error number.
      @ErrorSeverity,  -- parameter: original error severity.
      @ErrorState,     -- parameter: original error state.
      @ErrorProcedure, -- parameter: original error procedure name.
      @ErrorLine       -- parameter: original error line number.
      )

END

GO
