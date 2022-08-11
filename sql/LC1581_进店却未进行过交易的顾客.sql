# Write your MySQL query statement below

-- 方法1：子表
# select a.customer_id, count(*) as 'count_no_trans'
# from Visits as a
# where a.visit_id not in (select distinct visit_id from Transactions)
# group by a.customer_id
# ;

-- 方法2：left join
select a.customer_id, count(a.customer_id) as 'count_no_trans'
from Visits as a 
left join Transactions as b on a.visit_id = b.visit_id
where b.visit_id is null
group by a.customer_id
;
