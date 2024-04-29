/*1. Create the database named "SISDB"--*/
create database sisdb;
/*2
Define the schema for the Students, Courses, Enrollments, Teacher, and Payments tables based 
on the provided schema. Write SQL scripts to create the mentioned tables with appropriate data 
types, constraints, and relationships. 
*/
use sisdb;
create table student(student_id int,firstname varchar(50),lastname varchar(50),dateofbirth date,email varchar(20),phone varchar(20),
primary key(student_id)
);
create table teacher(teacher_id int,first_name varchar(30),lastname varchar(30),email varchar(50),primary key(teacher_id));
create table courses(course_id int,course_name varchar(30),credits int,teacher_id int,primary key(course_id),foreign key(teacher_id)
 references teacher(teacher_id));
 create table enrollment(enrollment_id varchar(20),enrollment_date date,student_id int,course_id int ,primary key(enrollment_id),
 foreign key(student_id) references student(student_id),foreign key(course_id) references courses(course_id));
 create table payments(payment_id int,student_id int,payment_amount int,payment_date date
 ,primary key(payment_id),foreign key(student_id) references student(student_id));
 /*
 3. Insert at least 10 sample records into each of the following tables. 
i. 
ii. 
iii. 
Students  
Courses 
Enrollments  
iv. Teacher  
v. Payments
 */
insert into student values(1,'John','Doe','1995-08-05','doe@example.com',123456789),
(2,'Ram','Sharma','1995-07-02','ram@example.com',13245678),
(3,'Shivangi','Gupta','1994-08-05','gupta@example.com',234567891),
(4,'Manish','Malhota','1995-01-010','manish@example.com',345216789),
(5,'Sanjay','Singhania','1995-10-28','sanjay@example.com',421356789),
(6,'Rani','Mahajan','1995-02-21','rani@example.com',532146789),
(7,'Alia','Bhatt','1995-09-019','alia@example.com',654321789);
insert into teacher values(1,'Ragini','Mehta','ragini@teacher.com'),
(2,'Anjali','Sharma','anjali@teacher.com'),
(3,'Meenal','Mehta','meenal@teacher.com'),
(4,'Malax','Alex','malax@teacher.com'),
(5,'Kunal','Prajapat','kunal@teacher.com'),
(6,'Raj','Dikshit','raj@teacher.com'),
(7,'Sujal','Sharma','sujal@teacher.com');
insert into courses values(1,'DBMS',20,1),
(2,'Computer Network',20,1),
(3,'Accounts',20,2),
(4,'Operating System',30,3),
(5,'C',15,3),
(6,'Java',80,4),
(7,'Python',60,5),
(8,'Machine Learning',50,5),
(9,'Web Developement',20,4),
(10,'MERN',20,6),
(11,'Graphics',20,7),
(12,'Software Engineering',20,7);
insert into payments values(1,1,20000,'2024-04-12'),
(2,2,40000,'2024-04-10'),
(3,1,20000,'2023-04-12'),
(4,2,50000,'2023-04-10'),
(5,3,10000,'2024-03-12'),
(6,6,25000,'2024-04-02'),
(7,7,30000,'2024-02-12'),
(8,7,20000,'2023-04-12'),
(9,6,20000,'2023-03-12'),
(10,3,9000,'2023-05-12');
insert into enrollment values(1,'2024-04-28',1,1),
(2,'2024-04-28',2,1),
(3,'2024-04-24',3,2),
(4,'2024-04-28',3,7),
(5,'2024-04-21',4,5),
(6,'2024-04-28',5,5),
(7,'2024-04-28',5,12),
(8,'2024-04-18',6,10),
(9,'2024-03-28',6,9),
(10,'2024-04-18',7,7),
(11,'2024-04-08',5,3),
(12,'2024-04-28',1,6);




