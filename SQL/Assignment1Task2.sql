use techshop;
insert into customer values('1','Huda','Shaikh','shaikhhuda2810@gmail.com','123456789','Indore'),
('2','Ram','Narayan','ramnarayan19@gmail.com','1456789','Chaennai'),
('3','Harish','Chandra','harishchandra@gmail.com','21084248','Mumbai'),
('4','Balaji','Sharma','balaji1234@gmail.com','123409','Delhi'),
('5','Samya','Gupta','samyagupta@gmail.com','7000237920','Indore');
insert into customer values('6','Radha','Krishna','krishna2810@gmail.com','123456789','Indore'),
('7','Chandra','Narayan','chandrnarayan890@gmail.com','14567589','Chaennai'),
('8','Harishita','Chandra','harishitachandra12@gmail.com','210890248','Mumbai'),
('9','Bala','Swami','sbala124@gmail.com','1234089','Delhi'),
('10','Somya','Gupta','guptasomya@gmail.com','70037920','Indore');
select * from customer order by customerId;
insert into products values(1,'Pencil','Apsara Pencil',20),
(2,'Pen','Trimax',50),
(3,'Scale','Doms',15),
(4,'Pen','Parker',90),
(5,'Pencil','Doms',2),
(6,'Notebook','Classmate',20),
(7,'Notebook','ABC',15),
(8,'Color Pens','Doms',100),
(9,'Notebook','Camel',120),
(10,'Water Color','Camel',70);
insert into orders values(1,2,'2024-04-25',200,'Pending'),
(2,7,'2024-04-25',123,'Pending'),
(3,9,'2024-04-21',800,'Pending'),
(4,10,'2024-03-24',70,'Pending'),
(5,5,'2024-04-15',120,'Pending'),
(6,1,'2024-04-15',80,'Pending'),
(7,3,'2024-04-1',80,'Pending'),
(8,4,'2024-04-22',190,'Pending'),
(9,8,'2024-04-23',80,'Pending'),
(10,6,'2024-04-19',120,'Pending');
insert into orderDetails values(1,10,1,1),
(2,1,10,2),
(3,9,9,3),
(4,2,8,4),
(5,3,7,5),
(6,4,6,6),
(7,5,5,7),
(8,6,4,8),
(9,7,2,9),
(10,6,3,1);
insert into inventory values(1,1,10,'2024-04-25'),
(2,2,12,'2024-04-25'),
(3,3,15,'2024-04-24'),
(4,4,16,'2024-04-23'),
(5,5,125,'2024-04-23'),
(6,6,16,'2024-04-22'),
(7,7,12,'2024-04-22'),
(8,8,16,'2024-04-21'),
(9,9,18,'2024-04-21'),
(10,10,14,'2024-04-23');





