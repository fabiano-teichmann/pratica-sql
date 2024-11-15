select 
	category,
	sub_category,
	total,
	RANK() OVER(ORDER BY total) as rank,
	row_number () over (order by total) as rank_total,
	dense_rank() over(order by total) as rank_dense
from expense 
order by rank desc

