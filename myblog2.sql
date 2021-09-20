-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 20 2021 г., 13:15
-- Версия сервера: 5.6.43
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `myblog2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `id_author` int(11) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `date` date DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `stat` int(11) DEFAULT NULL,
  `count_like` int(11) DEFAULT NULL,
  `alias` varchar(255) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `tags` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `title`, `text`, `id_author`, `time`, `date`, `img`, `stat`, `count_like`, `alias`, `category`, `tags`) VALUES
(178, 'Lorem ipsum dolor ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1, NULL, NULL, NULL, 5, 3, '3', 1, 'Lorem '),
(179, 'Lorem ipsum dolor ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1, NULL, NULL, NULL, 2, 3, '2', 1, 'Lorem ');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id_cat` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `alias_cat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id_cat`, `name`, `alias_cat`) VALUES
(1, 'Категория-1', 'cat.1'),
(2, 'Категория-2', 'cat.2'),
(3, 'Категория-3', 'cat.3');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `text_comm` text NOT NULL,
  `author` int(11) NOT NULL,
  `time_comm` time NOT NULL,
  `date_comm` date NOT NULL,
  `id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `title_img` varchar(255) NOT NULL,
  `id_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `title_img`, `id_article`) VALUES
(1, 'file_name', 5),
(2, 'flag2.png', 121),
(5, 'freudmuseum-2.jpg', 121),
(6, 'pathologischanatomisches.jpg', 121),
(7, 'prater.jpg', 121),
(8, 'stephansdom-2.jpg', 121),
(9, 'Barselona_Spain.jpg', 125),
(10, 'Bali_Indonesia.jpg', 125),
(11, '0007.jpg', 125),
(12, '0009.jpg', 125),
(13, '0003.jpg', 125),
(14, '0002.jpg', 125),
(15, '0005.jpg', 125),
(16, 'Dubai_UAE.jpg', 127),
(17, 'Budapest_Hungary.jpg', 127),
(18, 'index-0_afr.jpg', 127),
(20, '0006.jpg', 127),
(24, 'dubai_about_1.jpg', 134),
(79, '14069779193037.jpg', 150),
(81, '6TS-sf2IdGY.jpg', 150),
(90, '444.jpg', 159),
(92, '051_mini.jpg', 171),
(96, '050_mini.jpg', 171),
(97, '0999.jpg', 171),
(101, '0888.jpg', 171),
(113, '003_mini.jpg', 176);

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `id_art` int(11) DEFAULT NULL,
  `id_usr` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `name_menu` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `url` varchar(200) NOT NULL,
  `for_auth` tinyint(1) NOT NULL,
  `for_guests` tinyint(1) NOT NULL,
  `for_all` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id_menu`, `name_menu`, `is_active`, `url`, `for_auth`, `for_guests`, `for_all`) VALUES
(1, 'Главная', 1, 'index.php', 0, 0, 1),
(2, 'Создать статью', 1, 'create.php', 1, 0, 0),
(3, 'Мой профиль', 1, 'profile.php', 1, 0, 0),
(6, 'Регистрация', 1, 'register.php', 0, 1, 0),
(7, 'Войти', 1, 'login.php', 0, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `login` varchar(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `about` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `name`, `surname`, `age`, `email`, `password`, `avatar`, `about`) VALUES
(1, 'login', 'Marcus', 'Cicero', 2021, 'Marcus.Tullius@gmail.com', '1111', '051_mini.jpg', 'Lorem ipsum dolor sit amet'),
(2, 'login', 'Олег3', 'Симонова', 21, 'some@mail.ru', '444356', 'html_css.png', 'Все так хорошо)))  Прям супер\r\nпродолж:)'),
(28, 'login', 'Fedor', 'Ivanov', 16, NULL, NULL, NULL, ''),
(29, 'login', 'Nikolay', 'Petrov', 29, NULL, NULL, NULL, ''),
(30, 'login', 'Nikolay', 'Petrov', 100, NULL, NULL, NULL, ''),
(31, 'login', 'Petr', 'Nikolaev', 65, NULL, NULL, NULL, ''),
(32, 'login', 'Semen', 'Nikolaev', 93, NULL, NULL, NULL, ''),
(33, 'login', 'Fedor', 'Semenov', 74, NULL, NULL, NULL, ''),
(34, 'login', 'Ivan', 'Fedorov', 88, NULL, NULL, NULL, ''),
(35, 'login', 'Semen', 'Petrov', 89, NULL, NULL, NULL, ''),
(36, 'login', 'Petr', 'Fedorov', 64, NULL, NULL, NULL, ''),
(37, 'login', 'Petr', 'Petrov', 62, NULL, NULL, NULL, ''),
(38, 'login', 'Nikolay', 'Nikolaev', 86, NULL, NULL, NULL, ''),
(39, 'login', 'Semen', 'Petrov', 63, NULL, NULL, NULL, ''),
(40, 'login', 'Semen', 'Semenov', 58, NULL, NULL, NULL, ''),
(41, 'login', 'Ivan', 'Nikolaev', 14, NULL, NULL, NULL, ''),
(42, 'login', 'Petr', 'Ivanov', 36, NULL, NULL, NULL, ''),
(43, 'login', 'Fedor', 'Ivanov', 73, NULL, NULL, NULL, ''),
(44, 'login', 'Petr', 'Ivanov', 60, NULL, NULL, NULL, ''),
(45, 'login', 'Ivan', 'Fedorov', 57, NULL, NULL, NULL, ''),
(46, 'login', 'Fedor', 'Semenov', 66, NULL, NULL, NULL, ''),
(47, 'login', 'Semen', 'Fedorov', 24, NULL, NULL, NULL, ''),
(48, 'login', 'Fedor', 'Semenov', 100, NULL, NULL, NULL, ''),
(49, 'login', 'Ivan', 'Semenov', 11, NULL, NULL, NULL, ''),
(50, 'login', 'Petr', 'Fedorov', 33, NULL, NULL, NULL, ''),
(51, 'login', 'Petr', 'Semenov', 48, NULL, NULL, NULL, ''),
(52, 'login', 'Semen', 'Petrov', 39, NULL, NULL, NULL, ''),
(53, 'login', 'Ivan', 'Semenov', 96, NULL, NULL, NULL, ''),
(54, 'login', 'Petr', 'Ivanov', 75, NULL, NULL, NULL, ''),
(55, 'login', 'Ivan', 'Fedorov', 67, NULL, NULL, NULL, ''),
(56, 'login', 'Petr', 'Fedorov', 83, NULL, NULL, NULL, ''),
(79, 'login', 'Ivan', 'Ivanov', 26, NULL, NULL, NULL, ''),
(80, 'login', 'Semen', 'Petrov', 83, NULL, NULL, NULL, ''),
(81, 'login', 'Nikolay', 'Nikolaev', 51, NULL, NULL, NULL, ''),
(82, 'login', 'Fedor', 'Petrov', 45, NULL, NULL, NULL, ''),
(83, 'login', 'Ivan', 'Ivanov', 46, NULL, NULL, NULL, ''),
(84, 'login', 'Nikolay', 'Petrov', 69, NULL, NULL, NULL, ''),
(85, 'login', 'Petr', 'Semenov', 70, NULL, NULL, NULL, ''),
(86, 'login', 'Petr', 'Semenov', 61, NULL, NULL, NULL, ''),
(87, 'login', 'Petr', 'Semenov', 100, NULL, NULL, NULL, ''),
(88, 'login', 'Fedor', 'Petrov', 10, NULL, NULL, NULL, ''),
(89, 'login', 'Semen', 'Ivanov', 26, NULL, NULL, NULL, ''),
(90, 'login', 'Fedor', 'Nikolaev', 69, NULL, NULL, NULL, ''),
(91, 'login', 'Petr', 'Semenov', 38, NULL, NULL, NULL, ''),
(92, 'login', 'Fedor', 'Semenov', 84, NULL, NULL, NULL, ''),
(93, 'login', 'Nikolay', 'Nikolaev', 28, NULL, NULL, NULL, ''),
(94, 'login', 'Fedor', 'Fedorov', 92, NULL, NULL, NULL, ''),
(95, 'login', 'Ivan', 'Nikolaev', 88, NULL, NULL, NULL, ''),
(96, 'login', 'Ivan', 'Petrov', 42, NULL, NULL, NULL, ''),
(97, 'login', 'Nikolay', 'Petrov', 28, NULL, NULL, NULL, ''),
(98, 'login', 'Nikolay', 'Petrov', 78, NULL, NULL, NULL, ''),
(99, 'login', 'Semen', 'Ivanov', 95, NULL, NULL, NULL, ''),
(100, 'login', 'Nikolay', 'Ivanov', 31, NULL, NULL, NULL, ''),
(101, 'login', 'Petr', 'Ivanov', 13, NULL, NULL, NULL, ''),
(102, 'login', 'Nikolay', 'Fedorov', 33, NULL, NULL, NULL, ''),
(103, 'login', 'Fedor', 'Nikolaev', 32, NULL, NULL, NULL, ''),
(104, 'login', 'Nikolay', 'Semenov', 16, NULL, NULL, NULL, ''),
(105, 'login', 'Semen', 'Petrov', 38, NULL, NULL, NULL, ''),
(106, 'login', 'Ivan', 'Semenov', 49, NULL, NULL, NULL, ''),
(107, 'login', 'Fedor', 'Ivanov', 28, NULL, NULL, NULL, ''),
(108, 'login', 'Fedor', 'Semenov', 94, NULL, NULL, NULL, ''),
(109, 'login', 'Semen', 'Ivanov', 96, NULL, NULL, NULL, ''),
(110, 'login', 'Semen', 'Fedorov', 100, NULL, NULL, NULL, ''),
(111, 'login', 'Semen', 'Fedorov', 69, NULL, NULL, NULL, ''),
(112, 'login', 'Semen', 'Fedorov', 22, NULL, NULL, NULL, ''),
(113, 'login', 'Nikolay', 'Nikolaev', 14, NULL, NULL, NULL, ''),
(114, 'login', 'Fedor', 'Nikolaev', 17, NULL, NULL, NULL, ''),
(115, 'login', 'Сергей', 'Милошевич', 16, 'some@some.ru', '123456', '05027.jpg', 'Я юный Югослав'),
(119, 'sfd', 'sdf', 'sdf', 4, 'ivan@ivan.ru4', '1234', '', ''),
(120, 'yi', 'rtjh', 'ryjk', 47, 'ivan@ivan.ru446', '1233rg', 'Barselona_Spain.jpg', ''),
(121, 'log', 'Иван', 'Самофал', 26, 'ivan@mail.ru', '12345', '14069779193037.jpg', 'Хахаха'),
(122, 'log', 'Р?РІР°РЅ', 'РЎР°РјРѕС„Р°Р»', 26, 'ivan@mail.ru', '12345', '0007.jpg', ''),
(123, 'log', 'Р?РІР°РЅ', 'РЎР°РјРѕС„Р°Р»', 26, 'ivan@mail.ru', '12345', '0007.jpg', ''),
(124, '47', 'РІР°С‹Рї', 'С‹Р°Рї', 75, 'ivan@ivan.ruР°', '123', 'Bali_Indonesia.jpg', ''),
(125, '47', 'РІР°С‹Рї', 'С‹Р°Рї', 75, 'ivan@ivan.ruР°', '123', 'Bali_Indonesia.jpg', ''),
(126, '346', 'Дмитрий', 'Федоров', 24, 'ivan@ivan.ru42', '123', 'elitefon.ru-20342.jpg', 'Я так все люблю!'),
(127, 'isamofal', 'ivan', 'samofal', 35, 'iva@iva.ru', '1111', '003_mini.jpg', ''),
(128, 'iisam', 'vanya', 'samofal', 40, 'vanya@ya.ru', '111111', '001_mini.jpg', 'statya obo mne^)'),
(129, 'iiisanm', 'ivan', 'nikolaev', 20, '20@20.ru', '1111', 'php2.png', 'about me^)'),
(130, 'somee', 'ivan', 'samofal', 30, 'van@ya.ru', '1111', 'git.png', 'dhdghdghdghd'),
(131, 'mylog', 'ivan', 'samofal', 30, 'iva2@iva.ru', '1111', 'php2.png', 'dsfgfsgfgsfg'),
(132, 'asmofal', 'ivan', 'samofal', 0, '30@30.ru', '1111', 'php_blog.png', ''),
(133, 'iisam', '', '', 0, 'ivannn@i.ru', '1111', 'git.png', ''),
(134, 'sdfg', '', '', 0, '40@ya.ru', '1111', 'html css.png', ''),
(135, 'fsdgsfg', '', '', 0, '50@ya.ru', '1111', 'php_blog.png', ''),
(136, 'dsfsdf', '', '', 0, 'ivan1@ya.ru', '1111', 'php2.png', ''),
(137, 'samofal10@mail.ru', 'ivan', 'samofal', 40, 'samofal10@mail.ru', '1111', 'Гифка с Gifius.ru (1).gif', 'dsfsdfdsf'),
(138, 'ivan@ivan.ru2', '', '', 0, 'some@mail.ru2', '123', '0999.jpg', 'dfg'),
(139, '1', 'ivan', 'samofal', 40, 'samofal10@mail.ru2', '1111', '0888.jpg', 'my about some text');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_author` (`id_author`),
  ADD KEY `category` (`category`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_cat`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author` (`author`),
  ADD KEY `id_article` (`id_article`);

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title_img` (`title_img`),
  ADD KEY `id_article` (`id_article`);

--
-- Индексы таблицы `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_art` (`id_art`),
  ADD KEY `id_usr` (`id_usr`);

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD UNIQUE KEY `name_menu` (`name_menu`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
