/*1-1*/
SELECT bookname
FROM Book
WHERE bookid = '1';

/*1-2*/
SELECT bookname
FROM Book
WHERE price >= '20000';

/*1-3*/
SELECT SUM(saleprice)
FROM Orders,Customer
WHERE Orders.custid=Customer.custid AND name LIKE '박지성';

/*1-4*/
SELECT COUNT(*)
FROM orders,customer
WHERE orders.custid = customer.custid AND name LIKE '박지성';

/*1-5*/
SELECT DISTINCT COUNT(publisher)
FROM book,orders,customer
WHERE book.bookid = orders.bookid AND orders.custid=customer.custid 
        AND customer.name LIKE '박지성';

/*1-6*/
SELECT bookname,saleprice,price-saleprice AS 가격차이
FROM book,customer,orders
WHERE book.bookid = orders.bookid AND orders.custid=customer.custid 
        AND customer.name LIKE '박지성';
        
/*1-7*/
SELECT bookname
FROM book
MINUS
SELECT bookname
FROM book,orders,customer
WHERE book.bookid = orders.bookid AND orders.custid=customer.custid 
        AND customer.name LIKE '박지성';
SELECT bookname
FROM book
WHERE NOT EXISTS (
    SELECT bookname
    FROM orders,customer
    WHERE book.bookid = orders.bookid AND orders.custid=customer.custid 
        AND customer.name LIKE '박지성');
