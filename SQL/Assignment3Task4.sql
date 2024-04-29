use HMBank;
/*
1. Retrieve the customer(s) with the highest account balance. 

*/
select max(balance) from accounts;
select customer_id from accounts where balance=(select max(balance) from accounts);
select * from customers where customer_id in(select customer_id from accounts where balance=(select max(balance) from accounts));
/*
2. Calculate the average account balance for customers who have more than one account. 

*/
select avg(balance)as balance,customer_id from accounts group by customer_id having count(*)>1;
select * from customers inner join (select avg(balance)as balance,customer_id from accounts group by customer_id having count(*)>1) as t on
t.customer_id=customers.customer_id; 
/*3. Retrieve accounts with transactions whose amounts exceed the average transaction amount. 
*/
select avg(amount) from transaction;
select * from transaction where amount>(select avg(amount) from transaction);
/*4. Identify customers who have no recorded transactions. 
*/
select distinct account_id from transaction;
select customer_id from accounts where account_id not in (select distinct account_id from transaction);
select  * from customers where customer_id in (select customer_id from accounts where account_id not in (select distinct account_id from transaction));
/*5. Calculate the total balance of accounts with no recorded transactions. 
*/
select distinct account_id from transaction;
select account_id,balance from accounts where account_id not in (select distinct account_id from transaction);
/*6. Retrieve transactions for accounts with the lowest balance. 
*/
select account_id from accounts having min(balance);
select * from transaction where account_id=(select account_id from accounts having min(balance));
/*7. Identify customers who have accounts of multiple types. 
*/
select customer_id from accounts group by customer_id having count(*)>1;
select  * from customers where customer_id in (select customer_id from accounts group by customer_id having count(*)>1);
/*8. Calculate the percentage of each account type out of the total number of accounts. 
*/
select account_type,count(*) as counts from accounts group by account_type;
select sum(t.count) from (select account_type,count(*) as count from accounts group by account_type) as t;
select t1.counts/(select sum(t.count) from (select account_type,count(*) as count from accounts group by account_type) as t)*100 as Percentage,
t1.account_type from (select account_type,count(*) as counts from accounts group by account_type) as t1;
/*9. Retrieve all transactions for a customer with a given customer_id. 
*/
select * from transaction where account_id in (select account_id from accounts where customer_id=2);
/*
10. Calculate the total balance for each account type, including a subquery within the SELECT 
clause. 
*/
select * from accounts;

