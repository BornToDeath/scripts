# Write your MySQL query statement below

-- 方法1
# select a.Name as 'Customers'
# from Customers as a
# where a.Id not in (
#     select CustomerId 
#     from Orders)
# ;

-- 方法2
select a.Name as 'Customers'
from Customers as a
left join Orders as b on a.Id = b.CustomerId
where b.CustomerId is null
;