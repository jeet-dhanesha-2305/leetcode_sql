with common_tiv_2015 as (
    select tiv_2015 
    from Insurance 
    group by tiv_2015 
    having count(tiv_2015) > 1
), unique_loc as (
    select pid 
    from Insurance 
    group by lat, lon 
    having count(pid) = 1
)

select round(sum(tiv_2016),2) as tiv_2016 
from Insurance 
where 
    tiv_2015 in (select tiv_2015 from common_tiv_2015) and 
    pid in (select pid from unique_loc)