# Write your MySQL query statement below

# 方法1
# select name
# from SalesPerson as a
# where a.sales_id not in (
#     select b.sales_id
#     from Orders as b
#     join Company as c on b.com_id = c.com_id
#     where c.name = 'RED')
# ;

# 方法2
select a.name
from SalesPerson a 
left join (
    select sales_id, c.name
    from Orders b 
    join Company c on b.com_id = c.com_id and c.name = 'Red') as d
on a.sales_id = d.sales_id
where d.name is null
;

