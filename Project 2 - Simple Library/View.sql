create View AuthorBooks
As
Select Authors.AuthorName , Books.Title 
From AuthorWritings 
Inner Join Authors 
ON AuthorWritings.AuthorWriterID = Authors.AuthorID 
Inner Join Books 
ON Books.BooKID = AuthorWritings.WritingBookID;

Create View FullUserInfo
As 
Select Users.Name , Users.UserLibraryNum , Email.Email , Phones.PhoneNumber , 
Fine.FineAmount , Fine.PaymentStatus , Fine.NumberOfLateDays
From Users
Inner Join Email ON
Email.UserEmailID = Users.UserID
Inner Join Phones ON
Phones.UserPhoneID = Users.UserID
Inner Join Fine ON
Fine.UserFineId = Users.UserID;