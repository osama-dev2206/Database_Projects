# Simple Clinic Documentation

This document defines the data requirements for the Simple Clinic database.

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

### ERD

![ERD - Simple Clinic](./ERD%20%E2%80%93%20Simple%20Clinic.drawio.svg)

### Relational Schema

![Relational Schema - Simple Clinic](./Relational%20Schema%20%E2%80%93%20Simple%20Clinic.drawio.svg)


### Database Design 
Soon! 