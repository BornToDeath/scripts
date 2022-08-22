# Write your MySQL query statement below

-- 方法1
# select a.request_at as 'Day', 
#     round(count(if(a.status != 'completed', a.status, null)) / count(*), 2) as 'Cancellation Rate'
# from Trips as a
# join Users as b on (a.client_id = b.users_id and b.banned = 'No')
# join Users as c on (a.driver_id = c.users_id and c.banned = 'No')
# where a.request_at between '2013-10-01' and '2013-10-03'
# group by a.request_at
# ;


-- 方法2
select a.request_at as 'Day', 
    round(count(if(a.status != 'completed', a.status, null)) / count(a.status), 2) as 'Cancellation Rate'
from Trips as a
where a.request_at between '2013-10-01' and '2013-10-03'
and a.client_id in (select users_id from Users where banned = 'No')
and a.driver_id in (select users_id from Users where banned = 'No')
group by a.request_at
;
