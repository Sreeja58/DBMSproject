create table login(login_id varchar(30) NOT NULL, login_password varchar(30) NOT NULL, primary key(login_id));
					  
create table admin(admin_id varchar(30) NOT NULL, admin_name varchar(30) NOT NULL, login_id varchar(30) NOT NULL, primary key(admin_id), 
				   foreign key (login_id) references login(login_id));
				   

create table branch( branch_name varchar(30) NOT NULL, branch_fees int , primary key (branch_name),
constraint fees_check check (branch_fees>=1000));



create table student(stu_id varchar(30) NOT NULL, stu_fname varchar(50) NOT NULL, stu_lname varchar(50),father_name varchar(30)NOT NULL,
father_occupation varchar(30) NOT NULL, tenth_marks int NOT NULL, tweleth_marks int NOT NULL, stu_nationality varchar(30)
NOT NULL, stu_gender varchar(1) not null, stu_city varchar(30) NOT NULL, stu_dob date NOT NULL, admin_id varchar(30) NOT NULL,branch_name varchar(50), primary key (stu_id), foreign key(admin_id) references admin(admin_id),
foreign key(branch_name) references branch(branch_name), constraint reasonable_date check (stu_dob <= '2003-12-31'),
constraint tenth_check check (tenth_marks <= 600 and tenth_marks >= 0),constraint twelve_check check (tweleth_marks <= 1000 and tweleth_marks >= 0));

create table admission(admission_id varchar(30) NOT NULL, admission_type varchar(30) NOT NULL, admission_date date NOT NULL, 
					    stu_id varchar(30) NOT NULL, primary key(admission_id), foreign key(stu_id) references student(stu_id));


create table student_phone(sn1 varchar(25) NOT NULL, stu_id varchar(30) NOT NULL, phone bigint NOT NULL, primary key(sn1), 
						   foreign key(stu_id) references student(stu_id), constraint phone_check check (phone > 999999999 and phone <=9999999999));


create table student_email(sn2 varchar(25) NOT NULL, stu_id varchar(30) NOT NULL, email varchar(30) NOT NULL, primary key(sn2), 
						   foreign key(stu_id) references student(stu_id));
						   

create table admin_phone(sn3 varchar(25) NOT NULL, admin_id varchar(30) NOT NULL, phone bigint NOT NULL, primary key(sn3), 
						   foreign key(admin_id) references admin(admin_id), constraint phone_check check (phone > 999999999 and phone <=9999999999));


create table admin_email(sn4 varchar(25) NOT NULL, admin_id varchar(30) NOT NULL, email varchar(30) NOT NULL, primary key(sn4), 
						   foreign key(admin_id) references admin(admin_id));
						   


insert into login values('l01','l@123'),('l02','l@234'),('l03','l@345'),('l04','l@456'),('l05','l@567'),('l06','l@678'),('l07','l@789');

insert into admin values ('A01','Akshya','l01'),('A02','Balu','l02'),('A03','celvin','l03'),('A04','Deepika','l04'),('A05','Eswari','l05'),
                         ('A06','Fizal','l06'),('A07','Ganggoli','l07');
						 
insert into branch values('CSE',200000),('EEE',150000),('MEE',200000),('ECE',300000),('BBA',50000),('BCA',65000),
						  ('CIVIL',80000),('MBBS',900000),('AI',400000);
						 
