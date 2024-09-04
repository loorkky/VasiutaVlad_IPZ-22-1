CREATE PROCEDURE CalculateAverageGradeWithoutRetakes
AS
BEGIN
    SELECT Kod_student, AVG(Reiting) AS AvgGrade
    FROM Reiting
    WHERE Prisutn = 1
    GROUP BY Kod_student;
END
EXEC CalculateAverageGradeWithoutRetakes;

CREATE PROCEDURE CalculateAverageGradeWithRetakes
AS
BEGIN
    SELECT Kod_student, AVG(Reiting) AS AvgGrade
    FROM Reiting
    GROUP BY Kod_student;
END
EXEC CalculateAverageGradeWithRetakes

CREATE PROCEDURE GetStudentsWithGrades4And5
AS
BEGIN
    SELECT DISTINCT s.*
    FROM dbo_student s
    INNER JOIN Reiting r ON s.Kod_stud = r.Kod_student
    WHERE r.Reiting >= 74
END
EXEC GetStudentsWithGrades4And5

CREATE PROCEDURE CalculateTotalGradeValues
    @studentCode INT
AS
BEGIN
    DECLARE @totalPoints INT
    DECLARE @nationalGrade NVARCHAR(10)
    DECLARE @ectsGrade NVARCHAR(10)

    SELECT @totalPoints = SUM(Reiting)
    FROM Reiting
    WHERE Kod_student = @studentCode;

    IF @totalPoints BETWEEN 60 AND 63
    BEGIN
        SET @nationalGrade = '3'
        SET @ectsGrade = 'E'
    END
    ELSE IF @totalPoints BETWEEN 64 AND 73
    BEGIN
        SET @nationalGrade = '3'
        SET @ectsGrade = 'D'
    END
    ELSE IF @totalPoints BETWEEN 74 AND 81
    BEGIN
        SET @nationalGrade = '4'
        SET @ectsGrade = 'C'
    END
    ELSE IF @totalPoints BETWEEN 82 AND 89
    BEGIN
        SET @nationalGrade = '4'
        SET @ectsGrade = 'B'
    END
    ELSE IF @totalPoints BETWEEN 90 AND 100
    BEGIN
        SET @nationalGrade = '5'
        SET @ectsGrade = 'A'
    END
    ELSE IF @totalPoints < 60
    BEGIN
        SET @nationalGrade = '2'
        SET @ectsGrade = 'F'
    END
    ELSE
    BEGIN
        SET @nationalGrade = NULL
        SET @ectsGrade = NULL
    END
    SELECT @totalPoints AS 'TotalPoints', @nationalGrade AS 'NationalGrade', @ectsGrade AS 'ECTSGrade'
END
EXEC CalculateTotalGradeValues @studentCode = 9

CREATE TRIGGER AddNewGroupOnInsert
ON dbo_student
AFTER INSERT
AS
BEGIN
    INSERT INTO dbo_groups (Kod_group, K_navch_plan)
    SELECT DISTINCT i.Kod_group, 17
    FROM inserted i
    LEFT JOIN dbo_groups g ON i.Kod_group = g.Kod_group
    WHERE g.Kod_group IS NULL;
END

INSERT INTO dbo_student (Sname, Name, FName, N_ingroup, Kod_group)
VALUES ('Додо', 'Валерій', 'Петрович', 1, N'c-58');

select * from dbo_student
select * from dbo_groups

CREATE TRIGGER DeleteEmptyGroupOnUpdate
ON dbo_student
AFTER DELETE
AS
BEGIN
    DELETE FROM dbo_groups
    WHERE Kod_group IN (
        SELECT g.Kod_group
        FROM dbo_groups g
        LEFT JOIN dbo_student s ON g.Kod_group = s.Kod_group
        GROUP BY g.Kod_group
        HAVING COUNT(s.Kod_stud) = 0
    );
END

delete from dbo_student
where Kod_stud = 53






