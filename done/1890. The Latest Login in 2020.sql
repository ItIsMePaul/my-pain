-- Write your PostgreSQL query statement below
SELECT DISTINCT user_id, MAX(time_stamp) as last_stamp
FROM Logins
WHERE time_stamp BETWEEN '2020-01-01' AND '2020-12-31'
group by user_id;