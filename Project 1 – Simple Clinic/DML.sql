insert Into Person (Name, DateOfBirth, Gender, Address)
values ('John Doe', '1985-07-15', 'M', '123 Main St, Anytown, USA');

insert Into Person (Name, DateOfBirth, Gender, Address)
values ('Jane Smith', '1990-03-22', 'F', '456 Oak St, Othertown, USA');

insert Into Phone (PhoneNumber, PersonId)
values ('555-1234', (select PersonId from Person where Name = 'John Doe'));
insert Into Phone (PhoneNumber, PersonId)
values ('555-5678', (select PersonId from Person where Name = 'Jane Smith'));

Insert Into Email (Email, PersonId)
values('jh@gmail.com', (select PersonId from Person where Name = 'John Doe'));

Insert Into Email (Email, PersonId)
values('Janeee@gmail.com', (select PersonId from Person where Name = 'Jane Smith'));

Insert Into Patient(PersonId)
values ( (Select PersonId From Person where Name = 'John Doe') );

Insert Into Doctor(PersonId,Specialization)
values ( (Select PersonId From Person where Name = 'Jane Smith'),'Nervous System' );

Insert Into Appointment (DoctorId, PatientId, PaymentId, MedicalRecordId,
AppointmentDateTime, AppoitmentStatus)
values ( (Select DoctorId From Doctor where PersonId = (Select PersonId From Person where Name = 'Jane Smith')),
		 (Select PatientId From Patient where PersonId = (Select PersonId From Person where Name = 'John Doe')),
		 NULL, NULL, '2024-07-01 10:00:00', 'Scheduled' );

Insert Into MedicalRecord (Diagnosis, AdditionalNotes, DescriptionOfVisit)
values ('Migraine', 'Patient reports severe headaches', 
'Initial consultation for recurring migraines');

Insert Into Payment (PaymentMethod, PaymentDate, AdditionalNotes, AmountPaid)
values ('Credit Card', '2024-07-01', 'Paid in full', 150);

Insert Into Prescription (MedicalId, Freq, StartDate, EndDate, SpecialInstructions, MedicalName, Dosage)
values ( (Select MedicalRecordId From MedicalRecord where Diagnosis = 'Migraine'), 2, '2024-07-01', '2024-07-15', 'Take with food', 'Ibuprofen', '200mg' );

Insert Into Appointment (ADoctorId, APatientId, APaymentId, AMedicalRecordId,
AppointmentDateTime, AppoitmentStatus)
values ( (Select DoctorId From Doctor where DoctorPersonId = (Select PersonId From Person where Name = 'Jane Smith')),
		 (Select PatientId From Patient where PatientPersonId = (Select PersonId From Person where Name = 'John Doe')),
		 (Select PaymentId From Payment where PaymentDate = '2024-07-01'), 
		 (Select MedicalRecordId From MedicalRecord where Diagnosis = 'Migraine'),
		 '2024-07-01 10:00:00', 'Completed' );


