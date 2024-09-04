CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100)
);

CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    Last_Name VARCHAR(50),
    First_Name VARCHAR(50),
    Middle_Name VARCHAR(50),
    Birth_Year INT,
    Employment_Date DATE,
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Department_ID INT,
    Identification_Code VARCHAR(20),
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

CREATE TABLE Sick_Leaves (
    Sick_Leave_ID INT PRIMARY KEY,
    Employee_ID INT,
    Start_Date DATE,
    End_Date DATE,
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);

CREATE TABLE Business_Trips (
    Trip_ID INT PRIMARY KEY,
    Employee_ID INT,
    Start_Date DATE,
    End_Date DATE,
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);

INSERT INTO Departments (Department_ID, Department_Name) VALUES
(1, 'Відділ розробки'),
(2, 'Відділ маркетингу'),
(3, 'Бухгалтерія');

INSERT INTO Employees (Employee_ID, Last_Name, First_Name, Middle_Name, Birth_Year, Employment_Date, Position, Salary, Department_ID, Identification_Code) VALUES
(1, 'Іванов', 'Петро', 'Олександрович', 1985, '2020-01-15', 'Програміст', 3000.00, 1, '12345'),
(2, 'Петров', 'Олег', 'Іванович', 1990, '2018-03-20', 'Менеджер з продажу', 2500.00, 2, '67890'),
(3, 'Сидорова', 'Олена', 'Петрівна', 1988, '2019-07-10', 'Головний бухгалтер', 3500.00, 3, '54321');

INSERT INTO Sick_Leaves (Sick_Leave_ID, Employee_ID, Start_Date, End_Date) VALUES
(1, 1, '2024-03-10', '2024-03-20'),
(2, 3, '2024-03-05', '2024-03-10');

INSERT INTO Business_Trips (Trip_ID, Employee_ID, Start_Date, End_Date) VALUES
(1, 2, '2024-02-15', '2024-02-20'),
(2, 3, '2024-03-01', '2024-03-03');

INSERT INTO Departments (Department_ID, Department_Name) VALUES (4, 'Відділ кадрів');

INSERT INTO Employees (Employee_ID, Last_Name, First_Name, Middle_Name, Birth_Year, Employment_Date, Position, Salary, Department_ID, Identification_Code) 
VALUES (4, 'Ковальчук', 'Марія', 'Василівна', 1987, '2023-06-12', 'HR менеджер', 2800.00, 4, '13579');

INSERT INTO Sick_Leaves (Sick_Leave_ID, Employee_ID, Start_Date, End_Date) VALUES (3, 1, '2024-04-01', '2024-04-05');

INSERT INTO Business_Trips (Trip_ID, Employee_ID, Start_Date, End_Date) VALUES (3, 1, '2024-05-10', '2024-05-15');

UPDATE Departments SET Department_Name = 'Відділ персоналу' WHERE Department_ID = 4;

UPDATE Employees SET Position = 'HR спеціаліст' WHERE Employee_ID = 4;

UPDATE Sick_Leaves SET End_Date = '2024-04-10' WHERE Sick_Leave_ID = 3;

UPDATE Business_Trips SET End_Date = '2024-05-20' WHERE Trip_ID = 3;

INSERT INTO Employees (Employee_ID, Last_Name, First_Name, Middle_Name, Birth_Year, Employment_Date, Position, Salary, Department_ID, Identification_Code) 
VALUES 
(5, 'Семенов', 'Олексій', 'Павлович', 1982, '2024-04-01', 'Програміст', 3200.00, 1, '24680'),
(6, 'Ковальов', 'Іван', 'Олегович', 1995, '2024-03-15', 'Маркетолог', 2700.00, 2, '35791');

UPDATE Sick_Leaves 
SET End_Date = '2024-04-15'
WHERE Employee_ID IN (1, 2);

UPDATE Business_Trips 
SET End_Date = '2024-05-25'
WHERE Employee_ID = 2;

DECLARE @DepartmentID INT = 3;
DECLARE @BirthYearThreshold INT = 1990;

SELECT *
FROM Employees
WHERE Department_ID = @DepartmentID AND Birth_Year < @BirthYearThreshold;

DECLARE @SalaryThreshold DECIMAL(10, 2) = 2500.00;
DECLARE @PositionToSearch VARCHAR(100) = 'Програміст';

SELECT *
FROM Employees
WHERE Salary > @SalaryThreshold AND Position = @PositionToSearch;

DECLARE @StartDateFrom DATE = '2024-03-01';
DECLARE @StartDateTo DATE = '2024-03-31';

SELECT *
FROM Sick_Leaves
WHERE Start_Date BETWEEN @StartDateFrom AND @StartDateTo;

DECLARE @EmployeeCountThreshold INT = 2;

SELECT Departments.Department_Name, COUNT(*) AS Employee_Count
FROM Departments
JOIN Employees ON Departments.Department_ID = Employees.Department_ID
GROUP BY Departments.Department_Name
HAVING COUNT(*) < @EmployeeCountThreshold;


select * from Departments
select * from Employees
select * from Sick_Leaves
select * from Business_Trips



