WITH film_revenue AS (
    SELECT f.title,
           COALESCE(SUM(p.amount), 0.00) AS revenue
    FROM film AS f
    LEFT JOIN inventory AS i ON i.film_id = f.film_id
    LEFT JOIN rental AS r ON r.inventory_id = i.inventory_id
    LEFT JOIN payment AS p ON p.rental_id = r.rental_id
    GROUP BY f.film_id, f.title
)
SELECT RANK() OVER (ORDER BY revenue DESC) AS rank,
       title,
       revenue
FROM film_revenue
ORDER BY rank, title;
