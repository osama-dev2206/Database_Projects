Create Table ProductCategories 
(
CategoryID int not null primary key identity(1,1), 
CategoryName nvarchar(50) not null 
);

create Table Products 
(
ProductID int not null primary key identity(1,1),
Price Money not null, 
Description nvarchar(Max) not null,
ProductName nvarchar(50) not null,
AdditionalDetails nvarchar(MAX) null,
QuantityInStock int not null,
ProductCategoryId int not null 
Constraint Fk_ProductCategoryID 
Foreign Key References ProductCategories(CategoryID) 
);

Create Table Images
(
ImageId	int not null primary key identity(1,1), 
ImageUrl varchar(100) not null,
ImageProductId int not null 
Foreign Key References Products(ProductID) ,
ImageOrder smallint not null ,
ImageDescription nvarchar(255) null
);

create Table Customers 
(
CustomerId int not null Identity(1,1) Primary Key  , 
ShippingAddress nvarchar(Max) not null,
ContactNotesDetails nvarchar(300) null,
CustomerName nvarchar(100) not null,
Email varchar(50) not null unique,
username varchar(20) not null unique,
password varchar(50) not null ,
Phone char(11) not null unique 
);

-- Junction Table for Many-to-Many relationship between Customers and Reviews
create Table Reviews
(
ReviewId int not null primary key identity(1,1),
ReviewText nvarchar(300) not null,
RatingScore tinyInt not null 
Check (RatingScore in(1,2,3,4,5) ) ,
ReviewDateTime datetime not null default getdate(),
ReviewCustomerId int not null 
Foreign Key References Customers(CustomerId) , 
ReviewProductId int not null 
Foreign Key References Products(ProductID) 
);

create Table  OrderStatuses 
(
OrderStatusId int not null primary key identity(1,1),
OrderStatus nvarchar(100) not null unique
);

create Table PaymentTransactions 
(
PaymentTransactionId int not null primary key identity(1,1), 
PaymentMethod nvarchar(50) not null,
TransactionDateTime datetime not null default getdate()
);

create Table ShippingStatuses 
(
ShippingStatusId int not null primary key identity(1,1),
CurrentShippingStatus varchar(50) not null unique ,
ShippingStatusStartDateTime datetime not null , 
ShippingStatusEndDateTime datetime null
);
create Table Shippings
(
ShippingId int not null primary key identity(1,1),
EstimatedDeliveryDate datetime not null,
ActualDeliveryDate date null,
ShippingCarrierNotes nvarchar(300)  null,
ShippingCarrierName nvarchar(100) not null,
TrackingNumber varchar(20) not null unique,
StatusOfShippingId int not null Foreign Key 
References ShippingStatuses(ShippingStatusId)
);
create Table Orders 
(
OrderId int not null primary key identity(1,1), 
OrderedCustomerId int not null 
Foreign Key References Customers(CustomerId) ,
OrderDateTime datetime not null default getdate(),
OrderNumber varchar(100) not null unique,
TotalAmount Money not null,
ShippingMethod varchar(100) not null , 
StatusId int not null Foreign Key 
References OrderStatuses(OrderStatusId) ,
PaymentId int not null Foreign Key References 
PaymentTransactions(PaymentTransactionId) ,
ShippingOrderId int not null
Foreign Key References Shippings(ShippingId)
);


Create Table OrderItems
(
OrderItemId int not null primary key identity(1,1), 
ItemProductId int not null
Foreign Key References Products(ProductID) ,
OrderOfProductsId int not null 
Foreign Key References Orders(OrderId) ,
QuantityOrdered int not null,
TotalItemsPrice Money not null ,
PriceForProduct Money not null
);

