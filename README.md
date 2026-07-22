# Database Projects

This repo is a collection of database design exercises built around real-world scenarios. Each project is intended to document the same core ideas from different domains, including entity modeling, relational design, SQL implementation, and supporting documentation.

- ERD
- Relational schema
- Database design
- Database Backup
- Sql queries

## Workspace Overview

The repository is organized as a set of independent project folders. Each folder can contain diagrams, SQL scripts, supporting documentation, and any database backup or deliverable files that belong to that scenario.

At the moment, only Project 1 has been fully developed. The remaining folders are present as placeholders for future work and can be expanded using the same structure when needed.


## Projects

| Project | Status | Description |
| --- | --- | --- |
| [Project 1 - Simple Clinic](Project%201%20%E2%80%93%20Simple%20Clinic/README.md) | Complete | A full clinic database project covering patients, doctors, appointments, medical records, prescriptions, and payments. Includes SQL scripts, diagrams, and a database backup. |
| Project 2 - Simple Library | Not started | Reserved for a library management database project. |
| Project 3 - Karate Club | Not started | Reserved for a karate club database project. |
| Project 4 - Car Rental | Not started | Reserved for a car rental database project. |
| Project 5 - Online Store | Not started | Reserved for an online store database project. |

## Project 1 At A Glance

Project 1 is the most complete reference in this workspace and can be used as the template for future projects. It includes:

- A detailed project README with the business requirements and implementation summary.
- SQL scripts for schema creation, sample data, indexing, and views.
- Visual documentation for the ERD and relational schema.
- A backup file containing the implemented SQL Server database.

## Project 1 Files

- [README](Project%201%20%E2%80%93%20Simple%20Clinic/README.md)
- [DDL.sql](Project%201%20%E2%80%93%20Simple%20Clinic/DDL.sql)
- [DML.sql](Project%201%20%E2%80%93%20Simple%20Clinic/DML.sql)
- [Index.sql](Project%201%20%E2%80%93%20Simple%20Clinic/Index.sql)
- [Views.sql](Project%201%20%E2%80%93%20Simple%20Clinic/Views.sql)
- [Simple_Clinic_Database.bak](Project%201%20%E2%80%93%20Simple%20Clinic/Simple_Clinic_Database.bak)

## Structure Of Projects

When a new project is added, a consistent structure will make it easier to compare designs across domains. A good baseline is:

- `README.md` for the project summary and requirements.
- `DDL.sql` for schema creation.
- `DML.sql` for sample data.
- `Index.sql` for performance indexes.
- `Views.sql` for reporting or abstraction views.
- Diagram files for ERD and relational schema.
- Backup files or exports if the project includes a working database instance.

## Notes

- This README is intended to act as the landing page for the entire workspace.
- Project naming and folder layout are intentionally simple so each exercise stays isolated from the others.
- The folder structure can be extended later without changing the overall navigation approach.
