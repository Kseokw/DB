/*�Լ� ����*/
/*���� ��� �ֹ� �ݾ��� ��� ������ �ݿø��ϱ�*/
select custid "����ȣ", Round(sum(saleprice)/count(*),-2)" ��ձݾ�"
from orders
group by custid;

/* ��¥�� ���ϰ� ����*/
select to_date('2020-07-01','yyyy-mm-dd')+5 before,
        to_date('2020-07-01','yyyy-mm-dd')-5 after
from dual;

select orderid "�ֹ���ȣ", orderdate "�ֹ���", orderdate+10 "Ȯ��"
from orders;

/*dbms������ ������ ���� ��¥�� �ð�, ���� Ȯ��*/
select sysdate,
to_char (sysdate,'yyyy/mm/dd hh24:mi:ss')"sysdate_1"
from dual;

/*���缭�� �� �� ���� ���� ���� ����� �� ������ ���� �ο��� ���ϱ�*/
select substr(name,1,1)"��", count(*)"�ο�"
from customer
group by substr(name,1,1);

/*null���� �ٸ� ������ ��ġ�ϴ� nvl�Լ�*/
select name "�̸�",nvl(phone,'����ó ����')"��ȭ��ȣ"
from customer;

/*spl��ȸ����� �������� ��Ÿ���� rownum*/
select rownum"����",custid,name,phone
from customer
where rownum<=2;