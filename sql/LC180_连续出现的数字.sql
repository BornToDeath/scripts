# Write your MySQL query statement below


select distinct a.Num as 'ConsecutiveNums'
from Logs as a, Logs as b, Logs as c
where a.Num = b.Num 
and b.Num = c.Num
and a.Id + 1 = b.Id 
and b.Id + 1 = c.Id
;
