USE MASTER
GO 
DROP DATABASE db_librarySQLproject
GO
CREATE DATABASE db_librarySQLproject
GO
USE db_librarySQLproject

-- LIBRAY_BRANCH
CREATE TABLE tbl_library_branch (
	library_branch_id INT PRIMARY KEY NOT NULL,
	library_branch_name VARCHAR(50) NOT NULL,
	library_branch_address VARCHAR(50) NOT NULL,
); 


--PUBLISHER
CREATE TABLE tbl_publisher (
	publisher_name VARCHAR(50) PRIMARY KEY NOT NULL, 
	publisher_address VARCHAR(50) NOT NULL, 
	publisher_phone VARCHAR(50) NOT NULL
);


--BORROWER
CREATE TABLE tbl_borrower (
	borrower_cardno INT PRIMARY KEY NOT NULL, 
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(50) NOT NULL,
	borrower_phone VARCHAR(50) NOT NULL,
);


--BOOKS
CREATE TABLE tbl_books (
	books_book_id INT IDENTITY (10,10) NOT NULL PRIMARY KEY, 
	books_title VARCHAR(50) NOT NULL, 
	books_publishername VARCHAR(50) FOREIGN KEY REFERENCES tbl_publisher(publisher_name) NOT NULL,
);


-- BOOK_COPIES
CREATE TABLE tbl_book_copies (
	book_copies_book_id INT FOREIGN KEY REFERENCES tbl_books(books_book_id), 
	book_copies_branch_id INT FOREIGN KEY REFERENCES tbl_library_branch(library_branch_id) NOT NULL, 
	book_copies_number_of_copies INT NOT NULL
);  


--BOOK_LOANS
CREATE TABLE tbl_book_loans (
	book_loans_book_id INT FOREIGN KEY REFERENCES tbl_books(books_book_id) NOT NULL,
	book_loans_branch_id INT FOREIGN KEY REFERENCES tbl_library_branch(library_branch_id) NOT NULL, 
	book_loans_cardno INT FOREIGN KEY REFERENCES tbl_borrower(borrower_cardno) NOT NULL, 
	book_loans_dateout VARCHAR(50) NOT NULL,
	book_loans_datedue VARCHAR(50) NOT NULL
);

--BOOK_AUTHORS
CREATE TABLE tbl_book_authors (
	book_authors_book_id INT FOREIGN KEY REFERENCES tbl_books(books_book_id), 
	book_authors_authorname VARCHAR(50) NOT NULL
);

-- INSERTING DATA


--LIBRARY_BRANCH

INSERT INTO tbl_library_branch
	(library_branch_id, library_branch_name, library_branch_address)
	VALUES 
	(1, 'Central', '253 E Prescott Dr., Seattle, WA'),
	(2, 'Sharpstown', '206 W.  Ferry Rd., Auburn, WA'),
	(3, 'Eastside', '405 N. Knox Rd., Federal Way, WA'),
	(4, 'Jingletown', '602 Cherry St., Tacoma, WA')
	;
SELECT * FROM tbl_library_branch;

INSERT INTO tbl_publisher
	(publisher_address, publisher_phone, publisher_name)
	VALUES 
	('253 West Broadway, New York, NY', '905-555-1234', 'NASA5fiction'),
	('208 East Broadway, New York, NY', '206-555-2345', 'Political Publications'),
	('897 Upper Eastside, New York, NY', '225-555-4567', 'The entire Harry Potter series Publications'),
	('3343 West Eastside, New York, NY', '778-555-5678', 'Dr. Seuss Publications'),
	('8235 Tall Building, New York, NY', '965-555-2635', 'WB Publications'),
	('8903 Downtown, New York, NY', '101-555-0000', 'AM Publications'),
	('5555 Uptown, New York, NY', '708-555-1111', 'Success Publications'),
	('5677 Other Tall Building, New York, NY', '888-555-2333', 'Olympic Publications'),
	('58987 Another Tall Building, New York, NY', '856-432-7896', 'Sarah Publications'),
	('4325 Short Building, New York, NY', '432-098-8741', 'Jessica Publications')
	;
SELECT * FROM tbl_publisher;

