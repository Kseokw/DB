SELECT  name, saleprice
FROM Customer LEFT OUTER JOIN Orders ON Customer.custid=Orders.custid;

/*왼쪽 외부조인(+)
dsfSELECT  Customer.name, saleprice
dfFROM Customer,Orders
dfWHERE Customer.custid=Orders.custid(+)

/*책 중에서 가장 비싼 가격
SELECT MAX(price)
FROM Book;

/*35000인 도서의 이름
SELECT bookname
FROM Book
WHERE price=35000;

/*가장 비싼 도서의 이름*/
SELECT bookname
FROM Book
WHERE price=(SELECT MAX(price)
                FROM Book);
                
/*책을 주문한적 있는 고객의 아이디*/
SELECT custid
FROM Orders;

/*책을 주문한적 있는 고객의 이름 찾기*/
SELECT name
FROM Customer
WHERE custid IN (1,2,3,4);

/*도서를 주문한 적이 있는 고객의 이름*/
SELECT name
FROM Customer
WHERE custid IN (SELECT custid
                FROM Orders);
                
/*출판사별 출판사의 평균 도서 가격보다 비싼 도서*/
SELECT b1.bookname
FROM Book b1
WHERE b1.price > (SELECT avg(b2.price)
                    FROM Book b2
                    WHERE b2.publisher=b1.publisher);