insert into student values('s123','Helena'    ,'singh' ,'Akshya singh'   ,'Bussiness'    ,450 ,750 ,'India' ,'F' ,'Haryana'   ,'12-12-2002' ,'A01' ,'CSE'),
						   ('s234','Ismael'   ,'Ahmed' ,'Imran Ahmed'    ,'Employee'     ,475 ,775 ,'India' ,'M' ,'Guntur'    ,'01-02-2003' ,'A03' ,'MEE'),
						   ('s345','Jagapathi','Rajput','Shyam Rajput'   ,'bank employee',460 ,750 ,'India' ,'M' ,'Jaipur'    ,'03-04-2002' ,'A04' ,'AI'),
						   ('s456','Kamala'   ,'Vemuri','Srinivas'       ,'Bussiness'    ,525 ,850 ,'India' ,'F' ,'Vijayawada','05-09-2003' ,'A03' ,'CSE'),
						   ('s567','Layla'    ,'pedru' ,'peter pedru'    ,'Employee'     ,550 ,875 ,'India' ,'F' ,'Goa'       ,'04-04-2002' ,'A06' ,'ECE'),
						   ('s678','Mounika'  ,'Annad' ,'Preetham Annand','Govt.Employee',550 ,900 ,'India' ,'F' ,'Kollam'    ,'06-06-2003' ,'A01' ,'EEE'),
						   ('s789','Nani'     ,'Agrawal','Vijay'         ,'Govt.Employee',500 ,875 ,'India ','M' ,'Delhi'     ,'08-02-2003' ,'A02' ,'ECE');

						   
insert into admission values('a987','Merit','12-08-2021','s123'),     ('a876','Management','1-08-2021','s234'),
							 ('a765','Managemnt','07-30-2021','s345'),('a654','Merit','07-31-2021','s456'),
							 ('a543','Management','05-08-2021','s567'),('a432','Merit','08-15-2021','s678'),
							 ('a321','Management','08-21-2021','s789'),('a412','Management','08-15-2021','s678');



insert into admin_email values('AE1','A01','Akshya@gmail.com'),('AE2','A02','Balu@gmail.com'),('AE3','A03','celvin@gmail.com'),
							   ('AE4','A04','Deepika@gmail.com'),('AE5','A05','Eswari@gmail.com'),('AE6','A06','Fizal@gmail.com'),
							   ('AE7','A07','Ganggoli@gmail.com');
							   
insert into admin_phone values('AP100','A01' ,9876543210),('AP101','A02',8765432109),(102,'A03',7654321098),
							   ('AP103','A04',6543210987),('AP104','A05',6543217890),(105,'A06',7654321890),
							   ('AP106','A07',8765432190);
insert into admin_phone values('AP107','A04',6589324785),('AP108','A07',7854658932),('AP109','A02',8325695812);

							   
							   
							   
insert into student_email values ('SE1010','s123','Helena@gmail.com')  ,('SE1011','s234','Ismael89@gmail.com'),
								 ('SE1012','s345','Jagapathi@gmai.com'),('SE1013','s456','kamala67@gmail.com'),
								 ('SE1014','s567','Layla34@gmail.com') ,('SE1015','s678','Mounika56@gmail.com'),
								 ('SE1016','s789','Nani78@gmail.com')  , ('SE1017','s123','Hell@gmail.com'),
								 ('SE1018','s567','Jaggu@gmail.com')   ,('SE1019','s234','Khan@gmail.com');
								 
insert into student_phone values ('SP1000','s123',6789054321),('SP1001','s234',7890654312),('SP1002','s345',8907123456),
								 ('SP1003','s456',9870654321),('SP1004','s567',9087653421),('SP1005','s678',8097654321),
								 ('SP1006','s789',7890654312),('SP1007','s456',8756982548),('SP1008','s234',7778589657),
								 ('SP1009','s345',8523961740);




						   
						   
						   
						   
						   
select * from student;
select * from admission;
select * from admin;
select * from branch;
select * from login;
select * from student_phone;
select * from student_email;
select * from admin_phone;
select * from admin_email;



		
drop table student_phone;
drop table student_email;
drop table admin_phone;
drop table admin_email;
drop table admission;
drop table student;
drop table branch;
drop table admin;
drop table login;

