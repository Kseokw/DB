create table employee (
empno NUMBER NOT NULL PRIMARY KEY,
name VARCHAR2(20),
phoneno NUMBER,
address VARCHAR2(20),
sex VARCHAR2(20),
position VARCHAR2(20),
deptno NUMBER,
FOREIGN KEY (deptno) REFERENCES Department(deptno) ON DELETE CASCADE);

create table Department (
deptno NUMBER NOT NULL PRIMARY KEY,
deptname VARCHAR(20),
manager VARCHAR2(20));

create table Project (
projno NUMBER NOT NULL PRIMARY KEY,
projname VARCHAR2(20),
deptno NUMBER,
FOREIGN KEY (deptno) REFERENCES Department(deptno) ON DELETE CASCADE);

create table works (
projno NUMBER NOT NULL,
empno NUMBER NOT NULL,
hoursworked NUMBER,
PRIMARY KEY (projno, empno),
FOREIGN KEY (projno) REFERENCES Project(projno) ON DELETE CASCADE,
FOREIGN KEY (empno) REFERENCES employee(empno) ON DELETE CASCADE);

insert INTO Department VALUES(1,'IT','����');
insert INTO Department VALUES(2,'Marketing', 'ȫ�浿');

insert INTO employee 
    VALUES(1, '�����', 01012341232, '����','��','Programmer',1);
insert INTO employee 
    VALUES(2, '�̼���', 01012323122, '����','��','Programmer',1);
insert INTO employee 
    VALUES(3, '�ڿ���', 01076851231, '����','��','Salesperson',2);
insert INTO employee 
    VALUES(4, 'ȫ�浿', 01012341546, '����','��','Manager',2);
insert INTO employee 
    VALUES(5, '����', 01012311112, '����','��','Manager',1);

insert INTO Project VALUES (1,'�����ͺ��̽�',1);
insert INTO Project VALUES (2,'��������',2);

insert INTO works VALUES (1,1,3);
insert INTO works VALUES (1,2,1);
insert INTO works VALUES (2,3,1);
insert INTO works VALUES (2,4,5);
insert INTO works VALUES (1,5,1);

select * from Department;
select * from employee;
select * from Project;
select * from works;
/* 2 */
select name from employee;

/* 3 */
select name from employee WHERE sex LIKE '��';

/* 4*/
select name from employee where position LIKE 'Manager';
select manager from Department;

/* 5 */
select name,address
From department, employee
where department.deptno=employee.deptno AND deptname='IT';

/* 6 */
select COUNT(*)
FROM employee
where deptno IN (select deptno
                FROM department
                WHERE manager = 'ȫ�浿');
select COUNT(*)
FROM employee, department
WHERE employee.deptno=department.deptno AND manager='ȫ�浿';

/* 7 */
select deptno, SUM(hoursworked), name, SUM(hoursworked)
FROM employee,works
WHERE employee.empno=works.empno
GROUP BY deptno,name
ORDER BY name;

/* 8 */
select projno, projname, count(*)
FROM project, employee
WHERE project.deptno=employee.deptno
GROUP BY projno, projname
HAVING count(*)>= 2
ORDER BY projno;

/* 9 */
select name
from employee,department
where employee.deptno=department.deptno AND employee.deptno
IN (select deptno
    from employee
    group by deptno
    having count(*)>=3);