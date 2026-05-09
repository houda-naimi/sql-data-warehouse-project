/*
Stored Procedure: Load Bronze Layer (Source -> Bronze)
Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    The procedure performs the following operations:
    - Truncates the existing bronze tables before loading new data.
    - Uses the BULK INSERT command to import data from CSV files into the bronze tables.
    - Tracks and displays the loading duration for each table.
    - Handles errors using TRY...CATCH blocks for better monitoring and debugging.
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME,@end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME ;
	BEGIN TRY
		PRINT('>> Loading Bronze layer');
		PRINT('>> Loading CRM  Tables');

		SET @batch_start_time = GETDATE();
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_cust_info;
		BULK INSERT bronze.crm_cust_info
				FROM 'C:\sql_project\datasets\source_crm\cust_info.csv'
				WITH (
					FIRSTROW = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
				);
		SET @end_time = GETDATE();
		PRINT '>> Load duration : ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_prd_info;
		BULK INSERT bronze.crm_prd_info
				FROM 'C:\sql_project\datasets\source_crm\prd_info.csv'
				WITH (
					FIRSTROW = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
				);
		SET @end_time = GETDATE();
		PRINT '>> Load duration : ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_sales_details;
		BULK INSERT bronze.crm_sales_details
				FROM 'C:\sql_project\datasets\source_crm\sales_details.csv'
				WITH (
					FIRSTROW = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
				);
		SET @end_time = GETDATE();
		PRINT '>> Load duration : ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

		PRINT('>> Loading ERP  Tables');

		TRUNCATE TABLE bronze.erp_loc_a101;
		BULK INSERT bronze.erp_loc_a101
				FROM 'C:\sql_project\datasets\source_erp\loc_a101.csv'
				WITH (
					FIRSTROW = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
				);
		TRUNCATE TABLE bronze.erp_cust_az12;
		BULK INSERT bronze.erp_cust_az12
				FROM 'C:\sql_project\datasets\source_erp\cust_az12.csv'
				WITH (
					FIRSTROW = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
				);
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		BULK INSERT bronze.erp_px_cat_g1v2
				FROM 'C:\sql_project\datasets\source_erp\px_cat_g1v2.csv'
				WITH (
					FIRSTROW = 2,
					FIELDTERMINATOR = ',',
					TABLOCK
				);
	SET @batch_end_time = GETDATE();
	PRINT '>> Bronze layer is Completed';
	Print '>> Total Load duration : ' + CAST (DATEDIFF (second,@batch_start_time, @batch_end_time) as NVARCHAR) + 'seconds';
	END TRY
	BEGIN CATCH
			PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
			PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
	END CATCH
END