--BORROWER
INSERT INTO tbl_borrower
	(borrower_cardno, borrower_name, borrower_address, borrower_phone)
	VALUES 
	(1234, 'Cindy Lou Hoo', '000 Hilltop, Tacoma, WA', '555-234-5556'),
	(5678, 'Mr. Grinch', '304 Dark Cave, Seattle, WA', '888-555-9994'),
	(4567, 'Pikachu', '895 Pokestop, Yelm, WA', '999-444-9930'),
	(8912, 'Frosty Snowman', '5897 Fort Lewis, WA', '999-444-0987'),
	(3456, 'Rudolph', '888 North Pole, Olympia, WA', '444-666-4322'),
	(7891, 'Justin Timberlake', '589 SoHo, WA', '444-333-0988'),
	(2345, 'Jerry Jones', '999 AT&T Park, Tacoma, WA', '000-444-0987'),
	(6789, 'Justin Timberlake', '589 Seattle, WA', '999-666-5432'),
	(0123, 'Jerry Jones', '999 AT&T Park, Auburn, WA', '000-666-5433'),
	(0456, 'Justin Timberlake', '589 Federal Way, WA', '555-555-4432'),
	(0012, 'Jerry Jones', '999 AT&T Park, Tacoma, WA', '666-888-9876'),
	(0013, 'Chris Brown', '222 Starwood St., Federal Way, WA', '555-000-4432'),
	(0014, 'Sarah Smith', '9567 Happy St., Fife, WA', '444-321-4566'),
	(0015, 'Jerry Jones', '999 AT&T Park, Lake Tapps, WA', '965-095-6847'),
	(0016, 'Bob James', '9789 Westlake, Bellevue, WA', '333-876-3647'),
	(0017, 'Sammy Parker', '2063 AT&T Park, Sumner, WA', '000-645-3847'),
	(0018, 'Jessica Lewis', '999 AT&T Park, Bonney Lake , WA', '332-666-3214'),
	(0019, 'Mary Anne', '999 AT&T Park, Buckley, WA', '444-098-7654'),
	(0010, 'Sammy Jones', '999 AT&T Park, Tacoma, WA', '666-888-9876'),
	(0020, 'Stewart Brown', '222 Starwood St., Federal Way, WA', '555-000-4432'),
	(0030, 'Bradley Smith', '9567 Happy St., Fife, WA', '444-321-4566'),
	(0040, 'Elizabeth Jones', '999 AT&T Park, Lake Tapps, WA', '965-095-6847'),
	(0050, 'Robert James', '9789 Westlake, Bellevue, WA', '333-876-3647'),
	(0060, 'Wendy Parker', '2063 AT&T Park, Sumner, WA', '000-645-3847'),
	(0070, 'Gary Lewis', '999 AT&T Park, Bonney Lake , WA', '332-666-3214'),
	(0080, 'Nicole Anne', '999 AT&T Park, Buckley, WA', '444-098-7654'),
	(0090, 'Patricia Willis', '999 AT&T Park, Seattle, WA', '222-098-5412'),
	(0101, 'Sarah Wachowicz', '000 Wall, Tacoma, WA', '555-234-5556')
;


