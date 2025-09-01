-- ============================================================
-- Sales & Revenue Analytics — Chinook SQL Analytics
-- Purpose: Track headline KPIs, trends, and product performance
-- DB: SQLite (Chinook)
-- ============================================================

-- 1. Headline KPIs: revenue & units sold
SELECT ROUND(SUM(i.Total), 2) AS TotalRevenue,
       SUM(ii.Quantity)       AS UnitsSold
FROM invoices i
JOIN invoice_items ii ON ii.InvoiceId = i.InvoiceId;

------------------------------------------------------------------

-- 2. Monthly revenue trend (YYYY-MM)
SELECT 
  SUBSTR(i.InvoiceDate, 6, 2) || '-' || SUBSTR(i.InvoiceDate, 1, 4) AS MonthYear,
  ROUND(SUM(i.Total), 2) AS Revenue
FROM invoices i
GROUP BY SUBSTR(i.InvoiceDate, 6, 2) || '-' || SUBSTR(i.InvoiceDate, 1, 4)
ORDER BY MonthYear;

------------------------------------------------------------------

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

------------------------------------------------------------------

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

------------------------------------------------------------------

-- 5. Revenue by genre
SELECT g.Name AS Genre,
       ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS Revenue
FROM invoice_items ii
JOIN tracks t  ON t.TrackId  = ii.TrackId
JOIN genres g  ON g.GenreId  = t.GenreId
GROUP BY g.GenreId
ORDER BY Revenue DESC;

-- 5.2 Revenue per genre with percentage and cumulative percentage
WITH GenreRevenue AS (
    SELECT 
        g.Name AS Genre,
        ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS Revenue
    FROM invoice_items ii
    JOIN tracks t ON t.TrackId = ii.TrackId
    JOIN genres g ON g.GenreId = t.GenreId
    GROUP BY g.GenreId
),
TotalRevenue AS (
    SELECT SUM(Revenue) AS Total FROM GenreRevenue
)
SELECT 
    gr.Genre,
    gr.Revenue,
    ROUND(100.0 * gr.Revenue / tr.Total, 2) AS Percentage,
    ROUND(SUM(100.0 * gr.Revenue / tr.Total) OVER (ORDER BY gr.Revenue DESC), 2) AS Cumulative_Percentage
FROM GenreRevenue gr, TotalRevenue tr
ORDER BY gr.Revenue DESC;

------------------------------------------------------------------

-- 6.1 Revenue by media type (format)
SELECT mt.Name AS MediaType,
       ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS Revenue
FROM invoice_items ii
JOIN tracks t   ON t.TrackId         = ii.TrackId
JOIN media_types mt ON mt.MediaTypeId = t.MediaTypeId
GROUP BY mt.MediaTypeId
ORDER BY Revenue DESC;

-- 6.2 Revenue by media type (format) with percentage of revenue
WITH MediaTypeRevenue AS (
    SELECT 
        mt.Name AS MediaType,
        ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS Revenue
    FROM invoice_items ii
    JOIN tracks t ON t.TrackId = ii.TrackId
    JOIN media_types mt ON mt.MediaTypeId = t.MediaTypeId
    GROUP BY mt.MediaTypeId
),
TotalRevenue AS (
    SELECT SUM(Revenue) AS Total FROM MediaTypeRevenue
)
SELECT 
    mtr.MediaType,
    mtr.Revenue,
    ROUND(100.0 * mtr.Revenue / tr.Total, 2) AS Percentage
FROM MediaTypeRevenue mtr, TotalRevenue tr
ORDER BY mtr.Revenue DESC;




