Create View FullVechicleDetails AS
Select v.VehicleID, v.Model,
v.year As ManfacturedYear, v.Mileage,
v.RentalPricePerDay, v.PlateNum, v.Make, 
AvailabilityStatus = 
CASE
	when v.AvailabilityStatus = 1 then 'Available'
	when v.AvailabilityStatus = 0 then 'Not Available'	
END
, 
vc.CategoryName, ft.FuelType
From Vehicles as v 
Inner JOin VehicleCategories AS vc 
ON vc.CategoryID = v.VehicleCategoryID  
Inner Join FuelTypes as ft 
On ft.FuelId = v.FuelTypeId ; 


create View CustomerRents AS 
Select Customers.customerID , Customers.Name ,
Vehicles.Model , Vehicles.PlateNum , RentalPriceByDay
From RentalBookings 
Inner Join Customers ON RentalCustomerID = Customers.customerID
Inner Join Vehicles On RentalVehicleID = VehicleID ;

