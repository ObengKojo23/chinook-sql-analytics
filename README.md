![Banner Image](./images/banner.png)

# SQL-Driven Business Insights on the Chinook Music Store Dataset

[![SQL](https://img.shields.io/badge/SQL-SQLite-blue)]()
[![SQL Badge](https://img.shields.io/badge/SQL-Analysis-blue)]()
[![Jupyter](https://img.shields.io/badge/Notebook-Jupyter-orange)]()
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
![GitHub last commit](https://img.shields.io/github/last-commit/ObengKojo23/Chinook-SQL-Analytics)
![GitHub repo size](https://img.shields.io/github/repo-size/ObengKojo23/Chinook-SQL-Analytics)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)

---

## 📝 Executive Summary  

Our digital music store (Chinook) continues to grow, but management faces challenges in understanding key performance drivers across customer behavior, sales performance, and catalog utilization.  While we collect large volumes of transactional and catalogue data, actionable insights are missing.   

To address this gap, I am tasked as **the analyst** to conduct a **comprehensive SQL-driven analysis** of the [Chinook Database](https://github.com/ObengKojo23/chinook-sql-analytics/tree/main/dataset). This analysis aims to transform raw transaction and catalog data into **actionable insights** that inform management decisions on:

- **Customer segmentation & retention**
- **Revenue trends & product performance**
- **Pricing & basket behavior**
- **Catalogue optimization**
- **Team performance (support reps)**

The outcomes of this project provide management with a clear, evidence-based view of the business. Insights will form the foundation for **data-informed decision-making** across marketing, sales, and content teams, ensuring that our strategies are backed by evidence rather than assumptions. 

This repository demonstrates the full workflow, from **business problem framing** to **SQL analysis** to **executive recommendations**, in a format that is reproducible.

---

## 📊 Key Insights Snapshot

✅ **Top Revenue Market:** USA — $523.06 (22.5% of global revenue)  
✅ **Most Profitable Genre:** Rock — $826.65 (40% of total sales)  
✅ **Customer Loyalty:** 100% repeat buyers — exceptional retention potential  
✅ **Best Performing Rep:** Jane Peacock — $833.04 revenue managed  
✅ **Revenue Trend:** Stable YoY, slight peaks in April & November  

---

## 📑 Project Files

| File/Folder | Purpose |
|-------------|---------|
| **[finding_report.md](./finding_report.md)** | Full narrative report — insights & management recommendations |
| **[chinook_sql_analysis.ipynb](./chinook_sql_analysis.ipynb)** | Jupyter Notebook with SQL queries, outputs, and commentary |
| **[sql_queries/](./sql_queries/)** | Clean, modular SQL scripts organized by business theme |
| **[requirements.txt](./requirements.txt)** | Python dependencies for reproducibility |
| **[data/chinook.db](./data/chinook.db)** | SQLite database (optional if license allows) |

---

## 📂 Repository Structure

```plaintext
chinook-sql-analytics/

├── database/
│   └── chinook.db
├── finding_report.md
├── images/
│   ├── catalogue_content_curation.sql
│   ├── customer_market_insights.sql
│   ├── sales_revenue_analytics.sql
│   └── team_performance.sql
├── sql_queries_scripts/
│   ├── all_queries_master.sql
│   ├── basket_pricing_behavior.sql
│   ├── catalogue_content_curation.sql
│   ├── customer_market_insights.sql
│   ├── sales_revenue_analytics.sql
│   └── team_performance.sql
├── LICENSE
├── README.md
├── requirements.txt
└── chinook_sql_analysis.ipynb
```
---

## 🎯 Deliverables & Outcomes  

### 📂 Deliverables  
- **SQL Queries Notebook**: Step-by-step queries solving each business problem (Jupyter-ready).  
- **Chinook Database Connection Setup**: Instructions to set up and query the SQLite Chinook database in Jupyter Notebook.  
- **Business Problem Framework**: Clear mapping of management questions to SQL queries.  
- **Documentation**: Problem statements, query explanations, and insights for non-technical stakeholders.  

### 📊 Outcomes  
- Identified top **10 high-value customers** and segmented markets by revenue and average order value.  
- Highlighted **revenue trends** by month and uncovered top-performing **tracks, artists, genres, and media types.**  
- Revealed **basket size and value patterns**, including products with high price sensitivity.  
- Exposed **curation gaps** (tracks missing from playlists) and most-playlisted tracks for better catalogue strategy.  
- Evaluated **employee performance** by revenue under management, average deal size, and portfolio efficiency.  

✅ These insights provide **data-driven recommendations** for customer retention, product promotions, catalog curation, and employee performance management.  

---

## 📂 SQL Scripts  

All queries are organized by business problem and include:  
- The **business problem** (from management).  
- The **SQL query** solving it.  
- Inline **insights and recommendations** as comments.  

- [Customer & Market Insights](sql_queries_script/customer_market_insights.sql)  
- [Sales & Revenue Analytics](sql_queries_script/sales_revenue_analytics.sql)  
- [Basket & Pricing Behavior](sql_queries_script/basket_pricing_behavior.sql)  
- [Catalogue & Content Curation](sql_queries_script/catalogue_content_curation.sql)  
- [Team Performance](sql_queries_script/team_performance.sql)  
- [All Queries (Master File)](sql_queries_script/all_queries_master.sql)  

---

## 🚀 Getting Started  

1. Clone the repository  
   ```bash
   git clone https://github.com/obengkojo23/chinook-sql-analytics.git
   cd chinook-sql-analytics


---



## 🛠 Reproducibility
All SQL queries can be run directly against `chinook.db` using SQLite + Jupyter Notebook. Queries are stored in the `sql/` folder of this repository for quick replication.


## 🔗 Connect with Me  
For any questions or suggestions, feel free to reach out:

👤 **Emmanuel Obeng Afari**  
- 📌 [LinkedIn](https://www.linkedin.com/in/obengafari)
- 📂 [More Projects on GitHub](https://github.com/ObengKojo23)

---

