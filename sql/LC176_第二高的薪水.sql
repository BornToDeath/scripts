# Write your MySQL query statement below


-- 方法1：临时表
# select (
#     select distinct salary
#     from Employee
#     order by salary desc
#     limit 1 offset 1) as 'SecondHighestSalary'
# ;


-- 方法2：ifnull
# select ifnull(
#     (select distinct salary
#     from Employee
#     order by salary desc
#     limit 1 offset 1), null) as 'SecondHighestSalary'
# ;


-- 方法3：max
select max(salary) as 'SecondHighestSalary'
from Employee
where salary < (select max(distinct salary) from Employee)
;
