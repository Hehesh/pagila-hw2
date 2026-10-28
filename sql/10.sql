SELECT feature.special_feature,
       SUM(p.amount) AS profit
FROM film AS f
CROSS JOIN LATERAL unnest(f.special_features) AS feature(special_feature)
JOIN inventory AS i
    ON i.film_id = f.film_id
JOIN rental AS r
    ON r.inventory_id = i.inventory_id
JOIN payment AS p
    ON p.rental_id = r.rental_id
GROUP BY feature.special_feature
ORDER BY feature.special_feature;
