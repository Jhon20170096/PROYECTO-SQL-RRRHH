------------------ 
-- CARGA DE DATOS 
------------------

CREATE DATABASE BD_HR; --Modificar CON UN NOMBRE QUE HAGA SENBTIDO CON TU DATA 
USE BD_HR;
/*
QUIERO QUECREES UNA TABLA EN SQL SERVER PARA PODER CAR MI CSV DE MI PROYECTO EL CUAL TIENE LAS SIGUIENTES 
COLUMNAS Y TE DOY LAS 4 PRIMERAS FILAS PARA QUE INFIERAS EL MEJOR TIPO DE DATO PERO A LA VES TENGA FEXIBILIDAD :

*/
---------------------------------
-- CARGA EMPLEADOS
---------------------------------
IF OBJECT_ID('Employee', 'U') IS NOT NULL
    DROP TABLE Employee;

CREATE TABLE Employee (
    -- Alfanum�rico por el formato '3012-1A41'
    EmployeeID              NVARCHAR(50) PRIMARY KEY, 
    FirstName               NVARCHAR(100),
    LastName                NVARCHAR(100),
    Gender                  NVARCHAR(50),
    Age                     INT,
    BusinessTravel          NVARCHAR(100),
    Department              NVARCHAR(100),
    [DistanceFromHome (KM)] INT, -- Entre corchetes por el espacio y par�ntesis
    State                   NVARCHAR(10), 
    Ethnicity               NVARCHAR(100),
    Education               INT, -- Es un nivel (1-5)
    EducationField          NVARCHAR(100),
    JobRole                 NVARCHAR(100),
    MaritalStatus           NVARCHAR(50),
    Salary                  DECIMAL(18, 2), -- Para manejar montos grandes con decimales
    StockOptionLevel        INT,
    OverTime                NVARCHAR(10),
    HireDate                DATE, -- El formato YYYY-MM-DD es nativo de SQL
    Attrition               VARCHAR(250), --TEXTO
    YearsAtCompany          INT,
    YearsInMostRecentRole   INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager    INT
);

BULK INSERT Employee
FROM 'C:\HOME LOCAL\PROYECTOS\SQL\DEMO2\PROYECTO-SQL-RRRHH\Data\Employee.csv' -- Reemplaza con la ruta real
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,           -- Ignora el encabezado del CSV
    FIELDTERMINATOR = ',',  -- Cambia por ';' si tu CSV usa punto y coma
    ROWTERMINATOR = '\n' -- Salto de l�nea est�ndar (LF) o '\n'
   -- ENCODING = 'UTF-8'      -- Importante si tienes acentos o tildes
 
);



IF OBJECT_ID('PerformanceRating', 'U') IS NOT NULL
    DROP TABLE PerformanceRating;
    

-- Crear la tabla con tipos de datos adecuados
CREATE TABLE PerformanceRating (
    PerformanceID                 NVARCHAR(20) PRIMARY KEY, -- Ej: 'PR01'
    EmployeeID                    NVARCHAR(50),             -- Debe coincidir con el formato de tu otra tabla
    ReviewDate                    DATE,                     -- SQL Server maneja formato YYYY-MM-DD
    EnvironmentSatisfaction       INT,
    JobSatisfaction               INT,
    RelationshipSatisfaction      INT,
    TrainingOpportunitiesWithinYear INT,
    TrainingOpportunitiesTaken    INT,
    WorkLifeBalance               INT,
    SelfRating                    INT,
    ManagerRating                 INT
);

BULK INSERT PerformanceRating
FROM 'C:\HOME LOCAL\PROYECTOS\SQL\DEMO2\PROYECTO-SQL-RRRHH\Data\PerformanceRating.csv' -- Reemplaza con la ruta real
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,           -- Ignora el encabezado del CSV
    FIELDTERMINATOR = ',',  -- Cambia por ';' si tu CSV usa punto y coma
    ROWTERMINATOR = '\n' -- Salto de l�nea est�ndar (LF) o '\n'
       -- Importante si tienes acentos o tildes
 
);
