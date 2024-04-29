use sisdb;
/*
1. Write an SQL query to insert a new student into the "Students" table with the following details: 
a. First Name: John 
www.hexaware.com 
© Hexaware Technologies Limited. All rights 
b. Last Name: Doe 
c. Date of Birth: 1995-08-15 
d. Email: john.doe@example.com 
e. Phone Number: 1234567890 
*/
insert into teacher values(1,'Ragini','Mehta','ragini@teacher.com');
/*
2. Write an SQL query to enroll a student in a course. Choose an existing student and course and 
insert a record into the "Enrollments" table with the enrollment date. 
*/
insert into courses values(1,'DBMS',20,1);
insert into enrollment values(1,'2024-04-28',1,1);
/*
3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and 
modify their email address. 
*/
update teacher set email='ragini123@teacher.com' where teacher_id=1;
/*
4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select 
an enrollment record based on the student and course
*/
delete from enrollment where enrollment_id=10;
/*
5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and 
teacher from the respective tables. 
*/
update courses set teacher_id=2 where course_id=9;
/*
6.Delete a specific student from the "Students" table and remove all their enrollment records 
from the "Enrollments" table. Be sure to maintain referential integrity. 
*/
delete from students where student_id=1;
/*
7.Update the payment amount for a specific payment record in the "Payments" table. Choose any 
payment record and modify the payment amount. 
*/
update payments set payment_amount=1000,payment_date='2024-02-09' where payment_id=1;
