-- Write your PostgreSQL query statement below
select max(t1.num) as num
from MyNumbers as t1
where t1.num IN (select t2.num
                from MyNumbers as t2
                Group by t2.num
                HAVING count(t2.num) = 1);