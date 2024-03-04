SELECT 
	dbBoydLakeMarinaWarehouse.dbo.tblCUSTOMER.customerID AS customer_bk, 
	dbBoydLakeMarinaWarehouse.dbo.tblCUSTOMER.customerFirst,
	dbBoydLakeMarinaWarehouse.dbo.tblCUSTOMER.customerLast,
	dbBoydLakeMarinaWarehouse.dbo.tblCUSTOMER.customerAge,
	dbBoydLakeMarinaWarehouse.dbo.tblCUSTOMER.customerGender,
	dbBoydLakeMarinaWarehouse.dbo.tblCUSTOMER.customerAddress,
	dbBoydLakeMarinaWarehouse.dbo.tblCUSTOMER.customerCity,
	dbBoydLakeMarinaWarehouse.dbo.tblCUSTOMER.customerState,
	dbBoydLakeMarinaWarehouse.dbo.tblCUSTOMER.customerZip,
	dbBoydLakeMarinaWarehouse.dbo.tblCUSTOMER.customerCountry,
	dbBoydLakeMarinaWarehouse.dbo.tblCUSTOMER.customerPhone,
	dbBoydLakeMarinaWarehouse.dbo.tblCUSTOMER.customerEmail,
	dbBoydLakeMarinaWarehouse.dbo.tblCUSTOMER.customerLicense
FROM 
	dbBoydLakeMarinaWarehouse.dbo.tblCUSTOMER;