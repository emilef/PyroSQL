SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

-- =======================================================================
-- PROCEDURE: Fail
-- Can be called by the test procedures to mark a test failure. 
-- It will record an entry in TestLog and raise an exception.
-- =======================================================================
CREATE PROCEDURE Assert.Fail
   @ErrorMessage  nvarchar(max)
AS
BEGIN
   DECLARE @TestSessionId int
   DECLARE @TestId int
   
   SELECT @TestSessionId = TestSessionId, @TestId = TestId FROM #Tmp_CrtSessionInfo
   INSERT INTO Data.TestLog(TestSessionId, TestId, EntryType, LogMessage) VALUES(@TestSessionId, @TestId, 'F', ISNULL(@ErrorMessage, ''))
   RAISERROR('TST RAISERROR {6C57D85A-CE44-49ba-9286-A5227961DF02}', 16, 110)
END

GO
