create database demo_view_index;

use demo_view_index;

create table products (
id int auto_increment primary key,
product_code varchar(45),
product_name varchar(100),
product_price double,
product_amount int,
product_description varchar(100),
product_status varchar(100)
);

insert into products 
value 	(1, "p-01","iphone", 100, 1, "Dien thoai thong minh", "13 pro"),
		(2, "p-02","iphone", 100, 3, "Dien thoai thong minh", "14 pro"),
		(3, "p-03","samsung", 100, 4, "Dien thoai thong minh", "galaxy"),
		(4, "p-04","samsung", 100, 5, "Dien thoai thong minh", "galaxy A"),
		(5, "p-01","samsung", 100, 2, "Dien thoai thong minh", "zip");
        
 -- tạo Unique Index         
create index product_code_idx on products(product_code);
explain select * 
from products
where product_code = "p-01";
-- tạo Composite Index 
create index product_name_price_idx on products(product_name,product_price);
explain select * 
from products 
where product_name = "iphone" and product_price = 100 ;

-- tạo view 
create view products_view as 
select product_code, product_name, product_price,product_status  
from products;

select * 
from products_view;

-- sửa view
create or replace view products_view as
select product_name, product_price 
from products;

-- xóa view 
drop view products_view;

-- tạo sp lấy thông tin 
DELIMITER //
create procedure get_info_product()
begin
select*
from products;
end //
DELIMITER ;

call get_info_product();

--  tạo sp thêm mới 
DELIMITER //
create procedure add_new_product(in 
id int, 
product_code varchar(45),
product_name varchar(100),
product_price double,
product_amount int,
product_description varchar(100),
product_status varchar(100) )
begin
insert into products
value (id, product_code, product_name, product_price, product_amount, product_description, product_status);
end //
DELIMITER ;

call add_new_product(6, "p-06","iphone", 200, 1, "Dien thoai thong minh", "15 pro");

-- sửa thông tin theo id
 DELIMITER //
create procedure edit_info_product(in id_edit int, new_name varchar(100))
begin
update products 
set product_name = new_name
where id = id_edit;
end //
DELIMITER ;

call edit_info_product(6, "iphone limited");

-- xoá sản phẩm theo id
 DELIMITER //
create procedure delete_product(in id_delete int)
begin
delete from products
where id = id_delete;
end //
DELIMITER ;

call delete_product(6);
