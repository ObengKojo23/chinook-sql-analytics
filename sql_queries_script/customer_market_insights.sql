-- =========================================================
-- Problem (from Management)
--  Management needs to understand all revenue sources. Placing priority on;   
-- The most valuable customers, 
-- Best regions/countries of sales, 
-- Retainable customers and one-timer shoppers. 
-- Market-level Average Order Value (AOV)  
-- =========================================================

-- 1. Top lifetime value customers
SELECT c.CustomerId,
       c.FirstName || ' ' || c.LastName AS Customer,
       c.Country,
       ROUND(SUM(i.Total), 2) AS LifetimeRevenue
FROM customers c
JOIN invoices  i ON i.CustomerId = c.CustomerId
GROUP BY c.CustomerId
ORDER BY LifetimeRevenue DESC
LIMIT 20;

-- 2. Revenue by country
WITH revenue_by_country AS (
    SELECT 
        c.Country,
        ROUND(SUM(i.Total), 2) AS Revenue
    FROM customers c
    JOIN invoices i ON i.CustomerId = c.CustomerId
    GROUP BY c.Country
),
ranked AS (
    SELECT 
        Country,
        Revenue,
        ROUND((Revenue * 100.0 / (SELECT SUM(Revenue) FROM revenue_by_country)), 2) AS RevenuePercentage
    FROM revenue_by_country
    ORDER BY Revenue DESC
)
SELECT 
    Country,
    Revenue,
    RevenuePercentage,
    ROUND(SUM(RevenuePercentage) OVER (ORDER BY Revenue DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 2) AS CumulativePercentage
FROM ranked
ORDER BY Revenue DESC;

-- 3. AOV by country
SELECT c.Country,
       ROUND(AVG(i.Total), 2) AS AvgOrderValue
FROM customers c
JOIN invoices  i ON i.CustomerId = c.CustomerId
GROUP BY c.Country
ORDER BY AvgOrderValue DESC;

-- 4. New vs. returning customers (proxy via invoice count)
WITH counts AS (
  SELECT c.CustomerId, COUNT(i.InvoiceId) AS Orders
  FROM customers c
  LEFT JOIN invoices i ON i.CustomerId = c.CustomerId
  GROUP BY c.CustomerId
)
SELECT
  SUM(CASE WHEN Orders = 1 THEN 1 ELSE 0 END) AS OneTimeCustomers,
  SUM(CASE WHEN Orders > 1 THEN 1 ELSE 0 END) AS ReturningCustomers
FROM counts;


