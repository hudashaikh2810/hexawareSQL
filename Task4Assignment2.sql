use sisdb;
/*
1. Write an SQL query to calculate the average number of students enrolled in each course. Use 
aggregate functions and subqueries to achieve this.
*/

/*
2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum 
payment amount and then retrieve the student(s) associated with that amount.
*/
select * from student where student_id=(select student_id from payments having max(payment_amount));
/*
3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the 
course(s) with the maximum enrollment count. 
*/
select count(*)as enrolled,course_id from enrollment group by course_id;
select t.course_id as id from (select count(*)as enrolled,course_id from enrollment group by course_id) as t having max(t.enrolled);
select course_name from courses where course_id=(select t.course_id as id from (select count(*)as enrolled,course_id from enrollment group by course_id) as t having max(t.enrolled));
/*
4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum 
payments for each teacher's courses. 
*/
/*
5. Identify students who are enrolled in all available courses. Use subqueries to compare a 
student's enrollments with the total number of courses. 
*/
select count(*) from courses;
select count(*),course_id from enrollment group by course_id having count(*)=(select count(*) from courses);
/*
6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to 
find teachers with no course assignments. 
*/
select * from courses;
select * from teacher;
select * from teacher where teacher_id not in (select teacher_id from courses);
/*
7. Calculate the average age of all students. Use subqueries to calculate the age of each student 
based on their date of birth. 
*/
select firstname,lastname,timestampdiff(year,dateofbirth,curdate()) as age from student;
select avg(t.age) from (select firstname,lastname,timestampdiff(year,dateofbirth,curdate()) as age from student) as t;
/*
8. Identify courses with no enrollments. Use subqueries to find courses without enrollment 
records. 
*/

select * from courses where course_id not in (select course_id from enrollment);
/*
9. Calculate the total payments made by each student for each course they are enrolled in. Use 
subqueries and aggregate functions to sum payments.
*/
/*
11. Write an SQL query to calculate the total payments made by each student. Join the "Students" 
table with the "Payments" table and use GROUP BY to calculate the sum of payments for each 
student. 
*/
select sum(payment_amount) as payment,student_id from payments group by student_id;
select student.student_id,student.firstname,student.lastname,t.payment from student natural join (select sum(payment_amount) as payment,student_id from payments group by student_id) as t;
/*
12. Retrieve a list of course names along with the count of students enrolled in each course. Use 
JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to 
count enrollments. 
*/
select course_id,count(*)as studentEnrolled from enrollment group by course_id;
select courses.course_name,t.studentEnrolled from courses natural join (select course_id,count(*)as studentEnrolled from enrollment group by course_id) as t;
/*
13. Calculate the average payment amount made by students. Use JOIN operations between the 
"Students" table and the "Payments" table and GROUP BY to calculate the average.
*/
select avg(payment_amount) as AvgPayments,student_id from payments group by student_id;
select t.AvgPayments,student.firstname,student.lastname from student natural join (select avg(payment_amount) as AvgPayments,student_id from payments group by student_id) as t;
/*
10. Identify students who have made more than one payment. Use subqueries and aggregate 
functions to count payments per student and filter for those with counts greater than one.
*/
select student_id from payments group by student_id having count(*)>1;
select * from student where student_id in (select student_id from payments group by student_id having count(*)>1);