use HMBank;
/*1. Insert at least 10 sample records into each of the following tables.   
• Customers  
• Accounts 
• Transactions*/
insert into customers values(1,'John','Doe','doe@example.com',123456789,'Indore','1995-08-05'),
(2,'Ram','Sharma','ram@example.com',13245678,'Jammu','1995-07-02'),
(3,'Shivangi','Gupta','gupta@example.com',234567891,'Mumbai','1994-08-05'),
(4,'Manish','Malhota','manish@example.com',345216789,'Indore','1995-01-010'),
(5,'Sanjay','Singhania','sanjay@example.com',421356789,'Mumbai','1995-10-28'),
(6,'Rani','Mahajan','rani@example.com',532146789,'Indore','1995-02-21'),
(7,'Alia','Bhatt','alia@example.com',654321789,'Mumbai','1995-09-019');
insert into accounts values(1,1,'Saving',10000),
(2,2,'Current',20000),
(3,3,'ZeroBanalace',30000),
(4,4,'Saving',50000),
(5,5,'Current',30000),
(6,6,'ZeroBanalace',90000);
insert into transaction values(4,1,200,'2024-04-28','Withdrawal'),
(5,2,400,'2024-04-28','Deposit'),
(6,3,800,'2024-04-28','Transafer');
/*1. Write a SQL query to retrieve the name, account type and email of all customers.  */
select concat(firstname,' ',lastname) 'name',email from customers;
select * from accounts;
select concat(customers.firstname,' ',customers.lastname) 'name',customers.email,accounts.account_type from customers natural join accounts;
/*2. Write a SQL query to list all transaction corresponding customer. */
select * from transaction;
/*3. Write a SQL query to increase the balance of a specific account by a certain amount.*/
update accounts set balance=balance+700 where account_id=1;
/*4. Write a SQL query to Combine first and last names of customers as a full_name. 
*/
select concat(firstname,' ' ,lastname) as Fullname from customers;
/*5. Write a SQL query to remove accounts with a balance of zero where the account 
type is savings. */
delete from accounts where balance=0 and account_type='Saving';
/* Write a SQL query to Find customers living in a specific city.*/
select * from customers where address='Indore';
/*7. Write a SQL query to Get the account balance for a specific account. */
select balance from accounts where account_id=2;
/*8. Write a SQL query to List all current accounts with a balance greater than $1,000.*/
select * from accounts where account_type='Current' and balance>1000;
/*9. Write a SQL query to Retrieve all transactions for a specific account. 
*/
select * from transaction where account_id=2;
/*12. Write a SQL query to Find customers not living in a specific city. 
*/
select * from customers where address<>'Mumbai';
/*Write a SQL query to Identify accounts where the balance is less than a specified 
overdraft limit. */
select * from accounts where balance<50000;
/*10. Write a SQL query to Calculate the interest accrued on savings accounts based on a 
given interest rate.*/
select account_id,(balance*10*1)/100 as SimpleInteres from accounts where account_type='Saving';