CREATE DATABASE dbBoydLakeMarinaWarehouse

CREATE TABLE tblCUSTOMER
(
customerID 				INT IDENTITY(1,1) 	PRIMARY KEY,
customerFirst			VARCHAR(50)		NOT NULL,
customerLast			VARCHAR(50)		NOT NULL,
customerAge				INT				NOT NULL,
customerGender			VARCHAR(30)		NOT NULL,
customerAddress			VARCHAR(249)	NOT NULL,
customerCity			VARCHAR(50)		NOT NULL,
customerState			VARCHAR(2)		NOT NULL,
customerZip				VARCHAR(10)		NOT NULL, 
customerCountry			VARCHAR(30)		NOT NULL,
customerPhone			VARCHAR(11)		NOT NULL,
customerEmail			VARCHAR(50)		NOT NULL,
customerLicense			INT
);

CREATE TABLE tblEMPLOYEE
(
employeeID				INT IDENTITY(1,1) 	PRIMARY KEY,
employeeFirst			VARCHAR(50)		NOT NULL,
employeeLast			VARCHAR(50)		NOT NULL,
employeeAge				INT				NOT NULL,
employeeGender			VARCHAR(30)		NOT NULL,
employeeAddress			VARCHAR(249)	NOT NULL,
employeeCity			VARCHAR(50)		NOT NULL,
employeeState			VARCHAR(2)		NOT NULL,
employeeZip				VARCHAR(10)		NOT NULL, 
employeeCountry			VARCHAR(30)		NOT NULL,
employeePhone			VARCHAR(11)		NOT NULL,
employeeEmail			VARCHAR(50)		NOT NULL,
employeeHireDate		DATE			NOT NULL,
employeePosition		VARCHAR(50)		NOT NULL
);

CREATE TABLE tblRENTAL_BOAT
(
rentalboatID			INT IDENTITY(1,1) 	PRIMARY KEY,
rentalboatType			VARCHAR(50)		NOT NULL,
rentalboatSize			INT				NOT NULL,
rentalboatCapacity		INT				NOT NULL,
rentalboatModel			VARCHAR(50)		NOT NULL,
rentalboatManufacturer	VARCHAR(50)		NOT NULL,
rentalboatName			VARCHAR(30)		NOT NULL,
rentalboatCost			DECIMAL(10,2)	NOT NULL, 
rentalboatCL			INT				NOT NULL
);

CREATE TABLE tblSPACE_BOAT
(
spaceboatID				INT IDENTITY(1,1) 	PRIMARY KEY,
spaceboatLength			INT				NOT NULL, 
spaceboatCL				INT				NOT NULL
);

CREATE TABLE tblSPACE_RENTAL
(
spacerentID				INT IDENTITY(1,1) 	PRIMARY KEY,
customerID				INT				NOT NULL, 
spaceboatID				INT				NOT NULL, 
spacerentStart			DATE			NOT NULL, 
spacerentSize			INT				NOT NULL, 
spacerentPower			BIT 			NOT NULL, 
spacerentLoaction		VARCHAR(10)		NOT NULL,
spacerentFee			DECIMAL(10,2)	NOT NULL	 
CONSTRAINT fk_spacerent_customer FOREIGN KEY (customerID) REFERENCES tblCUSTOMER (customerID),
CONSTRAINT fk_spacerent_spaceboat FOREIGN KEY (spaceboatID) REFERENCES tblSPACE_BOAT (spaceboatID)
);

CREATE TABLE tblBOAT_RENTAL
(
boatrentID				INT IDENTITY(1,1) 	PRIMARY KEY,
customerID				INT				NOT NULL,
rentboatID				INT				NOT NULL, 
employeeID				INT				NOT NULL, 
boatrentDate			DATE			NOT NULL,
boatrentStart			TIME			NOT NULL, 
boatrentEnd				TIME			NOT NULL, 
boatrentFee				DECIMAL(10,2)	NOT NULL
CONSTRAINT fk_boatrent_customer FOREIGN KEY (customerID) REFERENCES tblCUSTOMER (customerID),
CONSTRAINT fk_boatrent_rentboat FOREIGN KEY (rentboatID) REFERENCES tblRENTAL_BOAT (rentalboatID),
CONSTRAINT fk_boatrent_employee FOREIGN KEY (employeeID) REFERENCES tblEMPLOYEE (employeeID)
); 

CREATE TABLE tblPRODUCT_CATEGORY
(
prodcatID				INT IDENTITY(1,1) 	PRIMARY KEY,
prodcatName				VARCHAR(40)		NOT NULL, 
prodcatDesc				VARCHAR(255)	NOT NULL 
);

CREATE TABLE tblPRODUCT
(
productID				INT IDENTITY(1,1) 	PRIMARY KEY,
prodcatID				INT					NOT NULL,
productName				VARCHAR(60)			NOT NULL, 
productPrice			DECIMAL(10,2)		NOT NULL,
CONSTRAINT fk_product_productcategory FOREIGN KEY (prodcatID) REFERENCES tblPRODUCT_CATEGORY (prodcatID)
);

CREATE TABLE tblORDER
(
orderID					INT IDENTITY(1,1) 	PRIMARY KEY,
customerID	 			INT 			NOT NULL, 
orderTotal				DECIMAL(10,2)	NOT NULL, 
CONSTRAINT fk_order_customer FOREIGN KEY (customerID) REFERENCES tblCUSTOMER (customerID)
);

CREATE TABLE tblORDER_PRODUCT
(
orderprodID			INT IDENTITY(1,1) 	PRIMARY KEY,
orderID				INT				NOT NULL, 
productID			INT 			NOT NULL, 
CONSTRAINT fk_orderproduct_order FOREIGN KEY (orderID) REFERENCES tblORDER (orderID), 
CONSTRAINT fk_orderproduct_product FOREIGN KEY (productID) REFERENCES tblPRODUCT (productID)
);