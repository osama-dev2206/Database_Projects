-- Index
create Index INDX_NameOfPerson 
On Person(Name,Gender);

create Index INDX_DoctorSpecialization
On Doctor (Specialization);

create Index INDX_AppointmentStatus
on Appointment(AppoitmentStatus,DoctorId,PatientId,MedicalRecordId);


