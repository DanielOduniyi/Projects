CREATE DATABASE CA_KPMG_DW
GO

USE CA_KPMG_DW
GO

/* Transaction_Dimension Table*/
CREATE TABLE Transaction_Dim (
	Transaction_key INT NOT NULL IDENTITY,
    Transaction_id INT ,
    Online_order VARCHAR(10),    
	Order_status VARCHAR(20),
	Product_id INT,
	Brand VARCHAR(25),
	Product_line VARCHAR(25),
	Product_class VARCHAR(10),
	Product_size VARCHAR(50),
	List_price MONEY,
	Standard_cost MONEY,
	PRIMARY KEY (Transaction_key))
GO

/* Calendar_Dimension Table*/
CREATE TABLE Calendar_Dim (	
	Calendar_key INT NOT NULL IDENTITY,
	FullDate DATE,
	DayofWeek_ CHAR(15),
	DayType CHAR(20),
	DayofMonth_ INT,
	Month_	CHAR(10),
	Quarter_ CHAR(2),
	Year_ INT,
	PRIMARY KEY (Calendar_key))
GO

/* Location_Dimension Table*/
CREATE TABLE Location_Dim (	
	Location_key INT NOT NULL IDENTITY,
	Customer_address VARCHAR(50),
	Postcode INT,
	State_name VARCHAR(20),
	Property_valuation TINYINT NULL,
	PRIMARY KEY (Location_key))
GO

/* Customer_Dimension Table */
CREATE TABLE Customer_Dim (
	Customer_key INT NOT NULL IDENTITY,
	Customer_id INT,
	Full_name VARCHAR(55),
	Gender VARCHAR(10),
	past_3_years_bike_related_purchases INT,
	DOB DATE NULL,
	Job_industry_category VARCHAR(50) NULL,
	Wealth_segment VARCHAR(25) NULL,
	Owns_car VARCHAR(5),
	Tenure TINYINT,
    PRIMARY KEY (Customer_key))
GO

CREATE TABLE Sales_Fact (
	Transaction_key INT,
	Calendar_key INT,
	Location_key INT,
	Customer_key INT,
	FullDate DATE,
	List_price MONEY,
	Standard_cost MONEY,
	Property_valuation TINYINT NULL,
	Profit MONEY,
	PRIMARY KEY(Transaction_key, Calendar_key),
	FOREIGN KEY (Transaction_key) REFERENCES Transaction_Dim (Transaction_key),
	FOREIGN KEY (Calendar_key) REFERENCES Calendar_Dim (Calendar_key),
	FOREIGN KEY (Customer_key) REFERENCES Customer_Dim (Customer_key),
	FOREIGN KEY (Location_key) REFERENCES Location_Dim (Location_key))
GO

CREATE TABLE Demographics_Fact (
	Customer_key INT,
	Location_key INT,
	Customer_address VARCHAR(50),
	Postcode INT,
	State_name VARCHAR(20),
	Age INT,
	PRIMARY KEY(Customer_key, Location_key),
	FOREIGN KEY (Customer_key) REFERENCES Customer_Dim (Customer_key),
	FOREIGN KEY (Location_key) REFERENCES Location_Dim (Location_key))
GO