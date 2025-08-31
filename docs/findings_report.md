# 📊 Findings & Recommendations Report (Chinook SQL Analytics)

This report summarizes insights from a comprehensive SQL analysis of the Chinook music store database.  
The findings are organized into five business themes, with **clear recommendations** for management action.

---

## 1️⃣ Customer & Market Insights

**Key Insights:**
- **Top Lifetime Value Customers:**  
  - Helena Holý (Czech Republic) leads with **$49.62** lifetime revenue.  
  - Richard Cunningham (USA) and Luis Rojas (Chile) follow closely, with **$47.62** and **$46.62** respectively.  
  - USA-based customers dominate the top 20 list — a clear signal of a strong North American customer base.

- **Market Revenue Distribution:**  
  - **USA** leads with $523.06 (22.46%) — Making `USA` our primary revenue driver.  
  - **Canada:** follows with $303.96 (13.05%) and **France** is our third biggest market with $195.10 (8.38%).  
  - The top 5 countries(`USA`, `Canada`, `France`, `Brazil` and `Germany`) contribute **58.77% of the total revenue**. This highlights a **concentrated market opportunity**.
  - **Long-tail countries** such as Denmark, Italy, and Spain contribute smaller but **consistent revenue streams**, making them ideal candidates for targeted upselling and cross-selling campaigns.

- **Average Order Value (AOV):**  
  - **Highest AOV markets:** Chile (**$6.66**), Ireland (**$6.52**), and Hungary (**$6.52**), despite being smaller contributors in overall revenue.  
  - USA and Canada have mid-tier AOVs (**$5.75** and **$5.43**), showing growth potential.

- **Customer Retention:**  
  - 100% of customers are repeat buyers (0 one-timers detected).  
  - This suggests strong loyalty, existing engagement and a probable effective retention strategies by management.

### **🎯Recommendations:**
- **Prioritize High-Revenue Markets:** Focus marketing and promotional campaigns on **USA, Canada, France, Brazil and Germany** where revenue concentration is highest.  
- **Lift AOV in Key Markets:** Test product bundles and cross-sells in USA and Canada to raise AOV.  
- **VIP Program:** Develop a loyalty tier for top LTV customers with early access to new releases to protect and grow these valuable relationships.
- **Retention Strategy:** Maintain engagement via personalized recommendations and exclusive offers. Since no customers are one-timers, invest in **cross-selling complementary products** and **loyalty incentives** to further monetize repeat behavior.

### 📌 **Management Takeaway:**  
The company has a **loyal and concentrated customer base** with significant growth potential in both **revenue and AOV**. Strategic focus on key markets and customer engagement initiatives can accelerate profitability.

---

## 2️⃣ Sales & Revenue Analytics

**Key Insights:**
- **Total Revenue:** **$20,848.62** across **2,240** units sold with steady performance across multiple years.
- **Top Genres:**  
  - **Rock** leads at **$826.65** (40% of sales), followed by Latin (**$382.14**) and Metal (**$261.36**).  
  - Genre sales are heavily skewed, with **Rock, Latin, and Metal** contributing **63.13%** of catalog revenue.
  - TV Shows soundtracks (**Lost**, **The Office**) also appear in the top 10, and generate **$93.53** in revenue indicating a strong demand for media-related content.

- **Top Artists:**  
  - **Iron Maiden ($138.60)**, **U2 ($105.93)**, and **Metallica ($90.09)** dominate artist revenue, confirming **Rock/Metal** as the core genre drivers. 
  - Long tail of artists generates moderate revenue — potential for curated exposure.

- **Revenue by Media Type (format):**  
  - **MPEG audio files** contribute **$1,956.24** representing and overwhelming **84.01%** of the total revenue.  
  - Other formats like Protected MPEG-4 video (**$220.89**) and Protected AAC audio (**$144.54**)  contribute marginally.
  - Protected MPEG-4 and AAC formats worefully underperformed.

- **Revenue Trend:**  
  - Monthly revenues are stable, with slight seasonal peaks in **April** and **November**.  
  - No major declining trend observed indicating that demand is steady.

### **🎯Recommendations:**
- **Expand High-Performing Genres:** Increase catalog depth in **Rock**, **Latin** and **Metal** categories.  
- **Leverage Top Artists:** Feature **Iron Maiden**, **U2**, and **Metallica** in promotions to boost revenue.  
- **Phase Out Low-Performing Formats:** Prioritize high-performing media types (**MPEG audio**) in catalog updates and user experience.
- Reassess the business case for rarely purchased formats (**Purchased/Unprotected AAC**) 
- **Seasonal Promotions:** Launch campaigns ahead of **April** and **November** peaks to maximize demand.
- Curate dedicated “TV & Film Soundtracks” playlists to increase discovery and repeat purchases.

  
### 📌 **Management Takeaway:**  
The company has a strong, stable revenue stream driven by dominant genres like Rock, Latin, and Metal, as well as a core group of popular artists. The heavy reliance on MPEG audio suggests focusing catalog expansion on this format. The stable monthly revenue trend, combined with seasonal peaks, presents an opportunity to maximize sales with targeted promotions and curated contend. A strategic shift towards high-performing formats and genres will further strengthen the brand's market position.

