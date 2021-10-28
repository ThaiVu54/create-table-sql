create database quanlysinhvien;
use quanlysinhvien;
create table class(
classid int auto_increment not null primary key,
classname varchar(60) not null,
statrdate datetime not null,
status bit
);

create table student(
studentid int auto_increment not null primary key, 
studentname varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit,
classid int
);

select * from quanlysinhvien.student;

create table `subject`(
subjd int not null primary key auto_increment,
subname varchar(30),
credit tinyint not null default 1 check (credit >=1),
status tinyint default 1
);

create table mark(
markid int auto_increment not null primary key,
subid int not null unique key,
studentid int not null unique,
mark float default 0 check (mark between 0 and 100),
examtimes tinyint default 1
);
alter table student add foreign key (classid) references class(classid);
select * from quanlysinhvien.subject;

alter table subject rename column subjd to subid;
alter table mark add foreign key (subid) references subject(subid);
alter table mark add foreign key (studentid) references student (studentid);