
Create Table VehicleCategories
(
CategoryID INT PRIMARY KEY IDENTITY(1,1), 
CategoryName varchar (100) NOT NULL UNIQUE 
);

create Table FuelTypes 
(
FuelId INT PRIMARY KEY IDENTITY(1,1),
FuelType varchar(50) NOT NULL ,
);

create Table Vehicles (
VehicleID INT PRIMARY KEY IDENTITY(1,1),
FuelTypeId int not null Foreign Key References FuelTypes(FuelId) , 
Model varchar (100) NOT NULL ,
year INT NOT NULL,
Mileage decimal NOT NULL,
RentalPricePerDay smallmoney NOT NULL,
PlateNum varchar (10) NOT NULL UNIQUE  ,
Make varchar (Max) NOT NULL,
AvailabilityStatus  bit not  NULL,
VehicleCategoryID INT not null FOREIGN KEY REFERENCES VehicleCategories(CategoryID)
);

create table Maintenances (
	MaintenanceID INT PRIMARY KEY IDENTITY(1,1),
	VehicleID INT NOT NULL FOREIGN KEY REFERENCES Vehicles(VehicleID),
	Description nvarchar(Max) NOT NULL,
	MaintenanceDate date NOT NULL Default GETDate() ,
	Cost smallmoney NOT NULL
);


-----------------------------------
create table Customers
(
customerID INT PRIMARY KEY IDENTITY(1,1),
Name nvarchar(100) NOT NULL,
DriverLicenseNum int NOT NULL UNIQUE,
ContactInfo varchar(Max)  NULL
);

create Table RentalBookings 
(
RentalId int PRIMARY KEY IDENTITY(1,1),
RentalCustomerID int NOT NULL FOREIGN KEY REFERENCES Customers(customerID),
RentalVehicleID int NOT NULL FOREIGN KEY REFERENCES Vehicles(VehicleID),
RentalStartDate date NOT NULL,
RentalEndDate date  NULL,
PickupLocation nvarchar(MAX) NOT NULL,
RentalPriceByDay smallmoney NOT NULL,
InitialTotalDueAmount smallmoney NOT NULL,
DropOffLocation nvarchar(MAX) NOT NULL,
InitialVehicleCheckNotes nvarchar(MAX) NULL ,
InitialRentalDays int NOT NULL 
);

create table VehicleReturns
(
VehicleReturnID int PRIMARY KEY IDENTITY(1,1),
ActualReturnDate date not NULL,
VehicleCheckNotes nvarchar(MAX) NULL, 
AdditionalCharges smallmoney NULL,
Mileage decimal not NULL,
ConsumedMileage decimal not NULL,
FinalDueAmount smallmoney not NULL 
);

create Table RentalTransactions
(
RentalTransactionID int PRIMARY KEY IDENTITY(1,1),
VehicleRentalId int not null Foreign Key REFERENCES RentalBookings(RentalId),
ReturnVehicleId int  null Foreign Key REFERENCES VehicleReturns(VehicleReturnID),
InitialPaidAmount smallmoney not null,
PaymentDate date not null ,
PaymentStatus bit not null, 
PaymentDetails nvarchar(MAX) not null, 
PaidInitialTotalDueAmount smallmoney not null,
ActualTotalDueAmount smallmoney not null , 
TotalRemaining smallmoney not null ,
TotalRefund smallmoney not null , 
UpdateTransactionDate date not null 
);

