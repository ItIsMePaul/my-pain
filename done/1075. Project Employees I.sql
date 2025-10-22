SELECT project_id, ROUND(AVG(Employee.experience_years)::numeric, 2) as average_years
FROM Project JOIN Employee
ON Project.employee_id = Employee.employee_id
GROUP BY project_id;