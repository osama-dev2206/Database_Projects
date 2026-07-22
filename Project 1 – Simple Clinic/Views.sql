exec sp_rename 'Doctor.PersonId', 'DoctorPersonId', 'COLUMN';

create View DoctorsFullDetails as 
Select DoctorId , Name as DoctorName , DateOfBirth, Gender , Address
,Specialization
From Person
INNER JOIN Doctor ON Person.PersonId = Doctor.DoctorPersonId  ;


exec sp_rename 'Patient.PersonId', 'PatientPersonId', 'COLUMN';

create View PatientFullDetails as 
Select PatientId , Name as PatientName, DateOfBirth, Gender , Address 
From Person
INNER JOIN Patient ON Person.PersonId =Patient.PatientPersonId  ;


Select * from DoctorsFullDetails;
select * from PatientFullDetails;

create View AppointmentDetails as
Select
AppointmentId,
AppointmentDateTime, 
AppoitmentStatus, DoctorsFullDetails.DoctorName ,
PatientFullDetails.PatientName , 
Payment.PaymentMethod , 
Payment.AmountPaid  ,
MedicalRecord.Diagnosis


From Appointment 
Inner JOIN DoctorsFullDetails ON Appointment.ADoctorId = DoctorsFullDetails.DoctorId
INNER JOIN PatientFullDetails ON Appointment.APatientId = PatientFullDetails.PatientId 
INNER JOIN Payment ON Payment.PaymentId = Appointment.APaymentId
INNER JOIN MedicalRecord ON MedicalRecord.MedicalRecordId = Appointment.AMedicalRecordId;

Select * From AppointmentDetails  ;