SELECT * 
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis

SELECT * 
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis

SELECT COUNT(*) 
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis

-- Checking Null Values
SELECT * 
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis
WHERE quantiy is null

SELECT * 
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis
WHERE price_per_unit is null
OR cogs is null
OR total_sale is null
OR age is null
OR customer_id is null
OR sale_time is null
OR sale_date is null
OR transactions_id is null

DELETE FROM db_SalesAnalysis.dbo.RetailSalesAnalysis
WHERE quantiy is null

DELETE FROM db_SalesAnalysis.dbo.RetailSalesAnalysis
WHERE age is null

SELECT * 
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis
WHERE quantiy is null

SELECT COUNT(*) 
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis


-- DATA EXLPORATION

--How many sales do we have

SELECT COUNT(*) AS TOTAL_SALES
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis

-- How many Customers does the store has

SELECT COUNT(DISTINCT(customer_id)) AS Total_number_of_customer 
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis

--How many Categories are there
SELECT COUNT(DISTINCT(category)) AS Categories
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis

SELECT DISTINCT(category) AS Categories
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis

--Data analysis and Key problems and answers

--Q1: Write a SQL query to retrieve all columns for a sales made on '2022-11-05'
SELECT *
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis
WHERE sale_date = '2022-11-05'

--Q2: Write a SQL query to retreive all tansactions where the category is clothing and the the quantity is more than or equal to 4 in the month of Nov-2022

SELECT *
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis
WHERE category ='Clothing'
	AND
		sale_date > '2022-10-31' AND sale_date < '2022-12-01'
	AND quantiy >= 4 

--Q3: Write a SQL query to calculate the total sales for each category
SELECT category, SUM(total_sale) AS Net_Sales, COUNT(*) AS Total_Orders
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis
GROUP BY category

--Q4: Write a SQL query to find the average age of the customers who purchase items from the 'Beauty' Category
SELECT ROUND(AVG(age),2) AS Custome_Avg_Age
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis
WHERE category = 'Beauty'

--Q5: Write a SQL query to find all transactions where the total_sale is greater than 1000
SELECT * 
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis
WHERE total_sale > 1000

SELECT COUNT(*) 
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis
WHERE total_sale > 1000

--Q6: Write a SQL query to find the total transactions made by each gender and each category
SELECT gender,category, COUNT(transactions_id) AS Total_trans
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis
GROUP BY gender,category
ORDER BY 2

--Q7: Write a SQL query to calculate the average sale for each month, find out the best selling month in each year
SELECT Sales_year,Sales_month, Average_Sale
FROM(
SELECT YEAR(sale_date) AS Sales_year,MONTH(sale_date) AS Sales_month, AVG(total_sale) AS Average_Sale,
	RANK() OVER(PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) AS Sale_Rank
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis 
GROUP BY sale_date) AS T1
WHERE Sale_Rank = 1


--Q8: Write a SQL query to find the top 5 customer on the highest sales
SELECT TOP 5 customer_id, SUM(total_sale) As Sales_By_Customer
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis
GROUP BY customer_id 
ORDER BY Sales_By_Customer DESC

--Q9: Write a SQL query to find the unique number of customers who purchased items from each category
SELECT category, COUNT(customer_id) AS Customers
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis
GROUP BY category

--Q10: Write a SQL query to create each shift and number of orders

WITH Hourly_Sales AS
(
SELECT *,
	CASE
		WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
		WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
	END AS Shift
FROM db_SalesAnalysis.dbo.RetailSalesAnalysis)
SELECT Shift, COUNT(*) 
FROM Hourly_Sales
GROUP BY Shift