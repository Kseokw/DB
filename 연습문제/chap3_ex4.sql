SELECT *
FROM book;

/*4-1*/
INSERT INTO Book(bookid,bookname,publisher,price)
VALUES (15,'����������','���ѹ̵��',10000);

/*4-2*/
DELETE FROM book
WHERE publisher='�Ｚ��';

ROLLback;

/*4-3*/
DELETE FROM book
WHERE publisher='�̻�̵��';

/*4-4*/
UPDATE book
SET publisher='�������ǻ�'
WHERE publisher='���ѹ̵��';

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
VALUES ('�Ѻ���ī����','����� ������', '1993-01-01','http://hanbit.co.kr');

DELETE FROM bookcompany;

ALTER TABLE Bookcompany MODIFY begin VARCHAR(20);