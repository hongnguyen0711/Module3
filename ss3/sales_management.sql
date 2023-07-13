create database sales_management;

use sales_management;

create table customer(
c_id int auto_increment primary key,
c_name varchar(100),
c_age varchar(100)
);

create table orders(
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
foreign key(o_id) references orders(o_id),
foreign key(p_id) references product(p_id)
);

insert into customer(c_name, c_age) 
value ("Minh Quan", 10), 
      ("Ngoc Oanh",20),
      ("Hong Ha",50);

insert into orders(o_date, o_total_price,c_id)
value ("2006-03-21", null, 1),
	  ("2006-03-23", null, 2),
      ("2006-03-16", null, 1);

insert into product(p_name, p_price)
value ("May Giat", 3),("Tu Lanh", 5),("Dieu Hoa", 7),("Quat", 1),("Bep Dien", 2);

insert into order_detail(o_id, p_id, od_qty)
value (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

select o_id, o_date, o_total_price
from orders;

select customer.c_name, product.p_name
from customer
join orders on customer.c_id = orders.c_id
join order_detail on orders.o_id = order_detail.o_id
join product on order_detail.p_id = product.p_id;

select customer.c_name, product.p_name
from customer
left join orders on customer.c_id = orders.c_id
left join order_detail on orders.o_id = order_detail.o_id
left join product on order_detail.p_id = product.p_id
where p_name is null;

SET sql_mode = 0;
select  orders.o_id, orders.o_date, sum(order_detail.od_qty*product.p_price) as total
from orders
join order_detail on orders.o_id = order_detail.o_id
join product on order_detail.p_id = product.p_id
group by orders.o_id;
SET sql_mode = 1;


