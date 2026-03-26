- table used in movie performance data warehouse
  - film f
  - inventory inv
  - category c
  - payment p
  - language l
  - film category fc
  - rental r

WITH stg_film AS (
    SELECT
        film_id,
        title AS film_title,
        rental_rate,
        replacement_cost
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
)
