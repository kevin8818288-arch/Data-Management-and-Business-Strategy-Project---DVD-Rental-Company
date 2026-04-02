-- Data Analysis
	-- Revenue Analysis --
    -- 1. Top 20 Revenue Drivers
    SELECT 
		film_id,
        title,
        total_revenue,
        revenue_rank
	FROM revenue_mart
    ORDER BY revenue_rank
    LIMIT 20;
	
    -- 2. Revenue by Category
    SELECT
		category,
		COUNT(*) AS film_count,
		SUM(total_revenue) AS category_revenue,
		AVG(total_revenue) AS avg_revenue_per_film
	FROM revenue_mart
	GROUP BY category
	ORDER BY category_revenue DESC;
	-- Sports category has the higheest revenue generated in the whole year. But one thing we can notice is,
    -- even Sci-Fi has less films than Sports, they still generate the highest revenue per film, showcasing Sci-Fi is also with high potential.
    
    -- 3. Top 20 Most Rented Films and Their Revenue Contribution
	SELECT
		film_id,
		title,
		category,
		rental_count,
		total_revenue,
		revenue_rank
	FROM revenue_mart
	ORDER BY rental_count DESC
	LIMIT 20;
    -- Some movies with 32-33 rentals count gernate much lower revenue than expected with high rental frequecy, ranking in more than 100
    
    -- 4. Revenue Driver Analysis: Demand-Driven vs Supply-Supported
    SELECT
		film_id,
		title,
		category,
		total_revenue,
		rental_count,
		inventory_count,
		rental_count / NULLIF(inventory_count, 0) AS rentals_per_inventory
	FROM revenue_mart
	ORDER BY total_revenue DESC
	LIMIT 50;
    -- The table shows that the key revenue driver was not derived from higher inventory, since each films has similar stock. Therefore, the demand is the key driven that affects revenue.
-- ------------------------------------------------------------------------------------------------------ --
	2. Demand vs Monetization
- Demand vs Monetization
1. Top rental count~= Top 10/20 most famous movie
2. which film has low revenue per rental
3. which movie has the high demand and low revenue ranking?
  - too see if we need to pivot the pricing strategy

-Inventory Efficiency
1. which movie has high inventory but low sales?
2. which movie has low inventory but high rental_count
3. high revenue per inventory

- ROI/ Capital Effieiency
1. ROI by film
  a. high ROI
  b. low ROI
2. which movie has high demand but low ROI
