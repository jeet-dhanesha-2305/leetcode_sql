
with my_cte as (
    select count(*) as cons_player from 
    (
        select player_id, min(event_date) as first_login
        from Activity 
        group by player_id 
    ) as t1 
    inner join Activity t2 
    on t1.player_id = t2.player_id and date_add(t1.first_login, interval 1 day) = t2.event_date 
) 

select 
    round(cons_player / (select count(distinct player_id) from Activity),2) as fraction 
from my_cte