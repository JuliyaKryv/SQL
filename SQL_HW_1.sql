-- 1)Створити таблицю employees
-- - id. serial,  primary key,
-- - employee_name. Varchar(50), not null

create table employees (
id serial primary key,
employee_name varchar(50) not null 
);

select * from employees;

-- 2) Наповнити таблицю 70 рядками
insert into employees(employee_name)
values ('emp1'),
	   ('emp2'),
	   ('emp3'),
	   ('emp4'),
	   ('emp5'),
	   ('emp6'),
	   ('emp7'),
	   ('emp8'),
	   ('emp9'),
	   ('emp10'),
	   ('emp11'),
	   ('emp12'),
	   ('emp13'),
	   ('emp14'),
	   ('emp15'),
	   ('emp16'),
	   ('emp17'),
	   ('emp18'),
	   ('emp19'),
	   ('emp20'),
	   ('emp21'),
	   ('emp22'),
	   ('emp23'),
	   ('emp24'),
	   ('emp25'),
	   ('emp26'),
	   ('emp27'),
	   ('emp28'),
	   ('emp29'),
	   ('emp30'),
	   ('emp31'),
	   ('emp32'),
	   ('emp33'),
	   ('emp34'),
	   ('emp35'),
	   ('emp36'),
	   ('emp37'),
	   ('emp38'),
	   ('emp39'),
	   ('emp40'),
	   ('emp41'),
	   ('emp42'),
	   ('emp43'),
	   ('emp44'),
	   ('emp45'),
	   ('emp46'),
	   ('emp47'),
	   ('emp48'),
	   ('emp49'),
	   ('emp50'),
	   ('emp51'),
	   ('emp52'),
	   ('emp53'),
	   ('emp54'),
	   ('emp55'),
	   ('emp56'),
	   ('emp57'),
	   ('emp58'),
	   ('emp59'),
	   ('emp60'),
	   ('emp61'),
	   ('emp62'),
	   ('emp63'),
	   ('emp64'),
	   ('emp65'),
	   ('emp66'),
	   ('emp67'),
	   ('emp68'),
	   ('emp69'),
	   ('emp70');

-- 3) Створити таблицю salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null
	  
create table salary (
id serial primary key,
monthly_salary int not null
);

select * from salary;

-- 4) Наповнити таблицю  salary 15 рядками

insert into salary (monthly_salary)
   values (1000),
          (1100),
          (1200),
          (1300),
          (1400),
          (1500),
          (1600),
          (1700),
          (1800),
          (1900),
          (2000),
          (2100),
          (2200),
          (2300),
          (2400),
          (2500);

-- 5) Створити таблицю employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null
         
create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

select * from salary;

-- 6) Наповнити таблицю employee_salary 40 рядками:
--- в 10 рядків із 40 вставити неіснуючі employee_id

insert into employee_salary (employee_id, salary_id)
   values (13,1),
          (2,2),
          (36,3),
          (84,4),
          (85,5),
          (69,6),
          (7,7),
          (68,8),
          (9,9),
          (50,10),
          (11,11),
          (12,12),
          (83,13),
          (14,14),
          (15,15),
          (86,16),
          (67,1),
          (88,2),
          (49,3),
          (20,4),
          (71,5),
          (82,6),
          (23,7),
          (24,8),
          (45,9),
          (26,10),
          (87,11),
          (28,12),
          (29,13),
          (30,14),
          (81,15),
          (32,16),
          (53,1),
          (34,2),
          (35,3),
          (63,4),
          (37,5),
          (38,6),
          (89,7),
          (80,8);
          
select * from employee_salary;

-- Скинути лічильник id-шників (якщо у новій табл він поч не з 1-ці) транзакцій 
--і встановити його з початку: з 1-ці

truncate table employee_salary restart identity cascade;

-- 7) Створити таблицю roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique

create table roles(
id serial primary key,
role_name int not null unique
);

select * from roles;

-- 8) Поміняти тип поля role_name з int на varchar(30)

alter table roles alter column role_name set data type varchar(30);

-- 9) Наповнити таблицю roles 20 рядками

insert into roles (role_name)
   values ('Junior Python developer'),
          ('Middle Python developer'),
          ('Senior Python developer'),
          ('Junior Java developer'),
          ('Middle Java developer'),
          ('Senior Java developer'),
          ('Junior JavaScript developer'),
          ('Middle JavaScript developer'),
          ('Senior JavaScript developer'),
          ('Junior Manual QA engineer'),
          ('Middle Manual QA engineer'),
          ('Senior Manual QA engineer'),
          ('Project Manager'),
          ('Designer'),
          ('HR'),
          ('CEO'),
          ('Sales manager'),
          ('Junior Automation QA engineer'),
          ('Middle Automation QA engineer'),
          ('Senior Automation QA engineer');


-- 10) Створити таблицю roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- - role_id. Int, not null (внешний ключ для таблицы roles, поле id)
         
create table roles_employee (
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
	references employees (id),
foreign key (role_id)
	references roles (id)
);

select * from roles_employee;

-- Наповнити таблицю roles_employee 40 рядками

insert into roles_employee (employee_id, role_id)
	values (1,5),
	       (2,8),
	       (18,15),
	       (66,3),
	       (16,11),
	       (25,9),
	       (31,2),
	       (27,19),
	       (60,20),
	       (24,8),
	       (41,5),
	       (23,7),
	       (69,1),
	       (29,4),
	       (67,5),
	       (52,7),
	       (61,7),
	       (42,17),
	       (53,15),
	       (58,16),
	       (17,13),
	       (62,11),
	       (57,5),
	       (4,8),
	       (11,6),
	       (5,4),
	       (51,4),
	       (32,3),
	       (33,13),
	       (8,17),
	       (20,5),
	       (40,18),
	       (68,10),
	       (9,20),
	       (64,9),
	       (22,8),
	       (19,7),
	       (28,6),
           (15,4),
	       (43,1);
	      
-- Скинути лічильник id-шників (якщо у новій табл він поч не з 1-ці) транзакцій 
--і встановити його з початку: з 1-ці

truncate table roles_employee restart identity cascade;


-- public.students definition

-- копіювання таблиці з іншої БД;

CREATE TABLE public.students (
	id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	"password" varchar(50) NOT NULL,
	created_on timestamp NOT NULL,
	CONSTRAINT students_email_key UNIQUE (email),
	CONSTRAINT students_pkey PRIMARY KEY (id)
);

-- Знаходила помилку в id які не входили у межі 1-70 (for HW2 task1,2)
select * from employee_salary where employee_id not between 1 and 70;

select * from employee_salary where employee_id between 1 and 70;

-- Виправити помилку в id- 71 який не входить у межі 1-70
update employee_salary set employee_id = 33 where employee_id = 71;

-- (for HW2 task 3)
insert into salary (monthly_salary)
   values (900),
          (1555);
         
insert into salary (monthly_salary)
   values (3000);
          
select * from salary;