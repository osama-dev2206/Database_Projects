--create Database Simple_Library ; 
use  Simple_Library ;

-- Authors 
Create Table Authors
(
AuthorID Int not null identity(1,1)
Constraint PK_AuthorId Primary Key  ,
AuthorName varchar(50) not null , 
DateOfBirth Date not null , 
Email varchar(50) not null 
);

-- Books 
Create Table Books
(
BooKID int not null identity(1,1)
Constraint PK_BookID Primary Key 
,
Title varchar(100) not null 
,
ISBN varchar(50) not null
Constraint UQ_ISBN Unique(ISBN)
, 
PublicationDate Date not null , 
Genre varchar(50) not null ,
AdditionalDetails varchar(max) null 
);

-- Author Writings ( Junction Table)
create Table AuthorWritings
(
AuthorWritingId int not null identity(1,1) 
Constraint PK_AuthorWrintings Primary Key 
,
AuthorWriterID int not null 
Constraint FK_AuthorWriterID Foreign Key
References Authors(AuthorID) 
,
WritingBookID int not null 
Constraint FK_WritingBookID Foreign Key
References Books(BookID) 
);



-- Each Book Has Many Copies 
Create Table BookCopies
(
CopyID int identity(1,1)  not null 
Constraint PK_CopyID Primary Key 
,
AvailabilityStatus bit null 
,
OriginalBookID int not null 
Constraint FK_OriginalBookID Foreign Key 
References Books(BookID) 
);

-- Settings Table 
Create Table Settings
(
AllowedBorrowDays int  ,
TheFineAmountPerDay int 
);
Insert Into Settings values(3,5) 

-- Users 
Create Table Users
(
UserID int not null Primary Key ,
Name varchar(100)  not null ,
UserLibraryNum int not null 
Unique
);

-- Phone & Email are associate with user
Create Table Phones 
(
PhoneID int not null Primary Key , 
PhoneNumber char(11) not null ,
UserPhoneID int not null Foreign Key
References Users(UserID) 
)

Create Table Email 
(
EmailID int not null Primary Key , 
Email varchar(50) not null ,
UserEmailID int not null Foreign Key
References Users(UserID) 
)

-- Borrowing Records 
create Table  BorrowingRecords 
(
BorrowID int not null identity(1,1) 
Constraint PK_BRID Primary Key
,
DueDate date 
,
ActualReturnDate Date null 
,
BorrowDate Date not null 
,
BorrowingUserId int null 
Foreign Key References Users(UserID) 
,
BorrowingBookCopyId int null 
Foreign Key References BookCopies(CopyID)
);

Create Table Fine 
(
FineID Int not null 
Primary Key , 
FineBorrowId int null Foreign Key 
References BorrowingRecords(BorrowID) 
,
UserFineId int null Foreign Key 
References Users(UserID) 
,
FineAmount int null ,
PaymentStatus bit null ,
NumberOfLateDays tinyint null 
);


Create Table Reservations
(
ReservationId int not null Primary Key ,
UserReservationID int  null Foreign Key
References Users(UserID) ,
ReservationCopyBookID int null Foreign Key
References BookCopies(CopyID) ,
ReservatioinDateTime DateTime 
);
