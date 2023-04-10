/*2-1*/
SELECT COUNT(*) AS 도서의총수
FROM book;

/*2-2*/
SELECT COUNT( DISTINCT publisher) AS 출판사의총수
FROM book;

/*2-3*/
SELECT name,address
FROM customer;

/*2-4*/
SELECT orderid
FROM orders
WHERE orderdate  BETWEEN '2020-07-04' AND '2020-07-07';

/*2-5*/
SELECT orderid
FROM orders
WHERE orderdate NOT BETWEEN '2020-07-04' AND '2020-07-07';

/*2-6*/
SELECT name,address
FROM customer
WHERE name LIKE '김%';

/*2-7*/
SELECT name,address
FROM customer
WHERE name LIKE '김%아';

/*2-8*/
SELECT name
FROM customer
WHERE custid IN (
SELECT custid FROM customer
MINUS
SELECT custid FROM orders);

SELECT name
FROM customer
WHERE name NOT IN(
    SELECT name
    FROM orders,customer
    WHERE orders.custid=customer.custid);

/*2-9*/
SELECT SUM(saleprice) AS 총액 ,AVG(saleprice) AS 평균금액
FROM orders;

/*2-10*/
SELECT name,SUM(saleprice)
FROM customer,orders
WHERE orders.custid = customer.custid
GROUP BY name;

/*2-11*/
SELECT name,bookname
FROM book,orders,customer
WHERE book.bookid=orders.bookid AND orders.custid=customer.custid
ORDER BY customer.custid;

/*2-12*/
SELECT * 
FROM book,orders
WHERE book.bookid=orders.bookid AND price-saleprice=(SELECT MAX(price-saleprice)
    FROM book,orders
    WHERE book.bookid=orders.bookid);

/*2-13*/
SELECT name,AVG(saleprice)
FROM customer,orders
WHERE customer.custid=orders.custid
GROUP BY name
HAVING AVG(saleprice) > (
SELECT AVG(saleprice) 
FROM orders);
