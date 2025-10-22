WITH
    most_expensive_item AS (
        SELECT DISTINCT
            ON (store_id) store_id,
            product_name,
            quantity
        FROM
            inventory
        ORDER BY
            store_id,
            price DESC
    ),
    cheapest_item AS (
        SELECT DISTINCT
            ON (store_id) store_id,
            product_name,
            quantity
        FROM
            inventory
        ORDER BY
            store_id,
            price ASC
    )
SELECT
    i.store_id,
    s.store_name,
    s.location,
    e.product_name AS most_exp_product,
    c.product_name AS cheapest_product,
    ROUND((c.quantity::NUMERIC / e.quantity::NUMERIC), 2) AS imbalance_ratio
FROM
    inventory i
    JOIN stores s ON s.store_id = i.store_id
    JOIN most_expensive_item e ON e.store_id = i.store_id
    JOIN cheapest_item c ON c.store_id = i.store_id
WHERE
    c.quantity > e.quantity
GROUP BY
    i.store_id,
    s.store_name,
    s.location,
    e.product_name,
    c.product_name,
    c.quantity,
    e.quantity
HAVING
    COUNT(i.store_id) > 2
ORDER BY
    imbalance_ratio DESC,
    s.store_name ASC;