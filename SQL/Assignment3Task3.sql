use HMBank;
/*1. Write a SQL query to Find the average account balance for all customers.   
*/


select customers.customer_id,customers.firstname,t.avg from customers natural join (select customer_id,avg(balance) as avg from accounts group by customer_id) as t;
/*2. Write a SQL query to Retrieve the top 10 highest account balances.  
*/
select customers.firstname,accounts.balance,accounts.account_type from customers natural join accounts order by balance;
/*3. Write a SQL query to Calculate Total Deposits for All Customers in specific date. 
*/

select * from transaction;
select account_id,sum(amount) as amount from transaction where transaction_type='Deposit' and transaction_date='2024-04-28' group by account_id;
select * from accounts;
select accounts.customer_id,sum(t.amount) as amount from accounts inner join (select account_id,sum(amount) as amount from transaction where transaction_type='Deposit' and transaction_date='2024-04-28' group by account_id) as t 
on accounts.account_id=t.account_id group by accounts.customer_id;
select customers.firstname,t1.amount from customers inner join (select accounts.customer_id,sum(t.amount) as amount from accounts inner join (select account_id,sum(amount) as amount from transaction where transaction_type='Deposit' and transaction_date='2024-04-28' group by account_id) as t 
on accounts.account_id=t.account_id group by accounts.customer_id)
as t1 on customers.customer_id=t1.customer_id;
/*4. Write a SQL query to Find the Oldest and Newest Customers. 
*/
select customer_id,timestampdiff(year,dob,curdate())as age from customers;
select min(t.age) from (select customer_id,timestampdiff(year,dob,curdate())as age from customers) as t;
select customer_id as New from customers where timestampdiff(year,dob,curdate())=(select min(t.age) from (select customer_id,timestampdiff(year,dob,curdate())as age from customers) as t);
select customer_id as Old from customers where timestampdiff(year,dob,curdate())=(select max(t.age) from (select customer_id,timestampdiff(year,dob,curdate())as age from customers) as t);
select customer_id,case when customer_id in 
(select customer_id as New from customers where timestampdiff(year,dob,curdate())=(select min(t.age) from (select customer_id,timestampdiff(year,dob,curdate())as age from customers) as t))
 then 'New' else 'old' end 'Customer_Type' from customers;

/*5. Write a SQL query to Retrieve transaction details along with the account type. 
*/
select * from transaction;
select transaction.transaction_id,transaction.amount,transaction.account_id,accounts.account_type,transaction.transaction_date from transaction natural join accounts;
/*6. Write a SQL query to Get a list of customers along with their account details. 
*/
select * from accounts;
select * from customers natural join accounts;
/*
7. Write a SQL query to Retrieve transaction details along with customer information for a 
specific account. 
*/
select * from transaction where account_id=2;
select accounts.customer_id,t.transaction_id,t.account_id,t.amount,t.transaction_date from
accounts natural join (select * from transaction where account_id=2) as t;
select * from customers inner join (select accounts.customer_id as customer_id,t.transaction_id as transaction_id,t.account_id as account_id,t.amount as amount,t.transaction_date as date
 from
accounts natural join (select * from transaction where account_id=2) as t) as t2 on customers.customer_id=t2.customer_id;
/*8. Write a SQL query to Identify customers who have more than one account.*/
select customer_id from accounts group by customer_id having count(*)>1;
select * from customers natural join (select customer_id from accounts group by customer_id having count(*)>1) as t;
/*9. Write a SQL query to Calculate the difference in transaction amounts between deposits and 
withdrawals. */
select * from transaction;
select account_id,sum(amount) as deposit from transaction where transaction_type='Deposit' group by account_id;
select account_id,sum(amount) as withdrawal from transaction where transaction_type='Withdrawal' group by account_id;
select t1.account_id,case when t2.withdrawal is null then 0 else t2.withdrawal end as withdrawal,
case when t1.deposit is null then 0 else t1.deposit end as deposit
from (select account_id,sum(amount) as deposit from transaction where transaction_type='Deposit' group by account_id) as t1
left join
 (select account_id,sum(amount) as withdrawal from transaction where transaction_type='Withdrawal' group by account_id) as t2
on t1.account_id=t2.account_id
union
select t2.account_id,case when t2.withdrawal is null then 0 else t2.withdrawal end as withdrawal,
case when t1.deposit is null then 0 else t1.deposit end as deposit
from
 (select account_id,sum(amount) as withdrawal from transaction where transaction_type='Withdrawal' group by account_id) as t2 left join
 (select account_id,sum(amount) as deposit from transaction where transaction_type='Deposit' group by account_id) as t1


on t1.account_id=t2.account_id;


select t3.account_id,t3.withdrawal-t3.deposit from
 (select t1.account_id,case when t2.withdrawal is null then 0 else t2.withdrawal end as withdrawal,
case when t1.deposit is null then 0 else t1.deposit end as deposit
from (select account_id,sum(amount) as deposit from transaction where transaction_type='Deposit' group by account_id) as t1
left join
 (select account_id,sum(amount) as withdrawal from transaction where transaction_type='Withdrawal' group by account_id) as t2
on t1.account_id=t2.account_id
union
select t2.account_id,case when t2.withdrawal is null then 0 else t2.withdrawal end as withdrawal,
case when t1.deposit is null then 0 else t1.deposit end as deposit
from
 (select account_id,sum(amount) as withdrawal from transaction where transaction_type='Withdrawal' group by account_id) as t2 left join
 (select account_id,sum(amount) as deposit from transaction where transaction_type='Deposit' group by account_id) as t1


on t1.account_id=t2.account_id) 
as t3;
/*
10. Write a SQL query to Calculate the average daily balance for each account over a specified 
period. 
*/
select * from accounts;
select * from transaction;
select account_id,transaction_date,sum(amount) from transaction where transaction_type='Deposit' group by account_id,transaction_date;
/*11. Calculate the total balance for each account type*/
select account_type,sum(balance) from accounts group by account_type;
/*
12. Identify accounts with the highest number of transactions order by descending order. 

*/
select count(*) as count,account_id from transaction group by account_id;
select max(t.count) as highest,t.account_id from (select count(*) as count,account_id from transaction group by account_id) as t;
/*13. List customers with high aggregate account balances, along with their account types. 
*/
select * from accounts;
select max(balance) as balance,customer_id,account_type from accounts group by account_type having max(balance);
select customers.firstname,t.account_type,customers.customer_id,t.balance from customers inner join 
(select max(balance) as balance,customer_id,account_type from accounts group by account_type having max(balance)) as t
on customers.customer_id=t.customer_id;
/**/
select * from transaction;
select * from transaction t1 inner join transaction t2 on t1.account_id=t2.account_id and t1.transaction_id<>t2.transaction_id and t1.amount=t2.amount and t2.transaction_date=t1.transaction_date
and t1.transaction_type=t2.transaction_type;
;
