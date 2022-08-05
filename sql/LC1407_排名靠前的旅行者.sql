# Write your MySQL query statement below


select a.name, ifnull(sum(b.distance), 0) as 'travelled_distance'
from Users as a
left join Rides as b on a.id = b.user_id
group by a.id
order by travelled_distance desc, name asc
;
