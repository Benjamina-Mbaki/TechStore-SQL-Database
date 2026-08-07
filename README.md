🛒 TechStore SQL Database

A relational SQL database project for a fictional e-commerce technology store.

📌 Project Overview

TechStore is a database designed to manage customers, products, orders, and order items.

The project demonstrates fundamental SQL and relational database concepts, including:

- Database creation
- Table creation
- Primary keys
- Foreign keys
- Relationships between tables
- INSERT statements
- SELECT queries
- WHERE conditions
- ORDER BY
- JOINs
- GROUP BY
- Aggregate functions
- Calculating order totals

🗂️ Database Structure

The database contains four main tables:

Customers

Stores customer information such as names, email addresses, phone numbers, and cities.

Products

Stores products, categories, prices, and stock quantities.

Orders

Stores customer orders and their current status.

Order_Items

Connects products to orders and records the quantity purchased.

🔗 Relationships

Customers
    │
    │ 1
    │
    │
    │ many
  Orders
    │
    │ 1
    │
    │
    │ many
Order_Items
    │
    │ many
    │
    │ 1
 Products

🛠️ Technologies

- SQL
- MySQL

🎯 Purpose

This project was created to practice relational database design and SQL queries while building a portfolio project for GitHub.

👩🏽‍💻 Author

Benjamina Mbaki
