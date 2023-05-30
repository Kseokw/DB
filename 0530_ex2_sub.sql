/*중첩질의 -where절- 비교연산자*/
select orderid, custid, saleprice
from orders md
where saleprice>(select avg(saleprice)
                    from orders so
                    where md.custid=so.custid);

select avg(saleprice)
from orders
where custid=1;

/*중첩질의 - in,not in 연산자*/
select sum(saleprice)"total"
from orders
where custid in (select custid
                    from customer
                    where address LIKE '%대한민국%');
select custid
from customer
where address LIKE '%대한민국%';

/*중첩질의 - all,some(any)연산자*/
select orderid, saleprice
from orders
where saleprice > all(select saleprice
                    from orders
                    where custid=3);
select saleprice
from orders
where custid=3;

/*중복질의 - exists, not xeists연산자*/
select sum(saleprice)"total"
from orders od
where exists (select *
                from customer cs
                where address LIKE '%대한민국%' AND cs.custid=od.custid);