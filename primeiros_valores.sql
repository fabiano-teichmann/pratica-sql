select 
	category,
	sub_category ,
	description ,
	total, 
	FIRST_VALUE(total) over(PARTITION BY sub_category ORDER BY total DESC) MaxSub,
	FIRST_VALUE(total) over(PARTITION BY sub_category ORDER BY total asc) Min2Sub,
	LAST_VALUE(total) over(PARTITION BY sub_category ORDER BY total DESC) MinSub
from expense order by id desc