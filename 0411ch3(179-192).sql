/*new table ����*/
CREATE TABLE NewBook (
bookid NUMBER PRIMARY KEY,
bookname VARCHAR2(20) not null,
publisher VARCHAR2(20) UNIQUE,
price NUMBER DEFAULT 10000 CHECK(price>1000));

SELECT *
FROM newbook;

/*new customer table ����*/
CREATE TABLE NewCustomer (
custid NUMBER PRIMARY KEY,
name VARCHAR2(20),
address VARCHAR2(20),
phone VARCHAR2(30));

/*new orders table ����*/
CREATE TABLE NewOrders (
orderid NUMBER,
custid NUMBER not null,
bookid NUMBER not null,
saleprice NUMBER,
orderdate DATE,
PRIMARY KEY(orderid),
FOREIGN KEY(custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE);

/*�Ӽ� �߰�*/
ALTER TABLE newbook ADD isbn VARCHAR2(13);

/*������� ����*/
ALTER TABLE newbook MODIFY isbn NUMBER;

SELECT * FROM newbook;
SELECT * FROM neworders;
SELECT * FROM newcustomer;

/*���̺� ����*/
DROP TABLE newbook;

SELECT * FROM Book;

/*���� �߰�*/
INSERT INTO book(bookid,bookname,publisher,price)
VALUES(11,'������ ����','�Ѽ����м���',90000);

INSERT INTO book(bookid,bookname,publisher)
VALUES(14,'����������','�Ѽ����м���');

SELECT * FROM imported_book;

/*�뷮 ����*/
INSERT INTO Book(bookid,bookname,price,publisher)
SELECT bookid,bookname,price,publisher
FROM imported_book;

SELECT * FROM customer;

/*�Ӽ��� ����*/
UPDATE customer
SET address='���ѹα� �λ�'
WHERE custid=5;

UPDATE customer
SET address=(SELECT address FROM customer WHERE name='�迬��')
WHERE name='�ڼ���';

/*���� ����*/
DELETE FROM customer
WHERE custid=5;

/*���� �ǵ�����*/
Rollback;