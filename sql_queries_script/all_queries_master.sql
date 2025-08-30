-- ===== File: customer_market_insights.sql =====

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



-- ===== File: sales_revenue_analytics.sql =====
-- =========================================================
-- Problem (from Management)
-- Provide a single view of sales performance: totals, monthly
-- trends, and top-performing tracks, artists, genres, formats.
-- =========================================================


-- 1. Headline KPIs: revenue & units sold
SELECT ROUND(SUM(i.Total), 2) AS TotalRevenue,
       SUM(ii.Quantity)       AS UnitsSold
FROM invoices i
JOIN invoice_items ii ON ii.InvoiceId = i.InvoiceId;

-- 2. Monthly revenue trend (YYYY-MM)
SELECT 
  SUBSTR(i.InvoiceDate, 6, 2) || '-' || SUBSTR(i.InvoiceDate, 1, 4) AS MonthYear,
  ROUND(SUM(i.Total), 2) AS Revenue
FROM invoices i
GROUP BY SUBSTR(i.InvoiceDate, 6, 2) || '-' || SUBSTR(i.InvoiceDate, 1, 4)
ORDER BY MonthYear;

-- 3. Top 10 tracks by revenue
SELECT t.TrackId,
       t.Name AS Track,
       ar.Name AS Artist,
       ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS Revenue
FROM invoice_items ii
JOIN tracks   t  ON t.TrackId   = ii.TrackId
JOIN albums   al ON al.AlbumId  = t.AlbumId
JOIN artists  ar ON ar.ArtistId = al.ArtistId
GROUP BY t.TrackId
ORDER BY Revenue DESC
LIMIT 10;

-- 4. Top 10 artists by revenue
SELECT ar.ArtistId,
       ar.Name AS Artist,
       ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS Revenue
FROM invoice_items ii
JOIN tracks  t  ON t.TrackId   = ii.TrackId
JOIN albums  al ON al.AlbumId  = t.AlbumId
JOIN artists ar ON ar.ArtistId = al.ArtistId
GROUP BY ar.ArtistId
ORDER BY Revenue DESC
LIMIT 10;

-- 5. Revenue by genre
SELECT g.Name AS Genre,
       ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS Revenue
FROM invoice_items ii
JOIN tracks t  ON t.TrackId  = ii.TrackId
JOIN genres g  ON g.GenreId  = t.GenreId
GROUP BY g.GenreId
ORDER BY Revenue DESC;

-- 6. Revenue by media type (format)
SELECT mt.Name AS MediaType,
       ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS Revenue
FROM invoice_items ii
JOIN tracks t   ON t.TrackId         = ii.TrackId
JOIN media_types mt ON mt.MediaTypeId = t.MediaTypeId
GROUP BY mt.MediaTypeId
ORDER BY Revenue DESC;



-- ===== File: basket_pricing_behavior.sql =====
-- =========================================================
-- Problem (from Management)
-- Management wants to understand basket composition (size and value) and identify:
-- Which invoices are large?
-- Which products sell high volume on discount?.
-- =========================================================

-- 1. Largest baskets by quantity and value
SELECT ii.InvoiceId,
       SUM(ii.Quantity) AS ItemsInBasket,
       ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS BasketValue
FROM invoice_items ii
GROUP BY ii.InvoiceId
ORDER BY ItemsInBasket DESC, BasketValue DESC
LIMIT 10;

-- 2. Popular tracks with lower average prices (price sensitivity proxy)
WITH track_stats AS (
  SELECT 
    t.TrackId,
    t.Name,
    AVG(ii.UnitPrice) AS AvgPrice,
    SUM(ii.Quantity)  AS TotalQty,
    SUM(ii.UnitPrice * ii.Quantity) AS TotalRevenue
  FROM tracks t
  JOIN invoice_items ii ON ii.TrackId = t.TrackId
  GROUP BY t.TrackId
)
SELECT 
  Name, 
  ROUND(AvgPrice, 2) AS AvgPrice, 
  TotalQty,
  ROUND(TotalRevenue, 2) AS TotalRevenue
FROM track_stats
ORDER BY TotalQty DESC, AvgPrice ASC
LIMIT 15;


-- ===== File: catalogue_content_curation.sql =====
-- =========================================================
-- Problem (from Management)
--Content team needs to ensure the catalogue is well curated by having insights on: 
-- Which albums have depth?
-- Where are curation gaps (tracks not in any playlist)? 
-- What is the most play-listed (social proof). 
-- =========================================================

-- 1. Albums with deepest tracklists
SELECT al.AlbumId,
       al.Title AS Album,
       ar.Name  AS Artist,
       COUNT(t.TrackId) AS NumTracks
FROM albums al
JOIN artists ar ON ar.ArtistId = al.ArtistId
JOIN tracks  t  ON t.AlbumId   = al.AlbumId
GROUP BY al.AlbumId
ORDER BY NumTracks DESC, Album;

-- 2. Tracks missing from any playlist (curation gap)
SELECT t.TrackId, t.Name AS Track, ar.Name AS Artist
FROM tracks t
JOIN albums al  ON al.AlbumId  = t.AlbumId
JOIN artists ar ON ar.ArtistId = al.ArtistId
LEFT JOIN playlist_track pt ON pt.TrackId = t.TrackId
WHERE pt.PlaylistId IS NULL
ORDER BY Artist, Track
LIMIT 50;

-- 3. Most playlisted tracks (social proof)
SELECT t.Name AS Track,
       ar.Name AS Artist,
       COUNT(pt.PlaylistId) AS PlaylistsCount
FROM playlist_track pt
JOIN tracks t  ON t.TrackId  = pt.TrackId
JOIN albums al ON al.AlbumId = t.AlbumId
JOIN artists ar ON ar.ArtistId = al.ArtistId
GROUP BY t.TrackId
ORDER BY PlaylistsCount DESC, Track
LIMIT 20;


-- ===== File: team_performance.sql =====
-- =========================================================
-- Problem (from Management)
-- Sales leadership needs to be able to measure employee's effectiveness and performance visibility:
-- Revenue under management
-- Average invoice value  
-- Portfolio size to guide management decision on incentives and coverage
-- =========================================================

-- 1. Revenue managed by each rep
SELECT e.EmployeeId,
       e.FirstName || ' ' || e.LastName AS Employee,
       ROUND(SUM(i.Total), 2) AS RevenueManaged
FROM employees e
JOIN customers c ON c.SupportRepId = e.EmployeeId
JOIN invoices  i ON i.CustomerId   = c.CustomerId
GROUP BY e.EmployeeId
ORDER BY RevenueManaged DESC;

-- 2. Average invoice value per rep
SELECT e.EmployeeId,
       e.FirstName || ' ' || e.LastName AS Employee,
       ROUND(AVG(i.Total), 2) AS AvgInvoice
FROM employees e
JOIN customers c ON c.SupportRepId = e.EmployeeId
JOIN invoices  i ON i.CustomerId   = c.CustomerId
GROUP BY e.EmployeeId
ORDER BY AvgInvoice DESC;

-- 3. Portfolio size vs revenue
SELECT e.EmployeeId,
       e.FirstName || ' ' || e.LastName AS Employee,
       COUNT(DISTINCT c.CustomerId) AS CustomersManaged,
       ROUND(SUM(i.Total), 2)       AS RevenueManaged
FROM employees e
LEFT JOIN customers c ON c.SupportRepId = e.EmployeeId
LEFT JOIN invoices  i ON i.CustomerId   = c.CustomerId
GROUP BY e.EmployeeId
ORDER BY RevenueManaged DESC, CustomersManaged DESC;

.
-- ---------------------------------------------------------


