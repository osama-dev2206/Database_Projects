# Simple Clinic Database Project 

This project is a relational database design for a small clinic management system. It covers the core workflows needed to manage patients, doctors, appointments, medical records, prescriptions, and payments.

The database is implemented with SQL scripts:

- `DDL.sql` creates the tables, keys, and constraints.
- `DML.sql` inserts sample data for patients, doctors, appointments, medical records, prescriptions, and payments.
- `Index.sql` creates performance indexes.
- `Views.sql` creates reusable views for reporting and joined person information.

## Index

- [Overview](#overview)
- [Requirements Coverage](#requirements-coverage)
  - [1. Patient Management](#1-patient-management)
  - [2. Doctor Management](#2-doctor-management)
  - [3. Appointments Management](#3-appointments-management)
  - [4. Medical Records](#4-medical-records)
  - [5. Prescriptions](#5-prescriptions)
  - [6. Payment Management](#6-payment-management)
- [Database Diagrams](#database-diagrams)
  - [ERD](#erd)
  - [Relational Schema](#relational-schema)
- [Database Structure](#database-structure)
- [Views](#views)
- [Sample Data Included](#sample-data-included)
- [How the System Works](#how-the-system-works)

## Overview

The Concept of the project is to model a simple but practical clinic workflow where:

- each person can be registered as a patient or a doctor,
- patients can schedule appointments with doctors,
- each appointment can result in a medical record,
- medical records can include prescribed medications,
- and payments can be processed for each appointment.

## Requirements Coverage

### 1. Patient Management

The schema stores patient information in `Patient` and shared identity details in `Person`.

- `Person` keeps the basic details like name, date of birth, gender, and address.
- `Patient` represents a person in the role of a patient.
- `Phone` stores one or more phone numbers per person.
- `Email` stores one or more email addresses per person.

### 2. Doctor Management

The schema stores doctor information in `Doctor` and shared identity details in `Person`.

- `Doctor` contains the doctor's specialization and links to the `Person` table.

### 3. Appointments Management

Appointment activity is recorded in `Appointment`.

- Each record links a patient and a doctor.
- It stores the appointment date/time and the status (e.g., Pending, Confirmed, Completed, Cancelled, Rescheduled, NoShow).

### 4. Medical Records

Medical outcomes are stored in `MedicalRecord`.

- Each record represents the clinical outcome of a visit, including diagnosis and visit description.
- Linked to the appointment.

### 5. Prescriptions

Prescription details are managed in `Prescription`.

- Stores details like medication name, dosage, frequency, and start/end dates.
- Associated uniquely with a specific medical record.

### 6. Payment Management

Payment tracking is handled in `Payment`.

- Stores payment date, method, and amount paid for an appointment.

## Database Diagrams

### ERD

![ERD diagram](ERD%20%E2%80%93%20Simple%20Clinic.drawio.svg)

### Relational Schema

![Relational schema diagram](Relational%20Schema%20%E2%80%93%20Simple%20Clinic.drawio.svg)

## Database Structure

### `Person`

Stores shared identity details for both patients and doctors.

Fields:

- `PersonId` primary key
- `Name`
- `DateOfBirth`
- `Gender`
- `Address`

### `Phone`

Stores phone numbers associated with a person.

Fields:

- `PhoneId` primary key
- `PhoneNumber`
- `PersonId` foreign key to `Person`

### `Email`

Stores email addresses associated with a person.

Fields:

- `EmailId` primary key
- `Email`
- `PersonId` foreign key to `Person`

### `Doctor`

Stores details specific to doctors.

Fields:

- `DoctorId` primary key
- `Specialization`
- `PersonId` foreign key to `Person`

### `Patient`

Stores details specific to patients.

Fields:

- `PatientId` primary key
- `PersonId` foreign key to `Person`

### `MedicalRecord`

Stores the clinical outcomes and visit details.

Fields:

- `MedicalRecordId` primary key
- `Diagnosis`
- `AdditionalNotes`
- `DescriptionOfVisit`

### `Prescription`

Stores medication details tied to a medical record.

Fields:

- `PrescriptionId` primary key
- `MedicalId` foreign key to `MedicalRecord`, unique
- `Freq`
- `StartDate`
- `EndDate`
- `SpecialInstructions`
- `MedicalName`
- `Dosage`

### `Payment`

Stores billing information for appointments.

Fields:

- `PaymentId` primary key
- `PaymentMethod`
- `PaymentDate`
- `AdditionalNotes`
- `AmountPaid`

### `Appointment`

Links patients, doctors, payments, and medical records.

Fields:

- `AppointmentId` primary key
- `DoctorId` foreign key to `Doctor`
- `PatientId` foreign key to `Patient`
- `PaymentId` foreign key to `Payment`
- `MedicalRecordId` foreign key to `MedicalRecord`
- `AppointmentDateTime`
- `AppoitmentStatus`

## Views

### `DoctorsFullDetails`

Returns each doctor combined with their personal details from `Person`.

Useful for:

- retrieving full profiles of doctors,
- including specialization and contact information.

### `PatientFullDetails`

Returns each patient combined with their personal details from `Person`.

Useful for:

- front-desk lookup,
- retrieving full profiles of patients.

### `AppointmentDetails`

Returns a comprehensive summary of an appointment.

Useful for:

- combining appointment time, status, doctor name, patient name, payment details, and diagnosis into a single view.

## Sample Data Included

The `DML.sql` file seeds the database with:

- 2 people (one patient, one doctor),
- their phone numbers and emails,
- 1 medical record,
- 1 payment,
- 1 prescription,
- and 2 appointments (one scheduled, one completed).

This makes it easier to test joins, views, and clinic workflows immediately after running the scripts.

## How the System Works

1. A person is registered in `Person` with contact details in `Phone` and `Email`.
2. The person is assigned a role by being added to `Patient` or `Doctor`.
3. A patient books a visit, creating a record in `Appointment`.
4. When the visit happens, a `MedicalRecord` is created, and the appointment status is updated.
5. If medication is needed, a `Prescription` is added, linked to the `MedicalRecord`.
6. Billing is processed, adding a record to `Payment`, linked to the appointment.

## Design Notes

- The `Person` table uses an inheritance-like pattern (Is-A relationship) where `Patient` and `Doctor` extend it.
- `AppoitmentStatus` has a check constraint restricting it to values like 'Pending', 'Confirmed', 'Completed', etc.
- `Prescription.MedicalId` is constrained as unique to ensure at most one prescription is directly tied to a single medical record.
- The `Appointment` table acts as a central hub linking the doctor, patient, payment, and medical record.

## File Overview

- `DDL.sql` creates the schema.
- `DML.sql` loads sample records.
- `Index.sql` creates performance indexes.
- `Views.sql` defines reporting views.
- `ERD – Simple Clinic.drawio.svg` shows the entity relationship diagram.
- `Relational Schema – Simple Clinic.drawio.svg` shows the relational schema.
- `Simple_Clinic_Database.bak` contains the existing database backup.
