-- ============================================
-- TechStore Database
-- E-Commerce SQL Database Project
-- ============================================

CREATE DATABASE TechStore;
USE TechStore;

-- ============================================
-- 1. CUSTOMERS TABLE
-- ============================================

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    city VARCHAR(50),
    created_at DATE
);

-- ============================================
-- 2. PRODUCTS TABLE
-- ============================================

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- ============================================
-- 3. ORDERS TABLE
-- ============================================

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(30) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- ============================================
-- 4. ORDER ITEMS TABLE
-- ============================================

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- ============================================
-- INSERT CUSTOMERS
-- ============================================

INSERT INTO Customers
(first_name, last_name, email, phone, city, created_at)
VALUES
('Sarah', 'Mokoena', 'sarah@example.com', '0712345678', 'Johannesburg', '2026-01-10'),
('Daniel', 'Smith', 'daniel@example.com', '0723456789', 'Pretoria', '2026-01-15'),
('Lerato', 'Nkosi', 'lerato@example.com', '0734567890', 'Soweto', '2026-02-01'),
('Michael', 'Brown', 'michael@example.com', '0745678901', 'Durban', '2026-02-12'),
('Thandi', 'Dlamini', 'thandi@example.com', '0756789012', 'Cape Town', '2026-03-05');

-- ============================================
-- INSERT PRODUCTS
-- ============================================

INSERT INTO Products
(product_name, category, price, stock_quantity)
VALUES
('Laptop Pro 15', 'Laptops', 15999.99, 10),
('Wireless Mouse', 'Accessories', 399.99, 50),
('Mechanical Keyboard', 'Accessories', 899.99, 25),
('USB-C Hub', 'Accessories', 599.99, 30),
('Gaming Monitor 27"', 'Monitors', 4999.99, 15),
('Bluetooth Headphones', 'Audio', 1299.99, 20),
('Webcam HD', 'Accessories', 799.99, 18),
('External SSD 1TB', 'Storage', 1799.99, 12);

-- ============================================
-- INSERT ORDERS
-- ============================================

INSERT INTO Orders
(customer_id, order_date, status)
VALUES
(1, '2026-03-10', 'Completed'),
(2, '2026-03-12', 'Completed'),
(3, '2026-03-15', 'Pending'),
(4, '2026-03-18', 'Shipped'),
(5, '2026-03-20', 'Processing');

-- ============================================
-- INSERT ORDER ITEMS
-- ============================================

INSERT INTO Order_Items
(order_id, product_id, quantity)
VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(2, 6, 1),
(3, 5, 1),
(3, 4, 1),
(4, 8, 2),
(5, 7, 1),
(5, 2, 1);

-- ============================================
-- BASIC QUERIES
-- ============================================

-- Display all customers
SELECT * FROM Customers;

-- Display all products
SELECT * FROM Products;

-- Display products costing more than R1,000
SELECT * FROM Products WHERE price > 1000;

-- Display products with low stock
SELECT * FROM Products WHERE stock_quantity < 20;

-- ============================================
-- SORT PRODUCTS BY PRICE
-- ============================================

SELECT product_name, price FROM Products ORDER BY price DESC;

-- ============================================
-- CUSTOMER ORDERS
-- ============================================

SELECT
    Customers.first_name,
    Customers.last_name,
    Orders.order_id,
    Orders.order_date,
    Orders.status
FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- ============================================
-- ORDER DETAILS
-- ============================================

SELECT
    Orders.order_id,
    Products.product_name,
    Order_Items.quantity,
    Products.price,
    (Order_Items.quantity * Products.price) AS subtotal
FROM Order_Items
JOIN Orders ON Order_Items.order_id = Orders.order_id
JOIN Products ON Order_Items.product_id = Products.product_id;

-- ============================================
-- TOTAL VALUE OF EACH ORDER
-- ============================================

SELECT Orders.order_id, SUM(Order_Items.quantity * Products.price) AS total_amount
FROM Order_Items
JOIN Orders ON Order_Items.order_id = Orders.order_id
JOIN Products ON Order_Items.product_id = Products.product_id
GROUP BY Orders.order_id;

-- ============================================
-- TOTAL SALES
-- ============================================

SELECT SUM(Order_Items.quantity * Products.price) AS total_sales
FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id;

-- ============================================
-- MOST EXPENSIVE PRODUCT
-- ============================================

SELECT * FROM Products ORDER BY price DESC LIMIT 1;

-- ============================================
-- NUMBER OF PRODUCTS IN EACH CATEGORY
-- ============================================

SELECT
    category,
    COUNT(*) AS number_of_products
FROM Products GROUP BY category;

-- ============================================
-- CUSTOMERS WHO HAVE PLACED ORDERS
-- ============================================

SELECT DISTINCT
    Customers.first_name,
    Customers.last_name,
    Customers.email
FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- ============================================
-- END OF DATABASE
-- ============================================
