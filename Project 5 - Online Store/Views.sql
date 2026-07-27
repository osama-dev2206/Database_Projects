create View FullProdcutDetails as
Select Products.ProductName , Products.Price ,
Products.QuantityInStock , ProductCategories.CategoryName ,
Reviews.RatingScore 
From Products
Inner Join ProductCategories on
Products.ProductCategoryId = ProductCategories.CategoryID
Inner Join Reviews 
On ReviewProductId = Products.ProductID

Create View FullOrderDetails as
Select Orders.OrderId , Customers.CustomerName ,
Orders.OrderDateTime , Orders.ShippingMethod ,
Shippings.ShippingCarrierName , ShippingStatuses.CurrentShippingStatus
From Orders 
Inner Join Customers
On Customers.CustomerId = Orders.OrderedCustomerId 
Inner Join Shippings
On ShippingId =  ShippingOrderId
Inner Join ShippingStatuses 
On ShippingId = ShippingStatuses.ShippingStatusId; 

create View CustomerOrderItemsDetails as
Select Orders.OrderNumber , Customers.CustomerName , Orders.OrderDateTime ,
Products.ProductName , 
OrderItems.QuantityOrdered , OrderItems.TotalItemsPrice ,
CurrentShippingStatus
From Orders
Inner Join Customers On Customers.CustomerId = Orders.OrderedCustomerId 
Inner Join OrderItems ON OrderOfProductsId = Orders.OrderId 
Inner Join Shippings ON Orders.ShippingOrderId = Shippings.ShippingId
Inner Join ShippingStatuses 
ON Shippings.StatusOfShippingId = ShippingStatuses.ShippingStatusId
Inner Join Products ON
Products.ProductID = OrderItems.ItemProductId ;


Create View  OrderPayment as
Select PaymentTransactions.PaymentMethod ,
PaymentTransactions.TransactionDateTime , Orders.OrderNumber ,
Products.ProductName , OrderItems.QuantityOrdered ,
OrderItems.TotalItemsPrice , Customers.CustomerName
From Orders 
Inner Join PaymentTransactions 
On PaymentTransactionId = PaymentId 
Inner Join OrderItems On 
OrderItems.OrderOfProductsId = Orders.OrderId 
Inner Join Products On
OrderItems.ItemProductId = Products.ProductID 
Inner Join Customers ON
Orders.OrderedCustomerId = Customers.CustomerId;


