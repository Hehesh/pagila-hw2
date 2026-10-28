SELECT f.title,
       COALESCE(SUM(p.amount), 0.00) AS revenue
FROM film AS f
LEFT JOIN inventory AS i
    ON i.film_id = f.film_id
LEFT JOIN rental AS r
    ON r.inventory_id = i.inventory_id
LEFT JOIN payment AS p
    ON p.rental_id = r.rental_id
GROUP BY f.film_id, f.title
ORDER BY revenue DESC, f.title;
