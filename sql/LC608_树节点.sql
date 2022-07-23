/* 方法1：union 联合查询 */

# 查找根节点
select id, 'Root' as Type
from tree
where p_id is null

union

# 查找叶子节点
select a.id, 'Leaf' as Type
from tree as a
where a.id not in (
    select distinct p_id
    from tree
    where p_id is not null)
and a.p_id is not null

union

# 查找非叶子节点
select distinct a.id, 'Inner' as Type
from tree as a
join tree as b on a.id = b.p_id
where a.p_id is not null

order by id
;


/* 方法2：case when */

select id, (
    case
        when p_id is null then 'Root'
        when id in (select p_id from tree) then 'Inner'
        else 'Leaf'
    end) as Type
from tree
order by id
;


/* 方法3：if */

select id, if (isnull(p_id), 'Root', if (id in (select p_id from tree), 'Inner', 'Leaf')) as Type
from tree
order by id
;
