# Data Management & Business Strategy Project - DVD Rental Company

## Project Overview
This project simulates how a DVD rental company can use data to improve revenue performance through pricing, inventory allocation, and capital efficiency analysis.

I designed an end-to-end analytics workflow that transforms raw transactional data into a structured analytical layer, business-focused data marts, and an interactive Power BI dashboard for decision support.

---

## Business Questions
The company lacked a structured data model to understand:
1. Which films and categories drive the most revenue?
2. Which films show high demand but relatively weak revenue contribution?
3. How can pricing and inventory allocation be optimized to improve revenue performance?
4. What pricing and inventory actions could improve revenue?

The goal was to develop a data-driven strategy to improve revenue and operational efficiency.

## Resource
- Sakila (MySQL database)
- Core tables used: `film`, `inventory`, `rental`, `payment`, `category`, `film_category`, and `language`

---

## Data Architecture
### Schema Overview
  <img width="771" height="686" alt="image" src="https://github.com/user-attachments/assets/307c5055-10ef-4797-bb4f-bad9205d35ca" />
### Analytics Workflow
<img width="430" height="566" alt="image" src="https://github.com/user-attachments/assets/d787807b-f4dd-43e8-815c-0e887fe7b023" />
This project follows a layered analytics architecture:

1. **Raw Data Layer**
   - Source tables from the Sakila MySQL database

2. **Lightweight Staging Layer**
   - Selected relevant columns
   - Standardized naming
   - Applied basic validation

3. **Data Warehouse / Semantic Layer**
   - Built a centralized film-level analytical dataset
   - Integrated 10+ relational tables
   - Defined reusable business metrics

4. **Data Marts**
   - Created business-focused views for revenue, demand vs monetization, inventory efficiency, and ROI analysis

5. **Dashboard & Insights**
   - Visualized key metrics in Power BI to support pricing and inventory decisions

- Outcome
  <img width="1325" height="362" alt="image" src="https://github.com/user-attachments/assets/dbb61ad1-8728-48ee-9d42-f093c1739b86" />

📊 Demand Distribution Insight

Due to duplicated rental counts across films, multiple films share the same demand rank (using DENSE_RANK()).

This indicates that:

Customer demand is clustered rather than evenly distributed
Many films perform similarly in terms of rental frequency
Ranking-based filtering may include larger groups than expected

## Solution Approach

### 1. Data Warehouse Design (Semantic Layer)
Built a centralized `movie_performance_dw` table as the core analytical layer.

Each row represents one film and includes:

- Film attributes: title, category, language, release year
- Pricing inputs: rental rate, replacement cost
- Demand metrics: rental count
- Revenue metrics: total revenue, revenue per rental
- Inventory metrics: inventory count, revenue per inventory

Key metrics include:

- `total_revenue`
- `rental_count`
- `inventory_count`
- `revenue_per_rental`
- `revenue_per_inventory`

---
## Data Marts

Created four analytical data marts to support specific business questions:

### Revenue Mart

Purpose:
- Identify top revenue-generating films and categories
- Evaluate revenue concentration and business drivers

### Demand & Monetization Mart

Purpose:
- Compare demand volume with revenue contribution
- Identify high-demand films with weaker monetization
- Detect potential pricing review opportunities

### Inventory Efficiency Mart

Purpose:
- Evaluate whether inventory allocation aligns with customer demand
- Identify overstocked or understocked films
- Measure inventory utilization efficiency

### ROI Efficiency Mart

Purpose:
- Estimate capital efficiency using replacement cost and inventory count as a proxy for investment
- Identify films with stronger or weaker proxy ROI performance
---

### 2. Business Analysis & Insights
  ### 1. Revenue Analysis

Analyzed top revenue-generating films and category-level performance to understand which titles and genres drive business performance.

Key insight:
- Revenue is concentrated among a subset of high-performing films.
- Category-level analysis helps identify which genres may deserve more inventory or pricing attention.

  ### 2. Demand vs Monetization Analysis

Compared rental count with total revenue and revenue per rental to identify films with high demand but weaker revenue contribution.

Key insight:
- Several high-demand films generated lower revenue than expected relative to their demand level.
- These films represent potential candidates for pricing review or monetization strategy adjustments.

Key findings:

- High-demand movies were often underpriced  
- Inventory allocation was not aligned with demand  
- ROI varied significantly across titles  

---

  ### 3. Decision Support & Visualization
Developed Tableau dashboards to translate analysis into business insights:

- Enabled comparison across movies, genres, and store locations
- Supported evaluation of **pricing v.s. demand trade-offs**
- Modeled scenario indicating potential **~15% revenue uplift**
  ### 4. ROI / Capital Efficiency Analysis

Used replacement cost multiplied by inventory count as a cost proxy to estimate capital efficiency.

Key insight:
- Proxy ROI varies significantly across titles, suggesting that some films generate stronger returns relative to inventory investment.

---
## Dashboard
<img width="1290" height="724" alt="image" src="https://github.com/user-attachments/assets/0b6e5b2e-2f8d-4206-9b70-c0c29df35e87" />
The dashboard visualizes revenue, demand, monetization, inventory allocation, and ROI efficiency to identify pricing and inventory optimization opportunities.

Key components include:
- KPI overview for revenue, rentals, revenue per rental, and film coverage
- Demand vs Monetization analysis to identify high-demand films with weak revenue contribution
- Priority Films table to translate monetization gaps into actionable pricing review candidates
- ROI vs Demand analysis to evaluate capital efficiency
- Inventory Allocation vs Demand analysis to assess whether inventory levels align with customer demand
---

## Key Impact

- Built a reusable analytical data foundation by integrating 10+ relational tables into a centralized film-level dataset
- Created business-focused data marts to support revenue, pricing, inventory, and capital efficiency analysis
- Identified pricing and inventory optimization opportunities through demand, monetization, and ROI analysis
- Modeled strategies suggesting approximately **10–15% potential revenue uplift** under scenario-based assumptions

---

## Tools & Technologies

- **SQL / MySQL:** joins, aggregations, CTEs, window functions, data modeling
- **Power BI:** dashboard design, KPI cards, scatter plots, priority tables
- **Data Modeling:** semantic layer, data marts, metric definition
- **Business Analytics:** pricing analysis, inventory allocation, proxy ROI analysis

---

## Project Takeaway

This project demonstrates how raw transactional data can be transformed into a structured decision-support system. By combining data modeling, SQL analysis, and dashboard visualization, the project identifies actionable opportunities for pricing review and inventory optimization.


**Project Link:** Coming soon

