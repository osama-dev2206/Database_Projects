USE [Simple_Library];
GO

-- 1. Insert 3 Users
INSERT INTO Users (UserID, Name, UserLibraryNum)
VALUES 
	(1, 'Alice Smith', 'L001'),
	(2, 'Bob Johnson', 'L002'),
	(3, 'Charlie Brown', 'L003');
GO

-- 2. Insert 3 Authors
INSERT INTO Authors (AuthorName, DateOfBirth, Email)
VALUES 
	('George Orwell', '1903-06-25', 'orwell@example.com'),
	('J.K. Rowling', '1965-07-31', 'rowling@example.com'),
	('J.R.R. Tolkien', '1892-01-03', 'tolkien@example.com');
GO

-- 3. Insert 3 Books
INSERT INTO Books (Title, ISBN, PublicationDate, Genre)
VALUES 
	('1984', '978-0451524935', '1949-06-08', 'Dystopian'),
	('Harry Potter and the Sorcerer''s Stone', '978-0439708180', '1997-06-26', 'Fantasy'),
	('The Hobbit', '978-0547928227', '1937-09-21', 'Fantasy');
GO

-- 4. Connect Authors to Books (AuthorWritings)
-- Using IDENT_CURRENT to get the most recent Identity IDs inserted if we assume clean insert,
-- Or referencing by exact subqueries / assumed IDs (1, 2, 3 for 3 recent inserts).
INSERT INTO AuthorWritings (AuthorWriterID, WritingBookID)
VALUES 
	((SELECT AuthorID FROM Authors WHERE AuthorName = 'George Orwell'), 
	 (SELECT BooKID FROM Books WHERE Title = '1984')),
	((SELECT AuthorID FROM Authors WHERE AuthorName = 'J.K. Rowling'), 
	 (SELECT BooKID FROM Books WHERE Title = 'Harry Potter and the Sorcerer''s Stone')),
	((SELECT AuthorID FROM Authors WHERE AuthorName = 'J.R.R. Tolkien'), 
	 (SELECT BooKID FROM Books WHERE Title = 'The Hobbit'));
GO

-- 5. Insert 3 Book Copies
INSERT INTO BookCopies (AvailabilityStatus, OriginalBookID)
VALUES 
	('Checked Out', (SELECT BooKID FROM Books WHERE Title = '1984')),
	('Checked Out', (SELECT BooKID FROM Books WHERE Title = 'Harry Potter and the Sorcerer''s Stone')),
	('Checked Out', (SELECT BooKID FROM Books WHERE Title = 'The Hobbit'));
GO

-- 6. Connect Users to Book Copies (BorrowingRecords)
INSERT INTO BorrowingRecords (BorrowingUserId, BorrowingBookCopyId, BorrowDate, DueDate)
VALUES 
	(1, (SELECT TOP 1 CopyID FROM BookCopies WHERE OriginalBookID = (SELECT BooKID FROM Books WHERE Title = '1984')), GETDATE(), DATEADD(day, 14, GETDATE())),
	(2, (SELECT TOP 1 CopyID FROM BookCopies WHERE OriginalBookID = (SELECT BooKID FROM Books WHERE Title = 'Harry Potter and the Sorcerer''s Stone')), GETDATE(), DATEADD(day, 14, GETDATE())),
	(3, (SELECT TOP 1 CopyID FROM BookCopies WHERE OriginalBookID = (SELECT BooKID FROM Books WHERE Title = 'The Hobbit')), GETDATE(), DATEADD(day, 14, GETDATE()));
GO

