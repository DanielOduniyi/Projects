USE CA_KPMG
GO

/* CUSTOMER_ADDRESS */

UPDATE Customer_Address
SET State_name = 'NSW'
WHERE State_name = 'New South Wales'
GO

UPDATE Customer_Address
SET State_name = 'VIC'
WHERE State_name = 'Victoria'
GO

/* NEW_CUSTOMER_LIST */

UPDATE New_Customer_List
SET Job_industry_category = 'Not Applicable'
WHERE Job_industry_category = 'n/a'
GO

DELETE FROM New_Customer_List WHERE Gender = 'U';

/* CUSTOMER_DEMOGRAPHIC */

UPDATE Customer_demographic
SET Gender = 'Male'
WHERE Gender = 'M'
GO

UPDATE Customer_demographic
SET Gender = 'Female'
WHERE Gender = 'F' OR Gender = 'Femal'
GO

UPDATE Customer_demographic
SET Job_industry_category = 'Not Applicable'
WHERE Job_industry_category = 'n/a'
GO

UPDATE Customer_demographic
SET Last_name = ''
WHERE Last_name IS NULL
GO

DELETE FROM Customer_demographic WHERE Gender = 'U';

/* TRANSACTIONS */

DELETE FROM Transactions WHERE Standard_cost IS NULL;

UPDATE Transactions
SET Online_order = 'FALSE'
WHERE Online_order IS NULL
GO

SELECT * FROM Transactions WHERE Product_class IS NULL;
/* Testing to see if all changes have been made */