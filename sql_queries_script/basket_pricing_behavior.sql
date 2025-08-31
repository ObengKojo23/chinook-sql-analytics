-- ============================================================
-- Basket & Pricing Behavior — Chinook SQL Analytics
-- Purpose: Understand basket size/value and price sensitivity
-- DB: SQLite (Chinook)
-- ============================================================

-- 1. Largest baskets by quantity and value
SELECT ii.InvoiceId,
       SUM(ii.Quantity) AS ItemsInBasket,
       ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS BasketValue
FROM invoice_items ii
GROUP BY ii.InvoiceId
ORDER BY ItemsInBasket DESC, BasketValue DESC
LIMIT 10;

-- ----------------------------------------------------------------

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


