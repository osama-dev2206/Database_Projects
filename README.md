# Database Projects

This repository is a collection of relational database design exercises built around real-world application scenarios. Each project demonstrates core database engineering principles across different domains, including entity-relationship modeling, relational schema design, normalized SQL implementations, performance optimization, and supporting documentation.

- Entity-Relationship Diagrams (ERD) & Relational Schemas
- Normalized Database Architecture (1NF to 3NF)
- SQL Implementation Scripts (DDL, DML, Indexes, Views)
- Database Backup Files & Runnable Samples

---

## Workspace Overview

The repository is organized as a collection of independent project folders. Each folder contains ERD and relational diagrams, SQL scripts (schema creation, seed data, views, indexes), project documentation, and working database backup deliverables.

Currently, **Project 1 (Simple Clinic)** and **Project 2 (Simple Library)** are fully completed and serve as comprehensive reference designs. The remaining folders are structured as placeholders for upcoming database projects.

---

## Projects Summary

| Project | Status | Description |
| --- | --- | --- |
| [Project 1 – Simple Clinic](Project%201%20%E2%80%93%20Simple%20Clinic/README.md) | **Complete** | Healthcare clinic database managing patients, doctors, appointments, medical records, prescriptions, and billing/payments. |
| [Project 2 - Simple Library](Project%202%20-%20Simple%20Library/README.md) | **Complete** | Library management system tracking books, physical copies, authors, user profiles, borrowing history, holds/reservations, and fine tracking. |
| Project 3 - Karate Club | *Not started* | Reserved for a karate club membership and belt progression database system. |
| Project 4 - Car Rental | *Not started* | Reserved for a vehicle fleet rental and reservation database project. |
| Project 5 - Online Store | *Not started* | Reserved for an e-commerce store database covering products, orders, customers, and inventory. |

---

## Completed Projects at a Glance

### [Project 1: Simple Clinic Database](Project%201%20%E2%80%93%20Simple%20Clinic/README.md)

A complete healthcare provider system implemented in SQL Server, centered around patient care and appointment workflows.

- **Core Domains**: Shared identity (`Person`), Patients, Doctors, Appointments (6 status states), Medical Records, Prescriptions, and Payments.
- **Key Deliverables**:
  - [README](Project%201%20%E2%80%93%20Simple%20Clinic/README.md)
  - [DDL.sql](Project%201%20%E2%80%93%20Simple%20Clinic/DDL.sql)
  - [DML.sql](Project%201%20%E2%80%93%20Simple%20Clinic/DML.sql)
  - [Index.sql](Project%201%20%E2%80%93%20Simple%20Clinic/Index.sql)
  - [Views.sql](Project%201%20%E2%80%93%20Simple%20Clinic/Views.sql)
  - [Simple_Clinic_Database.bak](Project%201%20%E2%80%93%20Simple%20Clinic/Simple_Clinic_Database.bak)
  - [ERD Diagram](Project%201%20%E2%80%93%20Simple%20Clinic/ERD%20%E2%80%93%20Simple%20Clinic.drawio.svg) | [Relational Schema](Project%201%20%E2%80%93%20Simple%20Clinic/Relational%20Schema%20%E2%80%93%20Simple%20Clinic.drawio.svg)

### [Project 2: Simple Library Database](Project%202%20-%20Simple%20Library/README.md)

A relational database system modeling library inventory management, member borrowing, and overdue penalty calculations.

- **Core Domains**: Catalog (`Books`, `Authors`, `AuthorWritings`), Physical Inventory (`BookCopies`), Member Management (`Users`, `Phones`, `Email`), `BorrowingRecords`, `Reservations`, Overdue Fines (`Fine`), and Policy `Settings`.
- **Key Deliverables**:
  - [README](Project%202%20-%20Simple%20Library/README.md)
  - [DDL.sql](Project%202%20-%20Simple%20Library/DDL.sql)
  - [DML.sql](Project%202%20-%20Simple%20Library/DML.sql)
  - [View.sql](Project%202%20-%20Simple%20Library/View.sql)
  - [Simple_Library Database](Project%202%20-%20Simple%20Library/Simple_Library%20Database)
  - [ERD Diagram](Project%202%20-%20Simple%20Library/ERD-Project%202%20-%20Simple%20Library.drawio.svg) | [Relational Schema](Project%202%20-%20Simple%20Library/Relational%20Schema%20-%20Project%202%20-%20Simple%20Library.drawio.svg)

---

## Standard Project Structure

Every project in this repository follows a consistent layout to enable clear comparison across business domains:

- `README.md` — Detailed requirements coverage, entity definitions, and design notes.
- `DDL.sql` — Schema definition script (tables, primary/foreign keys, constraints, default values).
- `DML.sql` — Seed script populating realistic test data across all tables.
- `Index.sql` / `View.sql` — Performance indexes and views for reporting/abstractions.
- Diagrams (`.drawio.svg`) — Visual ERD and Relational Schema representations.
- Database Backups / Files — Pre-built database instances ready for restoration/testing.

---

## Notes

- This `README.md` serves as the central landing page and index for all projects.
- Each project directory is self-contained and isolated from other exercises.
