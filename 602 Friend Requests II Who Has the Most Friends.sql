with all_friends as (
    select accepter_id as id, count(requester_id) as friend_count
    from RequestAccepted 
    group by accepter_id 
    union all
    select requester_id as id, count(accepter_id) as friend_count
    from RequestAccepted 
    group by requester_id 
)

select id, sum(friend_count) as num 
from all_friends 
group by id 
order by sum(friend_count) desc 
limit 1