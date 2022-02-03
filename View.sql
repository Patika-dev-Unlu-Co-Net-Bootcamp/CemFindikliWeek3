CREATE VIEW StudentByEducation AS
Select E.EducationName AS EgitimAdı, S.Name AS Ad, S.Surname AS Soyad
FROM StudentInEducation AS SE
INNER JOIN Students AS S
ON SE.StudentId = S.Id
INNER JOIN Education AS E
ON SE.EducationId = E.Id