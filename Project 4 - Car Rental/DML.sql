-- 1. Insert into VehicleCategories
INSERT INTO VehicleCategories (CategoryName)
VALUES 
	('Sedan'),
	('SUV'),
	('Luxury'),
	('Compact');

-- 2. Insert into FuelTypes
INSERT INTO FuelTypes (FuelType)
VALUES 
	('Gasoline'),
	('Diesel'),
	('Electric'),
	('Hybrid');

-- 3. Insert into Vehicles
INSERT INTO Vehicles (FuelTypeId, Model, year, Mileage, RentalPricePerDay, PlateNum, Make, AvailabilityStatus, VehicleCategoryID)
VALUES 
	(1, 'Camry', 2022, 15000.5, 45.00, 'ABC-1234', 'Toyota', 1, 1),
	(1, 'Explorer', 2023, 10200.0, 75.00, 'XYZ-9876', 'Ford', 1, 2),
	(3, 'C-Class', 2021, 25000.0, 120.00, 'LUX-001', 'Mercedes', 0, 3);

-- 4. Insert into Maintenances
INSERT INTO Maintenances (VehicleID, Description, MaintenanceDate, Cost)
VALUES 
	(1, 'Oil Change and Tire Rotation', '2023-01-15', 85.00),
	(2, 'Brake Pad Replacement', '2023-03-10', 250.00);

-- 5. Insert into Customers
INSERT INTO Customers (Name, DriverLicenseNum, ContactInfo)
VALUES 
	('John Doe', 12345678, 'john.doe@email.com - 555-0100'),
	('Jane Smith', 87654321, 'jane.smith@email.com - 555-0200'),
	('Robert Johnson', 11223344, 'robert.j@email.com - 555-0300');

-- 6. Insert into RentalBookings
INSERT INTO RentalBookings (RentalCustomerID, RentalVehicleID, RentalStartDate, RentalEndDate, PickupLocation, RentalPriceByDay, InitialTotalDueAmount, DropOffLocation, InitialVehicleCheckNotes, InitialRentalDays)
VALUES 
	(1, 1, '2023-10-01', '2023-10-05', 'Airport Terminal 1', 45.00, 180.00, 'Airport Terminal 1', 'Clean, full tank', 4),
	(2, 3, '2023-10-10', '2023-10-12', 'Downtown Office', 120.00, 240.00, 'Downtown Office', 'Small scratch on bumper', 2);

-- 7. Insert into VehicleReturns
INSERT INTO VehicleReturns (ActualReturnDate, VehicleCheckNotes, AdditionalCharges, Mileage, ConsumedMileage, FinalDueAmount)
VALUES 
	('2023-10-05', 'Returned in good condition', 0.00, 15300.5, 300.0, 180.00),
	('2023-10-12', 'Returned late + low fuel', 50.00, 25150.0, 150.0, 290.00);

-- 8. Insert into RentalTransactions
INSERT INTO RentalTransactions (VehicleRentalId, ReturnVehicleId, InitialPaidAmount, PaymentDate, PaymentStatus, PaymentDetails, PaidInitialTotalDueAmount, ActualTotalDueAmount, TotalRemaining, TotalRefund, UpdateTransactionDate)
VALUES 
	-- Transaction for Booking 1 (Fully Paid, returned on time)
	(1, 1, 180.00, '2023-10-01', 1, 'Credit Card - Visa ending 1234', 180.00, 180.00, 0.00, 0.00, '2023-10-05'),
	-- Transaction for Booking 2 (Paid initial, but returned late with fee)
	(2, 2, 240.00, '2023-10-10', 1, 'Credit Card - Mastercard ending 5678', 240.00, 290.00, 50.00, 0.00, '2023-10-12');