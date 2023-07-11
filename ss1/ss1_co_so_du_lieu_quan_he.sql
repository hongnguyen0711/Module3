create database student_management;
use student_managent;
create table student(
	id_student int auto_increment,
    name_student varchar(100),
    age_student int,
    country varchar(255),
    primary key (id_student)
);
insert into student_management.student(name_student,age_student,country) value ("ThoiND",18,"Da Nang"),("MinhML",17,"Hue");
select * from student_management.student;

set sql_safe_updates = 0;
update student set age_student = 20 where name_student = "ThoiND";
set sql_safe_updateS = 1;

create table class(
	id_class int auto_increment,
	name_class varchar(255),
    primary key (id_class)
);
insert into class(name_class) value ("C0423G1");
select * from class;

create table teacher(
	id_teacher int auto_increment,
    name_teacher varchar(100),
    age_teacher int,
    country varchar(255),
    primary key(id_teacher)
);
