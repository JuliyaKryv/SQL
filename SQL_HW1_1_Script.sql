-- SQL_HW_1.1

--Створити .sql файл у якому під кожною командою напишіть sql запит, який виконає команду.

--1. Вивести всі поля та всі рядки.
select * from students;

--2. Вивести всіх студентів у таблиці
select * from students;

--3. Вивести лише Id користувачів
select id from students;

--4. Вивести лише ім'я користувачів
select name from students;

--5. Вивести тільки email користувачів
select email from students;

--6. Вивести ім'я та email користувачів
select name, email from students;

--7. Вивести id, ім'я, email та дату створення користувачів
select id, name, email, created_on from students;

--8. Вивести користувачів де password 12333
select * from students where password = '12333';

--9. Вивести користувачів які були створені 2021-03-26 00:00:00
select * from students where created_on = '2021-03-26 00:00:00';

--10. Вивести користувачів де в імені є слово Анна
select * from students where name like '%Anna%';

--11. Вивести користувачів де в імені наприкінці є 8
select * from students where name like '%8';

--12. Вивести користувачів де в імені є літера а
select * from students where name like '%a%';

--13. Вивести користувачів які були створені 2021-07-12 00:00:00
select * from students where created_on = '2021-07-12 00:00:00';

--14. Вивести користувачів які були створені 2021-07-12 00:00:00 та мають пароль 1m313
select * from students where created_on = '2021-07-12 00:00:00' and password = '1m313';

--15. Вивести користувачів які були створені 2021-07-12 00:00:00 та у яких в імені є слово Andrey
select * from students where created_on = '2021-07-12 00:00:00' and name like '%Andrey%';

--16. Вивести користувачів які були створені 2021-07-12 00:00:00 та у яких в імені є цифра 8
select * from students where created_on = '2021-07-12 00:00:00' and name like '%8%';

--17. Вивести користувача у яких id дорівнює 110
select * from students where id = 110;

--18. Вивести користувача у яких id дорівнює 153
select * from students where id = 153;

--19. Вивести користувача у яких id більше 140
select * from students where id > 140;

--20. Вивести користувача у яких id менше 130
select * from students where id < 130;

--21. Вивести користувача у яких id менше 127 або більше 188
select * from students where id < 127 or id > 188;

--22. Вивести користувача у яких id менше або одно 137
select * from students where id <= 137;

--23. Вивести користувача у яких id більше або одно 137
select * from students where id >= 137;

--24. Вивести користувача у яких id більше 180 але менше 190
select * from students where id > 180 and id < 190;

--25. Вивести користувача у яких id між 180 та 190
select * from students where id between 180 and 190;

--26. Вивести користувачів де password дорівнює 12333, 1m313, 123313
--(Оператор IN є скороченням кількох OR умов.)
select * from students where password in ('12333', '1m313', '123313');

--27. Вивести користувачів де created_on дорівнює 2020-10-03 00:00:00, 2021-05-19 00:00:00, 2021-03-26 00:00:00
select * from students where created_on in ('2020-10-03 00:00:00', '2021-05-19 00:00:00', '2021-03-26 00:00:00');

--28. Вивести мінімальний id
select min(id) from students;

--29. Вивести максимальний.
select max(id) from students;

--30. Вивести кількість користувачів
select count(id) from students;
select count(*) from students;

--31. Вивести ID користувача, ім'я, дату створення користувача. Сортувати за порядком зростання дати додавання користувача.
select id, name, created_on from students order by created_on;
select id, name, created_on from students order by created_on asc;

--32. Вивести ID користувача, ім'я, дату створення користувача. Відсортувати по порядку зменшення дати додавання користувача.
select id, name, created_on from students order by created_on desc; 