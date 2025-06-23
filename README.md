## 📌 Overview

This project involves analyzing a retail sales dataset using **SQL Server**. I performed data cleaning, exploration, and advanced querying to uncover key sales insights, customer behavior, and product performance.

---

## 🗃️ Dataset Description

**Table Name:** `RetailSalesAnalysis`  
**Database:** `db_SalesAnalysis`  
**File:** `retail_sales_data.csv` in `/data`

### 🧾 Key Columns:
- `transactions_id` – Unique identifier per transaction
- `sale_date` – Date of transaction
- `sale_time` – Time of transaction
- `customer_id` – Unique customer ID
- `gender` – Gender of the customer
- `age` – Age of the customer
- `category` – Product category (e.g. Clothing, Beauty, etc.)
- `quantiy` – Quantity of items sold
- `price_per_unit` – Price per item
- `cogs` – Cost of goods sold
- `total_sale` – Total sale amount

---

## 🎯 Objectives

- Clean and prepare raw transactional data
- Handle missing values
- Analyze customer behavior by category and gender
- Segment performance across time and shifts
- Deliver actionable sales insights

---

## 🛠️ Tools Used

- SQL Server Management Studio (SSMS)
- Microsoft Excel (for CSV handling)

---

## 📊 Analysis Highlights

### ✅ Data Cleaning:
```sql
DELETE FROM RetailSalesAnalysis WHERE quantiy IS NULL OR age IS NULL;

## 📊 Analysis Highlights

### ✅ Key KPIs
- **Total Sales Transactions**
- **Number of Unique Customers**
- **Number of Product Categories**
- **Average Age of Beauty Category Customers**
- **High-Value Customers (Sales > ₦1000)**
- **Sales Distribution by Gender & Category**
- **Monthly Sales Trends**
- **Shift-Based Order Distribution (Morning, Afternoon, Evening)**

---

## 🔍 Sample Business Questions & SQL Queries

| **#** | **Business Question** | **Purpose** |
|-------|------------------------|-------------|
| Q1 | Retrieve all sales made on `2022-11-05` | Daily sales tracking |
| Q2 | Find clothing category orders ≥ 4 units in Nov 2022 | Product performance in a timeframe |
| Q3 | Calculate total sales for each category | Category-wise revenue |
| Q4 | Average age of customers who bought Beauty products | Customer profiling |
| Q5 | Transactions where total_sale > ₦1000 | Identifying high-value purchases |
| Q6 | Total transactions by gender and category | Demographic sales breakdown |
| Q7 | Monthly average sale, ranked to find best months per year | Seasonality analysis |
| Q8 | Top 5 customers with the highest total sales | Customer segmentation |
| Q9 | Count unique customers per category | Category popularity |
| Q10 | Orders grouped by shift (Morning, Afternoon, Evening) | Time-based operational insight |

📁 All query solutions are available in [`/scripts/retail_sales_analysis.sql`](./scripts/retail_sales_analysis.sql)

---

## 💡 Key Insights

- **Clothing** and **Electronics** categories generated the highest revenue.
- Majority of sales are under ₦1000, suggesting a high-frequency, low-cost retail model.
- **Evening shift** accounts for the largest portion of sales, followed by Morning.
- A small number of **loyal customers** contribute disproportionately to revenue.
- **Customer age** varies by product category — Beauty appeals to younger demographics.
- Sales peak in certain months, indicating **seasonal patterns** worth leveraging in promotions.

---

## 🏗 How to Run This Project

1. Clone or download this repository.
2. Import the `retail_sales_data.csv` file into your SQL Server database.
3. Open and execute the SQL script located in:

## Author - Olayinka Yusuf
https://www.linkedin.com/in/olayinka-yusuf-884362115/
