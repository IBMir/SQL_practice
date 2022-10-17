use pc_games;

insert into series(title)
values
('Mount & Blade'),
('The Sims'),
(''),
(''),
(''),
('');

insert into games(title, release_date, series_id, download_link)
values
('Mount & Blade II: Bannerlord', '2020-03-30', 1, 'https://store.steampowered.com/app/261550/Mount__Blade_II_Bannerlord/'),
('Cyberpunk 2077', '2020-12-10', null, 'http://s94333327.utorrentgames.pro/1282-cyberpunk-2077.html'),
('Mount & Blade: Warband Viking Conquest', '2014-01-01', 1, 'https://store.steampowered.com/app/48700/Mount__Blade_Warband/'),
('The Sims 4', '2014-09-02', 2, 'http://s94333327.utorrentgames.pro/1294-the-sims-4.html'),
('', '', , ''),
('', '', , ''),
('', '', , ''),
('', '', , ''),
('', '', , ''),
('', '', , ''),
('', '', , ''),
('', '', , '');

insert into developer(title, short_description)
values
('TaleWorlds Entertainment', 'Независимая частная компания, которая занимается разработкой компьютерных игр. Размещена в городе Анкара, столице Турции. Компания была основана супругами Армага́ном (тур. Armağan Yavuz) и Ипе́к Яву́з (тур. İpek Yavuz) в 2005 году. Примечательно, что Армаган Явуз, доктор физико-математических наук, до того, как увлекся разработкой игр, планировал заниматься исключительно академическими исследованиями. В год открытия компании была начата разработка компьютерной ролевой игры Mount & Blade — первого проекта TaleWorlds.'),
('CD Projekt RED', 'Компания-разработчик компьютерных игр, расположенная в Польше. Является дочерним предприятием компании CD Projekt. CD Projekt Investment основала CD Projekt RED в феврале 2002 года в первую очередь для разработки игр по мотивам серии романов «Ведьмак» Анджея Сапковского. С сентября 2003 года компания начинает работать над своим первым проектом.'),
('Brytenwalda Studios', 'Международная компания, расположенная в Испании. Он был основан в 2014 году семью партнерами, которые разработали мод Brytenwalda для Mount & Blade: Warband в качестве хобби. Затем Brytenwalda Studios разработала успешное дополнение Viking Conquest для того же движка. Студия выросла со своим первым проектом, добавив талантливых художников-графиков и программистов в свою основную команду.'),
('The Sims Studio', 'Американская компания, занимающаяся разработкой компьютерных игр; дочерняя компания Electronic Arts. Направление компании — развитие игровой серии «The Sims». После нескольких лет успеха серии игр «The Sims», начатой компанией Maxis и развиваемой EA Games, в 2008 году внутри корпорации Electronic Arts было создано отдельное ответвление The Sims Studio, возглавляемое Родом Хамблом.'),
('', ''),
('', ''),
('', '');

insert into games_developer(games_id, developer_id)
values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(, ),
(, );

insert into media_types(name)
values
('poster'),
('video_trailer'),
('video_review'),
('screenshot');

insert into media(games_id, media_types_id, name, link)
values
(1, 1, 'Обложка игры Mount & Blade II: Bannerlord', 'https://www.digiseller.ru/preview/213678/p1_3063460_1b0a3e86.jpg'),
(1, 2, 'Трейлер игры', 'https://cdn.cloudflare.steamstatic.com/steam/apps/256779591/movie480.webm?t=1585560419'),
(1, 4, null, 'https://wargm.ru/img/db/86/74/8674556be032ff83d34bf1d8604f19ca6.jpg'),
(1, 4, 'Скриншот Mount & Blade II: Bannerlord', 'https://vgtimes.ru/uploads/gallery/main/135216/n8xv4hgkbr.jpg'),
(2, 1, null, 'https://utorrentgames.pro/uploads/posts/2020-04/1587296680_56fg.jpg'),
(2, 2, 'Трейлер Cyberpunk 2077', 'https://www.youtube.com/watch?v=aSrFWinrkeQ'),
(2, 4, 'Скриншот', 'https://utorrentgames.pro/uploads/posts/2020-12/thumbs/1607348827_3.jpg'),
(3, 1, 'Mount & Blade: Warband постер', 'https://images.stopgame.ru/screenshots/10464/mount_and_blade_warband-60.jpg'),
(3, 2, 'Mount & Blade Warband: Viking Conquest - "First Gameplay" Trailer', 'https://youtu.be/kJx6yQ5wmwY'),
(3, 3, 'Mount and Blade : Warband, Jeens', 'https://www.youtube.com/playlist?list=PLDochWWO5v5lLUz58YbSEmSsNVk3QNVEX'),
(3, 4, null, 'https://www.digiseller.ru/preview/935293/p1_2917711_dd2eeb55.jpg'),
(3, 4, null, 'https://www.digiseller.ru/preview/730077/p1_3065219_9291bca6.jpg'),
(4, 1, 'the sims 4 постер', 'https://www.igroshop.com/images/detailed/2/sims-4.jpg'),
(4, 2, 'The Sims 4: Official Launch Trailer', 'https://youtu.be/z00mK3Pxc8w'),
(4, 3, 'The Sims 4 - Мир, где нет места несчастью? (Обзор)', 'https://youtu.be/uCxvUgrk3MM'),
(4, 4, 'Скриншот', 'https://i.playground.ru/e/wlvdKeD9nyhYycHlChHxug.jpeg'),
(4, 4, 'Скриншот The Sims 4', 'https://s3.gaming-cdn.com/images/products/2645/screenshot/game-origin-the-sims-4-spooky-stuff-wallpaper-1.jpg'),
(, , '', ''),
(, , '', '');

