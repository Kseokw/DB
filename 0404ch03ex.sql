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
WHERE Orders.custid=Customer.custid AND name='������';

/*1-4*/
SELECT COUNT(*)
FROM orders,customer
WHERE orders.custid = customer.custid AND name='������';

/*1-5*/
SELECT DISTINCT COUNT(publisher)
FROM book,orders,customer
WHERE book.bookid = orders.bookid AND orders.custid=customer.custid 
        AND name='������';

/*1-6*/
SELECT bookname,saleprice,(price-saleprice) AS ��������
FROM book,customer,orders
WHERE book.bookid = orders.bookid AND orders.custid=customer.custid 
        AND name='������';
        
/*1-7*/
SELECT bookname
FROM book
MINUS
SELECT bookname
FROM book,orders,customer
WHERE book.bookid = orders.bookid AND orders.custid=customer.custid 
        AND name='������';

/*2-1*/
SELECT COUNT(*) AS �������Ѽ�
FROM book;

/*2-2*/
SELECT COUNT( DISTINCT publisher) AS ���ǻ����Ѽ�
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
WHERE name LIKE '��%';

/*2-7*/
SELECT name,address
FROM customer
WHERE name LIKE '��%��';

/*2-8*/
SELECT name
FROM customer
WHERE custid IN (
SELECT custid FROM customer
MINUS
SELECT custid FROM orders);

/*2-9*/
SELECT SUM(saleprice) AS �Ѿ� ,AVG(saleprice) AS ��ձݾ�
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
SELECT MAX(price-saleprice)
FROM book,orders
WHERE orders.bookid = book.bookid;

/*2-13*/
SELECT name
FROM customer,orders
WHERE customer.custid=orders.custid
GROUP BY name
HAVING AVG(saleprice) > (
SELECT AVG(saleprice) 
FROM orders);
