
select 
    W_curr.id as id 
from Weather W_curr 
left join Weather W_prev 
on W_curr.recordDate = date_add(W_prev.recordDate, interval 1 day) 
where W_curr.temperature > W_prev.temperature