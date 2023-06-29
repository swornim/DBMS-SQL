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
--	   3 social SA 1000 3
--15) display isbn number and bookname where booklist must not contain isbn no. 3
select isbn, name from booklist where isbn not like '3'
--output : 1 1 math
--	   2 science 
--	   4 physics
