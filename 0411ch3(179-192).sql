/*new table 생성*/
CREATE TABLE NewBook (
bookid NUMBER PRIMARY KEY,
bookname VARCHAR2(20) not null,
publisher VARCHAR2(20) UNIQUE,
price NUMBER DEFAULT 10000 CHECK(price>1000));

SELECT *
FROM newbook;

/*new customer table 생성*/
CREATE TABLE NewCustomer (
custid NUMBER PRIMARY KEY,
name VARCHAR2(20),
address VARCHAR2(20),
phone VARCHAR2(30));

/*new orders table 생성*/
CREATE TABLE NewOrders (
orderid NUMBER,
custid NUMBER not null,
bookid NUMBER not null,
saleprice NUMBER,
orderdate DATE,
PRIMARY KEY(orderid),
FOREIGN KEY(custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE);

/*속성 추가*/
ALTER TABLE newbook ADD isbn VARCHAR2(13);

/*제약사항 변경*/
ALTER TABLE newbook MODIFY isbn NUMBER;

SELECT * FROM newbook;
SELECT * FROM neworders;
SELECT * FROM newcustomer;

/*테이블 삭제*/
DROP TABLE newbook;

SELECT * FROM Book;

/*투플 추가*/
INSERT INTO book(bookid,bookname,publisher,price)
VALUES(11,'스포츠 의학','한솔의학서적',90000);

INSERT INTO book(bookid,bookname,publisher)
VALUES(14,'스포츠의학','한솔의학서적');

SELECT * FROM imported_book;

/*대량 삽입*/
INSERT INTO Book(bookid,bookname,price,publisher)
SELECT bookid,bookname,price,publisher
FROM imported_book;

SELECT * FROM customer;

/*속성값 수정*/
UPDATE customer
SET address='대한민국 부산'
WHERE custid=5;

UPDATE customer
SET address=(SELECT address FROM customer WHERE name='김연아')
WHERE name='박세리';

/*투플 삭제*/
DELETE FROM customer
WHERE custid=5;

/*실행 되돌리기*/
Rollback;