
--- Media Movel

select 
  id,
  total,
  avg(total) OVER () AS Media,
  avg(total) over(order by "date"  range current row) MediaMovel,
  total - avg(total) over(order by "date"  range current row) Diff
from expense
 

 
--- pegando valor anterior e proximo
select 
	category,
	sum(total),
	lead(sum(total)) over(order by category) Proxima,
	lag(sum(total)) over(order by category) Anterior,
	lag(sum(total), 2) over(order by category) Anterior2,
	sum(total) - lead(sum(total)) over(order by category) Diff
from expense 
group by category 

--- pegan do enesio valor pengando qualquer valor de uma sequência ou lista que ocupa uma posição específica
select 
	description,
	sub_category,
	"date",
	total,
	nth_value(total, 1) over(order by total desc ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) Maior1,
	nth_value(total, 2) over(order by total desc ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) Maior2,
	nth_value(total, 1) over(order by total  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) Menor
	
from expense
where sub_category = 'Supermercado'

