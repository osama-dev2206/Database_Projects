--- DDL 
if Not Exists (Select * from sys.databases where name = 'Simple_Clinic')
Begin
create Database Simple_Clinic 
END 
use Simple_Clinic ; 

-- Person 
create Table Person
(
PersonId int identity(1,1) not null 
Constraint PK_PersonId Primary Key ,

Name varchar(100) not null , 
DateOfBirth Date not null , 
Gender char(1) not null , 
Address varchar(200) not null 
);

-- phone is associated with person 
create Table Phone 
(
PhoneId int Identity(1,1) not null 
Constraint PK_PhoneId Primary Key , 
PhoneNumber char(11) not null ,
PersonId int not null 
Constraint Fk_PhonePersonId Foreign Key 
references Person(PersonId)
);

-- Email Is associated with person 
create Table Email
(
EmailId int identity(1,1) not null 
Constraint PK_EmailId Primary Key ,
Email varchar(100) not null ,
PersonId int not null 
Constraint Fk_EmailPersonId Foreign Key 
references Person(PersonId)

);

-- Doctor Is-A Person 
create Table Doctor 
(
DoctorId int identity(1,1) not null
Constraint Pk_DoctorId Primary Key ,
Specialization varchar(200) not null , 
PersonId int not null 
Constraint Fk_DoctorAsPersonId Foreign Key 
references Person(PersonId)
);

-- Patient Is-A Person 
create Table Patient 
(
PatientId int not null identity(1,1) 
constraint PK_PatientId Primary Key ,
PersonId int not null 
Constraint Fk_PatientAsPersonId Foreign Key 
references Person(PersonId)
);

-- Medical Record 
Create Table MedicalRecord 
(
MedicalRecordId int not null identity(1,1) 
Constraint PK_MedicalRecordId Primary Key ,
Diagnosis varchar(1000) null ,
AdditionalNotes varchar(1000) null , 
DescriptionOfVisit varchar(1000) null
);

--- Perscription 
create Table Prescription 
(
PrescriptionId int not null identity(1,1) 
Constraint PK_PrescriptionId Primary Key ,

MedicalId int not null Constraint 
Fk_MedicalId Foreign Key 
References MedicalRecord(MedicalRecordId) 
,
Freq int null , 
StartDate date not null , 
EndDate date null ,
SpecialInstructions varchar(1000) null , 
MedicalName varchar(1000) not null ,
Dosage varchar(1000) not null ,
Constraint UQ_MedicalId Unique(MedicalId) 
);

-- Payment 
create Table Payment 
(
PaymentId int identity(1,1) not null 
Constraint PK_PaymentId Primary Key , 
PaymentMethod varchar(50) not null  ,
PaymentDate date not null , 
AdditionalNotes varchar(1000) null ,
AmountPaid int not null 
);

--- Appointment 
Create Table Appointment
(
AppointmentId int not null identity(1,1) 
Constraint PK_AppointmentId Primary Key 
,
DoctorId int not NUll Constraint FK_DoctorIdAppointment 
Foreign Key References Doctor(DoctorId)  
,
PatientId int not null Constraint Fk_PatientIdAppointment 
Foreign Key References Patient(PatientId) 
,
PaymentId int not null Constraint Fk_PaymentIdAppointment
Foreign Key References Payment(PaymentId)
,
MedicalRecordId int not null Constraint Fk_MedicalRecordIdAppointment
Foreign Key References MedicalRecord(MedicalRecordId)
,
AppointmentDateTime dateTime not null ,
AppoitmentStatus varchar(50) not null 
Constraint CHK_AppointmentStatus
check(
AppoitmentStatus in 
('Pending','Confrimed','Completed','Cancelled','Reschduled' , 'NoShow' ) 
)

);