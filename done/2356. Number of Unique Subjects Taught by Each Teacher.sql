-- Write your PostgreSQL query statement below
SELECT teacher_id, count(Distinct subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;