-- 1. Crear el rol db_CustomerService

USE AdventureWorks2019
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'db_CustomerService' AND type = 'R')
BEGIN
    CREATE ROLE db_CustomerService AUTHORIZATION dbo;
    PRINT 'Rol db_CustomerService creado exitosamente.';
END
ELSE
BEGIN
    PRINT 'El rol db_CustomerService ya existe.';
END
GO

-- 2. Asignar permisos necesarios
GRANT SELECT, UPDATE ON Sales.Customer TO db_CustomerService;
GRANT SELECT ON Person.Person TO db_CustomerService;
GRANT SELECT ON Sales.Store TO db_CustomerService;
GRANT SELECT ON Sales.SalesTerritory TO db_CustomerService;

PRINT 'Permisos asignados a db_CustomerService.';
GO