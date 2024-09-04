SELECT * FROM Departments;

SELECT d.Department_ID, d.Department_Name, COUNT(bt.Trip_ID) AS Trip_Count
FROM Departments d
LEFT JOIN Employees e ON d.Department_ID = e.Department_ID
LEFT JOIN Business_Trips bt ON e.Employee_ID = bt.Employee_ID
GROUP BY d.Department_ID, d.Department_Name;

SELECT COUNT(sl.Sick_Leave_ID) AS Sick_Leave_Count
FROM Sick_Leaves sl
INNER JOIN Employees e ON sl.Employee_ID = e.Employee_ID
WHERE MONTH(sl.Start_Date) = MONTH(GETDATE()) AND YEAR(sl.Start_Date) = YEAR(GETDATE());


SELECT e.Employee_ID, e.Last_Name, e.First_Name, e.Middle_Name
FROM Employees e
INNER JOIN Sick_Leaves sl ON e.Employee_ID = sl.Employee_ID
ORDER BY e.Last_Name, e.First_Name, e.Middle_Name;