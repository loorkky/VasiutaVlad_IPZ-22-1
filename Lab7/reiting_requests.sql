DELETE FROM Reiting
WHERE Kod_student IN (SELECT Kod_stud FROM dbo_student WHERE Sname = 'Vasiuta');

DELETE FROM Predmet_plan
WHERE K_predmet in (SELECT K_predmet FROM predmet WHERE Nazva = 'DataBase');

UPDATE Reiting
SET Reiting = Reiting * 1.15

UPDATE Reiting
SET Reiting = Reiting * 0.85

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