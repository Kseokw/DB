/*��ø���� -where��- �񱳿�����*/
select orderid, custid, saleprice
from orders md
where saleprice>(select avg(saleprice)
                    from orders so
                    where md.custid=so.custid);

select avg(saleprice)
from orders
where custid=1;

/*��ø���� - in,not in ������*/
select sum(saleprice)"total"
from orders
where custid in (select custid
                    from customer
                    where address LIKE '%���ѹα�%');
select custid
from customer
where address LIKE '%���ѹα�%';

/*��ø���� - all,some(any)������*/
select orderid, saleprice
from orders
where saleprice > all(select saleprice
                    from orders
                    where custid=3);
select saleprice
from orders
where custid=3;

/*�ߺ����� - exists, not xeists������*/
select sum(saleprice)"total"
from orders od
where exists (select *
                from customer cs
                where address LIKE '%���ѹα�%' AND cs.custid=od.custid);