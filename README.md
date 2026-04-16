# Data Management & Business Strategy Project - DVD Rental Company
## Conversation with ChatGPT: https://chatgpt.com/g/g-p-678ff9c3e3f081919e3368d81418235a-job-searching/c/69c5a856-35dc-8327-b7c1-3ddfd7c5c956
---

## Project Overview
Designed an end-to-end analytics workflow to simulate how a DVD rental company can leverage data to optimize pricing, inventory allocation, and revenue performance.

## Business Questions
The company lacked a structured data model to understand:
1. Which films and categories drive the most revenue?
2. Which films have high demand but weak monetization / inefficient inventory?
3. What pricing and inventory actions could improve revenue?

The goal was to develop a data-driven strategy to improve revenue and operational efficiency.

## Resource
- Sakila(MySQL database)
- Tableau Dashboard: visualize the outcome

## Data Architecture
- Schema Overview
  <img width="771" height="686" alt="image" src="https://github.com/user-attachments/assets/307c5055-10ef-4797-bb4f-bad9205d35ca" />
- diagram (draw.io)

- Architecture
- <img width="430" height="566" alt="image" src="https://github.com/user-attachments/assets/d787807b-f4dd-43e8-815c-0e887fe7b023" />

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
Built a centralized **movie performance data warehouse** by integrating 10+ relational table:

- Source tables: revenue, rental frequency, inventory levels, ROI
- Designed the schema to support scalable analytical queries and decision-making
- Built using SQL transformation (JOIN, CASE, CTEs, subqueries)

Key metrics:
- Revenue per movie
- Rental frequency
- Inventory utilization
- ROI per title

---
## 🔄 ETL Pipeline
- Cleaned and standardized raw transactional data
- Built transformation logic to aggregate business-level metrics
- Ensured consistency between operational data and analytical outputs
---

### 2. Business Analysis & Insights
Performed multi-dimensional analysis to uncover actional insights:

- Movie-level performance
- Genre-level demand patterns
- Inventory allocation efficiency

Key findings:

- High-demand movies were often underpriced  
- Inventory allocation was not aligned with demand  
- ROI varied significantly across titles  

---

### 3. Decision Support & Visualization
Developed Tableau dashboards to translate analysis into business insights:

- Enabled comparison across movies, genres, and store locations
- Supported evaluation of **pricing v.s. demand trade-offs**
- Modeled scenario indicating potential **~15 revenue uplift**

---
## Dashboard
- screenshots
- explanation

**Tools & Technologies:** 
- SQL(Joins, Aggregations, Subqueries, Data Modeling)
- Tableau (Dashboard Design & Visualization)
- ETL Pipelines (Data Cleansing & Transformation)

## 🚀 Key Impact
- Identified opportunities for pricing and inventory optimization  
- Built a scalable data foundation for ongoing analytics  
- Modeled strategies indicating **~15% potential revenue uplift**

**Project Link:** Coming soon

