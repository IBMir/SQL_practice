drop database if exists PC_Games;
create database PC_Games;

use PC_Games;

drop table if exists games;
create table games( -- игры
	id serial, -- уникальный номер игры
	title varchar(100) unique not null, -- название игры
	release_date date, -- дата выхода
	series_id bigint unsigned, -- номер серии
	download_link varchar(150), -- ссылка для скачивания
	created_at datetime default now(), -- время и дата создания записи
	updated_at datetime on update current_timestamp, -- время и дата изменения записи
	is_active bit default 1 -- является ли активной
);

drop table if exists genre;
create table genre( -- жанр игры
	id serial, -- уникальный номер жанра
	title varchar(100) unique not null -- наименование жанра
);

drop table if exists games_genre;
create table games_genre(
	games_id bigint unsigned not null,
	genre_id bigint unsigned not null,
	
	foreign key (games_id) references games(id),
	foreign key (genre_id) references genre(id)
);

drop table if exists media_types;
create table media_types( -- тип медиа
	id serial, -- уникальный номер типа
	name varchar(50) unique not null -- один из типов: poster, video_trailer, video_review (обзор), screenshot и др.
);

drop table if exists media;
create table media( -- медиа
	id serial,
	games_id bigint unsigned not null, -- уникальный номер игры
	media_types_id bigint unsigned not null, -- тип медиа
	name varchar(200), -- название
	link varchar(250) not null, -- ссылка на файл
	
	foreign key (media_types_id) references media_types(id),
	foreign key (games_id) references games(id)
);

drop table if exists game_description;
create table game_description( -- описание игры
	games_id bigint unsigned not null, -- уникальный номер игры
	poster_id bigint unsigned not null, -- постер игры
	body text not null, -- текст описания
		
	foreign key (games_id) references games(id),
	foreign key (poster_id) references media(id)
);

drop table if exists developer;
create table developer( -- разработчик
	id serial, -- уникальный номер разработчика
	title varchar(100) unique not null, -- название
	short_description text -- краткое описание
);

drop table if exists games_developer; 
create table games_developer( -- разработчик(и) игры (промежуточная таблица)
	games_id bigint unsigned not null,
	developer_id bigint unsigned not null,
	
	primary key (games_id, developer_id),
	foreign key (games_id) references games(id),
	foreign key (developer_id) references developer(id)
);

drop table if exists series;
create table series( -- серия игр
	id serial, --  уникальный номер серии
	title varchar(100) not null -- низвание
);

alter table games add constraint
foreign key (series_id) references series(id);

drop table if exists users; 
create table users( -- пользователи сайта
	id serial, -- уникальный номер пользователя
	login varchar(50) unique not null, -- уникальный логин
	email varchar(100) unique, -- адрес электронной почты
	password_hash VARCHAR(100) not null, -- хэш пароля
	link_photo varchar(250), -- фото пользователя
	created_at datetime default now(), -- время и дата создания записи
	is_active bit default 1 -- является ли активным
);

drop table if exists comment;
create table comment( -- комментарии
	id serial,
	users_id bigint unsigned not null, -- номер пользователя оставившего комментарий
	games_id bigint unsigned not null, -- уникальный номер игры
	body text not null, -- текст комментария
	created_at datetime default now(), -- время и дата создания записи
	is_active bit default 1, -- является ли активным
	
	foreign key (users_id) references `users`(id),
	foreign key (games_id) references `games`(id)
);

drop table if exists `language`;
create table `language`( -- язык (озвучки, интерфейса)
	id serial,
	title varchar(50) not null
);

drop table if exists interface_language;
create table interface_language(
	games_id bigint unsigned not null, -- уникальный номер игры
	language_id bigint unsigned not null, -- уникальный номер языка
	
	primary key (games_id, language_id),
	foreign key (games_id) references games(id),
	foreign key (language_id) references `language`(id)
);

drop table if exists voiceover_language;
create table voiceover_language(
	games_id bigint unsigned not null, -- уникальный номер игры
	language_id bigint unsigned not null, -- уникальный номер языка
	
	primary key (games_id, language_id),
	foreign key (games_id) references games(id),
	foreign key (language_id) references `language`(id)
);





















