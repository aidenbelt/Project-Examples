SELECT 
	dbBoydLakeMarinaWarehouse.dbo.tblRENTAL_BOAT.rentalboatID AS rentalboat_bk, 
	dbBoydLakeMarinaWarehouse.dbo.tblRENTAL_BOAT.rentalboatType,
	dbBoydLakeMarinaWarehouse.dbo.tblRENTAL_BOAT.rentalboatSize,
	dbBoydLakeMarinaWarehouse.dbo.tblRENTAL_BOAT.rentalboatCapacity,
	dbBoydLakeMarinaWarehouse.dbo.tblRENTAL_BOAT.rentalboatModel,
	dbBoydLakeMarinaWarehouse.dbo.tblRENTAL_BOAT.rentalboatManufacturer,
	dbBoydLakeMarinaWarehouse.dbo.tblRENTAL_BOAT.rentalboatName,
	dbBoydLakeMarinaWarehouse.dbo.tblRENTAL_BOAT.rentalboatCost,
	dbBoydLakeMarinaWarehouse.dbo.tblRENTAL_BOAT.rentalboatCL
FROM 
	dbBoydLakeMarinaWarehouse.dbo.tblRENTAL_BOAT;