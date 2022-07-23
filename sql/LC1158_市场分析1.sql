# Write your MySQL query statement below


select a.user_id as 'buyer_id', a.join_date, ifnull(b.orders_in_2019, 0) as 'orders_in_2019'
from Users as a
left join (
    select buyer_id, count(*) as 'orders_in_2019'
    from Orders 
    where year(order_date) = '2019'
    group by buyer_id) as b
on a.user_id = b.buyer_id
;
