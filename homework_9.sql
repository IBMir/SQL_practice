-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

START TRANSACTION;
insert into sample.users (name, birthday_at)
(select name, birthday_at from shop.users
where id = 1);
COMMIT;

-- Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.

drop view if exists name_prod_cat;
create view name_prod_cat as 
select products.name 'Товарная позиция', catalogs.name 'Каталог' from products 
join catalogs on catalogs.id = products.catalog_id;
select * from name_prod_cat;

-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

drop function if exists hello;

delimiter ||

create function hello(name varchar(20))
returns varchar(50) deterministic
begin
	case name
		when CURTIME() >= '06:00:00' and CURTIME() < '12:00:00' then
			return concat('Доброе утро, ', name, '!');
		when curtime() >= '12:00:00' and CURTIME() < '18:00:00' then
			return concat('Добрый день, ', name, '!');
		when curtime() >= '18:00:00' and CURTIME() < '00:00:00' then
			return concat('Добрый вечер, ', name, '!');
		else
			return concat('Доброй ночи', name, '!');
	end case;
end ||

delimiter ;

select hello('Имя')


-- по желанию) Пусть имеется таблица с календарным полем created_at. В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', 
-- '2016-08-04', '2018-08-16' и 2018-08-17. Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1,  
-- если дата присутствует в исходном таблице и 0, если она отсутствует.

drop procedure if exists date_august;

delimiter ||

create procedure date_august()
begin
	drop table if exists august;
	create table august(dates date, bull bit default 0);
	begin
		declare i int default 0;
		while i < 31 do
			insert into august (dates) values (date_add('2018-08-01', interval i day));
			set i = i + 1;
		end while;
	end;
end ||

delimiter ;

call date_august();

select * from august;

