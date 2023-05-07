/*7장 summer테이블*/
CREATE TABLE Summer(
sid NUMBER,
class VARCHAr(20),
price NUMBER);

INSERT INTO Summer VALUES (100,'FORTRAN',20000);
INSERT INTO Summer VALUES (150,'PASCAL',15000);
INSERT INTO Summer VALUES (200,'C',10000);
INSERT INTO Summer VALUES (250,'FORTRAN',20000);

SELECT * FROM Summer;

SELECT sid,class FROM Summer;

SELECT price
FROM Summer
WHERE class= 'C';

SELECT DISTINCT class
FROM Summer
WHERE price in (SELECT MAX(price)
                FROM Summer);

SELECT SUM(price), count(*)
FROM Summer;

/*삭제 이상*/
DELETE FROM Summer 
WHERE sid=200;

/*삽입 이상*/
INSERT INTO Summer VALUES (NULL,'JAVA',25000);

SELECT COUNT(*) AS 수강인원 FROM Summer;
SELECT COUNT(sid) AS 수강인원 FROM Summer;
SELECT COUNT(*) AS 수강인원
FROM Summer
WHERE sid IS NOT NULL;

/*수정 이상*/
UPDATE Summer
SET price=15000
where class='FORTRAN';

SELECT DISTINCT price AS "FORTAN 수강료"
FROM Summer
WHERE class='FORTRAN';

UPDATE Summer
SET price=20000
where class='FORTRAN';

UPDATE Summer
SET price=15000
WHERE class='FORTRAN' AND sid=100;

SELECT price AS "FORTAN 수강료"
FROM Summer
WHERE class='FORTRAN';

/*summer 테이블 분리*/
CREATE TABLE Summerprice(
class VARCHAR(20),
price INTEGER);

INSERT INTO Summerprice VALUES ('FORTRAN',20000);
INSERT INTO Summerprice VALUES ('PASCAL',15000);
INSERT INTO Summerprice VALUES ('C',10000);

select * from summerprice;

CREATE TABLE SummerEnroll(
sid INTEGER,
class VARCHAR(20));

INSERT INTO SummerEnroll VALUES (100,'FORTRAN');
INSERT INTO SummerEnroll VALUES (150,'PASCAL');
INSERT INTO SummerEnroll VALUES (200,'C');
INSERT INTO SummerEnroll VALUES (250,'FORTRAN');

select * from summerenroll;

select sid,class
from summerenroll;

select price
from summerprice
where class='C';

SELECT DISTINCT class
FROM Summerprice
WHERE price in (SELECT MAX(price)
                FROM Summerprice);

select count(*),SUM(price)
from summerprice,summerenroll
where summerprice.class=summerenroll.class;

select *
from summerprice,summerenroll
where summerprice.class=summerenroll.class;

/*삭제 이상*/
SELECT price
from summerprice
where class='C';

DELETE FROM SummerEnroll
WHERE sid=200;

SELECT *
FROM summerEnroll;

/*삽입 이상*/
INSERT INTO Summerprice VALUES ('JAVA',25000);

select *
from summerprice;

select *
from summerenroll;

/*수정 이상*/
UPDATE Summerprice
set price=15000
where class='FORTRAN';

SELECT price
from summerprice
where class='FORTRAN';