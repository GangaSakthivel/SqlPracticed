-- File: customer_purchase_analysis.sql
-- Purpose: SQL queries for Customer Purchase Analysis
-- This file contains queries to analyze customer purchase patterns and sales.

#transaction_id (ID of the transaction)
#customer_id (ID of the customer)
#transaction_date (date of purchase)
#product_id (ID of the purchased product)
#quantity (quantity of the product purchased)
#price (price of the product)

# Customer Purchase Analysis

#This project performs an analysis of customer purchasing patterns using SQL.

## Project Goals
#- Find total sales per day, month, and year
#- Identify the most popular products by quantity sold
#- Calculate the average spending per customer
#- Identify the top 10 highest spending customers

## Dataset
#A simulated e-commerce dataset containing transaction records, with fields:
#- `transaction_id`, `customer_id`, `product`, `quantity`, `price`, and `transaction_date`

## Queries and Insights
#- **Total Sales by Day, Month, and Year**: Insights into sales trends over time.
#- **Most Popular Products**: Find the top-selling products by quantity.
#- **Average Spending per Customer**: Helps understand customer spending patterns.
#- **Top 10 Highest Spending Customers**: Identify valuable customers.




use tuesday;
show tables;
desc transaction;

#Total Sales per Day:

SELECT transaction_date, 
       SUM(quantity * price) AS total_sales
FROM transaction
GROUP BY transaction_date
ORDER BY transaction_date;

#Total Sales per Month:

select date_format(transaction_date, '%y - %m') as month,
sum(quantity * price) as total_sales
from transaction
group by month
order by month;


#Total Sales per Year:

select year(transaction_date) as year, 
sum(quantity * price) as total_sales
from transaction
group by year
order by year;

#Identify the Most Popular Products by Quantity Sold

SELECT product, 
       SUM(quantity) AS total_quantity_sold
FROM transaction
GROUP BY product
ORDER BY total_quantity_sold DESC
LIMIT 10;

#Calculate the Average Spending per Customer

select customer_id, 
avg(quantity * price) as average_spending
from transaction
group by customer_id
order by average_spending desc;

#Find the Top 10 Highest Spending Customers

select customer_id,
sum(quantity * price) as total_spent
from transaction
group by customer_id
order by total_spent desc
limit 10;
