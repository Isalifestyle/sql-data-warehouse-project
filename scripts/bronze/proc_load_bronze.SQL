/*
================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
================================================================================

Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external csv files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv files to bronze tables.

Parameters:
    None.

    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;

================================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME
    DECLARE @start_bronze DATETIME, @end_bronze DATETIME
    BEGIN TRY
        SET @start_bronze = GETDATE()
        PRINT '========================================';
        PRINT 'Loading Bronze Layer';
        PRINT '========================================';

        PRINT '----------------------------------------';
        PRINT 'Loading CRM Tables';
        PRINT '----------------------------------------';

        PRINT '>> Tuncating Table: bronze.crm_cust_info'

        SET @start_time = GETDATE()
        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT '>> Inserting Data Info: bronze.crm_cust_info'
        BULK INSERT bronze.crm_cust_info
        FROM '/var/opt/mssql/datasets/source_crm/cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );
        SET @end_time = GETDATE()
        PRINT '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> ----------------';

        PRINT '>> Tuncating Table: bronze.crm_prd_info'
        -- Bulk loading prd_info table 
        SET @start_time = GETDATE()
        TRUNCATE TABLE bronze.crm_prd_info;
        PRINT '>> Inserting Data Info: bronze.crm_prd_info'
        BULK INSERT bronze.crm_prd_info
        FROM '/var/opt/mssql/datasets/source_crm/prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );
        SET @end_time = GETDATE()
        PRINT '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> ----------------';

        PRINT '>> Tuncating Table: bronze.crm_sales_details'
        -- Bulk loading sales_details table 
        SET @start_time = GETDATE()
        TRUNCATE TABLE bronze.crm_sales_details;
        PRINT '>> Inserting Data Info: bronze.crm_sales_details'
        BULK INSERT bronze.crm_sales_details
        FROM '/var/opt/mssql/datasets/source_crm/sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );
        SET @end_time = GETDATE()
        PRINT '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> ----------------';

        PRINT '----------------------------------------';
        PRINT 'Loading ERP Tables';
        PRINT '----------------------------------------';
        -- Bulk loading loc_a101 table 

        PRINT '>> Tuncating Table: bronze.erp_loc_a101'
        SET @start_time = GETDATE()
        TRUNCATE TABLE bronze.erp_loc_a101;
        PRINT '>> Inserting Data Info: bronze.erp_loc_a101'
        BULK INSERT bronze.erp_loc_a101
        FROM '/var/opt/mssql/datasets/source_erp/loc_a101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );
        SET @end_time = GETDATE()
        PRINT '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> ----------------';

        PRINT '>> Tuncating Table: erp_px_cat_g1v2'
        -- Bulk loading px_cat_g1v2 table 
        SET @start_time = GETDATE()
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        PRINT '>> Inserting Data Info: bronze.erp_px_cat_g1v2'
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM '/var/opt/mssql/datasets/source_erp/px_cat_g1v2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );
        SET @end_time = GETDATE()
        PRINT '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> ----------------';


        PRINT '>> Tuncating Table: erp_cust_az12'
        -- Bulk loading sales_details table 
        SET @start_time = GETDATE()
        TRUNCATE TABLE bronze.erp_cust_az12;
        PRINT '>> Inserting Data Info: bronze.erp_cust_az12'
        BULK INSERT bronze.erp_cust_az12
        FROM '/var/opt/mssql/datasets/source_erp/cust_az12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            TABLOCK
        );
        SET @end_bronze = GETDATE()
        SET @end_time = GETDATE()
        PRINT '>> Load Duration: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '>> ----------------';
        PRINT 'Total Bronze Layer Duration: ' +  CAST (DATEDIFF(second, @start_bronze, @end_bronze) AS NVARCHAR) + ' seconds'
    END TRY
    BEGIN CATCH
        PRINT '===========================================';
        PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
        PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
        PRINT 'ERROR MESSAGE' + CAST (ERROR_NUMBER() AS NVARCHAR);
        PRINT '===========================================';
    END CATCH
END;
GO
