# Write your MySQL query statement below

-- 方法1：子查询
# select a.score, (
#     select count(distinct b.score) 
#     from Scores as b
#     where b.score >= a.score) as 'rank'
# from Scores as a
# order by a.score desc
# ;

-- 方法2：dense_rank()
select score, dense_rank() over(order by score desc) as 'rank'
from Scores
;
