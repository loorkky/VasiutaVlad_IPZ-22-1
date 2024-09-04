CREATE PROCEDURE FindEmployeeByLastName (@lastName VARCHAR(50))
AS
BEGIN
    SELECT * FROM Employees WHERE Last_Name = @lastName;
END;
EXEC FindEmployeeByLastName @lastName = N'Іванов';

CREATE PROCEDURE FindEmployeesByDepartment (@departmentName VARCHAR(100))
AS
BEGIN
    SELECT * FROM Employees e JOIN Departments d ON e.Department_ID = d.Department_ID WHERE d.Department_Name = @departmentName;
END;
EXEC FindEmployeesByDepartment @departmentName = N'Відділ розробки';

CREATE PROCEDURE CalculateAverageSalaryByDepartment (@departmentName VARCHAR(100))
AS
BEGIN
    SELECT AVG(Salary) AS AverageSalary FROM Employees e JOIN Departments d ON e.Department_ID = d.Department_ID WHERE d.Department_Name = @departmentName;
END;
EXEC CalculateAverageSalaryByDepartment @departmentName = N'Відділ маркетингу';

CREATE TRIGGER AfterInsertEmployee
ON Employees
AFTER INSERT
AS
BEGIN
    PRINT 'Новий працівник був доданий!';
END;
INSERT INTO Employees (Employee_ID, Last_Name, First_Name, Middle_Name, Birth_Year, Employment_Date, Position, Salary, Department_ID, Identification_Code) 
VALUES (8, 'Сидоренко', 'Олександр', 'Іванович', 1990, '2024-05-06', 'Аналітик', 3000.00, 1, '12345');

CREATE TRIGGER UpdatePositionOnDepartmentChange
ON Employees
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted i
        JOIN deleted d ON i.Employee_ID = d.Employee_ID
        WHERE i.Department_ID = 4 AND d.Department_ID <> 4
    )
    BEGIN
        UPDATE Employees
        SET Position = 'HR менеджер'
        WHERE Employee_ID IN (SELECT Employee_ID FROM inserted);
    END
END;
UPDATE Employees
SET Department_ID = 4
WHERE Employee_ID = 1;

CREATE TABLE EmployeeChanges (
    Change_ID INT PRIMARY KEY IDENTITY,
    Employee_ID INT,
    Change_Date DATETIME,
    Changed_Field VARCHAR(100),
    Old_Value VARCHAR(100),
    New_Value VARCHAR(100)
);

CREATE TRIGGER LogEmployeeChanges
ON Employees
AFTER UPDATE
AS
BEGIN
    INSERT INTO EmployeeChanges (Employee_ID, Change_Date, Changed_Field, Old_Value, New_Value)
    SELECT i.Employee_ID, GETDATE(), c.COLUMN_NAME, d.Position, i.Position
    FROM inserted i
    INNER JOIN deleted d ON i.Employee_ID = d.Employee_ID
    CROSS JOIN INFORMATION_SCHEMA.COLUMNS c 
    WHERE c.TABLE_NAME = 'Employees' AND c.COLUMN_NAME NOT IN ('Employee_ID', 'Employment_Date')
    AND i.Position <> d.Position;
END;

UPDATE Employees
SET Position = 'Системний адміністратор'
WHERE Employee_ID = 1;

select * from EmployeeChanges









