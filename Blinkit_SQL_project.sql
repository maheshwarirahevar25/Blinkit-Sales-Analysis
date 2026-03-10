use fingertips

select * from blinket_clean_dataset

-- 1. Total Sales of All Items
SELECT SUM(Sales) AS Total_Sales
FROM blinket_clean_dataset;

-- 2. Average Sales by Item Type
SELECT Item_Type,
       ROUND(AVG(Sales),2) AS Avg_Sales
FROM blinket_clean_dataset
GROUP BY Item_Type
ORDER BY Avg_Sales DESC;

-- 3. Top 5 Best Selling Item Types
SELECT Item_Type,
       SUM(Sales) AS Total_Sales
FROM blinket_clean_dataset
GROUP BY Item_Type
ORDER BY Total_Sales DESC
LIMIT 5;

-- 4. Sales by Outlet Type
SELECT Outlet_Type,
       SUM(Sales) AS Total_Sales
FROM blinket_clean_dataset
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC;

-- 5. Compare Low Fat vs Regular Product Sales
SELECT Item_Fat_Content,
       SUM(Sales) AS Total_Sales,
       AVG(Sales) AS Avg_Sales
FROM blinket_clean_dataset
GROUP BY Item_Fat_Content;

-- 6. Number of Products in Each Outlet Location
SELECT Outlet_Location_Type,
       COUNT(*) AS Total_Items
FROM blinket_clean_dataset
GROUP BY Outlet_Location_Type;

-- 7. Average Sales by Outlet Size
SELECT Outlet_Size,
       ROUND(AVG(Sales),2) AS Avg_Sales
FROM blinket_clean_dataset
GROUP BY Outlet_Size;

-- 8. Sales Category using CASE
SELECT 
CASE 
    WHEN sales < 1000 THEN 'Low Sales'
    WHEN Sales BETWEEN 1000 AND 3000 THEN 'Medium Sales'
    ELSE 'High Sales'
END AS Sales_Category,
COUNT(*) AS Total_Items
FROM blinket_clean_dataset
GROUP BY Sales_Category;

-- 9. Outlets Having Average Sales Greater Than 2000
SELECT Outlet_Type,
       AVG(sales) AS Avg_Sales
FROM blinket_clean_dataset
GROUP BY Outlet_Type
HAVING AVG(Sales) < 2000;

-- 10. Outlet Age vs Average Sales
SELECT 
(2026 - Outlet_Establishment_Year) AS Outlet_Age,
ROUND(AVG(Sales),2) AS Avg_Sales
FROM blinket_clean_dataset
GROUP BY Outlet_Age
ORDER BY Outlet_Age;


