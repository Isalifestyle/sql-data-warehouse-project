/*
===============================================================================
Create Database and Schemas
===============================================================================

Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if
    it already exists.

    If the database exists, it is dropped and recreated. Additionally, the
    script sets up three schemas within the database:
    - bronze
    - silver
    - gold

WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it
    exists.

    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this script.
*/

USE master;
GO

IF EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'DataWarehouse'
)
BEGIN
    -- Disconnect all users from the database
    ALTER DATABASE DataWarehouse
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    -- Delete the database completely
    DROP DATABASE DataWarehouse;
END;
GO


CREATE DATABASE SalesDB;
GO

-- Creating DataWarehouse
CREATE DATABASE DataWareHouse;
GO

USE DataWareHouse;
GO

-- Creeating the 3 types of schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
