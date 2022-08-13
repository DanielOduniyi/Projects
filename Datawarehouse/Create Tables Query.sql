CREATE DATABASE CA_KPMG
GO

USE CA_KPMG
GO

/* Prior to loading the data from excel in the transction table records where 'Customer_id' = 5034 were deleted
Also, in the Customer_Address table records where 'Customer_id' > 4000 were also removed */

/* Creating the New_Customer_List Table */
CREATE TABLE New_Customer_List (
	First_name VARCHAR(20),
	Last_name VARCHAR(30),
	Gender VARCHAR(10),
	past_3_years_bike_related_purchases INT,
	DOB DATE NULL,
	Job_industry_category VARCHAR(50) NULL,
	Wealth_segment VARCHAR(25) NULL,
	Owns_car VARCHAR(5),
	Tenure TINYINT,
	Customer_address VARCHAR(50),
	Postcode INT,
	State_name VARCHAR(20),
	Property_valuation TINYINT NULL)
GO

/* Creating the Customer_demographic Table */
CREATE TABLE Customer_demographic (
	Customer_id INT NOT NULL,
	First_name VARCHAR(20),
	Last_name VARCHAR(30),
	Gender VARCHAR(10),
	past_3_years_bike_related_purchases INT,
	DOB DATE NULL,
	Job_industry_category VARCHAR(50) NULL,
	Wealth_segment VARCHAR(25) NULL,
	Owns_car VARCHAR(5),
	Tenure TINYINT,
    CONSTRAINT Cust_Demo_PK PRIMARY KEY (Customer_id))
GO

/* Creating the Customer_Address Table */
CREATE TABLE Customer_Address (
	Customer_id INT NOT NULL,
	Customer_address VARCHAR(50),
	Postcode INT,
	State_name VARCHAR(20),
	Property_valuation TINYINT NULL,
    CONSTRAINT Cust_Adr_FK FOREIGN KEY (Customer_id) REFERENCES Customer_demographic(Customer_id) ON DELETE CASCADE,
	CONSTRAINT Cust_Adr_PK PRIMARY KEY (Customer_id))
GO

/* Creating the Transactions Table */
CREATE TABLE Transactions (
    Transaction_id INT NOT NULL,
    Product_id INT NOT NULL,
	Customer_id INT NOT NULL,
    Transaction_date DATE,
    Online_order VARCHAR(10),    
	Order_status VARCHAR(20),
	Brand VARCHAR(25),
	Product_line VARCHAR(25),
	Product_class VARCHAR(10),
	Product_size VARCHAR(50),
	List_price MONEY,
	Standard_cost MONEY,
    CONSTRAINT Tran_PK PRIMARY KEY (Transaction_id),
    CONSTRAINT Tran_FK FOREIGN KEY (customer_id) REFERENCES Customer_demographic(Customer_id) ON DELETE CASCADE)
GO