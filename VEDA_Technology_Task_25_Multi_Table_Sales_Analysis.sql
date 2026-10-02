-- =========================================================
-- VEDA LEVEL 2 - DAY 25
-- MULTI-TABLE SALES ANALYSIS
-- Prepared by: Diya Goel
-- =========================================================

USE veda_day25_sales;


-- 1. DATA VALIDATION
SELECT COUNT(*) AS Total_Customers
FROM customers;

SELECT COUNT(*) AS Total_Products
FROM products;

SELECT COUNT(*) AS Total_Orders
FROM orders;


-- 2. JOIN VALIDATION
SELECT
    COUNT(*) AS Joined_Rows,
    COUNT(DISTINCT Order_ID) AS Unique_Orders,
    ROUND(SUM(Sales_Amount),2) AS Joined_Sales
FROM sales_analysis;


-- 3. DOUBLE-COUNTING VALIDATION
SELECT
    (SELECT ROUND(SUM(Sales_Amount),2)
     FROM orders) AS Raw_Order_Total,

    (SELECT ROUND(SUM(Sales_Amount),2)
     FROM sales_analysis) AS Joined_Order_Total;


-- 4. OVERALL KPIs
SELECT
    ROUND(SUM(Sales_Amount),2) AS Total_Sales,
    SUM(Quantity) AS Units_Sold,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Active_Customers,
    ROUND(
        SUM(Sales_Amount) / COUNT(DISTINCT Order_ID),2
    ) AS Average_Order_Value
FROM sales_analysis;


-- 5. MONTHLY SALES TREND
SELECT
    DATE_FORMAT(Order_Date,'%Y-%m') AS Sales_Month,
    ROUND(SUM(Sales_Amount),2) AS Monthly_Sales,
    SUM(Quantity) AS Units_Sold,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM sales_analysis
GROUP BY DATE_FORMAT(Order_Date,'%Y-%m')
ORDER BY Sales_Month;


-- 6. SALES BY REGION
SELECT
    Region,
    ROUND(SUM(Sales_Amount),2) AS Total_Sales,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Quantity) AS Units_Sold
FROM sales_analysis
GROUP BY Region
ORDER BY Total_Sales DESC;


-- 7. SALES BY CATEGORY
SELECT
    Category,
    ROUND(SUM(Sales_Amount),2) AS Total_Sales,
    SUM(Quantity) AS Units_Sold,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM sales_analysis
GROUP BY Category
ORDER BY Total_Sales DESC;


-- 8. TOP 10 PRODUCTS
SELECT
    Product_Name,
    Category,
    ROUND(SUM(Sales_Amount),2) AS Total_Sales,
    SUM(Quantity) AS Units_Sold,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM sales_analysis
GROUP BY Product_ID, Product_Name, Category
ORDER BY Total_Sales DESC
LIMIT 10;


-- 9. CUSTOMER SEGMENT ANALYSIS
SELECT
    Segment,
    COUNT(DISTINCT Customer_ID) AS Customers,
    ROUND(SUM(Sales_Amount),2) AS Total_Sales,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(
        SUM(Sales_Amount) / COUNT(DISTINCT Order_ID),2
    ) AS Average_Order_Value
FROM sales_analysis
GROUP BY Segment
ORDER BY Total_Sales DESC;


-- 10. FINAL JOINED DATA
SELECT *
FROM sales_analysis
ORDER BY Order_ID;