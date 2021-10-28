create database QuanLyDiemThi;
use quanlydiemthi;
create table hocsinh(
mahs varchar(10)not null primary key,
tenhs varchar(20)not null,
ngaysinh datetime,
lop varchar(20),
gt varchar(20)
);
insert into quanlydiemthi.hocsinh value ('c0821h1','thai vu','2004-01-18','08','nam');
select * from quanlydiemthi.hocsinh;

create table Monhoc(
mamh varchar(20) primary key,
tenmh varchar(20)
);

create table bangdiem(
mahs varchar(20),
mamh varchar(20),
diemthi int,
ngaykt date,
primary key (mahs,mamh),
foreign key (mahs) references hocsinh (mahs),
foreign key (mamh) references monhoc (mamh)
);

create table giaovien(
magv varchar(20),
tengv varchar(20),
sdt varchar(20)
);

alter table monhoc add magv varchar(20);
alter table giaovien add primary key (magv); 
select * from quanlydiemthi.monhoc;
alter table monhoc add foreign key (magv) references giaovien(magv);