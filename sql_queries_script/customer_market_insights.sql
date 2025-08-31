-- ============================================================
-- Customer & Market Insights — Chinook SQL Analytics
-- Purpose: Identify high-value customers, best regions/countries of sales, 
--          customer retention profile, and market-level average order value (AOV).
-- DB: SQLite (Chinook)
-- ============================================================


/* 1) Top Lifetime Value (LTV) Customers
   What it answers:
   - Who are our most valuable customers overall? */
SELECT c.CustomerId,
       c.FirstName || ' ' || c.LastName AS Customer,
       c.Country,
       ROUND(SUM(i.Total), 2) AS LifetimeRevenue
FROM customers c
JOIN invoices  i ON i.CustomerId = c.CustomerId
GROUP BY c.CustomerId
ORDER BY LifetimeRevenue DESC
LIMIT 20;

-- ----------------------------------------------------------------

/* 2) Revenue by Country with Share and Cumulative %
   What it answers:
   - Which markets drive revenue and how concentrated is it? */
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

-- ----------------------------------------------------------------

/* 3) Average Order Value (AOV) by Country
   What it answers:
   - Where is our pricing power / basket size strongest? */
SELECT c.Country,
       ROUND(AVG(i.Total), 2) AS AvgOrderValue
FROM customers c
JOIN invoices  i ON i.CustomerId = c.CustomerId
GROUP BY c.Country
ORDER BY AvgOrderValue DESC;

-- ----------------------------------------------------------------

/* 4) Returning vs One-time Customers (by invoice count)
   What it answers:
   - What does retention look like at a high level? */
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


