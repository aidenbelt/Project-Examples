SELECT 
	dbBoydLakeMarinaWarehouse.dbo.tblBOAT_RENTAL.boatrentID AS boatrentID_dd, 
	dbBoydLakeMarinaWarehouse.dbo.tblBOAT_RENTAL.boatrentStart,
	dbBoydLakeMarinaWarehouse.dbo.tblBOAT_RENTAL.boatrentEnd, 
	dbBoydLakeMarinaWarehouse.dbo.tblBOAT_RENTAL.boatrentFee, 
	dmBoydLakeMarina.dbo.dimCUSTOMER.customer_sk,
	dmBoydLakeMarina.dbo.dimRENTAL_BOAT.rentalboat_sk, 
	dmBoydLakeMarina.dbo.dimEMPLOYEE.employee_sk,
	dmBoydLakeMarina.dbo.dimDATE.date_sk AS boatrentDate
FROM 
	dbBoydLakeMarinaWarehouse.dbo.tblBOAT_RENTAL
INNER JOIN 
	dbBoydLakeMarinaWarehouse.dbo.tblCUSTOMER
ON 
	dbBoydLakeMarinaWarehouse.dbo.tblBOAT_RENTAL.customerID = dbBoydLakeMarinaWarehouse.dbo.tblCUSTOMER.customerID
INNER JOIN	
	dbBoydLakeMarinaWarehouse.dbo.tblRENTAL_BOAT
ON
	dbBoydLakeMarinaWarehouse.dbo.tblBOAT_RENTAL.rentboatID = dbBoydLakeMarinaWarehouse.dbo.tblRENTAL_BOAT.rentalboatID
INNER JOIN 
	dbBoydLakeMarinaWarehouse.dbo.tblEMPLOYEE
ON 
	dbBoydLakeMarinaWarehouse.dbo.tblBOAT_RENTAL.employeeID = dbBoydLakeMarinaWarehouse.dbo.tblEMPLOYEE.employeeID
INNER JOIN 
	dmBoydLakeMarina.dbo.dimCUSTOMER
ON 
	dmBoydLakeMarina.dbo.dimCUSTOMER.customer_bk = dbBoydLakeMarinaWarehouse.dbo.tblCUSTOMER.customerID
INNER JOIN 
	dmBoydLakeMarina.dbo.dimRENTAL_BOAT
ON 
	dmBoydLakeMarina.dbo.dimRENTAL_BOAT.rentalboat_bk = dbBoydLakeMarinaWarehouse.dbo.tblRENTAL_BOAT.rentalboatID
INNER JOIN
	dmBoydLakeMarina.dbo.dimEMPLOYEE
ON
	dmBoydLakeMarina.dbo.dimEMPLOYEE.employee_bk = dbBoydLakeMarinaWarehouse.dbo.tblEMPLOYEE.employeeID
INNER JOIN 
	dmBoydLakeMarina.dbo.dimDATE
ON 
	dmBoydLakeMarina.dbo.dimDATE.Date = dbBoydLakeMarinaWarehouse.dbo.tblBOAT_RENTAL.boatrentDate