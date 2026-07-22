# Simple Clinic Database

This project documents and implements a small clinic database for managing patients, doctors, appointments, medical records, prescriptions, and payments.

The database design exists in the project folder : [Simple_Clinic_Database.bak](./Simple_Clinic_Database.bak).

## Project Overview

The schema follows a normalized relational design centered on shared person details, with separate entities for clinical activity, billing, and reporting. The folder also includes the ERD and relational schema diagrams used to describe the structure visually.

## Project Files

- [DDL.sql](./DDL.sql) creates the database and defines the tables, keys, and constraints.
- [DML.sql](./DML.sql) inserts sample data.
- [Index.sql](./Index.sql) creates performance indexes.
- [Views.sql](./Views.sql) creates reporting views.
- [Simple_Clinic_Database.bak](./Simple_Clinic_Database.bak) contains the existing database backup.
- [ERD – Simple Clinic.drawio.svg](./ERD%20%E2%80%93%20Simple%20Clinic.drawio.svg) shows the entity-relationship diagram.
- [Relational Schema – Simple Clinic.drawio.svg](./Relational%20Schema%20%E2%80%93%20Simple%20Clinic.drawio.svg) shows the relational schema.

## Requirements

## 1. Patients

- Store information about patients.
- Each patient must have:
  - Unique identifier
  - **Name**
  - **Date of birth**
  - **Gender**
  - **Contact information (phone number, email)**
  - **Address**

## 2. Doctors

- Store information about doctors.
- Each doctor must have:
  - Unique identifier
  - **Name**
  - Specialization
  - **Date of birth**
  - **Gender**
  - **Contact information (phone number, email)**
  - **Address**

## 3. Appointments

- Store information about appointments.
- Each appointment must have:
  - **Unique identifier**
  - Patient
  - Doctor
  - **Appointment date and time**
  - **Appointment status**

**Appointment Status Options:**

1. Pending – scheduled but not yet occurred
2. Confirmed – confirmed by patient and provider
3. Completed – appointment took place as scheduled
4. Cancelled – cancelled by patient or provider
5. Rescheduled – moved to a different date/time
6. No Show – patient did not attend without cancelling

## 4. Medical Records

- Store medical records for patients.
- Each attended appointment must have a medical record.
- Each medical record must include:
  - **Unique identifier**
  - Patient
  - Doctor
  - **Description of visit**
  - **Diagnosis**
  - **Prescribed medication**
  - **Additional notes**

## 5. Prescription

- Store information about prescribed medications.
- At most one prescription per medical record.
- Each prescription must include:
  - Unique identifier
  - Medical record reference
  - Medication name
  - Dosage
  - Frequency
  - Start date
  - End date
  - Special instructions

## 6. Payments

- Store information about payments.
- Payment is per appointment.
- Each payment must include:
  - **Unique identifier**
  - Patient
  - **Payment date**
  - **Payment method**
  - **Amount paid**
  - **Additional notes**

---

## Solution

### Database Note

The database design exists in the backup file [Simple_Clinic_Database.bak](./Simple_Clinic_Database.bak). If you need to inspect or restore the database, start from that file.

### Project Files

- [DDL.sql](./DDL.sql) creates the database tables and constraints.
- [DML.sql](./DML.sql) inserts sample clinic data.
- [Index.sql](./Index.sql) defines indexes.
- [Views.sql](./Views.sql) defines reporting views.
- [Simple_Clinic_Database.bak](./Simple_Clinic_Database.bak) is the existing database backup.

### ERD

![ERD - Simple Clinic](./ERD%20%E2%80%93%20Simple%20Clinic.drawio.svg)

### Relational Schema

![Relational Schema - Simple Clinic](./Relational%20Schema%20%E2%80%93%20Simple%20Clinic.drawio.svg)

### Database Design

The schema is designed around patients, doctors, appointments, medical records, prescriptions, and payments. The implementation is included in the backup file listed above.

## Implementation Summary

- `Person` stores shared identity details.
- `Patient` and `Doctor` extend `Person` with role-specific data.
- `Phone` and `Email` store contact information.
- `Appointment` links patients, doctors, payments, and medical records.
- `MedicalRecord` stores the clinical outcome of a visit.
- `Prescription` stores medication details tied to a medical record.
- `Payment` stores billing information for appointments.

## Notes

- The scripts and diagrams in this folder are enough to understand the full design without opening the backup.
- The project is intended for Microsoft SQL Server.
