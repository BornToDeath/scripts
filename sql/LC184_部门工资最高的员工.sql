# Write your MySQL query statement below

-- 原来 in 还可以这样用
select b.name as 'Department', a.name as 'Employee', a.salary as 'Salary'
from Employee as a
join Department as b on a.departmentId = b.id
where (a.departmentId, a.salary) in (
    select departmentId, max(salary)
    from Employee
    group by departmentId)
;
