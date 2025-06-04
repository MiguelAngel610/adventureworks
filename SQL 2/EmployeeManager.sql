USE AdventureWorks2019;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'db_EmployeeManager' AND type = 'R')
BEGIN
    CREATE ROLE db_EmployeeManager AUTHORIZATION dbo;
    PRINT 'Rol db_EmployeeManager creado exitosamente.';
END
ELSE
BEGIN
    PRINT 'El rol db_EmployeeManager ya existe.';
END
GO

GRANT SELECT, UPDATE ON HumanResources.Employee TO db_EmployeeManager;
GRANT SELECT ON Person.Person TO db_EmployeeManager;

PRINT 'Permisos SELECT, UPDATE asignados a db_EmployeeManager.';
GO