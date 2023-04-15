CREATE TABLE theater (
theaterid NUMBER NOT NULL PRIMARY KEY,
theatername VARCHAR2(20),
place VARCHAR(20));

CREATE TABLE cinema (
theaterid NUMBER NOT NULL,
cinemaid NUMBER CHECK(cinemaid>=1 AND cinemaid<=10),
title VARCHAR2(20),
price NUMBER CHECK(price < 20000), 
seat VARCHAR2(20),
PRIMARY KEY (theaterid, cinemaid),
FOREIGN KEY(theaterid) REFERENCES theater(theaterid) ON DELETE CASCADE);

CREATE TABLE guest (
guestid NUMBER PRIMARY KEY,
name VARCHAR(20),
adress VARCHAR(20));

CREATE TABLE reservation (
theaterid NUMBER NOT NULL,
cinemaid NUMBER NOT NULL,
guestid NUMBER NOT NULL,
seatid NUMBER UNIQUE,
da VARCHAR(20),
FOREIGN KEY (theaterid,cinemaid) 
    REFERENCES cinema(theaterid,cinemaid) ON DELETE CASCADE,
FOREIGN KEY (guestid) REFERENCES guest(guestid) ON DELETE CASCADE);

INSERT INTO theater VALUES(1,'�Ե�','���');
INSERT INTO theater VALUES(2,'�ް�','����');
INSERT INTO theater VALUES(3,'����','���');

INSERT INTO guest VALUES(3,'ȫ�浿','����');
INSERT INTO guest VALUES(4,'��ö��','���');
INSERT INTO guest VALUES(9,'�ڿ���','����');

INSERT INTO cinema VALUES(1,1,'����� ��ȭ','15000','48');
INSERT INTO cinema VALUES(3,1,'���� ��ȭ','7500','120');
INSERT INTO cinema VALUES(3,2,'��մ� ��ȭ','8000','110');

INSERT INTO reservation VALUES(3,2,3,15,'2020-09-01');
INSERT INTO reservation VALUES(3,1,4,16,'2020-09-01');
INSERT INTO reservation VALUES(1,1,9,48,'2020-09-01');


/*1-1*/
SELECT theatername, place
FROM theater;

/*1-2*/
SELECT *
FROM theater
WHERE place='���';

/*1-3*/
SELECT name
FROM guest
WHERE adress='���'
ORDER BY name ASC;

/*1-4*/
SELECT theaterid,cinemaid,title
FROM cinema
WHERE price<=8000;

/*1-5*/
SELECT guestid,name,adress,place
FROM theater,guest
WHERE place = adress;

/*2-1*/
SELECT COUNT(*) AS ���尳��
FROM theater;

/*2-2*/
SELECT ROUND(AVG(price),0)
FROM cinema;

/*2-3*/
SELECT COUNT(*) AS ��������
FROM reservation
WHERE da='2020-09-01';

/*3-1*/
SELECT title
FROM theater,cinema
WHERE theater.theaterid=cinema.theaterid AND theatername='����';

/*3-2*/
SELECT name
FROM theater,reservation,guest
WHERE theater.theaterid=reservation.theaterid
    AND reservation.guestid=guest.guestid
    AND theatername LIKE '����';

SELECT name
FROM reservation,guest
WHERE reservation.guestid=guest.guestid 
    AND theaterid IN (SELECT theaterid
                        FROM theater
                        WHERE theatername = '����');
/*3-3*/
SELECT SUM(price)
FROM theater,cinema,reservation
WHERE theater.theaterid=reservation.theaterid
    AND cinema.cinemaid=reservation.cinemaid
    AND theatername='����';

SELECT SUM(price)
FROM cinema,reservation
WHERE cinema.cinemaid=reservation.cinemaid
    AND reservation.theaterid IN (SELECT theaterid
                        FROM theater
                        WHERE theatername = '����');

/*4-1*/
SELECT theaterid,COUNT(cinemaid)
FROM cinema
GROUP BY theaterid;

/*4-2*/
SELECT theatername,COUNT(cinemaid)
FROM theater,cinema
WHERE theater.theaterid=cinema.theaterid AND place LIKE '���'
GROUP BY theatername;

SELECT place,theatername,cinemaid,title,price,seat
FROM theater,cinema
WHERE theater.theaterid=cinema.theaterid AND place LIKE '���';

/*4-3*/
SELECT theatername,COUNT(guestid) AS ��������
FROM theater,reservation
WHERE theater.theaterid=reservation.theaterid
    AND da LIKE '2020-09-01'
GROUP BY theatername;

/*4-4*/
/*
INSERT INTO reservation
    values (1,1,3,45,'2020-09-01');
DELETE FROM reservation
WHERE seatid=45; */

SELECT *
FROM (SELECT title,COUNT(guestid)
    FROM cinema,reservation
    WHERE cinema.cinemaid=reservation.cinemaid
        AND cinema.theaterid=reservation.theaterid
     AND da LIKE '2020-09-01'
    GROUP BY title
    ORDER By COUNT(guestid) DESC)
WHERE ROWNUM = 1;

SELECT title,COUNT(guestid) AS MA
FROM cinema,reservation
WHERE cinema.cinemaid=reservation.cinemaid
    AND cinema.theaterid=reservation.theaterid
    AND da LIKE '2020-09-01'
GROUP BY title;

SELECT MAX(COUNT(guestid))
FROM cinema,reservation
WHERE cinema.cinemaid=reservation.cinemaid
    AND cinema.theaterid=reservation.theaterid
    AND da LIKE '2020-09-01'
GROUP BY title;


