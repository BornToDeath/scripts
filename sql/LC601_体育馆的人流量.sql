# Write your MySQL query statement below

-- 方法1：union 联合查询
# select * 
# from (
#     select a.*
#     from Stadium as a, Stadium as b, Stadium as c
#     where a.people >= 100 and b.people >= 100 and c.people >= 100 
#     and a.id + 1 = b.id and b.id + 1 = c.id

#     union

#     select b.*
#     from Stadium as a, Stadium as b, Stadium as c
#     where a.people >= 100 and b.people >= 100 and c.people >= 100 
#     and a.id + 1 = b.id and b.id + 1 = c.id

#     union

#     select c.*
#     from Stadium as a, Stadium as b, Stadium as c
#     where a.people >= 100 and b.people >= 100 and c.people >= 100 
#     and a.id + 1 = b.id and b.id + 1 = c.id) as d
# order by visit_date asc
# ;

-- 方法2：over
-- 参考：https://leetcode.cn/problems/human-traffic-of-stadium/solution/row_numberfang-shi-jie-jue-lian-xu-xing-42uhh/
with a as (
    select *, id - row_number() over(order by id) as 'step'
    from Stadium
    where people >= 100
)

select id, visit_date, people
from a
where step in (
    select step
    from a
    group by step
    having count(step) >= 3
)
order by visit_date asc
;

