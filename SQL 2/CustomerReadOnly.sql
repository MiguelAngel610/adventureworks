-- Crear el rol db_CustomerReadOnly
USE AdventureWorks2019
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'db_CustomerReadOnly' AND type = 'R')
BEGIN
    CREATE ROLE db_CustomerReadOnly AUTHORIZATION dbo;
    PRINT 'Rol db_CustomerReadOnly creado exitosamente.';
END
ELSE
BEGIN
    PRINT 'El rol db_CustomerReadOnly ya existe.';
END
GO

-- Permisos de solo lectura
GRANT SELECT ON Sales.Customer TO db_CustomerReadOnly;
GRANT SELECT ON Person.Person TO db_CustomerReadOnly;
GRANT SELECT ON Sales.Store TO db_CustomerReadOnly;
GRANT SELECT ON Sales.SalesTerritory TO db_CustomerReadOnly;

PRINT 'Permisos SELECT asignados a db_CustomerReadOnly.';
GO