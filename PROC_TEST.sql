USE [Test]
GO
/****** Object:  StoredProcedure [dbo].[MERGED_PROCEDURES]    Script Date: 06-11-2024 18:18:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[MERGED_PROCEDURES]
AS
BEGIN
    DECLARE @FirstTargetTime TIME = '18:02:00';
    DECLARE @SecondTargetTime TIME = '18:03:00';

    DECLARE @CurrentDate DATE = CAST(GETDATE() AS DATE);
    
    DECLARE @FirstTargetDateTime DATETIME = CAST(@CurrentDate AS DATETIME) + (CAST(@FirstTargetTime AS DATETIME) - CAST('1900-01-01' AS DATETIME));
    DECLARE @SecondTargetDateTime DATETIME = CAST(@CurrentDate AS DATETIME) + (CAST(@SecondTargetTime AS DATETIME) - CAST('1900-01-01' AS DATETIME));

    IF GETDATE() < @FirstTargetDateTime
    BEGIN
   --Waiting until 4:30 PM to execute the first procedure
        WAITFOR TIME @FirstTargetDateTime;
    END

 --Executing the first procedure at 4:30
    EXEC INSERTING; --1ST PROCEDURE
	select CONVERT(VARCHAR, GETDATE(), 120);


    IF GETDATE() < @SecondTargetDateTime
    BEGIN
        PRINT 'Waiting until 5:00 PM to execute the second procedure.';
        WAITFOR TIME @SecondTargetDateTime; 
			WAITFOR DELAY '23:59:59' --WAIT UNTIL NEXT DAY

    END

 -- Executing the second procedure at 5:00
    EXEC SetColumnToZero; --2ND PROCEDURE

	SELECT 'REFRESHED VALUES';
	SELECT * FROM TRUNCATED_MID; --FETCHING TABLE VALUES
	select CONVERT(VARCHAR, GETDATE(), 120);

END

