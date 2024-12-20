create table Department(
department_id int ,
department_name varchar(50),
primary key(department_id)
);
create table Employees(
employee_id int not null,
first_name varchar(50),
last_name varchar(50),
department_id int not null,
hire_date date,
primary key(employee_id,department_id),
foreign key(department_id) references Department(department_id)
);
create table Salaries(
salary_id int,
employee_id int,
salary int,
start_date date,
end_date date,
primary key(salary_id,employee_id),
foreign key(employee_id) references Employees (employee_id) on delete cascade
);
insert into Department (department_id,department_name)values(1,'Software Development Department');
insert into Department (department_id,department_name)values(2,'IT Infrastructure and Operations');
insert into Department (department_id,department_name)values(3,'Cybersecurity and Compliance');
insert into Department (department_id,department_name)values(4,'Data Science and Analytics');
insert into Department (department_id,department_name)values(5,'Cloud Computing and DevOps');
insert into Department (department_id,department_name)values(6,'Quality Assurance (QA) and Testing');
insert into Department (department_id,department_name)values(7,'Product Management');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(1,'ahmad','nazzal',2,'2020-12-1');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(2,'khalid','nizar',1,'2002-11-3');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(3,'asma','abdalkareem',2,'2009-5-6');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(4,'rana','nazzal',3,'2011-3-5');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(5,'fehmi','alqasem',5,'2022-2-22');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(6,'ramzi','seafan',7,'2011-11-11');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(7,'samah','alramahni',5,'2001-1-1');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(8,'alaa','mohammed',4,'2020-11-1');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(9,'salma','khalid',2,'2007-6-1');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(10,'ahmad','alselawi',5,'2022-1-1');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(11,'asma','jamal',3,'2021-12-1');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(12,'yahya','ahmad',5,'2020-1-23');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(13,'faisal','ghatashi',2,'2020-12-2');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(14,'hamza','alkafaween',5,'2024-5-3');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(15,'mohammed','omar',1,'2020-10-1');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(16,'hazem','hassen',1,'2019-11-25');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(17,'malik','ghssan',5,'2019-5-3');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(18,'ali','nazzal',4,'2013-3-3');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(19,'sami','soliman',2,'2000-1-1');
insert into Employees (employee_id,first_name,last_name,department_id,hire_date) values(20,'amani','mohammed',5,'2024-12-21');

insert into Salaries(salary_id,employee_id,salary,start_date,end_date) values(1,1,7000,'2020-12-1','2030-12-1');
insert into Salaries(salary_id,employee_id,salary,start_date,end_date) values(2,2,450,'2002-11-3','2020-11-1');
insert into Salaries(salary_id,employee_id,salary,start_date,end_date) values(3,3,9000,'2009-5-6','2021-10-1');
insert into Salaries(salary_id,employee_id,salary,start_date,end_date) values(4,4,1251,'2011-5-3','2024-12-1');
insert into Salaries(salary_id,employee_id,salary,start_date,end_date) values(5,5,6000,'2022-2-22','2030-9-1');
insert into Salaries(salary_id,employee_id,salary,start_date,end_date) values(6,6,1812,'2011-11-11','2026-7-6');
insert into Salaries(salary_id,employee_id,salary,start_date,end_date) values(7,7,1911,'2001-1-1','2010-8-23');


select first_name,last_name,hire_date,department_name from Employees e inner join Department d on e.department_id=d.department_id;
select d.* , e.* from Department d left join Employees e on d.department_id=e.department_id ;
select d.department_id,count(e.employee_id) from Department d left join Employees e on d.department_id=e.department_id  group by(department_id) having count(employee_id)>1;
select department_id, avg(salary) as AvgSalary from Employees e join  Salaries s on e.employee_id=s.employee_id group by(department_id) having(avg(salary)>1000);
select department_id, count(e.employee_id) as EmployeeCount from Employees e   join  Salaries s on e.employee_id=s.employee_id where(salary >5000)  group by(department_id) having(count(e.employee_id)>1);
select max(salary) from Salaries