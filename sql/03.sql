SELECT DISTINCT c.customer_id
FROM customer AS c
JOIN rental AS r
    ON r.customer_id = c.customer_id
JOIN inventory AS i
    ON i.inventory_id = r.inventory_id
JOIN film AS f
    ON f.film_id = i.film_id
JOIN payment AS p
    ON p.rental_id = r.rental_id
WHERE f.film_id IN (
    SELECT f2.film_id
    FROM film AS f2
    JOIN inventory AS i2
        ON i2.film_id = f2.film_id
    JOIN rental AS r2
        ON r2.inventory_id = i2.inventory_id
    JOIN payment AS p2
        ON p2.rental_id = r2.rental_id
    GROUP BY f2.film_id
    ORDER BY SUM(p2.amount) DESC
    LIMIT 5
)
ORDER BY c.customer_id;
