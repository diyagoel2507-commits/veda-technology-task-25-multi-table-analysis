# 📊 VEDA Day 25 – Multi-Table Sales Analysis

## 📌 Project Overview

This project focuses on analyzing sales data stored across multiple related tables — **Customers, Products, and Orders**.

The objective is to combine relational data using SQL joins, validate data relationships, calculate important business KPIs, and create an interactive **Power BI dashboard** to identify sales trends and business insights.

---

## 🎯 Objectives

- Combine multiple tables using relational joins
- Maintain data accuracy and avoid duplicate counting
- Calculate important sales KPIs
- Analyze monthly sales performance
- Compare sales across regions
- Analyze category-wise sales
- Identify top-performing products
- Understand customer segment contribution
- Build an interactive Power BI dashboard
- Generate actionable business insights

---

## 🗂️ Dataset

The project contains three primary tables:

### 1. Customers
Contains customer information such as:

- Customer ID
- Customer Name
- Region
- Customer Segment

### 2. Products
Contains product information such as:

- Product ID
- Product Name
- Category
- Unit Price

### 3. Orders
Contains transaction-level sales information such as:

- Order ID
- Order Date
- Customer ID
- Product ID
- Quantity
- Unit Price
- Discount
- Sales Amount

---

## 🔗 Data Relationships

The tables are connected using primary and foreign keys:

```text
Customers
Customer_ID
     │
     │ 1 : Many
     ▼
Orders
Customer_ID
Product_ID
     ▲
     │ 1 : Many
     │
Products
Product_ID
