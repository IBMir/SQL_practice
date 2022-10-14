-- ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке

use vk;

select distinct firstname as Имя from users;

-- iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false).
-- Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)

alter table users 
add column is_active enum('false', 'true') 
default 'true';

update users set is_active='false'
where id in (select user_id
from profiles
where (year(current_date) - year(birthday)) - (right(birthday, 5)>right(current_date, 5)) < 18);

-- iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)

delete from text_of_messages
where created_at > now()




