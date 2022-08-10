# Write your MySQL query statement below

-- 方法1
select stock_name, sum(case operation when 'Sell' then price else -price end) as 'capital_gain_loss'
from Stocks
group by stock_name
order by capital_gain_loss desc
;

-- 方法2
# select a.stock_name, 
#     (select sum(b1.price) from Stocks as b1 where b1.operation='Sell' and b1.stock_name = a.stock_name) -
#     (select sum(b2.price) from Stocks as b2 where b2.operation='Buy' and b2.stock_name = a.stock_name) as 'capital_gain_loss'
# from Stocks as a
# group by a.stock_name
# order by capital_gain_loss desc
# ;
