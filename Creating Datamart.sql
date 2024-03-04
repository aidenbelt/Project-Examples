-- INFO 3300
-- 10/5/23
-- Create datamart for boat rentals

IF NOT EXISTS(SELECT name FROM master.dbo.sysdatabases
	WHERE name = N'dmBoydLakeMarina')

	CREATE DATABASE dmBoydLakeMarina
GO

USE dmBoydLakeMarina
GO

IF EXISTS(
		SELECT *
		FROM sys.tables
		WHERE NAME = N'factBOAT_RENTAL')
		
		DROP TABLE factBOAT_RENTAL; 

IF EXISTS(
		SELECT *
		FROM sys.tables
		WHERE NAME = N'dimCUSTOMER')
		
		DROP TABLE dimCustomer; 


IF EXISTS(
		SELECT *
		FROM sys.tables
		WHERE NAME = N'dimRENTAL_BOAT')
		
		DROP TABLE dimRENTAL_BOAT; 

IF EXISTS(
		SELECT *
		FROM sys.tables
		WHERE NAME = N'dimEMPLOYEE')
		
		DROP TABLE dimEMPLOYEE; 

IF EXISTS(
		SELECT *
		FROM sys.tables
		WHERE NAME = N'dimDATE')
		
		DROP TABLE dimDATE; 

-- Build datamart structure

CREATE TABLE dimDATE
(
	date_sk					INT PRIMARY KEY, 
	Date					DATE,
	FullDate				NCHAR(10),
	DayOfMonth				INT, 
	DayName					NVARCHAR(9),
	DayOfWeek				INT,
	DayOfWeekInMonth		INT,
	DayOfWeekInYear			INT,
	DayOfQuarter			INT,
	DayOfYear				INT,
	WeekOfMonth				INT,
	WeekOfQuarter			INT,
	WeekOfYear				INT,
	Month					INT,
	MonthName				NVARCHAR(9),
	MonthOfQuarter			INT,
	Quarter					NCHAR(2),
	QuarterName				NVARCHAR(9),
	Year 					INT,
	YearName				CHAR(7), 
	MonthYear				CHAR(10),
	MMYYYY					INT,
	FirstDayOfMonth			DATE,
	LastDayOfMonth			DATE,
	FirstDayOfQuarter		DATE,
	LastDayOfQuarter		DATE,
	FirstDayOfYear			DATE,
	LastDayOfYear			DATE,
	IsHoliday				BIT,
	IsWeekend				BIT,
	Holiday					NVARCHAR(50),
	Season					NVARCHAR(10)
);

CREATE TABLE dimEMPLOYEE
(
	employee_sk				INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	employee_bk				INT NOT NULL,
	employeeFirst			NVARCHAR(50),
	employeeLast			NVARCHAR(50),
	employeeAge				INT,
	employeeGender			NVARCHAR(30),
	employeeAddress			NVARCHAR(249),
	employeeCity			NVARCHAR(50),
	employeeState			NVARCHAR(2),
	employeeZip				NVARCHAR(10),
	employeeCountry			NVARCHAR(30),
	employeePhone			NVARCHAR(11),
	employeeEmail			NVARCHAR(50),
	employeeHireDate		DATE,
	employeePosition		NVARCHAR(50)
);

CREATE TABLE dimRENTAL_BOAT
(
	rentalboat_sk			INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	rentalboat_bk			INT NOT NULL,
	rentalboatType			NVARCHAR(50),
	rentalboatSize			INT,
	rentalboatCapacity		INT,
	rentalboatModel			NVARCHAR(50),
	rentalboatManufacturer	NVARCHAR(50),
	rentalboatName			NVARCHAR(30),
	rentalboatCost			DECIMAL(10,2),
	rentalboatCL			INT
);

CREATE TABLE dimCUSTOMER
(
	customer_sk				INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	customer_bk				INT,
	customerFirst			NVARCHAR(50),
	customerLast			NVARCHAR(50),
	customerAge				INT,
	customerGender			NVARCHAR(30),
	customerAddress			NVARCHAR(249),
	customerCity			NVARCHAR(50),
	customerState			NVARCHAR(2),
	customerZip				NVARCHAR(10),
	customerCountry			NVARCHAR(30),
	customerPhone			NVARCHAR(11),
	customerEmail			NVARCHAR(50),
	customerLicense			INT
);

CREATE TABLE factBOAT_RENTAL
(
	date_sk					INT NOT NULL,
	customer_sk				INT NOT NULL,
	rentalboat_sk			INT NOT NULL,
	employee_sk				INT NOT NULL,
	boatrentID_dd			INT NOT NULL,
	boatrentStart			TIME,
	boatrentEnd				TIME,
	boatrentFee				DECIMAL(10,2),
	CONSTRAINT pk_BOAT_RENTAL PRIMARY KEY(date_sk, customer_sk, rentalboat_sk, employee_sk, boatrentID_dd),
	CONSTRAINT fk_factBR_dimDATE FOREIGN KEY (date_sk) REFERENCES dimDATE (date_sk),
	CONSTRAINT fk_factBR_dimCUSTOMER FOREIGN KEY (customer_sk) REFERENCES dimCUSTOMER (customer_sk),
	CONSTRAINT fk_factBR_dimRENTAL_BOAT FOREIGN KEY (rentalboat_sk) REFERENCES dimRENTAL_BOAT (rentalboat_sk),
	CONSTRAINT fk_factBR_dimEMPLOYEE FOREIGN KEY (employee_sk) REFERENCES dimEMPLOYEE (employee_sk)
);
