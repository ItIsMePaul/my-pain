WITH poor_quality_amount AS (
  SELECT query_name, count(*) AS bad_quality
  FROM Queries
  WHERE rating < 3
  GROUP BY query_name
)
SELECT Queries.query_name, 
       ROUND(SUM(Queries.rating::numeric / Queries.position) / count(*), 2) AS quality, 
       ROUND(COALESCE(poor_quality_amount.bad_quality, 0)::numeric / count(*) * 100, 2) AS  poor_query_percentage 
FROM Queries
LEFT JOIN poor_quality_amount ON poor_quality_amount.query_name = Queries.query_name
GROUP BY Queries.query_name, poor_quality_amount.bad_quality;