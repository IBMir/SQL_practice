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
	select g.id 'Уникальный_номер', g.title 'Название', g.release_date 'Дата_выпуска', s.title 'Серия', d.title 'Разработчик', gdes.body 'Описание', g.download_link 'Ссылка_для_скачивания'
	from games g 
	left join series s 
	on g.series_id = s.id  
	inner join games_developer gd 
	on g.id = gd.games_id 
	inner join developer d 
	on gd.developer_id = d.id 
	inner join game_description gdes 
	on g.id = gdes.games_id
	order by g.id;

select * from basic_game_data;

-- Информация о трех наиболее активных пользователях (не заблокированных).

select u.login 'Логин', u.email 'Адрес электронной почты' from users u
inner join comment c 
on u.id = c.users_id
where u.is_active = 1
group by u.id
order by count(c.id) desc
limit 3;

-- Процедура выводит всю информацию о конкретной игре по ее названию.

drop procedure if exists all_information_about_the_game;

delimiter ||

create procedure all_information_about_the_game(in title_games varchar(100))
	begin
		set @count_g = (select count(*) from basic_game_data where Название like concat ('%', title_games, '%'));
		if (@count_g = 1) then
			select * from basic_game_data where Название like concat ('%', title_games, '%');
			set @id_g = (select Уникальный_номер from basic_game_data where Название like concat ('%', title_games, '%'));
			select title 'Жанры' from genre g
				join games_genre gg  on g.id = gg.genre_id and gg.games_id = @id_g;
			select mt.name, m.name, m.link from media m 
				join media_types mt on mt.id = m.media_types_id and m.games_id = @id_g;
		elseif (@count_g > 1) then
			select 'Найдено более одной игры, уточните запрос.'
			union
			select Название from basic_game_data where Название like concat ('%', title_games, '%'); 
		else
			select 'По вашему запросу игр не найдено.';
		end if;
	end ||
	
delimiter ;

call all_information_about_the_game('Название игры');


