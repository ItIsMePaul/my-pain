DELETE 
FROM PERSON p
USING PERSON q
WHERE p.id > q.id AND q.email = p.email;