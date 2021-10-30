create database TourManager;
use TourManager;

# bảng điểm đến du lịch
create table TravelDestination
(
    id_travel        int primary key auto_increment,
    name_destination varchar(44) not null,
    description      varchar(44),
    avg_price        float,
    id_city          int         not null
);

# Khách đặt tour
create table guest
(
    id_guest              int primary key auto_increment,
    name_guest            varchar(44) not null,
    identification_number varchar(44) not null,
    birthday              date,
    id_city               int         not null
);

# City
create table city
(
    id        int primary key auto_increment,
    name_city varchar(44) not null
);

# Tour
create table tour
(
    id                int primary key auto_increment,
    code_tour         varchar(44),
    type_tour_id      int   not null,
    price_destination float not null,
    start_date        date,
    end_date          date
);
alter table tour
    add column destination_travel varchar(44) after price_destination;
alter table tour
    modify destination_travel int;
alter table tour
    add foreign key (destination_travel) references city (id);
select *
from tour;

create table TypeTour
(
    id        int primary key auto_increment,
    code_type varchar(44) not null,
    name_type varchar(44) not null
);

create table bill
(
    id       int primary key auto_increment,
    tour_id  int not null,
    guest_id int not null,
    status   bit
);

alter table traveldestination
    add foreign key (id_city) references city (id);
alter table guest
    add foreign key (id_city) references city (id);
alter table tour
    add foreign key (type_tour_id) references typetour (id);
alter table bill
    add foreign key (tour_id) references tour (id);
alter table bill
    add foreign key (guest_id) references guest (id_guest);

# Thêm thông tin
-- thêm 5 bản ghi của điểm đến du lịch
INSERT INTO tourmanager.traveldestination (name_destination, description, avg_price, id_city)
VALUES ('Nam Định', 'desc 1', 14, 4);
INSERT INTO tourmanager.traveldestination (name_destination, description, avg_price, id_city)
VALUES ('Hồ Chí Minh', 'desc 2', 15, 1);
INSERT INTO tourmanager.traveldestination (name_destination, description, avg_price, id_city)
VALUES ('Hà Nội', 'desc 3', 16, 2);
INSERT INTO tourmanager.traveldestination (name_destination, description, avg_price, id_city)
VALUES ('Huế', 'desc 4', 17, 5);
INSERT INTO tourmanager.traveldestination (name_destination, description, avg_price, id_city)
VALUES ('Vũng Tàu', 'desc 5', 18, 3);
-- thêm 5 thành phố
INSERT INTO tourmanager.city (name_city)
VALUES ('A');
INSERT INTO tourmanager.city (name_city)
VALUES ('B');
INSERT INTO tourmanager.city (name_city)
VALUES ('C');
INSERT INTO tourmanager.city (name_city)
VALUES ('D');
INSERT INTO tourmanager.city (name_city)
VALUES ('E')
-- thêm 10 khách hàng
INSERT INTO tourmanager.guest (name_guest, identification_number, birthday, id_city)
VALUES ('vũ văn thái', '1234', '1998-01-18', 4);
INSERT INTO tourmanager.guest (name_guest, identification_number, birthday, id_city)
VALUES ('nguyễn thị thu thủy', '6789', '2003-10-08', 5);
INSERT INTO tourmanager.guest (name_guest, identification_number, birthday, id_city)
VALUES ('ngô an', '1209', '2021-10-15', 5);
INSERT INTO tourmanager.guest (name_guest, identification_number, birthday, id_city)
VALUES ('xuân anh', '1532', '2020-10-22', 1);
INSERT INTO tourmanager.guest (name_guest, identification_number, birthday, id_city)
VALUES ('đức lập', '9875', '2021-10-31', 3);
INSERT INTO tourmanager.guest (name_guest, identification_number, birthday, id_city)
VALUES ('kiều anh', '5347', '2021-10-26', 2);
INSERT INTO tourmanager.guest (name_guest, identification_number, birthday, id_city)
VALUES ('văn toàn', '8520', '2021-10-16', 2);
INSERT INTO tourmanager.guest (name_guest, identification_number, birthday, id_city)
VALUES ('trần văn quyết', '0975', '2021-10-13', 5);
INSERT INTO tourmanager.guest (name_guest, identification_number, birthday, id_city)
VALUES ('maria an lành', '7567', '2000-08-09', 1);
INSERT INTO tourmanager.guest (name_guest, identification_number, birthday, id_city)
VALUES ('vũ clone', '1230', '2044-04-04', 4);
-- thêm 2 loại tour
INSERT INTO tourmanager.typetour (code_type, name_type)
VALUES ('supervip01', 'vip');
INSERT INTO tourmanager.typetour (code_type, name_type)
VALUES ('superfake02', 'fake');
select *
from typetour;

