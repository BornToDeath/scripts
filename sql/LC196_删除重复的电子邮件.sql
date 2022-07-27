# Please write a DELETE statement and DO NOT write a SELECT statement.
# Write your MySQL query statement below

-- 方法1
delete a.*
from Person as a, Person as b 
where a.email = b.email
and a.id > b.id
;

-- 方法2
# delete from Person 
# where id not in (
#     select t.id from (
#         select min(id) as 'id' 
#         from Person 
#         group by email
#     ) as t
# )
# ;

