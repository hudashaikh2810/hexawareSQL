/*1. Create the database named "HMBank" */
create database HMBank;
use HMBank;
/*2. Define the schema for the Customers, Accounts, and Transactions tables based on the 
provided schema.  
4. Create an ERD (Entity Relationship Diagram) for the database.  
5. Create appropriate Primary Key and Foreign Key constraints for referential integrity.  
6. Write SQL scripts to create the mentioned tables with appropriate data types, constraints, 
and relationships.   
• Customers  
• Accounts 
• Transactions*/
create table customers(customer_id int primary key,firstname varchar (50),lastname varchar(50),email varchar(255),phone varchar(12),address varchar(50));
alter table customers add column dob date;
create table accounts(account_id varchar(100) primary key,customer_id int,account_type enum('Saving','Current','ZeroBanalace'),balance int,
foreign key(customer_id) references customers(customer_id));
create table transaction(transaction_id int primary key,account_id varchar(100),amount int ,transaction_date date,transaction_type enum('Deposit','Withdrawal',
'Transafer'));
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
insert into transaction values(1,1,100,'2024-04-28','Deposit'),
(2,2,400,'2024-04-28','Withdrawal'),
(3,3,800,'2024-04-28','Transafer');
insert into accounts values(7,1,'Current',9000),
(8,2,'Saving',80000);
insert into transaction values(9,7,100,'2024-04-28','Deposit'),
(12,8,400,'2024-04-28','Withdrawal');
alter table transaction add foreign key(account_id) references accounts(account_id);
insert into transaction values(20,2,400,'2024-04-28','Deposit');


