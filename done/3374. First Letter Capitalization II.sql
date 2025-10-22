-- Write your PostgreSQL query statement below
SELECT
    content_id,
    content_text AS original_text,
    INITCAP (content_text) as converted_text
FROM user_content;