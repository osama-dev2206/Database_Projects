/* ===========================================================
   ProductCategories
=========================================================== */
INSERT INTO ProductCategories (CategoryName)
VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home & Kitchen'),
('Sports'),
('Beauty'),
('Toys'),
('Groceries'),
('Furniture'),
('Accessories');


/* ===========================================================
   Products
=========================================================== */
INSERT INTO Products
(Price, Description, ProductName, AdditionalDetails, QuantityInStock, ProductCategoryId)
VALUES
(1200.00,'Android Smartphone','Samsung Galaxy A55','8GB RAM, 256GB',50,1),
(35.99,'Cotton T-Shirt','Basic T-Shirt','100% Cotton',120,2),
(15.50,'Programming Book','Learn SQL','Second Edition',80,3),
(89.99,'Microwave Oven','LG Microwave','20 Liter Capacity',25,4),
(45.00,'Football','Adidas Football','FIFA Approved',40,5),
(22.75,'Face Wash','Nivea Face Wash','For All Skin Types',90,6),
(18.99,'Toy Car','Remote Car','Rechargeable Battery',60,7),
(5.99,'Olive Oil','Extra Virgin Olive Oil','500ml Bottle',100,8),
(250.00,'Office Chair','Ergonomic Chair','Adjustable Height',15,9),
(49.99,'Backpack','Travel Backpack','Water Resistant',70,10);


/* ===========================================================
   Images
=========================================================== */
INSERT INTO Images
(ImageUrl, ImageProductId, ImageOrder, ImageDescription)
VALUES
('images/a55.jpg',1,1,'Front View'),
('images/shirt.jpg',2,1,'Product Image'),
('images/sqlbook.jpg',3,1,'Book Cover'),
('images/microwave.jpg',4,1,'Front View'),
('images/football.jpg',5,1,'Official Ball'),
('images/facewash.jpg',6,1,'Bottle'),
('images/toycar.jpg',7,1,'Toy Car'),
('images/oliveoil.jpg',8,1,'Bottle'),
('images/chair.jpg',9,1,'Office Chair'),
('images/backpack.jpg',10,1,'Travel Backpack');


/* ===========================================================
   Customers
=========================================================== */
INSERT INTO Customers
(ShippingAddress, ContactNotesDetails, CustomerName, Email, Username, Password, Phone)
VALUES
('Cairo','VIP Customer','Ahmed Ali','ahmed@gmail.com','ahmed1','pass123','01000000001'),
('Giza',NULL,'Sara Mohamed','sara@gmail.com','sara2','pass123','01000000002'),
('Alexandria','Leave at door','Omar Hassan','omar@gmail.com','omar3','pass123','01000000003'),
('Mansoura',NULL,'Mona Adel','mona@gmail.com','mona4','pass123','01000000004'),
('Tanta',NULL,'Youssef Samy','youssef@gmail.com','youssef5','pass123','01000000005'),
('Zagazig','Call before delivery','Nada Ibrahim','nada@gmail.com','nada6','pass123','01000000006'),
('Ismailia',NULL,'Mahmoud Tarek','mahmoud@gmail.com','mahmoud7','pass123','01000000007'),
('Port Said',NULL,'Salma Khaled','salma@gmail.com','salma8','pass123','01000000008'),
('Aswan','Fragile items','Karim Adel','karim@gmail.com','karim9','pass123','01000000009'),
('Luxor',NULL,'Aya Mostafa','aya@gmail.com','aya10','pass123','01000000010');


/* ===========================================================
   Reviews
=========================================================== */
INSERT INTO Reviews
(ReviewText, RatingScore, ReviewCustomerId, ReviewProductId)
VALUES
('Excellent phone',5,1,1),
('Very comfortable',4,2,2),
('Helpful book',5,3,3),
('Works perfectly',4,4,4),
('Great quality',5,5,5),
('Good product',4,6,6),
('Kids love it',5,7,7),
('Fresh and tasty',5,8,8),
('Comfortable chair',4,9,9),
('Nice backpack',5,10,10);


