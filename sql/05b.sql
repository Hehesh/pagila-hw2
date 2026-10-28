SELECT a.last_name, a.first_name
FROM actor AS a
LEFT JOIN customer AS c
    ON c.first_name = a.first_name
   AND c.last_name = a.last_name
WHERE c.customer_id IS NULL
ORDER BY a.last_name, a.first_name;
