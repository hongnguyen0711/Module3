CREATE DATABASE watches_db;
USE watches_db;
CREATE TABLE `role` (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(255)
);
​
CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    account_username VARCHAR(100),
    account_password VARCHAR(100),
    role_id INT,
    is_delete BIT(1) DEFAULT 0,
    FOREIGN KEY (role_id) REFERENCES `role`(role_id)
);
​
CREATE TABLE type_customers(
    type_customer_id INT PRIMARY KEY AUTO_INCREMENT,
    type_customer_name VARCHAR(100)
);
​
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    customer_gender BIT(1),
    customer_birthday DATE,
    customer_phone VARCHAR(20),
    customer_email VARCHAR(45),
    customer_address VARCHAR(255),
    account_id INT UNIQUE,
    type_customer_id INT,
    is_delete BIT(1) DEFAULT 0,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id),
    FOREIGN KEY (type_customer_id) REFERENCES type_customers(type_customer_id)
);
​
CREATE TABLE watch_brands(
    watch_brand_id INT PRIMARY KEY AUTO_INCREMENT,
    watch_brand_name VARCHAR(100)
);
​
CREATE TABLE watches (
    watch_id INT PRIMARY KEY AUTO_INCREMENT,
    watch_name VARCHAR(100),
    watch_price DOUBLE,
    watch_brand_id INT,
    quantity int,
    descriptions varchar(225),
	is_delete BIT(1) DEFAULT 0,
    FOREIGN KEY (watch_brand_id) REFERENCES watch_brands(watch_brand_id)
);
​
CREATE TABLE images(
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    image_name VARCHAR(45),
    watch_id INT,
    FOREIGN KEY (watch_id) REFERENCES watches(watch_id)
);
CREATE TABLE vouchers(
    voucher_id INT PRIMARY KEY AUTO_INCREMENT,
    voucher_name VARCHAR(100),
    is_delete BIT(1) DEFAULT 0
);
CREATE TABLE shopping_carts (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
	pay BIT(1) DEFAULT 0,
    voucher_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (voucher_id) REFERENCES vouchers(voucher_id)
);
​
CREATE TABLE carts_watches (
    watch_id INT,
    cart_id INT,
    quantity INT,
    current_price DOUBLE,
    PRIMARY KEY(watch_id,cart_id),
    FOREIGN KEY (watch_id) REFERENCES watches(watch_id),
    FOREIGN KEY (cart_id) REFERENCES shopping_carts (cart_id)
);
​
​
CREATE TABLE orders_history (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    cart_id INT,
    order_date DATE,
    delivery_date DATE,
    is_delete BIT(1) DEFAULT 0,
    FOREIGN KEY (cart_id) REFERENCES shopping_carts(cart_id)
);