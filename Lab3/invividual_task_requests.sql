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
(1, '³��� ��������'),
(2, '³��� ����������'),
(3, '����������');

INSERT INTO Employees (Employee_ID, Last_Name, First_Name, Middle_Name, Birth_Year, Employment_Date, Position, Salary, Department_ID, Identification_Code) VALUES
(1, '������', '�����', '�������������', 1985, '2020-01-15', '���������', 3000.00, 1, '12345'),
(2, '������', '����', '��������', 1990, '2018-03-20', '�������� � �������', 2500.00, 2, '67890'),
(3, '��������', '�����', '�������', 1988, '2019-07-10', '�������� ���������', 3500.00, 3, '54321');

INSERT INTO Sick_Leaves (Sick_Leave_ID, Employee_ID, Start_Date, End_Date) VALUES
(1, 1, '2024-03-10', '2024-03-20'),
(2, 3, '2024-03-05', '2024-03-10');

INSERT INTO Business_Trips (Trip_ID, Employee_ID, Start_Date, End_Date) VALUES
(1, 2, '2024-02-15', '2024-02-20'),
(2, 3, '2024-03-01', '2024-03-03');

SELECT *
FROM Employees
WHERE Department_ID = 1 AND Birth_Year < 1990;

SELECT *
FROM Employees
WHERE Salary > 2500 AND Position = '���������';

SELECT *
FROM Sick_Leaves
WHERE Start_Date BETWEEN '2024-03-01' AND '2024-03-31';

SELECT *
FROM Employees
WHERE Employee_ID IN (SELECT Employee_ID FROM Sick_Leaves WHERE Start_Date BETWEEN '2024-03-01' AND '2024-03-10');

SELECT *
FROM Employees
WHERE Employee_ID IN (SELECT Employee_ID FROM Business_Trips WHERE Start_Date BETWEEN '2024-02-01' AND '2024-02-29');

SELECT Departments.Department_Name, COUNT(*) AS Employee_Count
FROM Departments
JOIN Employees ON Departments.Department_ID = Employees.Department_ID
GROUP BY Departments.Department_Name
HAVING COUNT(*) < 2;

SELECT *
FROM Employees
WHERE Position = '�������� � �������' AND Salary < 3000;

SELECT *
FROM Employees
WHERE Position = '�������� � �������' OR Position = '�������� ���������';

SELECT *
FROM Employees
WHERE Salary < 3000 AND Employee_ID NOT IN (SELECT Employee_ID FROM Sick_Leaves);

SELECT DISTINCT Departments.Department_Name
FROM Departments
JOIN Employees ON Departments.Department_ID = Employees.Department_ID
WHERE Birth_Year > 1980;
