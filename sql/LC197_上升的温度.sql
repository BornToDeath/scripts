# Write your MySQL query statement below

-- 方法1：
select a.id
from Weather as a, Weather as b
where datediff(a.recordDate, b.recordDate) = 1
and a.Temperature > b.Temperature
;

-- 方法2：连接查询 join
# select a.id
# from Weather as a
# join Weather as b on datediff(a.recordDate, b.recordDate) = 1
# where a.Temperature > b.Temperature
# ;
