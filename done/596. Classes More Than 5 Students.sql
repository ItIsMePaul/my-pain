-- Write your PostgreSQL query statement below
SELECT t1.class 
FROM Courses as t1
WHERE 4 < (SELECT count(t2.class) FROM Courses as t2 WHERE t1.class = t2.class)
GROUP BY class;