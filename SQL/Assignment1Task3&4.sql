use techshop;
select concat(firstname,' ',lastname) as fullname,email from customer;
select * from orders;
select orders.orderId,orders.orderDate,concat(customer.firstname,' ' ,customer.lastname) as Name from orders natural join customer order by orderId;
select * from orders;
select * from customer;
update products set price=price+0.1*price;
select * from products;
delete from orders;
select * from orderDetails;
update customer set email='shaikhhuda2810@gmail.com',address='pune',phone='+912344'  where  firstname='Huda';
select * from customer;
select * from orderDetails;
select * from orders;

alter table orderDetails add quantity int;
alter table orders add orderStatus enum('Pending','Shipped') default 'Pending';
select * from orders;
update orders set orderStatus='Shipped' where orderId=1;
select * from orders inner join customer on orders.customerId=customer.customerId;
select orderDetails.orderId,orderDetails.quantity*products.price from orderDetails natural join products;
update orders inner join (select orderDetails.orderId as t2,orderDetails.quantity*products.price as updatePrice from orderDetails natural join products
)as t1 on orders.orderId=t1.t2 set orders.orderAmount=t1.updatePrice;
select * from orders;
select customerId,count(*) from orders group by customerId having count(*)>=1;
select * from customer natural join (select customerId,count(*) from orders group by customerId having count(*)>=1) as t1;
select * from orders;
select * from orderDetails;
select orderDetails.productId as productId,orderDetails.orderId as orderId,orderDetails.quantity*products.price as updatePrice from orderDetails natural join products;
select sum(updatePrice) as revenue,productId from (select orderDetails.productId as productId,orderDetails.orderId as orderId,orderDetails.quantity*products.price as updatePrice from orderDetails natural join products) as t1 group by productId;
select products.productname,p.revenue from products natural join (select sum(updatePrice) as revenue,productId from (select orderDetails.productId as productId,orderDetails.orderId as orderId,orderDetails.quantity*products.price as updatePrice from orderDetails natural join products) as t1 group by productId
) as p;
select * from orderDetails;
select productId,sum(quantity)as TotalQuantity from orderDetails group by productId;
select * from orders;
select max(TotalQuantity) as MostPopular,products.productName from products inner join (select productId,sum(quantity)as TotalQuantity from orderDetails group by productId) as t1 on products.productId=t1.productId; 
select orderDetails.orderId,sum(orderDetails.quantity*products.price) from orderDetails natural join products group by orderDetails.orderId;
select * from orderDetails;
insert into orderDetails values(11,1,1,1),
(12,2,10,2);
select products.productId,products.productName,sum(orderDetails.quantity)*products.price from orderDetails natural join products group by orderDetails.productId ;
select * from customer;
select * from orders;
delete from orders where customerId=2;
insert into orders values(11,1,'2024-04-25',900,'Pending');
select customer.customerId,customer.firstname,customer.lastname,customer.email,customer.phone from customer natural join orders group by orders.customerId;
select sum(quantity),productId from orderDetails group by productId;
select productId from orderDetails order by productId;
insert into orderDetails values(13,11,1,1),
(14,9,10,2);
select * from products;
select * from orders;
select  max(t.pop),products.productName from products natural join (select sum(quantity) as pop,productId from orderDetails group by productId)as t;
select * from orders;
select avg(orderAmount),customerId from orders group by customerId;
select t.averageOrderAmount,customer.customerId,customer.firstName,customer.email from
 customer natural join(select avg(orderAmount) as averageOrderAmount,customerId from orders group by customerId) as t ;
select * from orders;
select max(orderAmount)from orders;
select * from orders where orderAmount=(select max(orderAmount)from orders
);
select customer.firstname,t.orderAmount from customer natural join (select * from orders where orderAmount=(select max(orderAmount)from orders
)) as t;
select * from orderDetails;
select count(*),productId from orderDetails group by productId;
select products.productName,t.orderTimes from products natural join (select count(*) as orderTimes,productId from orderDetails group by productId) as t;
select * from orders;
select * from orders where orderDate between '2024-03-11' and '2024-04-11';
select * from customer where customerId not in (select customerId from orders);
select * from inventory;

select sum(quantity),productId from orderDetails group by productId  ;
select * from inventory;
select inventory.quantityinStoc-t.quant as ItemsForSale,inventory.productId from inventory inner join (select sum(quantity) as quant,productId from orderDetails group by productId )
as t on inventory.productId=t.productId;
select sum(orderAmount)as TotalRevenue from orders; 
select  sum(orderAmount) as Amount,customerId from orders group by customerId;
select customer.customerId,customer.firstname,t.amount from customer inner join (select  sum(orderAmount) as Amount,customerId from orders group by customerId) as t 
on  customer.customerId=t.customerId where customer.firstname='Huda';
select * from orderDetails;
select * from orders;
select count(*),customerId from orders group by customerId;
select customer.firstname,max(t.c) from customer inner join (select count(*) as c,customerId from orders group by customerId)
as t on customer.customerId=t.customerId;
select * from orderDetails;
select sum(quantity),productId from orderDetails group by productId;
select max(t.c),products.productId,products.productName from products inner join (select sum(quantity) as c,productId from orderDetails group by productId)
as t on products.productId=t.productId;
select sum(orderAmount),customerId from orders group by customerId;
select max(t.c),customer.firstname from customer inner join (select sum(orderAmount) as c,customerId from orders group by customerId) as t
on customer.customerId=t.customerId;
select avg(orderAmount),customerId from orders group by customerId;
select count(*),customerId from orders group by customerId;
select customer.firstname,t.c from customer inner join (select count(*) as c,customerId from orders group by customerId) as t
on customer.customerId=t.customerId;