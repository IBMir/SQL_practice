-- Количество активных (не заблокированных) игр представленных на сайте.

select count(title) from games
where is_active = 1;

-- Выборка игр определенного года и их разработчики.

set @year_game = 2020;

select g.title 'Название игры', d.title 'Разработчик' from games g 
inner join games_developer gd 
on gd.games_id = g.id 
inner join developer d 
on d.id = gd.developer_id
where year(g.release_date) = @year_game;

-- Выборка активных (не заблокированных) игр определенного жанра.

set @genre_of_the_game = 'RPG';

select games.title from games
inner join games_genre
on games.id = games_genre.games_id
inner join genre
on genre.id = games_genre.genre_id and genre.title = @genre_of_the_game
where is_active = 1;

-- Игры, поддерживающие русский язык интерфейса и озвучки.

select games.title
from games
inner join interface_language
on interface_language.games_id = games.id and interface_language.language_id = 1
inner join voiceover_language
on voiceover_language.games_id = games.id and voiceover_language.language_id = 1;

-- Представление запроса на основные данные активных (не заблокированных) игр.

create view basic_game_data as
	select g.title 'Название', g.release_date 'Дата выпуска', s.title 'Серия', d.title 'Разработчик', gdes.body 'Описание', g.download_link 'Ссылка для скачивания'
	from games g 
	left join series s 
	on g.series_id = s.id  
	inner join games_developer gd 
	on g.id = gd.games_id 
	inner join developer d 
	on gd.developer_id = d.id 
	inner join game_description gdes 
	on g.id = gdes.games_id 
	where is_active = 1;

select * from basic_game_data;

-- Информация о трех наиболее активных пользователях (не заблокированных).

select u.login 'Логин', u.email 'Адрес электронной почты' from users u
inner join comment c 
on u.id = c.users_id
where u.is_active = 1
group by u.id
order by count(c.id) desc
limit 3;



