SELECT event_day, emp_id, SUM(out_time - in_time) as total_time
FROM Employees
GROUP BY
    event_day,
    emp_id;