-- Write your PostgreSQL query statement below
WITH
    CTE_reading_sessions AS (
        SELECT
            book_id,
            MAX(session_rating) AS highest_rating,
            MIN(session_rating) AS lowest_rating,
            ROUND(
                SUM(
                    CASE
                        WHEN session_rating >= 4
                        OR session_rating <= 2 THEN 1
                        ELSE 0
                    END
                )::decimal / COUNT(*),
                2
            ) AS polarization_score
        FROM
            reading_sessions
        GROUP BY
            book_id
        HAVING
            COUNT(*) >= 5
    )
SELECT
    b.book_id,
    b.title,
    b.author,
    b.genre,
    b.pages,
    s.highest_rating - s.lowest_rating AS rating_spread,
    s.polarization_score
FROM
    books b
    JOIN CTE_reading_sessions s ON s.book_id = b.book_id
WHERE
    s.lowest_rating <= 2
    AND s.highest_rating >= 4
    AND polarization_score >= 0.60
ORDER BY
    s.polarization_score DESC,
    b.title DESC;