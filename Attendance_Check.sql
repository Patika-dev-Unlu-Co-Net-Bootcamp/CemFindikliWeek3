USE [PatikaDb]
GO
/****** Object:  Trigger [dbo].[Attedance_Check]    Script Date: 2/3/2022 1:51:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[Attedance_Check]
ON [dbo].[Attendance]
AFTER INSERT, UPDATE AS
BEGIN
--Degiskenler belirlendi
	declare @Id int
	declare @EducationWeekId int
	declare @StudentId int
	declare @Education int
	declare @EducationWeekNumber int
	declare @Avarage int
	declare @AttendanceOfWeek int
	--Değişkenlere gerekli değerler atandı.
	Select @EducationWeekId = Id, @EducationWeekNumber = EducationWeek  From EducationWeekNumber 
	Select @AttendanceOfWeek = AttendanceOfWeek From Attendance Where @StudentId = StudentId
	--Dersin mevcut hafta sayısı öğrencinin devam sayısına bölünerek Avarage değişkenine atandı.
	Set @Avarage = (@AttendanceOfWeek/@EducationWeekNumber)*100
	--İşlem yapılan öğrencinin başarı oranında güncelleme yapıldı.
	UPDATE SuccessStatus Set SuccessStatus = @Avarage Where StudentId=@StudentId


END;