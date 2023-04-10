--SQL HomeWork 2. Joins

--Підключиться до
--Host: 159.69.151.133
--Port: 5056
--DB: підключення до тієї таблиці, де робили DDL операції
--User: підключення до тих користувачів, яким робили DDL операції
--Pass: 123

--Якщо для якогось кейсу треба зробити додаткову таблицю, заповнити її даними, то робіть )


  --1. Вивести всіх працівників чиї зарплати є у базі, разом із зарплатами.
select salary.monthly_salary, employees.employee_name
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary
on salary.id = employee_salary.salary_id;

  --2. Вивести всіх працівників у яких ЗП менше ніж 2000.
select salary.monthly_salary, employees.employee_name
from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary
on salary.id = employee_salary.salary_id
where monthly_salary  < 2000;

  --3. Вивести всі зарплатні позиції, але працівника за ними не призначено. (ЗП є, але не зрозуміло, хто її отримує.)
--Варіант 1
select monthly_salary from salary 
where id not in (select salary_id from employee_salary);

--Варіант 2
select salary.monthly_salary, employee_salary.employee_id as employee
   from salary
      left join employee_salary 
         on salary.id = employee_salary.salary_id
            where employee_salary.employee_id is null;

  --4. Вивести всі зарплатні позиції менше 2000, але працівник за ними не призначений. (ЗП є, але не зрозуміло, хто її отримує.)
select monthly_salary from salary 
where monthly_salary < 2000 and
id not in (select salary_id from employee_salary);           
           
  --5. Знайти всіх працівників кому не нараховано ЗП.
select employee_name from employees
      where employees.id not in (select employee_id from employee_salary);

  --6. Вивести всіх працівників із назвами їх посади.
select employees.employee_name, roles.role_name 
  from employees
    join roles_employee
      on employees.id = roles_employee.employee_id
       join roles 
         on roles.id = roles_employee.role_id;
         
  --7. Вивести імена та посаду тільки Java розробників.
select employees.employee_name, roles.role_name 
  from employees
    join roles_employee
      on employees.id = roles_employee.employee_id
       join roles 
         on roles.id = roles_employee.role_id
           where roles.role_name like '%Java%';
          
  --8. Вивести імена та посаду тільки Python розробників.
select employees.employee_name, roles.role_name 
  from employees
    join roles_employee
      on employees.id = roles_employee.employee_id
       join roles 
         on roles.id = roles_employee.role_id
           where roles.role_name like '%Python%';
          
  --9. Вивести імена та посаду всіх QA інженерів.
select employees.employee_name, roles.role_name 
  from employees
    join roles_employee
      on employees.id = roles_employee.employee_id
       join roles 
         on roles.id = roles_employee.role_id
           where roles.role_name like '%QA%';
          
  --10. Вивести імена та посаду ручних QA інженерів.
select employees.employee_name, roles.role_name 
  from employees
    join roles_employee
      on employees.id = roles_employee.employee_id
       join roles 
         on roles.id = roles_employee.role_id
           where roles.role_name like '%Manual QA%';
          
  --11. Вивести імена та посаду автоматизаторів QA
select employees.employee_name, roles.role_name 
  from employees
    join roles_employee
      on employees.id = roles_employee.employee_id
       join roles 
         on roles.id = roles_employee.role_id
           where roles.role_name like '%Auto% QA%';
          
  --12. Вивести імена та зарплати Junior фахівців
select employees.employee_name, salary.monthly_salary, roles.role_name   
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
              where roles.role_name like '%Junior%';
             
          
  --13. Вивести імена та зарплати Middle фахівців
select employees.employee_name, salary.monthly_salary, roles.role_name   
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
              where roles.role_name like '%Middle%';
             
  --14. Вивести імена та зарплати Senior фахівців
select employees.employee_name, salary.monthly_salary, roles.role_name   
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
              where roles.role_name like '%Senior%';
             
             
--Вивести імена та фах працівників, яким назначена зарплата
select employees.employee_name, salary.monthly_salary, roles.role_name   
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id;
                 
  --15. Вивести зарплати Java розробників
select employees.employee_name, salary.monthly_salary, roles.role_name   
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
              where roles.role_name like '%Java %';
             
  --16. Вивести зарплати Python розробників
             select employees.employee_name, salary.monthly_salary, roles.role_name   
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
              where roles.role_name like '%Python%';
             
  --17. Вивести імена та зарплати Junior Python розробників
select employees.employee_name, salary.monthly_salary, roles.role_name   
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
              where roles.role_name like '%Junior Python%';
             
  --18. Вивести імена та зарплати Middle JS розробників 
select employees.employee_name, salary.monthly_salary, roles.role_name   
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
              where roles.role_name like '%Middle J%S%';
             
  --19. Вивести імена та зарплати Senior Java розробників
select employees.employee_name, salary.monthly_salary, roles.role_name   
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
              where roles.role_name like '%Senior Java %';
             
  --20. Вивести зарплати Junior QA інженерів
select employees.employee_name, salary.monthly_salary, roles.role_name   
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
              where roles.role_name like '%Junior % QA%';
             
  --21. Вивести середню зарплату всіх Junior фахівців
select avg (salary.monthly_salary)
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
              where roles.role_name like '%Junior%';  
             
  --22. Вивести суму зарплат JS розробників
select sum (salary.monthly_salary)
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
              where roles.role_name like '%J%S%'; 
         
  --23. Вивести мінімальну ЗП QA інженерів
select min (salary.monthly_salary)
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
              where roles.role_name like '%QA%'; 
             
  --24. Вивести максимальну ЗП QA інженерів
select max (salary.monthly_salary)
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
              where roles.role_name like '%QA%'; 
             
  --25. Вивести кількість QA інженерів
select count (roles.role_name)
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
              where roles.role_name like '%QA%'; 
             
  --26. Вивести кількість Middle спеціалістів.
select count (roles.role_name)
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
              where roles.role_name like '%Middle%';  
             
  --27. Вивести кількість розробників
select count (roles.role_name)
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
              where roles.role_name like '%dev%';   
             
  --28. Вивести фонд (суму) зарплати розробників.
select sum (salary.monthly_salary)
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id;   
             
  --29. Вивести імена, посади та ЗП усіх спеціалістів зі зростання
select employees.employee_name, salary.monthly_salary, roles.role_name   
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
                order by salary.monthly_salary;
                 
  --30. Вивести імена, посади та ЗП усіх фахівців за зростанням у фахівців у яких ЗП від 1700 до 2300
select employees.employee_name, salary.monthly_salary, roles.role_name   
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
                where salary.monthly_salary between 1700 and 2300
               order by salary.monthly_salary;
               
  --31. Вивести імена, посади та ЗП усіх фахівців за зростанням у фахівців у яких ЗП менше 2300
select employees.employee_name, salary.monthly_salary, roles.role_name   
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
                where salary.monthly_salary < 2300
               order by salary.monthly_salary;
              
  --32. Вивести імена, посади та ЗП усіх фахівців за зростанням у фахівців у яких ЗП дорівнює 1100, 1500, 2000
              select employees.employee_name, salary.monthly_salary, roles.role_name   
  from employees
    join employee_salary 
      on employees.id = employee_salary.employee_id
        join roles_employee 
          on employees.id = roles_employee.employee_id
            join salary
              on salary.id = employee_salary.salary_id
                join roles
                  on roles.id = roles_employee.role_id
                where salary.monthly_salary in (1100, 1500, 2000)
               order by salary.monthly_salary;