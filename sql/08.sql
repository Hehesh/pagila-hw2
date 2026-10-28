SELECT f.title
FROM film AS f
WHERE f.rating = 'G'
  AND 'Trailers' IN (
      SELECT unnest(f.special_features)
  )
ORDER BY f.title;
