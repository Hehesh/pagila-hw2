SELECT EXTRACT(YEAR FROM r.rental_date)::integer AS "Year",
       EXTRACT(MONTH FROM r.rental_date)::integer AS "Month",
       SUM(p.amount) AS "Total Revenue"
FROM rental AS r
JOIN payment AS p
    ON p.rental_id = r.rental_id
GROUP BY ROLLUP (
    EXTRACT(YEAR FROM r.rental_date),
    EXTRACT(MONTH FROM r.rental_date)
)
ORDER BY "Year" NULLS LAST, "Month" NULLS LAST;
