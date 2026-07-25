# Karate Club Database Project

This project is a relational database design for a Karate Club management system. It covers the core workflows needed to manage members, instructors, belt testing, subscriptions, and financial payments.

The database is implemented with SQL scripts:

- `DDl.sql` creates the tables, keys, constraints, and seed settings.
- `DML.sql` and `DML2.sql` insert sample data for members, instructors, belt ranks, and tests.
- `Views.sql` creates reusable views for reporting and joined member information.

## Index

- [Overview](#overview)
- [Requirements Coverage](#requirements-coverage)
  - [1. Membership Management](#1-membership-management)
  - [2. Instructor Management](#2-instructor-management)
  - [3. Belt Rank and Testing](#3-belt-rank-and-testing)
  - [4. Payment and Fee Management](#4-payment-and-fee-management)
- [Database Diagrams](#database-diagrams)
  - [ERD](#erd)
  - [Relational Schema](#relational-schema)
- [Database Structure](#database-structure)
- [Views](#views)
- [Sample Data Included](#sample-data-included)
- [How the System Works](#how-the-system-works)

## Overview

The Concept of the project is to model a practical Karate Club workflow where:

- people can register as members or instructors,
- members can subscribe and maintain active status,
- members can test for new belt ranks under instructors,
- test and subscription payments are tracked,
- and summary views can simplify reporting.

## Requirements Coverage

### 1. Membership Management

The schema stores member information using `Members` and a shared `Persons` table.

- `Persons` keeps the name and address for both members and instructors.
- `Members` tracks the member's specific details like emergency contact, active status, and current belt rank.
- `Subscriptions` stores subscription periods, checking if a membership is paid and active.

### 2. Instructor Management

The schema stores instructor details in `Instructors` and `Qualifications`.

- `Instructors` inherits from `Persons` to reuse contact data.
- `Qualifications` stores multiple certifications or specialties for each instructor.
- `MemberInstructors` handles the many-to-many relationship where members can have multiple instructors and vice versa.

### 3. Belt Rank and Testing

Belt ranks and testing are managed through `BeltRanks` and `BeltTests`.

- `BeltRanks` stores all standard ranks (from White Belt to Black Belt 10th Dan) and their test fees.
- `BeltTests` records individual testing events, storing the date, instructor, target rank, result, and linked payment.

### 4. Payment and Fee Management

Financial tracking is consolidated in the `Payments` table.

- `Payments` records the date, amount, and payment status (paid/unpaid).
- `Subscriptions` references `Payments` for membership fees.
- `BeltTests` references `Payments` for specific test fees.

## Database Diagrams

### ERD

![ERD diagram](Erd-Project%203%20-%20Karate%20Club.drawio.svg)

### Relational Schema

![Relational schema diagram](Relational%20Schema%20-%20Project%203%20-%20Karate%20Club.drawio.svg)

## Database Structure

### `Persons`

Stores common personal details.

Fields:

- `PersonId` primary key
- `Name`
- `Address`

### `Emails`

Stores email addresses for people.

Fields:

- `EmailId` primary key
- `EmailAddress`
- `PersonEmailId` foreign key to `Persons`

### `Phones`

Stores phone numbers for people.

Fields:

- `PhoneId` primary key
- `PhoneNumber` unique
- `PersonPhoneId` foreign key to `Persons`

### `BeltRanks`

Stores standard belt ranks and their testing fees.

Fields:

- `BeltRankId` primary key
- `BeltRankName`
- `TestFee`

### `Members`

Stores member-specific profiles.

Fields:

- `MemberId` primary key
- `MemberPersonId` foreign key to `Persons`, unique
- `EmergencyContactName`
- `IsActive`
- `BeltRankId` foreign key to `BeltRanks`

### `Instructors`

Stores instructor profiles.

Fields:

- `InstructorId` primary key
- `PersonInstructorId` foreign key to `Persons`, unique

### `Qualifications`

Stores certifications for instructors.

Fields:

- `QualificationId` primary key
- `InstructorQualificationId` foreign key to `Instructors`
- `QualificationName`

### `MemberInstructors`

Junction table assigning members to instructors.

Fields:

- `MemberInstructorId` primary key
- `M_MemberId` foreign key to `Members`
- `M_InstructorId` foreign key to `Instructors`
- `AssignDate`

### `Payments`

Stores all financial transactions.

Fields:

- `PaymentId` primary key
- `Amount`
- `Date`
- `PaymentStatus`
- `PMemberId` foreign key to `Members`

### `Subscriptions`

Stores membership validity periods.

Fields:

- `SupscriptionId` primary key
- `StartDate`
- `EndDate`
- `Fees`
- `MemberShipStatus`
- `SMemberId` foreign key to `Members`
- `SPaymentId` foreign key to `Payments`

### `BeltTests`

Stores records of rank tests.

Fields:

- `TestId` primary key
- `Result`
- `TestDate`
- `TestedByInstructorId` foreign key to `Instructors`
- `TargetRankId` foreign key to `BeltRanks`
- `MemberTestedId` foreign key to `Members`
- `TestPaymentId` foreign key to `Payments`

## Views

### `MemberDetails`

Returns comprehensive member profiles including current belt rank and contact info.

Useful for:

- member lookup,
- account status review,
- and emergency contact retrieval.

### `InstructorDetails`

Returns a combined instructor profile with qualifications and contact info.

Useful for:

- front-desk inquiries,
- and class scheduling.

### `MembersPaymentStatus`

Returns a summarized view of member payments and their status (Paid or Didnot Pay).

Useful for:

- accounting reports,
- and tracking unpaid subscriptions.

### `CountByBeltRanks`

Returns the total number of members in each belt rank.

Useful for:

- class size planning,
- and demographic reporting.

## Sample Data Included

The `DML.sql` and `DML2.sql` files seed the database with:

- 10 people (acting as the base for members and instructors),
- 3 instructors with qualifications,
- 7 members,
- a full list of belt ranks,
- member-instructor assignments,
- and test/subscription payments.

This makes it easier to test joins, views, and membership workflows immediately after running the scripts.

## How the System Works

1. A person is registered in `Persons` with contact details in `Phones` and `Emails`.
2. A person becomes a `Member` and is given an initial `BeltRankId` (White Belt) or becomes an `Instructor`.
3. A `Member` creates a `Subscription`, linking to a `Payment` record for the membership fee.
4. An `Instructor` can be assigned to train a `Member` via `MemberInstructors`.
5. A `Member` attempts to upgrade their rank by registering for a `BeltTest`, which requires a new `Payment` matching the rank's `TestFee`.
6. Once the test is passed, the `Member`'s `BeltRankId` is updated to reflect their new rank.

## Design Notes

- `MemberPersonId` and `PersonInstructorId` are constrained as unique to ensure a 1-to-1 extension of `Persons`.
- `MemberInstructors` is used because members and instructors have a many-to-many relationship.
- `Payments` centralizes all financial data so subscription and test fees can be handled uniformly.
- Standardizing the `BeltRanks` ensures consistent test fees without data duplication.

## File Overview

- `DDl.sql` creates the schema.
- `DML.sql` and `DML2.sql` load sample records.
- `Views.sql` defines reporting views.
- `Erd-Project 3 - Karate Club.drawio.svg` shows the entity relationship diagram.
- `Relational Schema - Project 3 - Karate Club.drawio.svg` shows the relational schema.
