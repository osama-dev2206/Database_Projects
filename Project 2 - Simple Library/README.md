# Simple Library Database Project

This project is a relational database design for a small library management system. It covers the core workflows needed to manage books, copies, users, borrowing, returns, reservations, and fines.

The database is implemented with SQL scripts:

- `DDL.sql` creates the tables, keys, constraints, and seed settings.
- `DML.sql` inserts sample data for users, authors, books, copies, and borrowing records.
- `View.sql` creates reusable views for reporting and joined user information.

## Index

- [Overview](#overview)
- [Requirements Coverage](#requirements-coverage)
  - [1. Book Management](#1-book-management)
  - [2. User Management](#2-user-management)
  - [3. Borrowing and Returns](#3-borrowing-and-returns)
  - [4. Holds and Reservations](#4-holds-and-reservations)
  - [5. Fine Management](#5-fine-management)
- [Database Diagrams](#database-diagrams)
  - [ERD](#erd)
  - [Relational Schema](#relational-schema)
- [Database Structure](#database-structure)
- [Views](#views)
- [Sample Data Included](#sample-data-included)
- [How the System Works](#how-the-system-works)

## Overview

The Concept of the project is to model a simple but practical library workflow where:

- each book can have multiple copies,
- users can borrow specific copies,
- overdue borrowing can generate fines,
- reservations can be tracked for fairness,
- and summary views can simplify reporting.

## Requirements Coverage

### 1. Book Management

The schema stores book information in `Books` and author information in `Authors`.

- `Books` keeps the title, ISBN, publication date, genre, and additional details.
- `BookCopies` tracks individual physical copies of each book using a unique `CopyID`.
- `AvailabilityStatus` stores whether a copy is available or checked out.
- `AuthorWritings` supports the many-to-many relationship between authors and books.

### 2. User Management

The schema stores library users in `Users`.

- `Users` contains the user's name and library card number.
- `Phones` stores one or more phone numbers per user.
- `Email` stores one or more email addresses per user.

### 3. Borrowing and Returns

Borrowing activity is recorded in `BorrowingRecords`.

- Each record links a user to a specific book copy.
- It stores the borrowing date, due date, and actual return date.
- The return process is represented by updating the borrowing record and the related copy status.
- `Fine` can capture penalties for overdue or damaged returns.

### 4. Holds and Reservations

Reservation activity is stored in `Reservations`.

- A reservation links a user to a specific book copy.
- The reservation timestamp is stored in `ReservatioinDateTime`.
- The design supports ordering reservations by date/time to maintain fairness.

### 5. Fine Management

Fine tracking is handled in `Fine`.

- `FineAmount` stores the amount owed.
- `PaymentStatus` indicates whether the fine is paid or pending.
- `NumberOfLateDays` records how late the return was.
- `Settings` stores the borrowing policy used to calculate overdue fines.

## Database Diagrams

### ERD

![ERD diagram](ERD-Project%202%20-%20Simple%20Library.drawio.svg)

### Relational Schema

![Relational schema diagram](Relational%20Schema%20-%20Project%202%20-%20Simple%20Library.drawio.svg)

## Database Structure

### `Authors`

Stores author details.

Fields:

- `AuthorID` primary key
- `AuthorName`
- `DateOfBirth`
- `Email`

### `Books`

Stores the main book catalog.

Fields:

- `BooKID` primary key
- `Title`
- `ISBN` unique
- `PublicationDate`
- `Genre`
- `AdditionalDetails`

### `AuthorWritings`

Junction table that links authors and books.

Fields:

- `AuthorWritingId` primary key
- `AuthorWriterID` foreign key to `Authors`
- `WritingBookID` foreign key to `Books`

### `BookCopies`

Tracks physical copies of books.

Fields:

- `CopyID` primary key
- `AvailabilityStatus`
- `OriginalBookID` foreign key to `Books`

### `Users`

Stores library user records.

Fields:

- `UserID` primary key
- `Name`
- `UserLibraryNum` unique

### `Phones`

Stores phone numbers for users.

Fields:

- `PhoneID` primary key
- `PhoneNumber`
- `UserPhoneID` foreign key to `Users`

### `Email`

Stores email addresses for users.

Fields:

- `EmailID` primary key
- `Email`
- `UserEmailID` foreign key to `Users`

### `BorrowingRecords`

Stores the borrowing history for copy checkout and return tracking.

Fields:

- `BorrowID` primary key
- `BorrowDate`
- `DueDate`
- `ActualReturnDate`
- `BorrowingUserId` foreign key to `Users`
- `BorrowingBookCopyId` foreign key to `BookCopies`

### `Fine`

Stores late-return or damage penalties.

Fields:

- `FineID` primary key
- `FineBorrowId` foreign key to `BorrowingRecords`
- `UserFineId` foreign key to `Users`
- `FineAmount`
- `PaymentStatus`
- `NumberOfLateDays`

### `Reservations`

Stores reservation requests for book copies.

Fields:

- `ReservationId` primary key
- `UserReservationID` foreign key to `Users`
- `ReservationCopyBookID` foreign key to `BookCopies`
- `ReservatioinDateTime`

### `Settings`

Stores system-wide policy values.

Fields:

- `AllowedBorrowDays`
- `TheFineAmountPerDay`

## Views

### `AuthorBooks`

Returns each author with the books they wrote.

Useful for:

- book catalog reporting,
- author lookup,
- and quick relationship validation.

### `FullUserInfo`

Returns a combined user profile with contact and fine information.

Useful for:

- front-desk lookup,
- user account review,
- and fine status reporting.

## Sample Data Included

The `DML.sql` file seeds the database with:

- 3 users,
- 3 authors,
- 3 books,
- mappings between each author and book,
- 3 book copies,
- and 3 borrowing records.

This makes it easier to test joins, views, and borrowing workflows immediately after running the scripts.

## How the System Works

1. A book is registered in `Books`.
2. One or more authors are linked using `AuthorWritings`.
3. Physical copies are added in `BookCopies`.
4. A user is stored in `Users` with contact details in `Phones` and `Email`.
5. When the user borrows a copy, a row is inserted into `BorrowingRecords`.
6. If the item is returned late, a fine can be recorded in `Fine`.
7. If all copies are unavailable, a user can place a reservation in `Reservations`.

## Design Notes

- `ISBN` is constrained as unique to prevent duplicate book identifiers.
- `UserLibraryNum` is also unique to ensure each user has one library card number.
- `AuthorWritings` is used because books and authors have a many-to-many relationship.
- `Settings` centralizes the borrowing period and daily fine rate so these values can be changed in one place.

## File Overview

- `DDL.sql` creates the schema.
- `DML.sql` loads sample records.
- `View.sql` defines reporting views.
- `ERD-Project 2 - Simple Library.drawio.svg` shows the entity relationship diagram.
- `Relational Schema - Project 2 - Simple Library.drawio.svg` shows the relational schema.
