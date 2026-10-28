SELECT f.title
FROM film AS f
WHERE 'Behind the Scenes' IN (
          SELECT unnest(f.special_features)
      )
  AND 'Trailers' IN (
          SELECT unnest(f.special_features)
      )
ORDER BY f.title;
