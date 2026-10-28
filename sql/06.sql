SELECT f.title
FROM film AS f
WHERE f.film_id NOT IN (
    SELECT i.film_id
    FROM inventory AS i
)
ORDER BY f.title;
