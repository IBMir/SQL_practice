use draft;


-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

select distinct u.id, name 
FROM users u inner join orders o 
on u.id = o.user_id;

-- Выведите список товаров products и разделов catalogs, который соответствует товару.

select p.name as 'Товар', c.name as 'Раздел каталога'
from products p inner join catalogs c
on p.catalog_id = c.id;

-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label 
-- содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.

select id,
(select name from cities where cities.label = flights.`from`) as 'Вылет из',
(select name from cities where cities.label = flights.`to`) as 'Прилет в'
from flights