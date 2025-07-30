create table department(
dept_id int primary key ,
dept_name varchar(100) not null );

create table courses(
course_id int primary key,
course_name varchar(100) not null ,
dept_id int , 
foreign key (dept_id) references department(dept_id));

insert into department (dept_id,dept_name) values
(1, 'Computer Science'),
(2, 'Mechanical Engineering'),
(3, 'Electrical Engineering'),
(4, 'Mathematics'),
(5, 'Physics');

insert into courses ( course_id , course_name , dept_id) values
(101, 'Data Structures', 1),
(102, 'Algorithms', 1),
(103, 'Operating Systems', 1),
(104, 'Thermodynamics', 2),
(105, 'Fluid Mechanics', 2),
(106, 'Circuits', 3),
(107, 'Signals and Systems', 3),
(108, 'Linear Algebra', 4),
(109, 'Quantum Mechanics', 5),
(110, 'Classical Mechanics', 5),
(111, 'Compiler Design', 1); 

select dept_name
from department
where dept_id in(
select dept_id 
from courses
group by dept_id
having count(*)>1);

