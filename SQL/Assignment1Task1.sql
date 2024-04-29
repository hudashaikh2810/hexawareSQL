create database techshop;
use techshop;
create table customer(customerId int primary key,firstname varchar(30),lastname varchar(30),email varchar(255),phone varchar(12),
address varchar(60));
create table products(productId int primary key,productName varchar(50),description varchar(60),price int);
create table orders(orderId int,customerId int,orderDate date,orderAmount int,primary key(orderId),foreign key (customerId)
references customer(customerId)
);
create table orderDetails(orderDeatilId int,orderId int,productId int,primary key (orderDeatilId)
,foreign key(orderId) references orders(orderId) on delete cascade,foreign key(productId) references products(productId) on delete cascade);

create table inventory(inventoryId int primary key,productId int,quantityInStoc int,lastStockUpdate date,foreign key(productId) references products(productId));