insert into game_description(games_id, poster_id, body)
values
(1, 1, 'Mount & Blade II: Bannerlord представляет собой долгожданное продолжение знаменитой ролевой игры и симулятора средневековых войн Mount & Blade: Warband. Действие этой игры происходит за 200 лет до начала первой части. Улучшения коснулись как боевой системы, так и самой Кальрадии. Штурмуйте горные твердыни с помощью осадных орудий, создавайте тайные преступные империи на задворках городов или ищите славу в хаосе ожесточенных битв. Выбор за вами!'),
(2, 5, 'Описание: Cyberpunk 2077 (Киберпанк 2077) – компьютерная приключенческая Action/RPG в жанре киберпанка, объединившая в себе мотивы многих известных кинокартин и повествующая о сером альтернативном будущем… Сюжет игры вращается вокруг событий, происходящих в 2077-ом году. Альтернативное будущее оказалось не таким, каким мы его себе представляли. Люди перестали верить в естественность и стали вживлять в свои тела различные технологические гаджеты. И вообще, мир изменился – теперь всем им заправляют огромные корпорации, творящие все, что придет в головы их владельцам.'),
(3, 8, 'Viking Conquest - это второе по счету DLC (загружаемое дополнение) для Warband, предлагающее нам окунуться в темные времена Британии: римские легионы покинули туманный Альбион, но ситуация от этого лишь накалилась еще больше, различные племена вступили в схватку за право господствовать на островах, в то время как многочисленные враги уже положили глаз на богатые территории. В игре нас ожидают детально проработанная карта, включающая территории Британии, Дании и Норвегии, исторические фракции и множество изменений игрового процесса.'),
(4, 13, 'Компьютерная игра в жанре симулятора жизни, четвёртая по счету из серии игр The Sims. Как и в предыдущих играх серии, концепция геймплея остаётся прежней, игрок контролирует своего персонажа в различных видах деятельности и взаимоотношениях схожих с реальной жизнью. The Sims 4 имеет нелинейный игровой процесс без заданной конечной цели.'),
(, , ''),
(, , ''),
(, , ''),
(, , ''),
(, , ''),
(, , ''),
(, , ''),
(, , '');

insert into users(login, email, password_hash, link_photo)
values
('Levkoruc', 'Lev0k0ru@yandex.ru', '84hfao8fhge8h8gufsyg733ff4g4g5hh6j7j', 'https://i.pinimg.com/originals/11/2f/d6/112fd6041a2ff13f6fcb6c17ab267b9a.jpg'),
('Mark marko', 'Marko@yandex.ru', '04c9384hfao8fhmv8n7v46', 'https://yeahiknowitsucks.files.wordpress.com/2014/04/63d835ae684bfa2ba1e20ecb10fc16e390cac8651.jpg'),
('Mr3Chost', 'FFhost@mail.ru', 'h8guf3478cv387csyg733ff4g4g5hh6', 'https://static.wikia.nocookie.net/mrmen/images/f/fb/Greedy1.jpg/revision/latest?cb=20200226221620'),
('Сибиряк', 'FFghg3434@yandex.ru', '9nvnvbfyf64ejs117csyg733ff4g4g5h', 'https://i.pinimg.com/originals/af/62/e3/af62e39726f946b578b8a8dff0f5220b.png'),
('Адиль', 'Ad_i_L@mail.ru', 'fsmhfhf74hvejeyg733ff4g4g5hh6j7j', 'https://krot.info/uploads/posts/2022-03/1646923576_61-krot-info-p-prikolnie-znachki-smeshnie-foto-65.png'),
('Kristina', 'Kristinatina@mail.ru', '9nvnvbfyncjsud74jhkg', 'https://krot.info/uploads/posts/2022-03/1646179227_7-krot-info-p-znachok-prikol-smeshnie-foto-7.jpg'),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', ''),
('', '', '', '');

insert into comment(users_id, games_id, body)
values
(1, 1, 'играю с детства в эту игру досихпор не надоела,всем советую'),
(2, 1, 'помогите не могу установить игру'),
(2, 2, 'Игра норм, но у меня пк её не потянет )'),
(3, 1, 'не привык играть от первого лица. от 3 лица удобнее'),
(4, 2, 'Ну что сказать.. Это очень крутая игра! Есть баги, но на них я готов закрыть глаза. И я очень жду продолжение!'),
(1, 3, 'Очень нравится атмосфера игры, играю только ради нее, так как сюжет знаю уже на изусть.'),
(3, 2, 'Можно кайфануть со стримов PC версии'),
(4, 4, 'достаточное разнообразие npc'),
(6, 4, 'Прекрасная графика!Место на диске занимает мало, сюжет прикольный вместе с геймплеем.'),
(6, 2, 'Несколько нововведений в геймплее, хороший сюжет, хорошая оптимизация.'),
(5, 4, 'Большой мир, много возможностей у персонажа.'),
(, , ''),
(, , ''),
(, , ''),
(, , '');

insert into `language`(title)
values
('русский'),
('английский'),
('китайский'),
('турецкий'),
('французский'),
('итальянский'),
('японский'),
('корейский'),
('польский'),
('немецкий'),
('португальский'),
('нидерландский'),
('испанский');

insert into interface_language(games_id, language_id)
values
(1, 1),
(1, 2),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 6),
(2, 10),
(3, 1),
(3, 2),
(3, 3),
(3, 5),
(3, 10),
(4, 2),
(4, 5),
(4, 10),
(4, 12);

insert into voiceover_language(games_id, language_id)
values
(1, 1),
(1, 2),
(1, 4),
(2, 1),
(2, 2),
(2, 10),
(3, 1),
(3, 2),
(4, 2),
(4, 10),
(, ),
(, ),
(, ),
(, ),
(, ),
(, ),
(, ),
(, );

