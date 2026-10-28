SELECT special_feature AS special_features, COUNT(*)
FROM (
    SELECT unnest(special_features) AS special_feature
    FROM film
) AS features
GROUP BY special_feature
ORDER BY special_feature;
