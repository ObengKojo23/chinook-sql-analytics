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

