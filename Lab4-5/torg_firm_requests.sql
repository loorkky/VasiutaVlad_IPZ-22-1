SELECT SUM(NaSklade) AS TotalProducts
FROM tovar;

SELECT COUNT(*) AS TotalEmployees
FROM sotrudnik;

SELECT COUNT(*) AS TotalSuppliers
FROM postachalnik;

SELECT t.Nazva, SUM(zt.Kilkist) AS PurchasedQuantity
FROM zakaz z
INNER JOIN zakaz_tovar zt ON z.id_zakaz = zt.id_zakaz
INNER JOIN tovar t ON zt.id_tovar = t.id_tovar
WHERE CONVERT(DATE, z.date_rozm) BETWEEN '2017-06-01' AND '2017-06-30'
GROUP BY t.Nazva;

SELECT SUM(t.Price * zt.Kilkist) AS TotalSpent
FROM zakaz z
INNER JOIN zakaz_tovar zt ON z.id_zakaz = zt.id_zakaz
INNER JOIN tovar t ON zt.id_tovar = t.id_tovar
WHERE CONVERT(DATE, z.date_rozm) BETWEEN '2017-06-01' AND '2017-06-30';

SELECT p.Nazva, SUM(t.Price * zt.Kilkist) AS TotalSales
FROM zakaz_tovar zt
INNER JOIN tovar t ON zt.id_tovar = t.id_tovar
INNER JOIN postachalnik p ON t.id_postav = p.id_postach
GROUP BY p.Nazva;

SELECT p.Nazva, COUNT(z.id_zakaz) AS TotalOrders
FROM zakaz z
INNER JOIN zakaz_tovar zt ON z.id_zakaz = zt.id_zakaz
INNER JOIN tovar t ON zt.id_tovar = t.id_tovar
INNER JOIN postachalnik p ON t.id_postav = p.id_postach
WHERE t.Nazva = 'Молоко'
GROUP BY p.Nazva;

SELECT AVG(TotalSpent) AS AverageOrderAmount
FROM (
    SELECT SUM(t.Price * zt.Kilkist) AS TotalSpent
    FROM zakaz_tovar zt
    INNER JOIN tovar t ON zt.id_tovar = t.id_tovar
    GROUP BY zt.id_zakaz
) AS OrderTotals;

SELECT SUM(t.Price * zt.Kilkist) AS TotalOrderValue
FROM zakaz z
INNER JOIN zakaz_tovar zt ON z.id_zakaz = zt.id_zakaz
INNER JOIN tovar t ON zt.id_tovar = t.id_tovar
INNER JOIN klient k ON z.id_klient = k.id_klient
WHERE k.City = 'Житомир';

SELECT p.Nazva, AVG(t.Price) AS AveragePrice
FROM tovar t
INNER JOIN postachalnik p ON t.id_postav = p.id_postach
GROUP BY p.Nazva;