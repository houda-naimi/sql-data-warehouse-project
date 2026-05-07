/*
=============================================================
Create Database and Schemas
=============================================================
Purpose:
    This script creates a database called 'DataWarehouse' and creates three schemas: bronze, silver, and gold.
*/
USE master;
GO

-- Check if the database already exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    THROW 50000, 'The database "DataWarehouse" already exists.', 1;
END;
GO

-- Create the database
CREATE DATABASE DataWarehouse;
GO
USE DataWarehouse;
GO
  
-- Create schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
