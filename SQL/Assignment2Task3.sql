use sisdb;
/*
1. Write an SQL query to calculate the total payments made by a specific student. You will need to 
join the "Payments" table with the "Students" table based on the student's ID. 
*/
select sum(payment_amount) as totalPaymeny,student_id from payments group by student_id;
select student.firstname,student.lastname,student.student_id, t.totalPayment from student natural join (select sum(payment_amount) as totalPayment,student_id from payments group by student_id
)
as t;
/*
2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each 
course. Use a JOIN operation between the "Courses" table and the "Enrollments" table. 
*/
select * from enrollment;
select courses.course_name,t.studentEnrolled from courses natural join (select count(*)as studentEnrolled,course_id from enrollment group by course_id
) as t;
/*
3. Write an SQL query to find the names of students who have not enrolled in any course. Use a 
LEFT JOIN between the "Students" table and the "Enrollments" table to identify students 
without enrollments.
*/

select student.student_id,student.firstname,student.lastname from student left join (select distinct student_id from enrollment) as t 
on student.student_id=t.student_id where student.student_id not in(select distinct student_id from enrollment);
/*
4. Write an SQL query to retrieve the first name, last name of students, and the names of the 
courses they are enrolled in. Use JOIN operations between the "Students" table and the 
"Enrollments" and "Courses" tables.
*/
select enrollment.student_id as student_id,courses.course_name as course_name from enrollment natural join courses;
select student.firstname,student.lastname,stu.course_name from student natural join (select enrollment.student_id as student_id,courses.course_name as course_name from enrollment natural join courses) as stu;
/*
5. Create a query to list the names of teachers and the courses they are assigned to. Join the 
"Teacher" table with the "Courses" table. 
*/

select courses.course_name,concat(teacher.first_name,' ',teacher.lastname) as TeacherName from courses natural join teacher;
/*
6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the 
"Students" table with the "Enrollments" and "Courses" tables.
*/

select enrollment.enrollment_date,enrollment.student_id,enrollment.course_id,courses.course_name from enrollment natural join courses;
/*
7. Find the names of students who have not made any payments. Use a LEFT JOIN between the 
"Students" table and the "Payments" table and filter for students with NULL payment records.
*/
select * from student left join payments on student.student_id=payments.student_id where payments.payment_amount is null;
select * from student where student_id not in (select distinct student_id from payments);
/*
8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN 
between the "Courses" table and the "Enrollments" table and filter for courses with NULL 
enrollment records.
*/
select courses.course_name from courses left join enrollment on courses.course_id=enrollment.course_id where enrollment.course_id is null;
select course_name from courses where course_id not in (select distinct course_id from enrollment);
/*
9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" 
table to find students with multiple enrollment records.
*/
select * from enrollment;
select student_id from enrollment group by student_id having count(*)>1;
select student.student_id,student.firstname,student.lastname from student inner join (select student_id from enrollment group by student_id having count(*)>1)
as t on student.student_id=t.student_id;
/*
10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" 
table and the "Courses" table and filter for teachers with NULL course assignments.
*/
select * from courses;
insert into teacher values(8,'Sukanya','Mehta','sk123@teacher.com');
select * from teacher left join courses on teacher.teacher_id=courses.teacher_id where courses.course_id is null group by courses.teacher_id ;
