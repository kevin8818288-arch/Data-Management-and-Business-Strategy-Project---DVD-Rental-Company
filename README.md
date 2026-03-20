# Data Management & Business Strategy Project - DVD Rental Company

## Checklist
- fill out Readme
- organize my SQL file into three categories and upload
- Visualize my dashboard by myself (considering using Power BI as my main tool)

## Project Overview
Designed an end-to-end analytics workflow to simulate how a DVD rental company can leverage data to optimize pricing, inventory allocation, and revenue performance.

## Business Problem
The company lacked a structured data model to understand:
- which movie drive the most revenue?
- How demand varies across genres?
- Whether pricing and inventory decisions are aligned with profitability?

The goal was to develop a data-driven strategy to improve revenue and operational efficiency.

## Resource
- Sakila(MySQL database)
- Tableau Dashboard: visualize the outcome

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

**Tools & Technologies:** 
- SQL(Joins, Aggregations, Subqueries, Data Modeling)
- Tableau (Dashboard Design & Visualization)
- ETL Pipelines (Data Cleansing & Transformation)

## 🚀 Key Impact
- Identified opportunities for pricing and inventory optimization  
- Built a scalable data foundation for ongoing analytics  
- Modeled strategies indicating **~15% potential revenue uplift**

**Project Link:** Coming soon

