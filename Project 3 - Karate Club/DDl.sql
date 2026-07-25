
create table Persons
(
PersonId int primary key identity(1,1),
Name nvarchar(100) not null,
Address nvarchar(255) null
);
create Table Emails
(
EmailId int primary key identity(1,1),
EmailAddress varchar(50) not null,
PersonEmailId int foreign key references Persons(PersonId)
);

Create Table Phones
(
PhoneId int primary key identity(1,1),
PhoneNumber char(15) not null Unique,
PersonPhoneId int foreign key references Persons(PersonId)
);

-- Belt Rank 
create Table BeltRanks
(
BeltRankId int primary key identity(1,1),
BeltRankName nvarchar(50) not null,
TestFee smallmoney not null,
);

-- Member Is-A Person
create Table Members
(
MemberId int primary key identity(1,1),
MemberPersonId int not null unique
Foreign Key References Persons(PersonId) ,
EmergencyContactName nvarchar(MAX)  null,
IsActive bit null Default 1 ,
BeltRankId int foreign key references BeltRanks(BeltRankId)
);

-- Instructor Is-A Member
create Table Instructors
(
InstructorId int primary key identity(1,1),
PersonInstructorId int not null unique 
Foreign Key References Persons(PersonId)
);

create Table Qualifications
(
QualificationId int primary key identity(1,1),
InstructorQualificationId int not null foreign key references Instructors(InstructorId),
QualificationName nvarchar(100) not null
);

Create Table MemberInstructors
(
MemberInstructorId int primary key identity(1,1),
M_MemberId int not null foreign key references Members(MemberId),
M_InstructorId int not null foreign key references Instructors(InstructorId),
AssignDate date not null default GETDATE() ,
CONSTRAINT UQ_MemberInstructor UNIQUE(M_MemberId,M_InstructorId) 
);

Create Table Payments
(
PaymentId int primary key identity(1,1),
Amount smallmoney not null,
Date date not null default GETDATE(),
PaymentStatus bit not null default 1,
PMemberId int  null foreign key references Members(MemberId)
);

Create Table Subscriptions
(
SupscriptionId int primary key identity(1,1),
StartDate date not null default GETDATE(),
EndDate date null,
Fees int not null,
MemberShipStatus bit not null default 1,
SMemberId int not null 
Foreign Key References Members(MemberId) ,
SPaymentId int not null foreign key references Payments(PaymentId)
);

create Table BeltTests
(
TestId int primary key identity(1,1),
Result nvarchar(50) not null,
TestDate date not null default GETDATE(),
TestedByInstructorId int  null foreign key references Instructors(InstructorId),
TargetRankId int  null foreign key references BeltRanks(BeltRankId),
MemberTestedId int  null foreign key references Members(MemberId) , 
TestPaymentId int not null foreign key references Payments(PaymentId) ,

);


