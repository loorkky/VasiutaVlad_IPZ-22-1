USE [torg_firm]
GO
/****** Object:  Table [dbo].[klient]    Script Date: 20.09.2017 9:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[klient](
	[id_klient] [int] NOT NULL,
	[Nazva] [varchar](50) NULL,
	[Adress] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Tel] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_klient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[postachalnik]    Script Date: 20.09.2017 9:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postachalnik](
	[id_postach] [int] NOT NULL,
	[Nazva] [varchar](50) NULL,
	[Adress] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Tel] [varchar](50) NULL,
	[Kontakt_osoba] [varchar](50) NULL,
	[Posada] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_postach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sotrudnik]    Script Date: 20.09.2017 9:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sotrudnik](
	[id_sotrud] [int] NOT NULL,
	[Fname] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Lname] [varchar](50) NULL,
	[Posada] [varchar](50) NULL,
	[Adress] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Home_tel] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_sotrud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tovar]    Script Date: 20.09.2017 9:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tovar](
	[id_tovar] [int] IDENTITY(1,1) NOT NULL,
	[Nazva] [varchar](50) NULL,
	[Price] [decimal](6, 2) NULL,
	[NaSklade] [int] NULL,
	[id_postav] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tovar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zakaz]    Script Date: 20.09.2017 9:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zakaz](
	[id_zakaz] [int] IDENTITY(1,1) NOT NULL,
	[id_klient] [int] NOT NULL,
	[id_sotrud] [int] NOT NULL,
	[date_rozm] [datetime] NULL,
	[date_naznach]  AS (dateadd(day,(10),CONVERT([date],[date_rozm]))),
PRIMARY KEY CLUSTERED 
(
	[id_zakaz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zakaz_tovar]    Script Date: 20.09.2017 9:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zakaz_tovar](
	[id_zakaz] [int] NOT NULL,
	[id_tovar] [int] NOT NULL,
	[Kilkist] [int] NOT NULL,
	[Znigka] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_zakaz] ASC,
	[id_tovar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

-- Додамо дані до таблиці "Postachalnik"
INSERT INTO postachalnik (id_postach, Nazva, Adress, City, Tel, Kontakt_osoba, Posada) 
VALUES 
(1, N'ПП Фриз Н.Н.', N'вул. Бердичівська 46', N'Житомир', N'0509998877', N'Фриз Н.Н.', ''),
(2, N'ТОВ "Арей"', N'вул. Київська 7', N'Житомир', N'0678889994', N'Петров С.К', 'менеджер'),
(3, N'Краз Н.Н', N'вул. Вітрука 9', N'Київ', N'0974445544', N'Краз Н.Н.', ''),
(4, N'ТОВ "Агрофірма"', N'вул. Садова 12', N'Київ', N'0632223344', N'Іванов П.О.', 'менеджер'),
(5, N'ПП Чорний лебідь', N'вул. Шевченка 5', N'Львів', N'0971112233', N'Сидоренко В.М.', 'керівник'),
(6, N'ФОП Шевченко О.П.', N'вул. Гагаріна 9', N'Одеса', N'0503334455', N'Шевченко О.П.', 'власник');

-- Додамо дані до таблиці "Klient"
INSERT INTO klient (id_klient, Nazva, Adress, City, Tel) 
VALUES 
(1, N'ПП Стоян С.В.', N'вул. Бердичівська 10', N'Житомир', N'0504345566'),
(2, N'ТОВ "Арей"', N'вул. Київська 7', N'Житомир', N'0678889994'),
(3, N'ПП Апин В.С.', N'вул. Короленка 9', N'Київ', N'0501112233'),
(4, N'ТОВ "Блакитний екран"', N'вул. Кірова 30', N'Дніпро', N'0667778889'),
(5, N'ПП "Золотий ключик"', N'вул. Соборна 15', N'Харків', N'0635556677'),
(6, N'ТОВ "Мрія"', N'вул. Лесі Українки 3', N'Київ', N'0509876543');

-- Додамо дані до таблиці "Sotrudnik"
INSERT INTO sotrudnik (id_sotrud, Fname, Name, Lname, Posada, Adress, City, Home_tel) 
VALUES 
(1, N'Крув', N'Наталія', N'Сергіївна', N'Продавець', N'вул. Бердичівська 67 кв.20', N'Житомир', N'0509998877'),
(2, N'Петренко', N'Олексій', N'Геннадійович', N'Продавець', N'вул. Вітрука 20 кв.50', N'Житомир', N'0506667788'),
(3, N'Хмельник', N'Олена', N'Петрівна', N'Продавець-консультант', N'вул. Київська 67 кв.20', N'Житомир', N'0509998877'),
(4, N'Сидоров', N'Андрій', N'Іванович', N'Продавець', N'вул. Пушкіна 7', N'Львів', N'0973334445'),
(5, N'Павлова', N'Марія', N'Петрівна', N'Продавець-консультант', N'вул. Шевченка 22', N'Харків', N'0661234567'),
(6, N'Григоров', N'Олег', N'Анатолійович', N'Менеджер з продажу', N'вул. Тарасівська 5', N'Одеса', N'0955556667');

-- Додамо дані до таблиці "Tovar"
INSERT INTO tovar (Nazva, Price, NaSklade, id_postav) 
VALUES 
(N'Молоко', CAST(18.00 AS Decimal(6, 2)), 50, 1),
(N'Сир', CAST(25.00 AS Decimal(6, 2)), 30, 2),
(N'Мед', CAST(30.00 AS Decimal(6, 2)), 20, 3),
(N'Йогурт', CAST(14.50 AS Decimal(6, 2)), 40, 4),
(N'Сир', CAST(25.00 AS Decimal(6, 2)), 20, 5),
(N'Мед', CAST(30.00 AS Decimal(6, 2)), 15, 6),
(N'Ковбаса', CAST(45.00 AS Decimal(6, 2)), 30, 4),
(N'Печиво', CAST(12.00 AS Decimal(6, 2)), 50, 5),
(N'Масло', CAST(28.00 AS Decimal(6, 2)), 25, 6),
(N'Колбаса', CAST(50.00 AS Decimal(6, 2)), 20, 4),
(N'Сирок', CAST(18.00 AS Decimal(6, 2)), 35, 5),
(N'Макарони', CAST(10.00 AS Decimal(6, 2)), 40, 6),
(N'Кетчуп', CAST(8.00 AS Decimal(6, 2)), 60, 4);

-- Додамо дані до таблиці "Zakaz"
INSERT INTO zakaz (id_klient, id_sotrud, date_rozm) 
VALUES 
(1, 1, '2024-03-10T08:30:00'),
(2, 2, '2024-03-15T10:00:00'),
(3, 3, '2024-03-20T11:30:00'),
(4, 4, '2024-03-25T13:00:00'),
(5, 5, '2024-03-30T14:30:00'),
(6, 6, '2024-04-05T16:00:00'),
(1, 1, '2024-04-10T08:30:00'),
(2, 2, '2024-04-15T10:00:00'),
(3, 3, '2024-04-20T11:30:00'),
(4, 4, '2024-04-25T13:00:00');

-- Додамо дані до таблиці "Zakaz_tovar"
INSERT INTO zakaz_tovar (id_zakaz, id_tovar, Kilkist, Znigka) 
VALUES 
(1, 1, 10, 0),
(1, 2, 15, 0),
(2, 2, 20, 0),
(2, 3, 25, 0),
(2, 4, 30, 0),
(3, 3, 8, 0),
(3, 4, 12, 0),
(4, 1, 5, 0),
(4, 3, 10, 0),
(5, 2, 15, 0),
(5, 4, 20, 0),
(6, 1, 10, 0),
(6, 3, 15, 0),
(7, 3, 20, 0),
(7, 4, 25, 0),
(8, 1, 8, 0),
(8, 2, 12, 0),
(9, 2, 5, 0),
(9, 4, 10, 0),
(10, 1, 15, 0),
(10, 3, 20, 0);


SELECT Zakaz.*
FROM Zakaz
JOIN Zakaz_tovar ON Zakaz.id_zakaz = Zakaz_tovar.id_zakaz
JOIN Tovar ON Zakaz_tovar.id_tovar = Tovar.id_tovar
WHERE Tovar.Nazva = N'Молоко' AND Zakaz.date_rozm <= '2024-04-01';

SELECT *
FROM Tovar
WHERE Price BETWEEN 20.00 AND 50.00
AND NaSklade >= 15;

SELECT *
FROM Zakaz
WHERE date_naznach IS NULL;

SELECT Tovar.*
FROM Tovar
JOIN Postachalnik ON Tovar.id_postav = Postachalnik.id_postach
WHERE Postachalnik.Nazva = N'ТОВ "Арей"' AND Tovar.NaSklade >= 25;

SELECT SUM(Tovar.Price * Zakaz_tovar.Kilkist) AS TotalCost
FROM Zakaz
JOIN Zakaz_tovar ON Zakaz.id_zakaz = Zakaz_tovar.id_zakaz
JOIN Tovar ON Zakaz_tovar.id_tovar = Tovar.id_tovar
JOIN Postachalnik ON Tovar.id_postav = Postachalnik.id_postach
WHERE Postachalnik.Nazva LIKE N'%ТОВ%' AND Zakaz.date_rozm >= DATEADD(day, -30, GETDATE());

SELECT Zakaz.id_sotrud, Zakaz.date_rozm
FROM Zakaz
WHERE Zakaz.id_klient = 3;

SELECT *
FROM Postachalnik
WHERE Nazva LIKE N'%ЗАТ%'
AND id_postach NOT IN (SELECT DISTINCT id_postav FROM Tovar);

SELECT *
FROM Klient
WHERE Nazva LIKE N'%ПП%'
AND id_klient IN (SELECT DISTINCT id_klient FROM Zakaz WHERE date_rozm >= DATEADD(month, -1, GETDATE()));

SELECT *
FROM Sotrudnik
WHERE Name = N'Андрій'
ORDER BY Name;

SELECT *
FROM Klient
WHERE Email IS NOT NULL
ORDER BY id_klient;