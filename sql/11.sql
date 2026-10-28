SELECT DISTINCT
       a.first_name || ' ' || a.last_name AS "Actor Name"
FROM actor AS a
JOIN film_actor AS fa
    ON fa.actor_id = a.actor_id
JOIN film AS f
    ON f.film_id = fa.film_id
WHERE 'Behind the Scenes' IN (
    SELECT unnest(f.special_features)
)
ORDER BY "Actor Name";