-- thêm 15 tour
INSERT INTO tourmanager.tour (code_tour, type_tour_id, price_destination, start_date, end_date)
VALUES ('c0821h1', 1, 14.5, '2021-10-01', '2021-10-08');
INSERT INTO tourmanager.tour (code_tour, type_tour_id, price_destination, start_date, end_date)
VALUES ('a01', 1, 15.5, '2021-10-01', '2021-10-08');
INSERT INTO tourmanager.tour (code_tour, type_tour_id, price_destination, start_date, end_date)
VALUES ('a02', 2, 14.5, '2021-10-08', '2021-10-10');
INSERT INTO tourmanager.tour (code_tour, type_tour_id, price_destination, start_date, end_date)
VALUES ('a03', 2, 19.5, '2021-10-08', '2021-10-10');
INSERT INTO tourmanager.tour (code_tour, type_tour_id, price_destination, start_date, end_date)
VALUES ('a04', 2, 14.5, '2021-10-08', '2021-10-10');
INSERT INTO tourmanager.tour (code_tour, type_tour_id, price_destination, start_date, end_date)
VALUES ('a05', 1, 75, '2020-03-13', '2020-03-20');
INSERT INTO tourmanager.tour (code_tour, type_tour_id, price_destination, start_date, end_date)
VALUES ('a06', 1, 10, '2021-10-13', '2021-10-16');
INSERT INTO tourmanager.tour (code_tour, type_tour_id, price_destination, start_date, end_date)
VALUES ('a07', 1, 20, '2020-03-20', '2021-04-01');
INSERT INTO tourmanager.tour (code_tour, type_tour_id, price_destination, start_date, end_date)
VALUES ('a08', 2, 21, '2020-02-08', '2021-04-01');
INSERT INTO tourmanager.tour (code_tour, type_tour_id, price_destination, start_date, end_date)
VALUES ('a09', 1, 22, '2020-03-06', '2020-03-13');
INSERT INTO tourmanager.tour (code_tour, type_tour_id, price_destination, start_date, end_date)
VALUES ('a10', 2, 11, '2020-04-03', '2020-04-10');
INSERT INTO tourmanager.tour (code_tour, type_tour_id, price_destination, start_date, end_date)
VALUES ('b01', 2, 33, '2021-03-10', '2021-05-01');
INSERT INTO tourmanager.tour (code_tour, type_tour_id, price_destination, start_date, end_date)
VALUES ('b02', 1, 44, '2021-04-08', '2021-10-28');
INSERT INTO tourmanager.tour (code_tour, type_tour_id, price_destination, start_date, end_date)
VALUES ('b03', 2, 55, '2020-03-27', '2020-04-03');
INSERT INTO tourmanager.tour (code_tour, type_tour_id, price_destination, start_date, end_date)
VALUES ('b04', 1, 66, '2021-10-07', '2021-10-21');

UPDATE tourmanager.tour t
SET t.destination_travel = 4
WHERE t.id = 8;
UPDATE tourmanager.tour t
SET t.destination_travel = 3
WHERE t.id = 5;
UPDATE tourmanager.tour t
SET t.destination_travel = 4
WHERE t.id = 10;
UPDATE tourmanager.tour t
SET t.destination_travel = 2
WHERE t.id = 12;
UPDATE tourmanager.tour t
SET t.destination_travel = 1
WHERE t.id = 1;
UPDATE tourmanager.tour t
SET t.destination_travel = 1
WHERE t.id = 2;
UPDATE tourmanager.tour t
SET t.destination_travel = 1
WHERE t.id = 3;
UPDATE tourmanager.tour t
SET t.destination_travel = 3
WHERE t.id = 6;
UPDATE tourmanager.tour t
SET t.destination_travel = 5
WHERE t.id = 9;
UPDATE tourmanager.tour t
SET t.destination_travel = 5
WHERE t.id = 11;
UPDATE tourmanager.tour t
SET t.destination_travel = 4
WHERE t.id = 7;
UPDATE tourmanager.tour t
SET t.destination_travel = 2
WHERE t.id = 13;
UPDATE tourmanager.tour t
SET t.destination_travel = 3
WHERE t.id = 14;
UPDATE tourmanager.tour t
SET t.destination_travel = 5
WHERE t.id = 15;
UPDATE tourmanager.tour t
SET t.destination_travel = 2
WHERE t.id = 4;

-- them 10 bill
INSERT INTO tourmanager.bill (tour_id, guest_id, status)
VALUES (14, 1, true);
INSERT INTO tourmanager.bill (tour_id, guest_id, status)
VALUES (11, 2, false);
INSERT INTO tourmanager.bill (tour_id, guest_id, status)
VALUES (4, 3, false);
INSERT INTO tourmanager.bill (tour_id, guest_id, status)
VALUES (5, 4, null);
INSERT INTO tourmanager.bill (tour_id, guest_id, status)
VALUES (7, 5, true);
INSERT INTO tourmanager.bill (tour_id, guest_id, status)
VALUES (11, 6, false);
INSERT INTO tourmanager.bill (tour_id, guest_id, status)
VALUES (13, 7, false);
INSERT INTO tourmanager.bill (tour_id, guest_id, status)
VALUES (9, 8, true);
INSERT INTO tourmanager.bill (tour_id, guest_id, status)
VALUES (5, 10, false);

# Thống kê số lượng tour của các thành phố
select name_city, count(code_tour) as 'số lượng tour'
from tour join city c on tour.destination_travel = c.id group by destination_travel;

# Tính số tour có ngày bắt đầu trong tháng 3/2020
select code_tour,count(start_date) as number_start_month_3_2020
from tour where month(start_date) = 3 and year(start_date) = 2020 group by start_date;

# Tính số tour có ngày kết thúc trong tháng 4/2020
select code_tour,count(end_date) as number_end_month_4_2020
from tour where month(end_date) = 4 and year(end_date) = 2020 group by start_date;


