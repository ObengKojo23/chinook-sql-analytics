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


