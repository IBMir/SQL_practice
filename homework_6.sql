-- Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

-- У меня таблица vk немного видоизменена, поэтоми и решение отличается. Уверен что решить можно было и проще но я что-то не додумался. (Дамп прикрепляю)

use vk;

set @user_x = 2;

set @max_user_mess = (select count(from_user_id) as col 
from messages inner join text_of_messages tom 
on id = initiator_messages_id
where to_user_id = @user_x
group by from_user_id
order by col desc
limit 1);

select from_user_id 
from messages inner join text_of_messages tom 
on id = initiator_messages_id
where to_user_id = @user_x
group by from_user_id
having count(from_user_id) = @max_user_mess;

-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.

select count(likes.user_id) 
from profiles inner join likes
on profiles.user_id = likes.user_id
where timestampdiff(year, birthday, now()) < 10
group by likes.user_id;

-- Определить кто больше поставил лайков (всего): мужчины или женщины.

select case(gender)
	when 'м' then 'мужской'
	when 'ж' then 'женский'
end as 'Пол'
from profiles p inner join likes l 
on p.user_id  = l.user_id 
group by gender 
order by count(l.id) desc
limit 1