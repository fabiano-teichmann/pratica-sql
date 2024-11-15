-- CTE
WITH ranking AS (
  SELECT
    description,
    category,
    sub_category,
    total,
    rank() over(partition by category order by total desc) RankCategoria
    
  FROM expense
)

SELECT
  description,
  category,
  sub_category,
  total
FROM ranking
WHERE RankCategoria = 1;