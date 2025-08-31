# SQL-Driven Business Insights on the Chinook Music Store Dataset

# 🎶 Chinook Retail Analytics — SQL Project  

[![SQL](https://img.shields.io/badge/SQL-SQLite-blue)]()
[![SQL Badge](https://img.shields.io/badge/SQL-Analysis-blue)]()
[![Jupyter](https://img.shields.io/badge/Notebook-Jupyter-orange)]()  
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![GitHub last commit](https://img.shields.io/github/last-commit/ObengKojo23/Chinook-SQL-Analytics)]()
[![GitHub repo size](https://img.shields.io/github/repo-size/ObengKojo23/chinook-sql-analytics)]()
[![Status](https://img.shields.io/badge/Project-Completed-brightgreen)]() 

---

## 📝 Executive Summary  

Our digital music store (Chinook) continues to grow, but management faces challenges in understanding customer behavior, sales performance, and catalog utilization. We have large volumes of transactional and catalog data, yet actionable insights are missing.  

To address this, the Data Analytics team has been tasked with conducting a **comprehensive SQL-driven analysis** of the Chinook database. The goal is to uncover insights that will help us:  
- Identify and retain high-value customers.  
- Track sales performance across time, markets, products, and formats.  
- Understand purchasing behaviors to inform pricing and bundling strategies.  
- Optimize our music catalogue and playlists for better curation.  
- Evaluate account manager (support reps) performance to drive efficiency.  

This analysis will form the foundation for **data-informed decision-making** across marketing, sales, and content teams, ensuring that our strategies are backed by evidence rather than assumptions.  

---

## 📌 Problem Statement  

**From Management:**  

As part of our ongoing efforts to improve decision-making and drive growth, we need deeper insights from our digital music store data (Chinook database). While we have raw transaction and catalogue data, management lacks clear visibility into:  

1. **Customer & Market Insights**  
   - Who are our most valuable customers?  
   - Which markets generate the highest revenue and average order values?  
   - How many of our customers are one-time vs returning?  

2. **Sales & Revenue Analytics**  
   - What is our total revenue performance?  
   - What does the monthly revenue trend look like?  
   - Which tracks, artists, genres, and formats generate the most revenue?  

3. **Basket & Pricing Behavior**  
   - How do customers structure their purchases (basket size and value)?  
   - Which products are highly price-sensitive vs consistently premium?  

4. **Catalogue & Content Curation**  
   - Which albums and artists have the deepest catalogues?  
   - Are there tracks that are not being promoted via playlists?  
   - Which tracks are most frequently included in playlists?  

5. **Team Performance (Support Reps as Account Managers)**  
   - Which employees manage the most revenue?  
   - What is the average deal size per representative?  
   - How does portfolio size compare to revenue performance?  

**Your Task as the Analyst:**  
- Extract insights from the Chinook database using SQL.  
- Present findings that directly answer these questions.  
- Highlight key opportunities for management to act on (e.g., high-value customers, top-performing artists, curation gaps, rep performance).  
- Ensure the analysis is reproducible and can be shared with technical and non-technical stakeholders alike.  

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

- [Customer & Market Insights](sql_queries/customer_market_insights.sql)  
- [Sales & Revenue Analytics](sql_queries/sales_revenue_analytics.sql)  
- [Basket & Pricing Behavior](sql_queries/basket_pricing_behavior.sql)  
- [Catalogue & Content Curation](sql_queries/catalogue_content_curation.sql)  
- [Team Performance](sql_queries/team_performance.sql)  
- [All Queries (Master File)](sql_queries/all_queries_master.sql)  

---

## 🚀 Getting Started  

1. Clone the repository  
   ```bash
   git clone https://github.com/obengkojo23/chinook-sql-analytics.git
   cd chinook-sql-analytics




   # 🎵 Chinook SQL Analytics Project

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
![GitHub last commit](https://img.shields.io/github/last-commit/ObengKojo23/Chinook-SQL-Analytics)
![GitHub repo size](https://img.shields.io/github/repo-size/ObengKojo23/Chinook-SQL-Analytics)

This project analyzes the **Chinook digital media store database** using SQL and Jupyter Notebooks.  
The goal is to answer **key business questions** on customer behavior, revenue performance, pricing patterns, and team productivity — then translate them into **actionable insights** and **strategic recommendations** for stakeholders.

---

## 📊 Project Highlights
- **Comprehensive SQL Analysis:** Covers Customer Insights, Sales & Revenue Analytics, Basket Behavior, Content Curation, and Team Performance.
- **Executive-Ready Deliverables:** Includes a polished PDF executive summary for management consumption.
- **Reproducible Workflow:** Jupyter Notebook with well-documented SQL queries and outputs.
- **Action-Oriented Recommendations:** Every insight is paired with concrete business actions.

---

## 📂 Repository Structure

```plaintext
chinook-sql-analytics/
├── README.md                    # Project overview (you are here)
├── finding_report.md            # Full detailed analysis & insights
├── LICENSE                      # Apache 2.0 license
│
├── docs/                        # Supporting documents
│   ├── project_brief.md         # Problem statement from management
│   └── deliverables_outcomes.md # Key deliverables & success criteria
│
├── notebooks/                   # Reproducible Jupyter notebooks
│   └── chinook_sql_analysis.ipynb
│
├── reports/                     # Final stakeholder-ready reports
│   └── executive_summary.pdf
│
├── sql/                         # Organized SQL scripts
│   ├── customer_market_insights/
│   ├── sales_revenue_analytics/
│   ├── basket_pricing_behavior/
│   ├── catalogue_content_curation/
│   └── team_performance/
│
└── data/ (optional)             # Chinook database if shareable
    └── chinook.db

