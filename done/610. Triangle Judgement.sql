-- Write your PostgreSQL query statement below
Select x, y, z, Case 
         When (x + y > z and x + z > y and z + y > x) Then 'Yes' 
         ELse 'No' 
       END  as triangle
from Triangle