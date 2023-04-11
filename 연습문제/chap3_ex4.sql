SELECT *
FROM book;

/*4-1*/
INSERT INTO Book(bookid,bookname,publisher,price)
VALUES (15,'스포츠세계','대한미디어',10000);

/*4-2*/
DELETE FROM book
WHERE publisher='삼성당';

ROLLback;

/*4-3*/
DELETE FROM book
WHERE publisher='이상미디어';

/*4-4*/
UPDATE book
SET publisher='대한출판사'
WHERE publisher='대한미디어';

/*4-5*/
CREATE TABLE Bookcompany (
name VARCHAR(20) PRIMARY KEY,
address VARCHAR(20),
begin DATE);

SELECT *
FROM bookcompany;

/*4-6*/
ALTER TABLE Bookcompany ADD
webaddress VARCHAR(30);

/*4-7*/
INSERT INTO Bookcompany
VALUES ('한빛아카데미','서울시 마포구', '1993-01-01','http://hanbit.co.kr');

DELETE FROM bookcompany;

ALTER TABLE Bookcompany MODIFY begin VARCHAR(20);