create table emp(
emp_id int primary key,
emp_name varchar(20) not null,
department varchar(50) not null,
manager_id int null);

select * from emp;

alter table emp
add constraint fk_manager foreign key(manager_id) references emp(emp_id);

insert into emp ( emp_id , emp_name , department , manager_id)
values
(1, 'Alice', 'HR', NULL),       
(2, 'Bob', 'Finance', 1),
(3, 'Charlie', 'IT', 1),
(4, 'David', 'Finance', 2),
(5, 'Eve', 'IT', 3),
(6, 'Frank', 'HR', 1);

select 
e.emp_name as [EmployeeNmae],
e.department as [EmployeeDept],
m.emp_name as [Manager Name],
m.department as [ManagerDept]
from emp as E
join emp as M
on e.manager_id = m.emp_id

