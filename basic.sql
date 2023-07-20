CREATE DATABASE ADVANCED
USE advanced;
create table student(
	ID int,
	Name varchar(50),
	RN int,
	Batch varchar(50)
);
create table teacher(
	tid int,
	name varchar(50),
	faculty varchar(50)
);
insert into student values (1,'rummani',027,'BEI'),
						   (2,'swornim',036,'BEI'),
						   (3,'rammani',029,'BEI'),
						   (4,'ram',026,'BEI'),
						   (5,'shyam',030,'BEI');
insert into teacher values(1,'ramu','bei'),
						  (2,'hari','bct'),
						  (3,'shiva','bei'),
						  (4,'ramesh','bca'),
						  (5,'ramchandra','bei');
select * from student
select * from teacher

select ID, Name from student
select name, faculty from teacher

alter table student
drop column RN

alter table teacher
add salary int
 
select ID,Name into info_student from student
select* from info_student

delete info_student

drop table info_student

--lab2: constraints , Integrity & where clause

-- to set ID of student as primary key
alter table student
alter column ID int not null
alter table student
ADD primary key(ID)

CREATE TABLE employee(
	eid int not null,
	ename char(50),
	date_of_employee date,
	salary int,
	constraint p_k primary key(eid)
);
drop table employee;
create table booklist(
	isbn int not null,
	name char(50),
	publication char(50),
	primary key(isbn)
);
drop table booklist

create table book(
	bid int,
	bname char(50),
	author char(50),
	price int,
	constraint p_bk primary key(bid)
);
drop table book

create table issues(
	iid int,
	name char(50),
	dateofissue date,
	primary key(iid)
);
drop table issues


--lab 3

-- set tid as foreign key
alter table student
ADD tid int

ALTER TABLE teacher
alter column tid int not null

alter table teacher
ADD PRIMARY KEY(tid)

alter table student
add constraint f_k foreign key (tid) references teacher(tid); 

--to make bid and iid as foreign key
ALTER TABLE book
alter column bid int not null

alter table issues
alter column iid int not null

--2
alter table employee
add default '2010-1-1' for date_of_employee

--set iid as foreign key of book and bid as foreign key of employee
--set iid as foregin key of book
alter table book
add iid int

alter table book
add foreign key(iid) references issues(iid)

select * from book
-- set bid as foreign key of booklist
alter table booklist
add bid int

alter table booklist
add foreign key(bid) references book(bid)
select *from booklist
--check constraint 
alter table book
add constraint chk check(price <5000)

--ename,bname,name must constain some value
alter table employee
alter column ename char(50) not null

alter table booklist
alter column name char(50) not null

alter table book
alter column bname char(50) not null

alter table issues
alter column name char(50)not null

--print tables
select* from employee
select* from book
select* from booklist
select* from issues

------------------lab 4----------------------
insert into employee values(1,'ram','2010-1-1',20000),
						   (2,'shyam','2011-5-2',150000),
						   (3,'hari','2012-6-6',9000),
						   (4,'prakash','2013-5-9',25000);
						   
insert into booklist values(1,'math','read more'),
						   (2,'science','puspa'),
						   (3,'social','mcGraw Hill'),
						   (4,'physics','stanford');
						   
insert into book values    (1,'math','IA',5000),
						   (2,'science','HPK',2000),
						   (3,'social','SA',1000),
						   (4,'physics','SPA',3000); 

insert into issues values(1,'math','2023-1-1'),
						   (2,'science','2022-7-9'),
						   (3,'social','2023-9-9'),
						   (4,'physics','2024-6-25');		
------8) display eid ename of all employes whose salary is less than 10,000------------------------		
select eid,ename from employee where salary <10000
--output: 1 3 hari----

---------9) display all records of book whose price ranges from 2500 to 5000-------
select * from book where price between 2500 and 5000
---output : 1 math    IA  5000 NULL------
----------  4 physics SPA 3000 NULL------

---------10) diusplay all the record from boklist relation whose publication name starts from 'E'
select * from booklist where publication like 'm%'
---------output: 3 social mcGraw Hill 3---------

---------11) display all record from employee table whose name ends with 'ta'
select * from employee where ename like '%am'
-------output \: 1 ram 2010 - 01-01 20000
--               2 shyam 2011-05-02 150000

-----12) display iid and name from issues tabnle whose name exactly consist 5 characters.
select iid,name from issues where name like '______'
--- output 1 math
--         3 social

-- 13) display all records from employee table where name starts from 's' and salary greater than 10000
select * from employee where ename like 's%' and salary >= 10000
-- output: 2 shyam 2011-05-02 150000

--14) display all records from book table where either bookid lies in range 1001 to 2000 or price ranges in 1000 to 2500
select * from book where bid between 1001 and 2000 or price between 1000 and 2500
--output : 2 science HPK 2000 2
--		   3 social SA 1000 3
--15) display isbn number and bookname where booklist must not contain isbn no. 3
select isbn, name from booklist where isbn not like '3'
--output : 1 1 math
--		   2 science 
--		   4 physics

