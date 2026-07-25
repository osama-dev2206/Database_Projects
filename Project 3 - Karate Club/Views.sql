Create View MemberDetails AS
Select Persons.Name , Persons.Address , 
	   Members.EmergencyContactName , 
	   Members.IsActive , 
	   BeltRanks.BeltRankName , 
	   BeltRanks.TestFee , 
	   Emails.EmailAddress , 
	   Phones.PhoneNumber
	   From Persons 
	   Inner Join Members ON Persons.PersonId = Members.MemberPersonId 
	   Inner Join BeltRanks ON Members.BeltRankId = BeltRanks.BeltRankId
	   Inner Join Emails ON Persons.PersonId = Emails.PersonEmailId
	   Inner Join Phones ON Persons.PersonId = Phones.PersonPhoneId ;

	   create View InstructorDetails AS
	   Select  Instructors.InstructorId , 
	    Persons.Name,Persons.Address
	   ,Qualifications.QualificationName
	   , Emails.EmailAddress ,
	   Phones.PhoneNumber 

	   From Instructors
	   INNER JOin Persons ON Persons.PersonId = Instructors.PersonInstructorId
	   Inner Join Qualifications ON Qualifications.InstructorQualificationId 
	   = Instructors.InstructorId
	   Inner JOIN Emails ON Persons.PersonId = Emails.PersonEmailId
	   Inner Join Phones ON Persons.PersonId = Phones.PersonPhoneId ;


	   create View MemberNames AS

	   Select Members.MemberId,Persons.Name AS MemberName
	   From Members
	   Inner Join Persons On Persons.PersonId = Members.MemberPersonId ;

	   Create View InstructorNames AS
	   Select Instructors.InstructorId,Persons.Name AS InstructorName
	   From Instructors
	   Inner Join Persons On PersonId = Instructors.PersonInstructorId ;

	   Create View  MemberBeltRanks AS
	   Select BeltRanks.BeltRankId ,BeltRanks.BeltRankName ,

	   MemberNames.MemberId,MemberNames.MemberName 
	   From MemberNames
	   Inner Join Members ON Members.MemberId = MemberNames.MemberId 
	   Inner Join BeltRanks ON Members.BeltRankId = BeltRanks.BeltRankId ;
	  
	  Create view CountByBeltRanks
	  AS 
	  Select MemberBeltRanks.BeltRankId,MemberBeltRanks.BeltRankName ,
	  COUNT(*) AS [Count Of Members In Rank]
	  From MemberBeltRanks 
	  Group by BeltRankId 
	  ,BeltRankName; 


Create View MemberSubscriptions As 
Select Subscriptions.SupscriptionId , MemberNames.MemberName , Subscriptions.Fees
From Subscriptions
Inner Join MemberNames ON MemberNames.MemberId = Subscriptions.SMemberId ;

Create View MembersPaymentStatus As
Select Payments.PaymentId ,MemberNames.MemberName , Payments.Amount , Payments.Date ,
Payment_Status =
Case
 When Payments.PaymentStatus=0 Then 'Didnot Pay'
 When  Payments.PaymentStatus=1 Then 'Paid'
End
From Payments 
Inner Join MemberNames ON
Payments.PMemberId = MemberNames.MemberId ; 

