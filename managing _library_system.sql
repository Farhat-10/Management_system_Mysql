-- Tasks

-- Crud operations

-- CREATE a new book record in the book table.
INSERT INTO books (
	isbn, book_title, category, rental_price, status, author, publisher)
values (
	'978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co'
);

-- update an existing member adress.
UPDATE members
SET member_address = '125 Oak St'
WHERE member_id = 'C103';
SELECT *
FROM members
WHERE member_address = '125 Oak St'
;

-- delete a record from the issued_id table/ delete record where issued_id = 'IS140'
SELECT *
FROM issued_status;
DELETE 
FROM issued_status
WHERE issued_id = 'IS140'
;

-- select all books issued by the employee with the emp_id = E101
SELECT * 
FROM issued_status
WHERE issued_emp_id = 'E101'
;

--  List Members Who Have Issued More Than One Book.
SELECT 
issued_emp_id, count(issued_id) AS total_books_issued
FROM issued_status
GROUP BY issued_emp_id
HAVING total_books_issued >1 -- condition
ORDER BY total_books_issued DESC
;

-- Retrieve All Books in a Specific Category:
SELECT book_title
FROM books
WHERE category = 'Children'
;

-- Find Total Rental Income by Category:
SELECT category, sum(rental_price) as total_rental_income, COUNT(*)
FROM books
GROUP BY category
order by total_rental_income DESC
;

-- retreive the list of books that are not yet returned
SELECT * FROM issued_status as ist
LEFT JOIN
return_status as rs
ON rs.issued_id = ist.issued_id
WHERE rs.return_id IS NULL;



