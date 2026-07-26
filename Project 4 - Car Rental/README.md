# Car Rental Database Project

This project is a relational database design for a Car Rental management system. It covers the core workflows needed to manage vehicles, customers, rental bookings, vehicle returns, and transactions.

The database is implemented with SQL scripts:

- `DDL.sql` creates the tables, keys, constraints, and relationships.
- `DML.sql` inserts sample data for vehicles, categories, fuel types, customers, and bookings.
- `Views.sql` creates reusable views for vehicle details and customer rentals.

## Index

- [Overview](#overview)
- [Requirements Coverage](#requirements-coverage)
  - [1. Vehicle Management](#1-vehicle-management)
  - [2. Customer Management](#2-customer-management)
  - [3. Rental Booking Process](#3-rental-booking-process)
  - [4. Billing and Transactions](#4-billing-and-transactions)
- [Database Diagrams](#database-diagrams)
  - [ERD](#erd)
  - [Relational Schema](#relational-schema)
- [Database Structure](#database-structure)
- [Views](#views)
- [Sample Data Included](#sample-data-included)
- [How the System Works](#how-the-system-works)

## Overview

The Concept of the project is to model a practical Car Rental workflow where:

- vehicles are categorized and their fuel types and availability are tracked,
- maintenance records are kept for each vehicle,
- customers can book vehicles for specific dates and locations,
- vehicle returns track mileage and extra charges,
- and payments and outstanding balances are processed for each rental.

## Requirements Coverage

### 1. Vehicle Management

The schema stores vehicle information using `Vehicles`, `VehicleCategories`, and `FuelTypes`.

- `Vehicles` tracks specific details like model, make, year, mileage, rental price, and availability.
- `VehicleCategories` classifies vehicles (e.g., Sedan, SUV, Luxury).
- `FuelTypes` defines the type of fuel used (e.g., Gasoline, Electric).
- `Maintenances` records service history and repair costs for vehicles.

### 2. Customer Management

Customer details are handled in the `Customers` table.

- `Customers` stores personal information like name, driver's license number, and contact info to identify renters.

### 3. Rental Booking Process

The rental lifecycle is managed by `RentalBookings` and `VehicleReturns`.

- `RentalBookings` captures the rental agreement, including start/end dates, pickup/drop-off locations, rental days, and initial vehicle condition notes.
- `VehicleReturns` records the actual return details, consumed mileage, final condition, and any additional charges incurred upon return.

### 4. Billing and Transactions

Financial tracking is consolidated in the `RentalTransactions` table.

- `RentalTransactions` links bookings and returns to track initial payments, payment status, actual total due amounts, remaining balances, and refunds.

## Database Diagrams

### ERD

![ERD diagram](ERD%20-%20Project%204%20-%20Car%20Rental%20.drawio.svg)

### Relational Schema

![Relational schema diagram](Relational%20Schema%20-%20Project%204%20-%20Car%20Rental%20.drawio.svg)

## Database Structure

### `VehicleCategories`

Stores classifications for vehicles.

Fields:

- `CategoryID` primary key
- `CategoryName` unique

### `FuelTypes`

Stores available fuel types.

Fields:

- `FuelId` primary key
- `FuelType`

### `Vehicles`

Stores the core inventory of cars.

Fields:

- `VehicleID` primary key
- `FuelTypeId` foreign key to `FuelTypes`
- `Model`
- `year`
- `Mileage`
- `RentalPricePerDay`
- `PlateNum` unique
- `Make`
- `AvailabilityStatus`
- `VehicleCategoryID` foreign key to `VehicleCategories`

### `Maintenances`

Stores maintenance and repair records for vehicles.

Fields:

- `MaintenanceID` primary key
- `VehicleID` foreign key to `Vehicles`
- `Description`
- `MaintenanceDate`
- `Cost`

### `Customers`

Stores details of people renting the cars.

Fields:

- `customerID` primary key
- `Name`
- `DriverLicenseNum` unique
- `ContactInfo`

### `RentalBookings`

Stores reservations and initial rental agreements.

Fields:

- `RentalId` primary key
- `RentalCustomerID` foreign key to `Customers`
- `RentalVehicleID` foreign key to `Vehicles`
- `RentalStartDate`
- `RentalEndDate`
- `PickupLocation`
- `RentalPriceByDay`
- `InitialTotalDueAmount`
- `DropOffLocation`
- `InitialVehicleCheckNotes`
- `InitialRentalDays`

### `VehicleReturns`

Stores details when a vehicle is brought back.

Fields:

- `VehicleReturnID` primary key
- `ActualReturnDate`
- `VehicleCheckNotes`
- `AdditionalCharges`
- `Mileage`
- `ConsumedMileage`
- `FinalDueAmount`

### `RentalTransactions`

Stores payment and balance information for rentals.

Fields:

- `RentalTransactionID` primary key
- `VehicleRentalId` foreign key to `RentalBookings`
- `ReturnVehicleId` foreign key to `VehicleReturns`
- `InitialPaidAmount`
- `PaymentDate`
- `PaymentStatus`
- `PaymentDetails`
- `PaidInitialTotalDueAmount`
- `ActualTotalDueAmount`
- `TotalRemaining`
- `TotalRefund`
- `UpdateTransactionDate`

## Views

### `FullVechicleDetails`

Returns comprehensive vehicle profiles including their category and fuel type.

Useful for:

- inventory browsing,
- checking availability status (translated to 'Available' / 'Not Available').

### `CustomerRents`

Returns a summarized view of customers and the vehicles they have booked along with the daily rate.

Useful for:

- quick lookup of customer reservations,
- customer service inquiries.

## Sample Data Included

The `DML.sql` file seeds the database with:

- 4 vehicle categories and 4 fuel types,
- 3 vehicles (Camry, Explorer, C-Class),
- 2 maintenance records,
- 3 customers,
- 2 rental bookings (one completed and one returned late),
- 2 vehicle returns with recorded mileage and extra fees,
- 2 rental transactions handling payments.

This makes it easier to test joins, views, and the booking workflow immediately after running the scripts.

## How the System Works

1. Vehicles are cataloged in `Vehicles` with a defined `VehicleCategoryID` and `FuelTypeId`.
2. Routine servicing is tracked in the `Maintenances` table.
3. A `Customer` registers with their driver's license and contact information.
4. The `Customer` makes a reservation via `RentalBookings`, which captures the planned dates, location, and initial estimated cost.
5. An initial payment is logged in `RentalTransactions` upon booking.
6. When the rental period ends, details of the return (actual date, consumed mileage, condition) are recorded in `VehicleReturns`.
7. `RentalTransactions` is updated with the `ReturnVehicleId` to calculate any remaining balance or refund based on the `FinalDueAmount` from the return record.

## Design Notes

- `RentalTransactions` handles financial tracking to separate payment status from the core booking and return processes.
- The schema breaks down the rental lifecycle into `RentalBookings` and `VehicleReturns` to distinctively record planned versus actual parameters.
- Driver's licenses are constrained as unique to uniquely identify customers.
- The `AvailabilityStatus` bit flag provides a simple way to filter out cars currently rented or out for maintenance.

## File Overview

- `DDL.sql` creates the schema.
- `DML.sql` loads sample records.
- `Views.sql` defines reporting views.
- `ERD - Project 4 - Car Rental .drawio.svg` shows the entity relationship diagram.
- `Relational Schema - Project 4 - Car Rental .drawio.svg` shows the relational schema.
