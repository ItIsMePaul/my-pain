select products.product_name, sum(Orders.unit) as unit
FROM Orders
LEFT JOIN Products
ON Orders.product_id = Products.product_id
WHERE Orders.order_date between '2020-02-01' and '2020-02-29'
GROUP BY products.product_name
HAVING sum(Orders.unit) >= 100
ORDER BY sum(Orders.unit) DESC;