--BOOKS
INSERT INTO tbl_books
	(books_title, books_publishername)
	VALUES 
	('Science Fiction I', 'NASA5fiction'),
	('Becoming', 'Political Publications'),
	('Why I love Hawaii', 'Jessica Publications'),
	('Philospher''''s Stone', 'The entire Harry Potter series Publications'),
	('Green Eggs & Ham', 'Dr. Seuss Publications'),
	('Titan Games - The Legend of Fit', 'WB Publications'),
	('Animations Coming to Life', 'AM Publications'),
	('Peace with the Pulitzer', 'Success Publications'),
	('Percy Jackson & the Olympians', 'Olympic Publications'),
	('The Lost Tribe', 'Sarah Publications')
;
SELECT * FROM tbl_books;

--BOOK_COPIES
INSERT INTO tbl_book_copies
	(book_copies_book_id, book_copies_branch_id, book_copies_number_of_copies)
	VALUES 
	(10, 1, 10),
	(10, 2, 10),
	(10, 3, 10),
	(10, 4, 10),
	(20, 1, 10),
	(20, 2, 10),
	(20, 3, 10),
	(20, 4, 10),
	(30, 1, 10),
	(30, 2, 10),
	(30, 3, 10),
	(30, 4, 10),
	(40, 1, 10),
	(40, 2, 10),
	(40, 3, 10),
	(40, 4, 10),
	(50, 1, 10),
	(50, 2, 10),
	(50, 3, 10),
	(50, 4, 10),
	(60, 1, 10),
	(60, 2, 10),
	(60, 3, 10),
	(60, 4, 10),
	(70, 1, 10),
	(70, 2, 10),
	(70, 3, 10),
	(70, 4, 10),
	(80, 1, 10),
	(80, 2, 10),
	(80, 3, 10),
	(80, 4, 10),
	(90, 1, 10),
	(90, 2, 10),
	(90, 3, 10),
	(90, 4, 10),
	(100, 1, 10),
	(100, 2, 10),
	(100, 3, 10),
	(100, 4, 10)
;

SELECT * FROM tbl_book_copies;

--BOOK_LOANS

INSERT INTO tbl_book_loans
	(book_loans_book_id, book_loans_branch_id, book_loans_cardno, book_loans_dateout, book_loans_datedue)
	VALUES 
	(10, 1, 1234, '01/02/2019', '10/07/2019'),
	(20, 1, 5678, '11/02/2018', '01/15/2019'),
	(30, 2, 4567, '11/07/2018', '11/12/2018'),
	(40, 2, 8912, '11/08/2018', '01/21/2019'),
	(50, 3, 3456, '11/13/2018', '11/18/2018'),
	(60, 3, 7891, '11/16/2018', '01/21/2019'),
	(70, 4, 2345, '11/20/2018', '11/25/2018'),
	(80, 4, 6789, '11/27/2018', '02/02/2019'),
	(90, 1, 0123, '12/05/2018', '12/10/2018'),
	(100, 2, 0456, '12/09/2018', '01/21/2019'),
	(10, 1, 0012, '10/08/2017', '10/18/2017'),
	(20, 1, 0013, '11/07/2017', '01/17/2018'),
	(30, 2, 0014, '11/05/2017', '11/15/2017'),
	(40, 2, 0015, '11/08/2017', '01/18/2018'),
	(50, 3, 0016, '11/12/2017', '11/22/2017'),
	(60, 3, 0017, '11/26/2017', '01/26/2018'),
	(70, 4, 0018, '11/28/2017', '12/28/2017'),
	(80, 4, 0019, '11/25/2017', '02/25/2018'),
	(90, 1, 0010, '12/01/2017', '01/01/2017'),
	(10, 2, 0456, '12/09/2018', '01/21/2019'),
	(20, 1, 1234, '01/02/2019', '10/07/2019'),
	(30, 1, 5678, '11/02/2018', '01/15/2019'),
	(40, 2, 4567, '11/07/2018', '11/12/2018'),
	(50, 2, 8912, '11/08/2018', '01/21/2019'),
	(60, 3, 3456, '11/13/2018', '11/18/2018'),
	(70, 3, 7891, '11/16/2018', '01/21/2019'),
	(80, 4, 2345, '11/20/2018', '11/25/2018'),
	(90, 4, 6789, '11/27/2018', '02/02/2019'),
	(100, 1, 0123, '12/05/2018', '12/10/2018'),
	(90, 2, 0456, '08/09/2018', '09/15/2018'),
	(80, 1, 1234, '01/02/2019', '07/07/2019'),
	(70, 1, 5678, '04/02/2018', '05/15/2019'),
	(60, 2, 4567, '03/07/2018', '04/12/2018'),
	(50, 2, 8912, '01/08/2018', '02/15/2018'),
	(40, 3, 3456, '06/13/2018', '07/18/2018'),
	(30, 3, 7891, '07/16/2018', '08/21/2018'),
	(20, 4, 2345, '05/20/2018', '06/25/2018'),
	(10, 4, 6789, '01/27/2018', '01/21/2019'),
	(100, 1, 0123, '03/05/2018', '05/10/2018'),
	(20, 2, 0456, '01/09/2019', '02/15/2019'),
	(30, 1, 1234, '01/02/2019', '03/07/2019'),
	(40, 1, 5678, '01/02/2018', '01/21/2019'),
	(50, 2, 4567, '01/07/2018', '03/12/2019'),
	(60, 2, 8912, '01/08/2018', '01/21/2019'),
	(70, 3, 3456, '01/13/2018', '02/18/2019'),
	(80, 3, 7891, '01/16/2018', '01/21/2019'),
	(90, 4, 2345, '01/20/2018', '01/25/2019'),
	(100, 4, 6789, '01/27/2018', '02/02/2019'),
	(10, 1, 0123, '01/05/2018', '02/10/2019'),
	(100, 2, 3456, '12/09/2018', '01/15/2019'),
	(10, 2, 0013, '12/09/2018', '01/15/2019'),
	(40, 1, 1234, '01/15/2019', '03/07/2019'),
	(50, 1, 1234, '01/15/2019', '03/07/2019')
;

SELECT * FROM tbl_book_loans;


-- BOOK_AUTHORS
INSERT INTO tbl_book_authors
	(book_authors_book_id, book_authors_authorname)
	VALUES 
	(10, 'Stephen King'),
	(20, 'Stephen King'),
	(30, 'Michelle Obama'),
	(40, 'Barack Obama'),
	(50, 'J.K. Rowling'),
	(60, 'Dr. Seuss'),
	(70, 'John Grisham'),
	(80, 'Eric Carle'),
	(90, 'Toni Morrison'),
	(100, 'Rick Riordan')
;
SELECT * FROM tbl_book_authors;


CREATE PROCEDURE library_procedures
AS
SELECT 
	a1.books_title, a2.book_copies_number_of_copies,
	a3.library_branch_name
	FROM tbl_books a1
	INNER JOIN tbl_book_copies a2 ON a2.book_copies_book_id = a1.books_book_id
	INNER JOIN tbl_library_branch a3 ON a3.library_branch_id = a2.book_copies_branch_id
	WHERE books_title = 'The Lost Tribe' AND library_branch_name = 'Sharpstown'


SELECT 
	a1.books_title, a2.book_copies_number_of_copies,
	a3.library_branch_name
	FROM tbl_books a1
	INNER JOIN tbl_book_copies a2 ON a2.book_copies_book_id = a1.books_book_id
	INNER JOIN tbl_library_branch a3 ON a3.library_branch_id = a2.book_copies_branch_id
	WHERE books_title ='The Lost Tribe' 


SELECT borrower_name
	FROM tbl_borrower 
	WHERE NOT EXISTS
	(SELECT * FROM tbl_book_loans WHERE book_loans_cardno = borrower_cardno)


SELECT 
	a1.book_loans_datedue, a2.library_branch_name, a3.borrower_name, a3.borrower_address
	FROM tbl_book_loans a1
	INNER JOIN tbl_library_branch a2 ON a2.library_branch_id = a1.book_loans_branch_id
	INNER JOIN tbl_borrower a3 ON a3.borrower_cardno = a1.book_loans_cardno
	WHERE library_branch_name = 'Sharpstown' AND book_loans_datedue = '01/21/2019'


	--change 01/15/2019 to today's date when submitting

SELECT library_branch_name, count(book_loans_book_id) 
	FROM tbl_library_branch a1
	INNER JOIN tbl_book_loans a2 ON a2.book_loans_branch_id = a1.library_branch_id
	GROUP BY library_branch_name 


SELECT borrower_name, borrower_address, count(book_loans_book_id) 
	FROM tbl_borrower a1
	INNER JOIN tbl_book_loans a2 ON a2.book_loans_cardno = a1.borrower_cardno
	WHERE book_loans_datedue > '01/21/2019'
	GROUP BY borrower_name, borrower_address
	HAVING count(book_loans_book_id) > 5



SELECT a1.book_authors_authorname, a2.books_title, a3. book_copies_number_of_copies
	FROM tbl_book_authors a1
	INNER JOIN tbl_books a2 ON a2.books_book_id = a1.book_authors_book_id
	INNER JOIN tbl_book_copies a3 ON a3.book_copies_book_id = a2.books_book_id
	INNER JOIN tbl_library_branch a4 ON a4.library_branch_id = a3.book_copies_branch_id
	WHERE book_authors_authorname = 'Stephen King' AND library_branch_name = 'Central'


GO

EXEC library_procedures