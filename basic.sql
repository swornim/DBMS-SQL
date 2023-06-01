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


