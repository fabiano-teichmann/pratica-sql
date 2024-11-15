SELECT
  id,
  total ,
  wallet,
  SUM(total) OVER(ORDER BY total ROWS UNBOUNDED PRECEDING) Acumulado,
  avg(total) over(order by "date"  ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) Media2Ant2Pos,
  avg(total) over(order by "date" rows between 3 preceding and current row) Media3ant, 
  AVG(total) OVER (PARTITION BY wallet ORDER BY "date" asc ROWS UNBOUNDED PRECEDINg) AS MediaFull
  --  sum(quantidade) over(order by mudou_em asc ROWS UNBOUNDED PRECEDING )
FROM expense ;