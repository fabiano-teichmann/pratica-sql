select
	category,
	sub_category,    
    SUM(total) AS total_despesa
FROM expense e
where  e.date > (date_trunc('MONTH', CURRENT_DATE) - INTERVAL '1 month') and e."date"  <= (date_trunc('MONTH', CURRENT_DATE) )
GROUP BY category, sub_category
ORDER by total_despesa  ASC;

