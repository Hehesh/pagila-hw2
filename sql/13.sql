SELECT EXTRACT(YEAR FROM rental_date)::integer AS "Year",
       EXTRACT(MONTH FROM rental_date)::integer AS "Month",
       COUNT(*) AS "Total Rentals"
FROM rental
GROUP BY ROLLUP (
    EXTRACT(YEAR FROM rental_date),
    EXTRACT(MONTH FROM rental_date)
)
ORDER BY "Year" NULLS LAST, "Month" NULLS LAST;
