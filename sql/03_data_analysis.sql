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
    -- Demand vs Monetization Analysis --
    -- 1. Top Demand Films
    SELECT
		film_id,
		title,
		category,
		rental_count,
		demand_rank
	FROM demand_monetization_mart
	ORDER BY demand_rank
	LIMIT 20;
    -- 2. Low Monetization Films (Low revenue per rental)
	SELECT
	    film_id,
	    title,
	    category,
	    rental_count,
	    total_revenue,
	    revenue_per_rental
	FROM demand_monetization_mart
	WHERE rental_count > 20
	ORDER BY revenue_per_rental ASC
	LIMIT 20;
    -- consider increase the price for films have more than 20 rental count
    -- 3. High Demand but Low Revenue Ranking
	SELECT
		film_id,
		title,
		category,
		rental_count,
		total_revenue,
		demand_rank,
		revenue_rank,
		(revenue_rank - demand_rank) AS monetization_gap
	FROM demand_monetization_mart
	WHERE demand_rank <= 10
	  AND revenue_rank > demand_rank
	ORDER BY monetization_gap DESC
	LIMIT 20;
-- -----------------------------------------------------------------------------------------------
	-- Inventory Efficiency Analysis
	-- 1. Overstocked Films
		-- Which films have high inventory but low rental activity?
		-- These may indicate inefficient inventory allocation
	SELECT
	    film_id,
	    title,
	    category,
	    inventory_count,
	    rental_count,
	    rentals_per_inventory,
	    total_revenue
	FROM inventory_efficiency_mart
	WHERE inventory_count > 7
	  AND rentals_per_inventory < 3
	ORDER BY inventory_count DESC
	LIMIT 20;
	-- 2. Understocked Films
		-- Which films have high demand but limited inventory?
		-- These represent missed revenue opportunities.
	SELECT
	    film_id,
	    title,
	    category,
	    inventory_count,
	    rental_count,
	    rentals_per_inventory,
	    total_revenue
	FROM inventory_efficiency_mart
	WHERE inventory_count <= 5
	  AND rental_count > 20
	ORDER BY rental_count DESC
	LIMIT 20;
	-- 3. Inventory Productivity
		-- Which films generate high revernue per unit of inventory?
		-- These indicate strong capital efficiency
	SELECT
	    film_id,
	    title,
	    category,
	    inventory_count,
	    total_revenue,
	    revenue_per_inventory
	FROM inventory_efficiency_mart
	ORDER BY revenue_per_inventory DESC
	LIMIT 20;
-- -----------------------------------------------------------------------------------------------
	-- ROI/ Capital Effieiency
	-- 1. TOP ROI Films
	SELECT
	    film_id,
	    title,
	    category,
	    total_revenue,
	    total_cost_proxy,
	    roi_proxy
	FROM roi_efficiency_mart
	WHERE total_cost_proxy > 0
	ORDER BY roi_proxy DESC
	LIMIT 20;
	-- 2. Low ROI Films
	SELECT
	    film_id,
	    title,
	    category,
	    total_revenue,
	    total_cost_proxy,
	    roi_proxy
	FROM roi_efficiency_mart
	WHERE total_cost_proxy > 0
	ORDER BY roi_proxy ASC
	LIMIT 20;
	-- 3. ROI vs Demand
		-- Which movie has high demand but low ROI
	SELECT
	    d.film_id,
	    d.title,
	    d.rental_count,
	    r.roi_proxy
	FROM demand_monetization_mart d
	JOIN roi_efficiency_mart r
	    ON d.film_id = r.film_id;

