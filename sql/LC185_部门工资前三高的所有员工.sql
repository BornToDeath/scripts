# Write your MySQL query statement below


select c.name as 'Department', a.name as 'Employee', a.salary as 'Salary'
from Employee as a
left join Department as c on a.departmentId = c.id
where 3 > (
    select count(distinct b.salary)
    from Employee as b
    where a.salary < b.salary
    and a.departmentId = b.departmentId)
;
