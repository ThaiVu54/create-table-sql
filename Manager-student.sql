create database ManagerStudent;
use ManagerStudent;
create table address
(
    id_address   int primary key auto_increment,
    name_address varchar(50)
);
insert into ManagerStudent.address
    value (1, 'NamDinh');
insert into ManagerStudent.address
    value (2, 'VungTau');
insert into ManagerStudent.address
    value (3, 'QuangTri');
insert into ManagerStudent.address
    value (4, 'NgheAn');
insert into ManagerStudent.address
    value (5, 'HaTinh');


create table classes
(
    id_classes   int primary key auto_increment,
    name_classes varchar(50) not null,
    language     varchar(50) not null,
    description  varchar(255)
);
insert into ManagerStudent.classes value (1, 'class 1', 'java', 'java fullstack');
insert into ManagerStudent.classes value (2, 'class 2', 'python', 'python fullstack');
insert into ManagerStudent.classes value (3, 'class 3', 'php', 'php back-end');
insert into ManagerStudent.classes value (4, 'class 4', 'ruby', 'ruby part-time');
insert into ManagerStudent.classes value (5, 'class 5', 'c/c++', 'c/c++ fullstack');

create table students
(
    id_student int primary key auto_increment,
    full_name  varchar(40) not null,
    id_address int         not null,
    phone      varchar(40) not null unique,
    id_classes int         not null
);
insert into ManagerStudent.students value (1, 'vu van thai', 1, 0337334335, 1);
insert into ManagerStudent.students value (2, 'nguyen thi thu thuy', 1, 0444334335, 4);
insert into ManagerStudent.students value (3, 'tran van anh', 3, 0335555335, 1);
insert into ManagerStudent.students value (4, 'nguyen thi xuan anh', 1, 0123334335, 3);
insert into ManagerStudent.students value (5, 'vu van thai', 4, 0337335555, 2);
insert into ManagerStudent.students value (6, 'vu van thai', 5, 0337336666, 2);
insert into ManagerStudent.students value (7, 'vu van thai', 3, 0311111335, 5);
insert into ManagerStudent.students value (8, 'vu van thai', 2, 0337332335, 3);
insert into ManagerStudent.students value (9, 'vu van thai', 4, 0337334435, 4);
insert into ManagerStudent.students value (10, 'vu van thai', 1, 0127334335, 5);

create table course
(
    id_course          int primary key auto_increment,
    name_course        varchar(50) not null,
    description_course varchar(255)
);
insert into ManagerStudent.course (id_course, name_course, description_course) value (null, 'java full-time', 'desc 1');
insert into ManagerStudent.course (id_course, name_course, description_course) value (null, 'php full-time', 'desc 2');
insert into ManagerStudent.course (id_course, name_course, description_course) value (null, 'python full-time', 'desc 3');
insert into ManagerStudent.course (id_course, name_course, description_course) value (null, 'ruby full-time', 'desc 4');
insert into ManagerStudent.course (id_course, name_course, description_course) value (null, 'c/c++ full-time', 'desc 5');

create table point
(
    id_point   int primary key auto_increment,
    id_course  int not null,
    id_student int not null,
    point      int not null
);
INSERT INTO managerstudent.point (id_point, id_course, id_student, point)
VALUES (1, 1, 1, 10);
INSERT INTO managerstudent.point (id_point, id_course, id_student, point)
VALUES (2, 1, 1, 9);
INSERT INTO managerstudent.point (id_point, id_course, id_student, point)
VALUES (3, 2, 3, 8);
INSERT INTO managerstudent.point (id_course, id_student, point)
VALUES (3, 3, 7);
INSERT INTO managerstudent.point (id_course, id_student, point)
VALUES (2, 5, 6);
INSERT INTO managerstudent.point (id_course, id_student, point)
VALUES (5, 9, 6);
INSERT INTO managerstudent.point (id_course, id_student, point)
VALUES (1, 8, 5);
INSERT INTO managerstudent.point (id_course, id_student, point)
VALUES (1, 10, 1);
INSERT INTO managerstudent.point (id_course, id_student, point)
VALUES (2, 9, 1);
INSERT INTO managerstudent.point (id_course, id_student, point)
VALUES (3, 8, 2);
INSERT INTO managerstudent.point (id_course, id_student, point)
VALUES (3, 7, 3);
INSERT INTO managerstudent.point (id_course, id_student, point)
VALUES (4, 6, 4);
INSERT INTO managerstudent.point (id_course, id_student, point)
VALUES (4, 5, 5);
INSERT INTO managerstudent.point (id_course, id_student, point)
VALUES (5, 4, 6);


alter table students
    add foreign key (id_address) references address (id_address);
alter table students
    add foreign key (id_classes) references classes (id_classes);
alter table point
    add foreign key (id_student) references students (id_student);
alter table point
    add foreign key (id_course) references course (id_course);

# Thống kê số lượng học viên các lớp
select name_classes as 'tên lớp', count(name_classes) as 'Số lượng học viên các lớp'
from classes join students s on classes.id_classes = s.id_classes
group by name_classes;

# Thống kê số lượng học viên các tỉnh
select name_address as 'tên học viên', count(name_address) 'Số lượng học viên các tỉnh'
from address join students s on address.id_address = s.id_address
group by name_address;

# Tính điểm trung bình các khóa học
select name_course as 'tên khóa học', avg(point) 'Điểm trung bình'
from point join course c on point.id_course = c.id_course group by name_course;

# Đưa ra khóa học có điểm trung bình cao nhất
select name_course as 'tên khóa học', avg(point) as avg_point
from point join course c on point.id_course = c.id_course
group by name_course
having avg_point >= ALL
       (SELECT avg(point) as avg_point
        from point
                 join course c on point.id_course = c.id_course
        group by name_course);
