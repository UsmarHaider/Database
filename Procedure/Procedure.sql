

--LAB 11

go

CREATE PROCEDURE registration_course

@Semester varchar(20), @RNo  varchar(10), @CourseID int, @Section varchar(20), @CGPA float

AS

BEGIN

BEGIN TRANSACTION

IF @CGPA>2.5

BEGIN

INSERT INTO Registration VALUES (@Semester,@RNo,@CourseID,@Section,@CGPA);

COMMIT 

END

ELSE

BEGIN

PRINT 'Only enroll in the subject that he can Improve'

ROLLBACK 

END

END


