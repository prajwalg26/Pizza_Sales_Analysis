
SELECT * FROM pizza_sales

SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales

SELECT SUM(total_price)/ COUNT(Distinct order_id) AS Ang_Order_Value FROM pizza_sales

SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales

SELECT COUNT(Distinct order_id) AS Total_Orders FROM pizza_sales

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales

SELECT DATENAME(DW,order_date) AS order_day, COUNT (Distinct order_id) AS Total_orders
FROM pizza_sales
GROUP By DATENAME (DW, order_date)

SELECT DATENAME(MONTH,order_date) AS Month_name, COUNT (Distinct order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME (Month, order_date)
ORDER BY Total_orders DESC

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC

SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Quantity 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Quantity 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC