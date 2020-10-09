SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [test spDouble Calculation]
AS
    BEGIN
-- assemble
        DECLARE
            @param INT
        ,   @expected INT
        ,   @actual INT;
        SET @param = 5;
        SET @expected = 10;
-- Act
        EXEC @actual = spDouble @param;
-- assert
        EXEC tSQLt.AssertEquals @Expected = @expected, @Actual = @actual,
            @Message = N'The calculation is incorrect.'; -- nvarchar(max)
    END;
GO
