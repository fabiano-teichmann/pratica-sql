-- partition by
select 
	description,
	category,
	sub_category,
	total,
	avg(total) over(partition by category) MediaCategoria,
	avg(total) over(partition by category order by "date" rows between 2 preceding and 2 following) Media2AnteriorePosterior,
	max(total) over(partition by category order by total desc) Maximo,
	max(total) over(partition by category order by "date"  rows between unbounded preceding and current row) MaximoAteDataAtual,
	rank() over(partition by category order by total desc) RankCategoria,
	row_number() over(partition by category order by total desc) RowCategoria,
	ntile(5) over(partition by category order by total desc) BucketCategoria,
	avg(total) over(partition by sub_category) MediaSubCategoria	
from expense 