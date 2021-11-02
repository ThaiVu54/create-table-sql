create database demo;
use demo;
create table Products(
    id int primary key auto_increment,
    productCode varchar(30),
    productName varchar(30),
    productPrice float,
    productAmount int,
    productDescription varchar(30),
    productStatus bit
);

#Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
CREATE UNIQUE INDEX index_name ON products(productCode);

#Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create unique index index_name1 on products(productName,productPrice);

#Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure findProduct()
begin
    select * from products;
end //
DELIMITER ;


#Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
CREATE UNIQUE INDEX index_name ON products(productCode);

#Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create unique index index_name1 on products(productName,productPrice);

#Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products where productCode = 'TH01';
explain select * from products;

#So sánh câu truy vấn trước và sau khi tạo index

#Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW product_vw as
select productCode, productName, productPrice, productStatus
from products;

select * from product_vw;

#Tiến hành sửa đổi view
create or replace view product_vw as
select productCode, productName, productPrice, productStatus, productAmount
from products where productName = 'c';

#Xóa view
drop view product_vw;

#Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure findProduct()
begin
    select * from products;
end //
DELIMITER ;
call demo.findProduct();


#Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE insertNewProduct(
productCode varchar(30),
productName varchar(30),
productPrice float,
productAmount int,
productDescription varchar(30),
productStatus bit
    )
     begin
         insert into products (productcode, productname, productprice, productamount, productdescription, productstatus)
         values (productCode,productName,productPrice,productAmount,productDescription,productstatus);
     end //
DELIMITER ;
drop procedure insertNewProduct;
call insertNewProduct('th06','F',19.2,6,'desc 6',1);
select * from products;

#Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
drop procedure if exists editPointById;
create procedure editPointById(
id int,
    productCode varchar(30),
    productName varchar(30),
    productPrice float,
    productAmount int,
    productDescription varchar(30),
    productStatus bit
)
begin
    update products set productCode = productCode,
                        productCode = productName,
                        productPrice = productPrice,
                        productAmount = productAmount,
                        productDescription =productDescription,
                            productStatus = productStatus
    where id = id;
end;
delimiter ;
call editPointById(2,'th06','T',19.2,6,'desc 6',1);
ALTER TABLE products
    DROP INDEX index_name;
select * from products;

#Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure deleteById(
id int
)
begin
    DELETE FROM products
    WHERE id = id;
end //
delimiter ;
call deleteById(1);
select * from products;