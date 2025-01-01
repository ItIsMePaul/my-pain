-- Write your PostgreSQL query statement below
Select date_id, make_name, count(DISTINCT lead_id) as unique_leads, count(DISTINCT partner_id) as unique_partners 
From DailySales
Group by date_id, make_name;