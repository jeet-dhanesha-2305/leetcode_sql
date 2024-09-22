
with cte_1 as (
    select * 
    from Stadium 
    where people >= 100 
), cte_2 as (
    select *, (id - row_number() over(order by visit_date)) as rn
    from cte_1
)

select id, visit_date, people 
from cte_2 
where rn in (
    select rn
    from cte_2 
    group by rn 
    having count(rn) >= 3
)
