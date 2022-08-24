# Write your MySQL query statement below

-- 方法1
# select employee_id
# from Employees
# where employee_id not in (select employee_id from Salaries)

# union 

# select employee_id
# from Salaries
# where employee_id not in (select employee_id from Employees)

# order by employee_id asc
# ;


-- 方法2
select employee_id
from (
    select employee_id from Employees
    union all 
    select employee_id from Salaries
) as a
group by employee_id
having count(*) = 1
order by employee_id asc
;

