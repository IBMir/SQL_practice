-- 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

use vk;

INSERT INTO users (created_at, updated_at)
values (now(), now());

-- 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались 
-- значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

update users set
created_at = STR_TO_DATE(created_at, '%e.%c.%Y %H:%i'),
updated_at = STR_TO_DATE(updated_at, '%e.%c.%Y %H:%i');

-- 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, 
-- если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
-- Однако, нулевые запасы должны выводиться в конце, после всех записей.

select * from storehouses_products
order by if(value > 0, false, true), value;

-- 4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august')

select * from users
where `month` in  ('may', 'august');

-- 1. Подсчитайте средний возраст пользователей в таблице users. (У нас учебная таблица с датой рождения profiles  в базе vk)

select round(avg(year(current_date) - year(birthday)) - (right(birthday, 5)>right(current_date, 5))) as V
from profiles;

-- 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.

select DAYNAME(date_format(birthday, '2022-%m-%d')) as День_недели, count(DAYNAME(birthday)) as Количество from profiles
group by День_недели
order by Количество desc;

-- 3. (по желанию) Подсчитайте произведение чисел в столбце таблицы

select exp(sum(ln(value))) from storehouses_products;

