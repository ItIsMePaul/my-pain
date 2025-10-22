WITH
    totalUsers AS (
        SELECT
            COUNT(*) AS total_users
        FROM
            Users
    )
SELECT
    r.contest_id,
    ROUND(
        (COUNT(u.user_id) + 0.0) / t.total_users * 100.0,
        2
    ) AS percentage
FROM
    Register r
    JOIN Users u ON r.user_id = u.user_id
    CROSS JOIN totalUsers t
GROUP BY
    r.contest_id,
    t.total_users
ORDER BY
    percentage DESC,
    r.contest_id ASC;