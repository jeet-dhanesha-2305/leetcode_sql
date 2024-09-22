


select E2.name as name 
from Employee E1 
inner join Employee E2 
on E1.managerId = E2.id 
group by E2.id 
having count(E1.id) >= 5