/* ===========================================================
   OrderStatuses
=========================================================== */
INSERT INTO OrderStatuses (OrderStatus)
VALUES
('Pending'),
('Confirmed'),
('Processing'),
('Packed'),
('Shipped'),
('Out For Delivery'),
('Delivered'),
('Cancelled'),
('Returned'),
('Refunded');


/* ===========================================================
   PaymentTransactions
=========================================================== */
INSERT INTO PaymentTransactions
(PaymentMethod)
VALUES
('Credit Card'),
('Cash'),
('PayPal'),
('Debit Card'),
('Apple Pay'),
('Google Pay'),
('Credit Card'),
('Cash'),
('Debit Card'),
('PayPal');


/* ===========================================================
   ShippingStatuses
=========================================================== */
INSERT INTO ShippingStatuses
(CurrentShippingStatus, ShippingStatusStartDateTime, ShippingStatusEndDateTime)
VALUES
('Preparing','2026-07-01',NULL),
('Packed','2026-07-02',NULL),
('Shipped','2026-07-03',NULL),
('In Transit','2026-07-04',NULL),
('Out For Delivery','2026-07-05',NULL),
('Delivered','2026-07-06','2026-07-06'),
('Cancelled','2026-07-07','2026-07-07'),
('Returned','2026-07-08','2026-07-09'),
('Delayed','2026-07-10',NULL),
('Awaiting Pickup','2026-07-11',NULL);


/* ===========================================================
   Shippings
=========================================================== */
INSERT INTO Shippings
(EstimatedDeliveryDate, ActualDeliveryDate,
ShippingCarrierNotes, ShippingCarrierName,
TrackingNumber, StatusOfShippingId)
VALUES
('2026-07-10','2026-07-09',NULL,'DHL','TRK1001',6),
('2026-07-11',NULL,NULL,'FedEx','TRK1002',5),
('2026-07-12',NULL,'Delayed','UPS','TRK1003',9),
('2026-07-13',NULL,NULL,'Aramex','TRK1004',4),
('2026-07-14',NULL,NULL,'DHL','TRK1005',3),
('2026-07-15',NULL,NULL,'FedEx','TRK1006',2),
('2026-07-16',NULL,NULL,'UPS','TRK1007',1),
('2026-07-17',NULL,NULL,'Aramex','TRK1008',10),
('2026-07-18',NULL,NULL,'DHL','TRK1009',7),
('2026-07-19',NULL,NULL,'FedEx','TRK1010',8);


/* ===========================================================
   Orders
=========================================================== */
INSERT INTO Orders
(OrderedCustomerId, OrderNumber, TotalAmount,
ShippingMethod, StatusId, PaymentId, ShippingOrderId)
VALUES
(1,'ORD1001',1200.00,'Express',7,1,1),
(2,'ORD1002',35.99,'Standard',5,2,2),
(3,'ORD1003',15.50,'Express',2,3,3),
(4,'ORD1004',89.99,'Standard',3,4,4),
(5,'ORD1005',45.00,'Express',4,5,5),
(6,'ORD1006',22.75,'Standard',1,6,6),
(7,'ORD1007',18.99,'Standard',2,7,7),
(8,'ORD1008',5.99,'Express',5,8,8),
(9,'ORD1009',250.00,'Express',8,9,9),
(10,'ORD1010',49.99,'Standard',9,10,10);


/* ===========================================================
   OrderItems
=========================================================== */
INSERT INTO OrderItems
(ItemProductId, OrderOfProductsId, QuantityOrdered,
TotalItemsPrice, PriceForProduct)
VALUES
(1,1,1,1200.00,1200.00),
(2,2,1,35.99,35.99),
(3,3,1,15.50,15.50),
(4,4,1,89.99,89.99),
(5,5,1,45.00,45.00),
(6,6,1,22.75,22.75),
(7,7,1,18.99,18.99),
(8,8,1,5.99,5.99),
(9,9,1,250.00,250.00),
(10,10,1,49.99,49.99);

