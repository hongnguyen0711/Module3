create database sales_management;

use sales_management;

create table customer(
c_id int auto_increment primary key,
c_name varchar(100),
c_age varchar(100)
);

create table order_product(
o_id int auto_increment primary key,
o_date date,
o_total_price double,
c_id int,
foreign key(c_id) references customer(c_id)
); 

create table product(
p_id int auto_increment primary key,
p_name varchar(100),
p_price double
);
create table order_detail(
o_id int,
p_id int,
od_qty varchar(100),
primary key(o_id,p_id),
foreign key(o_id) references order_product(o_id),
foreign key(p_id) references product(p_id)
);