----------------------------------lab 3---------------------------------------------------

--Q) find all the bokname, publication name and author name where publication name is "ekta"
SELECT  bname,author,booklist.publication from book
INNER JOIN  booklist 
on book.bname = booklist.name
where booklist.publication = 'puspa'
--Q)find the teacher name and faculty who issued book on 2023-1-1
alter table issues
add tid int;

alter table issues
add foreign key(tid) references teacher(tid); 

update issues
set tid = '1'
where dateofissue = '2023-1-1'

select teacher.name , teacher.faculty,issues.dateofissue from teacher, issues where teacher.tid = issues.tid and issues.dateofissue = '2023-1-1'

--Q3)find the employee name whose salary is greter then 10000 and facuty is 'computer'

alter table teacher
add eid int;

alter table teacher
add foreign key(eid)references employee(eid);

update teacher
set eid = '1'
where tid = '1'

update teacher
set eid = '2'
where tid = '2'

update teacher
set eid = '3'
where tid = '3'

update teacher
set eid = '4'
where tid = '4'

update teacher
set eid = '4'
where tid = '5'

select ename,employee.salary,teacher.faculty from employee inner join teacher on employee.eid = teacher.eid
where employee.salary > 10000 and teacher.faculty = 'BEI' 
/* ename   salary faculty
 1 ram     20000  bei
 2 prakash 25000  bei
 */
 --4) add attribute bid on issues relation.
 alter table issues
 add bid int;
 --5) insert the data in bid column.
  update issues
set bid = '1'
where iid = '1'

 update issues
set bid = '2'
where iid = '2'

 update issues
set bid = '4'
where iid = '4'
 
 update issues
set bid = '3'
where iid = '3'
 
 --6)find the teacher name and bookname issued by the teacher whose name start with 's'

 update issues
set tid = '2'
where iid = '2'

 update issues
set tid = '3'
where iid = '3'

 update issues
set tid = '4'
where iid = '4'

select teacher.name, issues.name from teacher inner join issues on teacher.tid = issues.tid where teacher.name like 's%'
/* name  name 
1  shiva social

--7) update all salary by 10%
*/

update employee
set salary = salary * 0.1 + salary;

select * from employee;

/*eid ename          date_of_employee salary 
1 1   ram             2010-01-01	22000
2 2	 shyam		      2011-05-02	165000
3 3	 hari			  2012-06-06	9900
4 4	 prakash	      2013-05-09	27500                                      
*/
--8)update book name maths to mathematics

update book
set bname = 'mathematics' where bname = 'math'

--9) update the salary o all employee by 20% whose salary is less than 5000 
update employee 
set salary  = 1.1 * salary where salary < 10000

--10) provided 5% increment to all salaries whose salary is greater than 20000 and 20% increment is rest of salaries.(use CASE WHEN < CONDITIONS>THEN <STATEMENT> ELSE<STATEMENT> END).
update employee
set salary = case when salary > 20000 then salary * 1.05 
				  else salary* 1.2
end;

--11) delte the records from empolyee table whose eid is 4
delete from employee where eid = 1
--12)use sub query to find all teacher name and faculty whose date of employee is jan 2,2011
select * from employee
select * from teacher
select name, faculty from teacher where eid in(select eid from employee where  date_of_employee = '2010-01-01') 
/* output:-
	name	faculty
1	ramu	bei
*/
--13) use sub query to find all the bok name and author name whose publication is "puspa"
select bname, author from book where bid in  (select bid from booklist where publication = 'puspa')
/*output
	bname		author
1	mathematics IA
*/
----------------------------------lab 4: ----------------------------------------------------------------
--1)sort the employee records in descending order.
select * from employee order by	ename desc;
/*
eid ename  date_of_employee salary  faculty 
2	shyam  2011-05-02	  173250	NULL
1	ram     2010-01-01	  23100	    NULL
4	prakash	2013-05-09	  28875  	NULL
3	hari   2012-06-06	  11880 	NUL
*/

-- 2)sort name and punlication name in ascending order
select * from booklist order by name,publication
/* 
isbn name  publication 
1	math   read more                                         
4	physics stanford                                          
2	science puspa                                             
3	social  mcGraw Hill                                       
*/
--3)display top three records from teachers relation 
SELECT TOP 3 * FROM teacher;
/*
tid name  faculty  salary  eid
1	ramu	bei 	NULL	1
2	hari	bct	    NULL	2
3	shiva	bei 	NULL	3
*/
--4)display the sum of salaries of all employee
select SUM(salary) from employee
--237105

--5)display the minimum salary of employee
select min(salary) from employee
--11880
--6)display the average price of book wirteen by same author
insert into book values(5,'eco', 'IA', 6000,1)
select author , AVG(price)as average from book 
group by author
/*
author												average
HPK                                               	2000
IA                                                	5500
SA                                                	1000
SPA                                               	3000
*/
--7)display publicaton name and number of books published by it from book list realtion publication wise.
