SELECT f.title
FROM film AS f
LEFT JOIN inventory AS i
    ON i.film_id = f.film_id
WHERE i.inventory_id IS NULL
ORDER BY f.title;
