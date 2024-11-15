
/*
RANK() atribui uma classificação com base na coluna total 
As linhas com total iguais obteriam o mesmo valor de rank, mas a classificação seguinte será pulada.

*/


select 
	category,
	sub_category,
	total,
	RANK() OVER(ORDER BY total) as rank,
	row_number () over (order by total) as rank_total,
	dense_rank() over(order by total) as rank_dense
from expense 
order by rank desc