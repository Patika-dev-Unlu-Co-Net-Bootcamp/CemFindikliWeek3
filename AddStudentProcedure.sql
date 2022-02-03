CREATE PROCEDURE AddStudentProcedure
@Name nvarchar(100),
@Surname nvarchar(100),
@Phone nchar(15),
@Email nvarchar(300),
@Linkedn nvarchar(500),
@Github nvarchar(300),
@CreateDate smalldatetime,
@IsActive bit
AS 
IF EXISTS(Select * From Students Where Email = @Email)
BEGIN
raiserror('This Student Is Already Registered',1,1);
END
ELSE
BEGIN
INSERT INTO Students VALUES(@Name, @Surname, @Phone,
@Email, @Linkedn, @Linkedn, @Github, @IsActive)
END