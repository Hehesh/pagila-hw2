SELECT DISTINCT f.title
FROM film AS f
JOIN inventory AS i
    ON i.film_id = f.film_id
LEFT JOIN (
    SELECT DISTINCT i2.film_id
    FROM inventory AS i2
    JOIN rental AS r
        ON r.inventory_id = i2.inventory_id
    JOIN customer AS c
        ON c.customer_id = r.customer_id
    JOIN address AS a
        ON a.address_id = c.address_id
    JOIN city AS ci
        ON ci.city_id = a.city_id
    JOIN country AS co
        ON co.country_id = ci.country_id
    WHERE co.country = 'United States'
) AS us_rentals
    ON us_rentals.film_id = f.film_id
WHERE us_rentals.film_id IS NULL
ORDER BY f.title;
