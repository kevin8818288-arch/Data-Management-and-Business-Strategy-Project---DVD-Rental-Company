CREATE TABLE movie_performance_dw AS
WITH stg_film AS (
    SELECT
        film_id,
        title AS film_title,
        release_year,
        rental_rate,
        replacement_cost,
        language_id
    FROM film
),
stg_inventory AS (
    SELECT
        inventory_id,
        film_id
    FROM inventory
),
stg_rental AS (
    SELECT
        rental_id,
        inventory_id,
        rental_date
    FROM rental
),
stg_payment AS (
    SELECT
        payment_id,
        rental_id,
        amount,
        payment_date
    FROM payment
    WHERE amount >= 0
),
stg_category AS (
    SELECT
        fc.film_id,
        c.name AS category_name
    FROM film_category fc
    JOIN category c
        ON fc.category_id = c.category_id
),
inventory_summary AS (
    SELECT
        film_id,
        COUNT(*) AS inventory_count
    FROM stg_inventory
    GROUP BY film_id
)

SELECT
    f.film_id,
    f.film_title AS title,
    f.release_year,
    f.rental_rate,
    f.replacement_cost,
    inv.inventory_count,
    COUNT(DISTINCT r.rental_id) AS rental_count,
    COALESCE(SUM(p.amount), 0) AS total_revenue,
    MAX(p.payment_date) AS latest_payment_date,
    COALESCE(SUM(p.amount), 0) / NULLIF(inv.inventory_count, 0) AS revenue_per_inventory,
    COALESCE(SUM(p.amount), 0) / NULLIF(COUNT(DISTINCT r.rental_id), 0) AS revenue_per_rental,
    c.category_name AS category,
    l.name AS language
FROM stg_film f
JOIN inventory_summary inv
    ON f.film_id = inv.film_id
JOIN stg_category c
    ON f.film_id = c.film_id
LEFT JOIN language l
    ON f.language_id = l.language_id
LEFT JOIN stg_inventory i
    ON f.film_id = i.film_id
LEFT JOIN stg_rental r
    ON i.inventory_id = r.inventory_id
LEFT JOIN stg_payment p
    ON r.rental_id = p.rental_id
GROUP BY
    f.film_id,
    f.film_title,
    f.release_year,
    f.rental_rate,
    f.replacement_cost,
    inv.inventory_count,
    c.category_name,
    l.name
ORDER BY total_revenue DESC;
