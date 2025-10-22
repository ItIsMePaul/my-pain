SELECT lb.book_id, lb.title, lb.author, lb.genre, lb.publication_year, COUNT(*) as current_borrowers
FROM library_books as lb JOIN borrowing_records as br
ON lb.book_id = br.book_id
WHERE br.return_date IS NULL
GROUP BY lb.book_id, lb.title, lb.author, lb.genre, lb.publication_year, lb.total_copies
HAVING COUNT(*) = lb.total_copies
ORDER BY COUNT(*) DESC, lb.title ASC;