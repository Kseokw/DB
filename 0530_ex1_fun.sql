/*함수 연습*/
/*고객별 평균 주문 금액을 백원 단위로 반올림하기*/
select custid "고객번호", Round(sum(saleprice)/count(*),-2)" 평균금액"
from orders
group by custid;

/* 날짜를 더하고 빼기*/
select to_date('2020-07-01','yyyy-mm-dd')+5 before,
        to_date('2020-07-01','yyyy-mm-dd')-5 after
from dual;

select orderid "주문번호", orderdate "주문일", orderdate+10 "확정"
from orders;

/*dbms서버에 설정된 현재 날짜와 시간, 요일 확인*/
select sysdate,
to_char (sysdate,'yyyy/mm/dd hh24:mi:ss')"sysdate_1"
from dual;

/*마당서점 고객 중 같은 성을 가진 사람이 몇 명인지 성별 인원수 구하기*/
select substr(name,1,1)"성", count(*)"인원"
from customer
group by substr(name,1,1);

/*null값을 다른 값으로 대치하는 nvl함수*/
select name "이름",nvl(phone,'연락처 없음')"전화번호"
from customer;

/*spl조회결과를 순번으로 나타내는 rownum*/
select rownum"순번",custid,name,phone
from customer
where rownum<=2;