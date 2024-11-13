#List all authors and their countries of origin.
use tuesday;
desc authors;
select name, country from authors;

#Retrieve all books along with their genres and availability status.
desc books;
select title, genre, available from books;

#  Find books published before the year 1950.
select * from books where publication_date < '1950-01-01';

# Show details of all books written by authors from the United Kingdom.
select b.title, b.genre, b.publication_date
from books b
join authors a on b.author_id = a.author_id
where a.country = "United Kingdom";

#SELECT title FROM Books WHERE available = TRUE;
select title from books where available = true;

#Retrieve the names of borrowers who have not returned their books yet
select b.name 
from borrowers br
join borrowers b on br.borrower_id = b.borrower_id
where br.return_date is null;

#Count the total number of books in the library.
select count(*) as total_books from books;



#Find the total number of books available by genre.
select genre, count(*) as total_available_books
from books
where available = true
group by genre;

#List books along with their authors’ names.
SELECT b.title, a.name AS author_name
FROM Books b
JOIN Authors a ON b.author_id = a.author_id;


#10. Find the borrower names along with the titles of books they borrowed.
SELECT br.name AS borrower_name, b.title AS book_title
FROM Borrowers br
JOIN Books b ON br.book_id = b.book_id;

#11. List all books along with their publication date, sorted from the newest to the oldest.
select * from books order by publication_date desc;

#12. Identify authors who have more than one book in the library.
select a.name 
from authors a
join books b on a.author_id = b.author_id
group by a.name
having count(b.book_id) > 1;


#13 Show all books borrowed in January 2024.

select b.title, br.borrow_date 
from borrowers br
join books b on br.book_id = b.book_id
where br.borrow_date between '2024-01-01' and '2024-01-31';

#14. Find the most borrowed book title.

SELECT b.title, COUNT(br.book_id) AS borrow_count
FROM Borrowers br
JOIN Books b ON br.book_id = b.book_id
GROUP BY b.title
ORDER BY borrow_count DESC
LIMIT 1;

#15 List borrowers who have borrowed multiple books.
SELECT br.name
FROM Borrowers br
GROUP BY br.name
HAVING COUNT(br.book_id) > 1;

 
