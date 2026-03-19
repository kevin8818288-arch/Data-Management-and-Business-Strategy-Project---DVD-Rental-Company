# Data Management & Business Strategy Project - DVD Rental Company

## Project Overview
Designed an end-to-end analytics workflow to simulate how a DVD rental company can leverage data to optimize pricing, inventory allocation, and revenue performance.

## Business Problem
The company lacked a structured data model to understand:
- which movie drive the most revenue
- How demand varies across genres
- Whether pricing and inventory decisions are aligned with profitability

The goal was to develop a data-driven strategy to improve revenue and operational efficiency.

## Resource
Sakila(MySQL database)
Tableau Dashboard: visualize the outcome

## Solution Approach

### 1. Data Warehouse Design (Semantic Layer)
Built a centralized **movie performance data warehouse** by integrating 10+ relational table (rental, payment, inventory, customer, category) using SQL.

- Aggregated key metrics: revenue, rental frequency, inventory levels, ROI
- Designed the schema to support scalable analytical queries and decision-making

### 2. Business Analysis & Insights
Performed multi-dimensional analysis to uncover actional insights:

- Identified **high-demand but underpriced movies**, suggesting pricing optimization opportunities
- Analyzed **genre-level revenue performance** to guide inventory allocation
- Evaluated **ROI across titles** to prioritize high-return inventory investments

### 3. Decision Support & Visualization
Developed Tableau dashboards to translate analysis into business insights:

- Enabled comparison across movies, genres, and store locations
- Supported evaluation of **pricing v.s. demand trade-offs**
- Modeled scenario indicating potential **~15 revenue uplift**

---

**Tools & Technologies:** 
- SQL(Joins, Aggregations, Subqueries, Data Modeling)
- Tableau (Dashboard Design & Visualization)
- ETL Pipelines (Data Cleansing & Transformation)
## 🚀 Key Impact
- Established a structured data foundation for analytics and reporting
- Provided actionable recommendations on pricing and inventory strategy
- Demonstrated how data-driven decisions can improve revenue performance (~15% uplift potential)

**Project Link:** Coming soon
