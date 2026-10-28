SELECT f.title
FROM film AS f
JOIN inventory AS i
    ON i.film_id = f.film_id
JOIN rental AS r
    ON r.inventory_id = i.inventory_id
WHERE r.customer_id = 1
GROUP BY f.title
HAVING COUNT(*) > 1
ORDER BY f.title;
