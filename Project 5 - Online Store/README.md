# Online Store Database Project 

This project is a relational database design for an online store management system. It covers the core workflows needed to manage products, customers, orders, payments, shipping, and reviews.

The database is implemented with SQL scripts:

- `DDL.sql` creates the tables, keys, and constraints.
- `DML.sql` inserts sample data for products, customers, orders, order items, reviews, shippings, and payments.
- `Views.sql` creates reusable views for reporting and joined details.

## Index

- [Overview](#overview)
- [Requirements Coverage](#requirements-coverage)
  - [1. Product Catalog Management](#1-product-catalog-management)
  - [2. Customer Information](#2-customer-information)
  - [3. Order Information](#3-order-information)
  - [4. Payment Transaction](#4-payment-transaction)
  - [5. Shipping](#5-shipping)
  - [6. Reviews and Ratings](#6-reviews-and-ratings)
- [Database Diagrams](#database-diagrams)
  - [ERD](#erd)
  - [Relational Schema](#relational-schema)
- [Database Structure](#database-structure)
- [Views](#views)
- [Sample Data Included](#sample-data-included)
- [How the System Works](#how-the-system-works)

## Overview

The concept of the project is to model a complete online retail workflow where:

- the store manages a catalog of products organized by categories,
- customers can register and maintain their shipping and contact details,
- customers can place orders containing one or more products,
- payments are processed for each order,
- orders are shipped and tracked through various statuses,
- and customers can leave reviews and ratings for products they purchased.

## Requirements Coverage

### 1. Product Catalog Management

The schema stores product catalog details in `Products`, `ProductCategories`, and `Images`.

- `Products` stores the main information like product name, description, price, and quantity in stock.
- `ProductCategories` allows grouping products logically.
- `Images` stores multiple URLs and display order for product images.

### 2. Customer Information

Customer data is managed in `Customers`.

- It stores details such as customer name, shipping address, contact notes, email, phone number, and login credentials (username and password).

### 3. Order Information

Orders and their lifecycle are handled in `Orders`, `OrderItems`, and `OrderStatuses`.

- `Orders` acts as the main hub linking the customer, order date, total amount, shipping method, and links to payment and shipping records.
- `OrderItems` stores the specific products, quantities, and prices for each order.
- `OrderStatuses` manages the status lifecycle (e.g., Pending, Processing, Shipped, Delivered, Cancelled, Refunded).

### 4. Payment Transaction

Payment details are stored in `PaymentTransactions`.

- It captures the payment method, and the date/time of the transaction.
- The transaction record is linked to the `Orders` table.

### 5. Shipping

Shipping and logistics details are captured in `Shippings` and `ShippingStatuses`.

- `Shippings` stores details like carrier name, tracking number, estimated delivery date, actual delivery date, and notes.
- `ShippingStatuses` tracks the current state of shipping (Processing, Out for Delivery, Delivered, Return to Sender, On Hold, Delayed, Lost) along with timestamps.

### 6. Reviews and Ratings

Customer feedback on products is handled in `Reviews`.

- It acts as a junction storing reviews for products left by customers.
- It includes the review text, rating score (1 to 5), and the date and time of the review.

## Database Diagrams

### ERD

![ERD diagram](ERD%20-%20Project%205%20-%20Online%20Store.drawio.svg)

### Relational Schema

![Relational schema diagram](Relational%20Schema%20-%20%20Project%205%20-%20Online%20Store.drawio.svg)

## Database Structure

### `ProductCategories`

Stores categories for grouping products.

Fields:

- `CategoryID` primary key
- `CategoryName`

### `Products`

Stores details about items available for sale.

Fields:

- `ProductID` primary key
- `Price`
- `Description`
- `ProductName`
- `AdditionalDetails`
- `QuantityInStock`
- `ProductCategoryId` foreign key to `ProductCategories`

### `Images`

Stores product images.

Fields:

- `ImageId` primary key
- `ImageUrl`
- `ImageProductId` foreign key to `Products`
- `ImageOrder`
- `ImageDescription`

### `Customers`

Stores registered customer information.

Fields:

- `CustomerId` primary key
- `ShippingAddress`
- `ContactNotesDetails`
- `CustomerName`
- `Email` unique
- `username` unique
- `password`
- `Phone` unique

### `Reviews`

Stores customer reviews and ratings for products.

Fields:

- `ReviewId` primary key
- `ReviewText`
- `RatingScore` (constrained to 1, 2, 3, 4, or 5)
- `ReviewDateTime`
- `ReviewCustomerId` foreign key to `Customers`
- `ReviewProductId` foreign key to `Products`

### `OrderStatuses`

Stores possible statuses for an order.

Fields:

- `OrderStatusId` primary key
- `OrderStatus` unique

### `PaymentTransactions`

Stores payment information.

Fields:

- `PaymentTransactionId` primary key
- `PaymentMethod`
- `TransactionDateTime`

### `ShippingStatuses`

Stores predefined statuses for shipping progress.

Fields:

- `ShippingStatusId` primary key
- `CurrentShippingStatus` unique
- `ShippingStatusStartDateTime`
- `ShippingStatusEndDateTime`

### `Shippings`

Stores shipping and logistics tracking information.

Fields:

- `ShippingId` primary key
- `EstimatedDeliveryDate`
- `ActualDeliveryDate`
- `ShippingCarrierNotes`
- `ShippingCarrierName`
- `TrackingNumber` unique
- `StatusOfShippingId` foreign key to `ShippingStatuses`

### `Orders`

Stores the main customer order linking to payments and shippings.

Fields:

- `OrderId` primary key
- `OrderedCustomerId` foreign key to `Customers`
- `OrderDateTime`
- `OrderNumber` unique
- `TotalAmount`
- `ShippingMethod`
- `StatusId` foreign key to `OrderStatuses`
- `PaymentId` foreign key to `PaymentTransactions`
- `ShippingOrderId` foreign key to `Shippings`

### `OrderItems`

Stores the individual products and quantities in an order.

Fields:

- `OrderItemId` primary key
- `ItemProductId` foreign key to `Products`
- `OrderOfProductsId` foreign key to `Orders`
- `QuantityOrdered`
- `TotalItemsPrice`
- `PriceForProduct`

## Views

### `FullProdcutDetails`

Returns each product combined with its category and review rating score.

Useful for:

- retrieving comprehensive product listings for the storefront,
- seeing stock quantity and ratings together.

### `FullOrderDetails`

Returns order summary combined with customer name and shipping status.

Useful for:

- customer order history tracking,
- viewing order timestamps and carrier details at a glance.

### `CustomerOrderItemsDetails`

Returns a detailed breakdown of items within customer orders.

Useful for:

- analyzing specific products bought by a customer,
- seeing quantities and prices alongside order numbers and shipping status.

### `OrderPayment`

Returns a comprehensive view of payment details joined with ordered items and customers.

Useful for:

- financial reporting and invoicing,
- linking transaction times, methods, and customer names to exact products ordered.

## Sample Data Included

The `DML.sql` file seeds the database with:

- 10 categories,
- 10 products and their images,
- 10 customers,
- 10 reviews,
- 10 order statuses,
- 10 payment transactions,
- 10 shipping statuses,
- 10 shippings,
- 10 orders,
- and 10 order items.

This makes it easier to test joins, views, and store workflows immediately after running the scripts.

## How the System Works

1. Products are organized into `ProductCategories` and added to `Products` along with their `Images`.
2. A customer registers and their details are stored in `Customers`.
3. The customer places an order, creating an entry in `Orders`.
4. The specific products purchased are recorded in `OrderItems`, linked to the order.
5. Payment is processed and recorded in `PaymentTransactions`.
6. A shipping record is generated in `Shippings` to track logistics, with its status updated in `ShippingStatuses`.
7. Order progress is tracked by linking the order to `OrderStatuses`.
8. After purchase, the customer can leave a rating and text in `Reviews` for the products they bought.

## Design Notes

- The `Reviews` table uses a check constraint on `RatingScore` to restrict it to values between 1 and 5.
- Unique constraints are heavily utilized across tables to maintain data integrity (e.g., `Customers.Email`, `Customers.username`, `Orders.OrderNumber`, `Shippings.TrackingNumber`).
- The `Orders` table acts as a central hub linking the customer, order status, payment, and shipping.

## File Overview

- `DDL.sql` creates the schema.
- `DML.sql` loads sample records.
- `Views.sql` defines reporting views.
- `ERD - Project 5 - Online Store.drawio.svg` shows the entity relationship diagram.
- `Relational Schema -  Project 5 - Online Store.drawio.svg` shows the relational schema.
- `Online_Store Database .bak` contains the existing database backup.
