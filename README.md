![Banner Image](./assets/banner.png)

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

As Chinook continues to grow as a global digital music store, leadership identified a critical need for **data-backed decision-making** across customer engagement, sales strategy, and catalogue management.  

While the company collects detailed transactional and catalogue data, leadership lacked **clear, actionable insights** to answer key questions such as:  
- Who are our most valuable customers and markets?  
- What is driving revenue growth (or stagnation) across time, products, and geographies?  
- How do customer baskets and pricing sensitivities shape purchasing behavior?  
- Which tracks and albums are underperforming due to lack of promotion or playlist placement?  
- How effectively are support reps (account managers) managing their customer portfolios and revenue responsibilities?  

To address these gaps, the Data Analyst was tasked with a **comprehensive SQL-based analysis** of the [Chinook Database](https://github.com/ObengKojo23/chinook-sql-analytics/tree/main/dataset).  

The objectives of this project were to:  
- Build a **robust, reproducible analytics workflow** using SQL and Jupyter Notebook.  
- Deliver **executive-ready insights** that support marketing, sales, and product teams.  
- Provide **clear, actionable recommendations** that can directly inform strategy.  

The outcomes of this project provide management with a clear, evidence-based view of the business. Insights will form the foundation for **data-informed decision-making** across marketing, sales, and content teams, ensuring that strategies are backed by evidence rather than intuition. 

---

## 📌 Problem Statement  

To enable data-driven decision-making, **senior management commissioned a deep-dive analysis** of the Chinook database, focusing on five strategic pillars:  

1️⃣ **Customer & Market Insights** – Identifying high-value customers and top-performing markets to guide retention and expansion strategies.  
2️⃣ **Sales & Revenue Analytics** – Measuring revenue performance, uncovering trends, and highlighting best-selling products.  
3️⃣ **Basket & Pricing Behavior** – Understanding purchasing patterns, basket sizes, and price sensitivity to optimize pricing and promotions.  
4️⃣ **Catalogue & Content Curation** – Evaluating catalogue performance, surfacing underutilized tracks, and improving playlist curation.  
5️⃣ **Team Performance (Support Reps)** – Assessing account managers’ portfolio coverage, revenue contribution, and performance efficiency.  

---

## 🎯 Deliverables & Outcomes  

### 📂 Deliverables  
- **SQL Queries Notebook:** All queries written, executed, and documented in Jupyter.  
- **Chinook Database Connection Setup:** Simple setup to replicate results locally.  
- **Documentation:** Business problem framework, insights, and recommendations.  
- **SQL Script Folder:** Modular `.sql` files organized by business problem category.  

### 📊 Outcomes  
- Identified top **20 high-value customers** and segmented markets by revenue & AOV.  
- Highlighted **monthly revenue trends** and top-performing tracks, artists, genres, and media types.  
- Revealed **basket size and value patterns**, including price-sensitive products.  
- Exposed **curation gaps** (tracks missing from playlists) and most-playlisted tracks.  
- Evaluated **employee performance** by revenue under management, average deal size, and portfolio efficiency.  

✅ **Result:** A reproducible analysis that empowers data-driven decision-making in marketing, product curation, and sales operations.

---

## 🛠 Skills & Technologies Used  

- **SQL (SQLite)** — Complex joins, aggregations, CTEs, window functions  
- **Python** — Data analysis in Jupyter Notebook  
- **SQLAlchemy + ipython-sql** — Seamless database connection inside Jupyter  
- **Pandas** — Tabular data manipulation & exploration  
- **Matplotlib/Plotly** — Revenue trend and portfolio performance visualization  
- **Business Intelligence** — Problem framing, insight generation, executive-ready recommendations  
- **Git/GitHub** — Version control & project documentation  

---

## 📂 Repository Structure

```plaintext
chinook-sql-analytics/
├── README.md                             # Main project overview and documentation
├── requirements.txt                      # Python dependencies for environment setup
├── data/
│   └── chinook.db                        # SQLite database file used for analysis
├── notebooks/
│   └── chinook_sql_analysis.ipynb        # Jupyter Notebook with SQL queries, results, and insights
├── sql_queries/
│   ├── customer_market_insights.sql       # SQL queries for customer and market analysis
│   ├── sales_revenue_analytics.sql        # SQL queries for sales and revenue trends
│   ├── basket_pricing_behavior.sql        # SQL queries for basket size, value, and pricing behavior
│   ├── catalogue_content_curation.sql     # SQL queries for catalogue and playlist optimization
│   ├── team_performance.sql               # SQL queries for account manager performance analysis
│   └── all_queries_master.sql             # Consolidated file with all SQL queries
├── docs/
│   ├── project_brief.md                   # Project problem statement and objectives
│   ├── deliverables_outcomes.md           # Deliverables and expected outcomes
│   └── finding_report.md                  # Consolidated findings and recommendations
└── assets/
    └── notebook-preview.gif               # Notebook preview or screenshot
```

---

## 📑 Project Files

| File/Folder | Purpose |
|-------------|---------|
| **[finding_report.md](./finding_report.md)** | Comprehensive findings & recommendations report for management |
| **[chinook_sql_analysis.ipynb](./chinook_sql_analysis.ipynb)** | Main Jupyter Notebook with SQL queries, outputs, insights, and commentary |
| **[setup_sql_in_jupyter_notebook.ipynb](./setup_sql_in_jupyter_notebook.ipynb)** | Environment setup guide — shows how to connect Jupyter to the Chinook SQLite database |
| **[sql_queries_scripts/](./sql_queries_scripts/)** | Modular SQL scripts organized by business area |
| ├── `customer_market_insights.sql` | Queries for high-value customers, revenue by country, and AOV |
| ├── `sales_revenue_analytics.sql` | Queries for headline KPIs, monthly revenue trends, top tracks & artists |
| ├── `basket_pricing_behavior.sql` | Basket size, basket value, and price sensitivity queries |
| ├── `catalogue_content_curation.sql` | Playlist gaps, catalogue coverage, and most-played tracks |
| ├── `team_performance.sql` | Revenue by rep, portfolio size, and average invoice analysis |
| └── `all_queries_master.sql` | Consolidated file with all SQL queries in one place |
| **[database/chinook.db](./database/chinook.db)** | SQLite database file used for analysis (if license allows distribution) |
| **[images/](./images/)** | Project assets (banner image, database ERD diagram) used in README & notebook |
| **[requirements.txt](./requirements.txt)** | Python dependencies to reproduce the analysis locally |
| **[LICENSE](./LICENSE)** | Project license (Apache 2.0) |
| **[README.md](./README.md)** | This file — full project overview, problem statement, deliverables, and setup instructions |


---

## 🔄 How to Reproduce  

1. **Clone the repository**
   ```bash
   git clone https://github.com/obengkojo23/chinook-sql-analytics.git
   cd chinook-sql-analytics

2. **Create & activate a virtual environment (recommended)**
   ```bash
   python -m venv venv
   # macOS/Linux
   source venv/bin/activate
   # Windows
   venv\Scripts\activate

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt

4. **Verify the database file**

- Ensure that `data/chinook.db` exists in the `data/` folder.  
- If missing, [download the Chinook SQLite database](https://www.sqlitetutorial.net/sqlite-sample-database/) and place it inside the `data/` directory.

5. **Launch Jupyter and run the analysis**
   ```bash
   jupyter notebook
- Open `notebooks/chinook_sql_analysis.ipynb`.  
- In Jupyter, navigate to **Kernel → Restart & Run All** to execute all queries and reproduce outputs, visualizations, and insights.

---

## 🎥 Project Preview  

A quick glimpse of the Jupyter Notebook execution, showing queries, query outputs, insights, and recommendations.  

#### 🖼️ GIF Walkthrough
![Chinook Project Demo](./assets/notebook_preview.gif)



---

## 👤 Author 

**Emmanuel Obeng Afari**  

🔗 **Connect with me:**  
For any questions or suggestions, feel free to reach out:
- [LinkedIn](https://www.linkedin.com/in/obengafari)
- [GitHub](https://github.com/ObengKojo23)
- [Email](mailto:emmanuel.o.afari@gmail.com)

---

## 📜 License
This project is licensed under the [Apache License 2.0](https://github.com/ObengKojo23/chinook-sql-analytics/blob/main/LICENSE)

---

## 🏁 Business Impact
- This project demonstrates my ability to:
- Translate raw transactional data into clear, actionable business insights
- Build reproducible, well-documented SQL workflows
- Communicate results in an executive-ready, decision-focused format


