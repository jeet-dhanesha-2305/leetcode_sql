with top_most_salary as (
    select 
        *, 
        dense_rank() over( 
            partition by departmentId 
            order by salary desc ) as salary_rnk
    from Employee 
) 

select 
    d.name as "Department", 
    s.name as "Employee", 
    s.salary as "Salary" 
from top_most_salary s 
inner join Department d 
on s.departmentId = d.id 
where salary_rnk = 1