SELECT transaction_date, 
COALESCE((SELECT SUM(amount) 
        FROM transactions AS second
        where second.transaction_date = first.transaction_date AND second.amount % 2 = 1), 0) AS odd_sum,
COALESCE((SELECT SUM(amount) 
        FROM transactions AS second
        WHERE second.transaction_date = first.transaction_date AND second.amount % 2 = 0), 0) AS even_sum
FROM transactions AS first
GROUP BY first.transaction_date
ORDER BY first.transaction_date;