-----1-----
SELECT count(stu_fname),stu_city FROM student GROUP BY stu_city;
select count(branch_name) from branch ;
-----2-----
select  stu_fname,stu_lname from student order by tweleth_marks;
select stu_fname,stu_lname,tweleth_marks from student order by tweleth_marks;
select  stu_fname,stu_lname,stu_dob from student order by stu_dob;
-----3-----
select student.stu_id,admission.admission_id,admission.admission_date from admission inner join student on admission.stu_id = student.stu_id;
select student.stu_id,admission.admission_id,admission.admission_date from admission full outer join student on admission.stu_id = student.stu_id;
-----4-----
select stu_fname,stu_lname,tenth_marks,tweleth_marks from student  where tenth_marks >= 520 and tweleth_marks >=850;
select stu_fname,stu_lname,father_name,stu_city,stu_gender from student where stu_city='Haryana' or stu_gender='M';
-----5------
select (select count(*) from student where branch_name='CSE')+(select count(*) from student where branch_name='ECE');
select (select branch_fees from branch where branch_name='CSE')+(select branch_fees from branch where branch_name='ECE');
-----6------
select admin_id,admin_name from admin where admin_name like 'A%' or admin_name like 'E%';
select stu_id,stu_fname,stu_lname from student where stu_fname like 'H%' or stu_fname like 'J%';
-----7------
select to_char(stu_dob,'month') as month , extract(year from stu_dob) as year from student;
select to_char(admission_date,'month') as month , extract(year from admission_date) as year from admission;


select extract(month from stu_dob)as month from student;
select to_char(admission_date,'month') as month from admission;

------8------
select stu_id,stu_fname,stu_lname,stu_dob from student where stu_dob between '2002-01-01' and '2002-12-31'; 
select stu_id,stu_fname,stu_lname,stu_dob from student where stu_dob not between '2002-01-01' and '2002-12-31'; 
select stu_id,stu_fname,branch_name from student where branch_name in ('CSE','AI','MEE');
select stu_id,stu_fname,branch_name from student where branch_name not in ('CSE','AI','MEE');

-------9--------

select stu_fname from student  where stu_fname like 'J%' union select stu_fname from student where stu_fname like 'K%';
select admin_name from admin where admin_name like 'B%' except select admin_name from admin where admin_name like 'F%l';
select father_name from student where father_name like 'A%' intersect select father_name from student where father_name like 'A%';




--------10--------
SELECT stu_id
FROM admission
WHERE admission_id = ANY
  (SELECT admission_id
  FROM admission
  WHERE admission_id='a987');
  
  SELECT stu_id
FROM admission
WHERE admission_id = ALL
  (SELECT admission_id
  FROM admission
  WHERE admission_id='a876');
  

SELECT stu_fname,stu_lname
FROM student
WHERE EXISTS (SELECT admin_name FROM admin WHERE admin.admin_id = student.admin_id AND tenth_marks < 500);


SELECT stu_fname,stu_lname
FROM student
WHERE not EXISTS (SELECT admin_name FROM admin WHERE admin.admin_id = student.admin_id AND tenth_marks < 500);






create table admissions_report(login_id varchar(30) NOT NULL, login_password varchar(30)NOT NULL,
admin_id varchar(30) NOT NULL,admin_name varchar(30) NOT NULL,
branch_name varchar(30) NOT NULL, branch_fee int NOT NULL,
stu_id varchar(30) NOT NULL,stu_fname varchar(50) NOT NULL,
tenth_marks int NOT NULL, tweleth_marks int NOT NULL,stu_dob date NOT NULL,
father_name varchar(30) NOT NULL, admission_id varchar(30) NOT NULL,
admission_type varchar(30) NOT NULL, admission_date date NOT NULL,
primary key(login_id,admin_id,branch_name,stu_id,admission_id));



insert into admissions_report values('l01','l@123','A01','Akshya','CSE',200000,'s123','Helena',450 ,750 ,'12-12-2002',
'Akshya singh','a987','Merit','12-08-2021'),
('l02','l@234','A02','Balu','EEE',150000,'s234','Ismael' ,475 ,775,'01-02-2003',
'Imran Ahmed','a987','Merit','12-08-2021'),
('l03','l@345','A03','celvin','MEE',200000,'s345','Jagapathi',460 ,750 ,'03-04-2002',
'Shyam Rajput','a543','Management','05-08-2021');

select * from admissions_report;

