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
	ename char,
	date_of_employee date,
	salary int,
	constraint p_k primary key(eid)
);

create table booklist(
	isbn int not null,
	name char,
	publication char,
	primary key(isbn)
);

create table book(
	bid int,
	bname char,
	author char,
	price int,
	constraint p_bk primary key(bid)
);

create table issues(
	iid int,
	name char,
	dateofissue date,
	primary key(iid)
);



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
alter column ename char not null

alter table booklist
alter column name char not null

alter table book
alter column bname char not null

alter table issues
alter column name char not null

--print tables
select* from employee
select* from book
select* from booklist
select* from issues



