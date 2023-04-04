SELECT  name, saleprice
FROM Customer LEFT OUTER JOIN Orders ON Customer.custid=Orders.custid;

/*���� �ܺ�����(+)
dsfSELECT  Customer.name, saleprice
dfFROM Customer,Orders
dfWHERE Customer.custid=Orders.custid(+)

/*å �߿��� ���� ��� ����
SELECT MAX(price)
FROM Book;

/*35000�� ������ �̸�
SELECT bookname
FROM Book
WHERE price=35000;

/*���� ��� ������ �̸�*/
SELECT bookname
FROM Book
WHERE price=(SELECT MAX(price)
                FROM Book);
                
/*å�� �ֹ����� �ִ� ���� ���̵�*/
SELECT custid
FROM Orders;

/*å�� �ֹ����� �ִ� ���� �̸� ã��*/
SELECT name
FROM Customer
WHERE custid IN (1,2,3,4);

/*������ �ֹ��� ���� �ִ� ���� �̸�*/
SELECT name
FROM Customer
WHERE custid IN (SELECT custid
                FROM Orders);
                
/*���ǻ纰 ���ǻ��� ��� ���� ���ݺ��� ��� ����*/
SELECT b1.bookname
FROM Book b1
WHERE b1.price > (SELECT avg(b2.price)
                    FROM Book b2
                    WHERE b2.publisher=b1.publisher);
