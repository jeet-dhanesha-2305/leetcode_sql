-- solution 1
select c.name as "Customers"  
from Customers C 
left join Orders O 
on C.id = O.customerId 
where O.id is null


-- solution 2
with customers_who_ordered as (
    select distinct customerId 
    from Orders
)
select name as "Customers"
from Customers 
where id not in (
    select customerId from customers_who_ordered
)
