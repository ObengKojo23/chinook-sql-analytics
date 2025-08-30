# 🎵 Chinook SQL Analytics – Detailed Findings Report

This report documents the **full analysis** performed on the Chinook database. It includes **SQL queries, key outputs, and insights** for transparency and reproducibility.

---

## 1️⃣ Customer & Market Insights

### 1.1 Top Lifetime Value Customers
**SQL Query:**
```sql
SELECT c.CustomerId,
       c.FirstName || ' ' || c.LastName AS Customer,
       c.Country,
       ROUND(SUM(i.Total), 2) AS LifetimeRevenue
FROM customers c
JOIN invoices  i ON i.CustomerId = c.CustomerId
GROUP BY c.CustomerId
ORDER BY LifetimeRevenue DESC
LIMIT 20;
```

**Top Results:**
| CustomerId | Customer           | Country        | LifetimeRevenue |
|-----------|------------------|---------------|----------------|
| 6         | Helena Holý       | Czech Republic| 49.62          |
| 26        | Richard Cunningham| USA           | 47.62          |
| 57        | Luis Rojas        | Chile         | 46.62          |
| 45        | Ladislav Kovács   | Hungary       | 45.62          |
| 46        | Hugh O'Reilly     | Ireland       | 45.62          |

**Insight:** USA customers dominate the top 20, signaling a strong North American customer base.

---

### 1.2 Revenue by Country
**SQL Query:**
```sql
WITH revenue_by_country AS (
    SELECT c.Country,
           ROUND(SUM(i.Total), 2) AS Revenue
    FROM customers c
    JOIN invoices i ON i.CustomerId = c.CustomerId
    GROUP BY c.Country
)
SELECT Country,
       Revenue,
       ROUND((Revenue * 100.0 / (SELECT SUM(Revenue) FROM revenue_by_country)), 2) AS RevenuePercentage
FROM revenue_by_country
ORDER BY Revenue DESC;
```

**Top Results:**
| Country | Revenue | Revenue% |
|--------|---------|----------|
| USA    | 523.06  | 22.46    |
| Canada | 303.96  | 13.05    |
| France | 195.10  | 8.38     |
| Brazil | 190.10  | 8.16     |
| Germany| 156.48  | 6.72     |

**Insight:** The top 5 countries account for **>50% of revenue**, indicating key markets for growth.

---

### 1.3 Average Order Value by Country
**SQL Query:**
```sql
SELECT c.Country,
       ROUND(AVG(i.Total), 2) AS AvgOrderValue
FROM customers c
JOIN invoices  i ON i.CustomerId = c.CustomerId
GROUP BY c.Country
ORDER BY AvgOrderValue DESC;
```

**Top Results:**
| Country | AvgOrderValue |
|--------|---------------|
| Chile  | 6.66          |
| Ireland| 6.52          |
| Hungary| 6.52          |

**Insight:** Despite lower total revenue, Chile and Ireland have higher AOV — potential for high-value marketing campaigns.

---

### 1.4 Returning vs. One-time Customers
**SQL Query:**
```sql
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
```

**Result:** 0 one-time customers, 59 returning customers.

**Insight:** The business enjoys **100% returning customers** – a rare sign of strong loyalty.

---

## 2️⃣ Company's Sales & Revenue Analytics

### 2.1 Headline KPIs
**SQL Query:**
```sql
SELECT ROUND(SUM(i.Total), 2) AS TotalRevenue,
       SUM(ii.Quantity)       AS UnitsSold
FROM invoices i
JOIN invoice_items ii ON ii.InvoiceId = i.InvoiceId;
```

| Total Revenue | Units Sold |
|--------------|-----------|
| 20848.62     | 2240      |

**Insight:** The company has generated **$20,848.62** from 2,240 units sold.

---

### 2.2 Monthly Revenue Trend
**SQL Query:**
```sql
SELECT SUBSTR(i.InvoiceDate, 6, 2) || '-' || SUBSTR(i.InvoiceDate, 1, 4) AS MonthYear,
       ROUND(SUM(i.Total), 2) AS Revenue
FROM invoices i
GROUP BY SUBSTR(i.InvoiceDate, 6, 2) || '-' || SUBSTR(i.InvoiceDate, 1, 4)
ORDER BY MonthYear;
```

**Insight:** Revenue shows consistent monthly inflows with some seasonal spikes (April & November).

---

### 2.3 Top 10 Tracks by Revenue
**SQL Query:**
```sql
SELECT t.TrackId, t.Name AS Track, ar.Name AS Artist,
       ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS Revenue
FROM invoice_items ii
JOIN tracks t ON t.TrackId = ii.TrackId
JOIN albums al ON al.AlbumId = t.AlbumId
JOIN artists ar ON ar.ArtistId = al.ArtistId
GROUP BY t.TrackId
ORDER BY Revenue DESC
LIMIT 10;
```

**Insight:** Several TV show tracks like *The Woman King* and *Hot Girl* dominate top revenue slots — media tie-ins are key drivers.

---

### 2.4 Top 10 Artists by Revenue
**SQL Query:**
```sql
SELECT ar.ArtistId, ar.Name AS Artist,
       ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS Revenue
FROM invoice_items ii
JOIN tracks t ON t.TrackId = ii.TrackId
JOIN albums al ON al.AlbumId = t.AlbumId
JOIN artists ar ON ar.ArtistId = al.ArtistId
GROUP BY ar.ArtistId
ORDER BY Revenue DESC
LIMIT 10;
```

**Top Results:**
| Artist        | Revenue |
|--------------|--------|
| Iron Maiden  | 138.6  |
| U2           | 105.93 |
| Metallica    | 90.09  |

**Insight:** Rock/Metal artists are top revenue drivers, especially Iron Maiden.

---

### 2.5 Revenue by Genre
**Insight:** Rock is the dominant genre, followed by Latin and Metal — accounting for **>70% of total revenue**.

---

### 2.6 Revenue by Media Type
| Media Type              | Revenue |
|------------------------|--------|
| MPEG audio file        | 1956.24|
| Protected MPEG-4 video | 220.89 |

**Insight:** Digital audio files account for the bulk of revenue, reinforcing streaming/download-first business model.

---

## 3️⃣ Basket & Pricing Behavior
(…Average basket size, price elasticity insights, etc. – to be filled with your outputs…)

---

## 4️⃣ Catalogue & Content Curation
- Albums with deepest tracklists (e.g., *Greatest Hits* by Lenny Kravitz – 57 tracks)
- Most playlisted tracks (5 playlist appearances each)
- No missing-track curation gaps detected

---

## 5️⃣ Team Performance
- **Jane Peacock** leads with $833.04 in revenue managed, followed by Margaret Park and Steve Johnson.
- Support reps with no portfolios (Andrew Adams, Nancy Edwards, etc.) could be leveraged for new accounts.

---

## 🔑 Key Takeaways
- **50%+ revenue concentration** in top 5 countries — focus campaigns there.
- **Rock/Metal genre dominance** — protect and grow this customer segment.
- **Zero one-time buyers** — leverage loyalty strength with VIP programs.
- **Digital-first format** drives revenue — keep investing in downloadable content.

---

## 🛠 Reproducibility
All SQL queries can be run directly against `chinook.db` using SQLite + Jupyter Notebook. Queries are stored in the `sql/` folder of this repository for quick replication.


