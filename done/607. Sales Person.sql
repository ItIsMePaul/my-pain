WITH RedCompanySalesPersonID
AS
(SELECT DISTINCT
    sales_id
  FROM Orders
  JOIN Company
    ON Company.com_id = Orders.com_id
  WHERE Company.name = 'RED')
SELECT
  name
FROM SalesPerson
FULL JOIN RedCompanySalesPersonID
  ON SalesPerson.sales_id = RedCompanySalesPersonID.sales_id
WHERE RedCompanySalesPersonID.sales_id IS NULL;