---

## 3️⃣ Basket & Pricing Behavior

**Key Insights:**
- **Largest Baskets:**  
  - **Highest observeed:** Invoice 404 shows **14 items** with a basket value of **$25.86**.
  - The largest orders contain **14 items** per basket, with values ranging from **$13.86 to $25.86**.
  - Large baskets are rare, with most invoices containing fewer than 10 items.

- **Price-Sensitive Tracks:**  
  - Popular tracks with **low average price ($0.99)** generate significant unit sales.
  - These tracks drive volume but limit revenue per unit.

### **🎯Recommendations:**
- **Cross-Sell Strategy:** Suggest related tracks at checkout to raise basket value.  
- **Tiered Pricing:** Introduce “premium bundles” with slight discounts to incentivize bigger baskets.  
- **Promote High-Margin Tracks:** Highlight slightly higher-priced tracks alongside popular low-price ones.

### 📌 **Management Takeaway:**  
The company's basket sizes are relatively small, with only a few orders reaching higher values. While low-priced tracks drive significant volume, they limit per-unit revenue. A strategic focus on cross-selling, premium bundles, and highlighting higer-margin tracks can increase overall basket value and profitability without deterring price-sensitive customers.

---

## 4️⃣ Catalogue & Content Curation

**Key Insights:**
- **Lenny Kravitz – *Greatest Hits*** leads with **57 tracks**, followed by **Chico Buarque – *Minha História* (34)** and **Eric Clapton *Unplugged* (30)**.
- Multiple **TV season releases** (*Lost*, *The Office*, *Battlestar Galactica*) have **24–26+ tracks**, creating natural binge-listening bundles.
- Classic rock “best of”/live compilations (Queen, Creedence, U2, Metallica, Guns N’ Roses) appear frequently with **16–20+ tracks**, ideal for long-form listening.
- The **most-playlisted tracks (5 playlists each)** are predominantly **classical/orchestral works** (e.g., *Carmen: Overture*, *O Fortuna*, Mozart/Handel pieces).
- **Long-Tail Tracks Underperform:** Several tracks are missing from playlists or have very low sales volume.
- **Top-Performing Tracks:** A small group of tracks (e.g., “The Woman King”, “The Fix”) dominate revenue.

### **🎯Recommendations:**
- **Promote the Long Tail:** Create discovery playlists to surface under-promoted tracks.  
- **Curated Editorial Playlists:** Rotate tracks monthly to balance exposure between popular and niche items.  
- **Artist Spotlight Campaigns:** Feature artists with deep catalogues to drive repeat engagement.
- Maintain classical flagships (evergreen search demand) but **rebalance playlist real estate** toward genres/artists with higher commercial impact.

### 📌 **Management Takeaway:**  
The compan's catalog features strong top performers such as Lenny Kravits and classic rock compilations, but also presents underexposed long-tail tracks that are missing from playlists or generating low sales. By focusing on curated editorial playlists and artist spotlights, the catalog can achieve better balance, providing greater exposure to niche tracks while maintaining the popularity of classical and evergreen pieces. This approach will enhance repeat engagement and diversify the revenue stream.


---

## 5️⃣ Team Performance (Support Reps as Account Managers)

**Key Insights:**
- **Top Performers:**  
  - `Jane Peacock` leads with **$833.04** managed revenue.  
  - `Margaret Park` ($775.40) and `Steve Johnson` ($720.16) follow closely.
- **Average Invoice Value:**  
  - `Steve Johnson` leads the hightest average invoice value with **$5.72**, showing superior deal quality. He is slightly ahead of `Jane` (**$5.71**) and `Margaret` (**$5.54**).
- **Portfolio Coverage:**  
  - Jane (21 customers), Margaret (20), and Steve (18) collectively handle all active accounts.   
  - Five employees show **zero assigned customers**, indicating unused capacity.

### **🎯Recommendations:**
- **Replicate Top-Performer Playbooks:** Document Jane, Margaret, and Steve’s tactics for broader team adoption.
- **Rebalance Portfolios:** Distribute accounts to underutilized reps to spread workload and reduce risk concentration..
- **Enablement & Training:** Provide sales coaching and objection handling playbooks to underperformers.
- **Capacity Model:** Define optimal accounts per rep and refresh allocation quarterly.

### 📌 **Management Takeaway:**  
The team's top performers, Jane Peacock, Margaret Park, and Steve Johnson, exhibit strong account management, with high revenue and superior invoice values. However, a capacity imbalance exists, with some reps underutilized. By replicating best practices from the top performers, redistributing portfolios to balance workloads, and offering additional training to underperformers, the team can further enhance the overall efficiency and reduce risk concentration across accounts.


---


## 📌 Strategic Summary

This analysis highlights **where to focus efforts** for growth:
- **Market Focus:** Prioritize top 5 countries and unlock potential in mid-AOV markets.
- **Product Strategy:** Double down on Rock/Latin genres and top artists.
- **Customer Growth:** Increase basket size and launch loyalty incentives.
- **Sales Coverage:** Balance portfolios and replicate winning strategies.


✅ These recommendations create a roadmap for **sustainable revenue growth**, **customer retention**, and **operational efficiency**.  

