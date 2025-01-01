-- Write your PostgreSQL query statement below
SELECT t1.employee_id 
FROM Employees AS t1
WHERE t1.salary < 30000 AND t1.manager_id IS NOT NULL AND (
    SELECT t2.employee_id
    FROM Employees AS t2
    WHERE t1.manager_id = t2.employee_id
) IS NULL
ORDER BY t1.employee_id;