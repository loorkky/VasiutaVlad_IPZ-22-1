SELECT Kod_student, SUM(Reiting) AS Total_Rating
FROM Reiting
GROUP BY Kod_student;

SELECT Kod_group, COUNT(Kod_stud) AS Students_Count
FROM dbo_student
GROUP BY Kod_group;

SELECT Kod_group, COUNT(*) AS Discipline_Count
FROM dbo_groups
GROUP BY Kod_group;

SELECT Kod_group, COUNT(*) AS Classes_Count
FROM Rozklad_pids
GROUP BY Kod_group;

SELECT Kod_group, AVG(Reiting) AS Avg_Rating
FROM Reiting r
JOIN dbo_student s ON r.Kod_student = s.Kod_stud
GROUP BY Kod_group;

SELECT pp.K_predmet, AVG(r.Reiting) AS Avg_Rating
FROM Reiting r
JOIN Predmet_plan pp ON pp.K_predmet = pp.K_predmet
GROUP BY pp.K_predmet;

SELECT r.Kod_student, pp.K_predmet, r.Reiting AS Current_Rating
FROM Reiting r
JOIN Predmet_plan pp ON pp.K_predmet = pp.K_predmet;

SELECT pp.K_predmet, MIN(r.Reiting) AS Min_Rating
FROM Reiting r
JOIN Predmet_plan pp ON pp.K_predmet = pp.K_predmet
GROUP BY pp.K_predmet;

SELECT pp.K_predmet, MAX(r.Reiting) AS Min_Rating
FROM Reiting r
JOIN Predmet_plan pp ON pp.K_predmet = pp.K_predmet
GROUP BY pp.K_predmet;

SELECT K_predm_pl, COUNT(Zdacha_type) AS Classes_Count_By_Type
FROM Rozklad_pids
GROUP BY K_predm_pl, Zdacha_type;

SELECT K_spets, COUNT(Kod_group) AS Groups_Count
FROM Navch_plan
JOIN dbo_groups ON Navch_plan.K_navch_plan = dbo_groups.K_navch_plan
GROUP BY K_spets;

DELETE FROM Reiting
WHERE Kod_student IN (SELECT Kod_stud FROM dbo_student WHERE Sname = 'Vasiuta');

DELETE FROM Predmet_plan
WHERE K_predmet in (SELECT K_predmet FROM predmet WHERE Nazva = 'DataBase');

UPDATE Reiting
SET Reiting = Reiting * 1.15

UPDATE Reiting
SET Reiting = Reiting * 0.85

DECLARE @K_group varchar(10) = 'ϲ-53';
DECLARE @Reiting smallint = 76;

INSERT INTO Reiting (K_zapis, Kod_student, Reiting, Prisutn)
SELECT 36, s.Kod_stud, @Reiting, 2
FROM dbo_student s
JOIN dbo_groups g ON s.Kod_group = g.Kod_group
WHERE g.Kod_group = @K_group;

DECLARE @ALLHOURS int = 1500;

INSERT INTO Predmet_plan(K_predmet, K_navch_plan, Chas_Lek, Cahs_pr, Chas_all, Chas_Labor, Chas_sem, Kilk_modul, Cahs_sam, Semestr, Shifr_predmet, k_fk)
SELECT p.K_predmet, 17, @ALLHOURS / 2, @ALLHOURS / 2, @ALLHOURS, @ALLHOURS / 2, @ALLHOURS / 2, 5, null, 1, null, 4
FROM predmet p
WHERE Nazva LIKE 'M%';

UPDATE Predmet_plan
SET Kilk_modul = 5
WHERE K_predmet = 388

DELETE FROM dbo_student
WHERE Kod_group = 'ϲ-54'

DECLARE @Kod_group varchar(10) = 'ϲ-54'
DECLARE @Prisutn int = 0

INSERT INTO Reiting(K_zapis, Kod_student, Reiting, Prisutn)
SELECT 36, s.Kod_stud, 66, @Prisutn
FROM dbo_student s
JOIN dbo_groups g ON s.Kod_group = g.Kod_group
WHERE g.Kod_group = @Kod_group;

UPDATE Reiting
SET Prisutn = 1
WHERE Kod_student IN (SELECT Kod_stud FROM dbo_student WHERE Sname = 'Vasiuta');