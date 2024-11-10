-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 08 2024 г., 20:55
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sportOrg`
--

-- --------------------------------------------------------

--
-- Структура таблицы `org`
--

CREATE TABLE `org` (
  `id` int NOT NULL,
  `fio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `org`
--

INSERT INTO `org` (`id`, `fio`) VALUES
(1, 'Организатор 1'),
(2, 'Организатор 2'),
(3, 'Организатор 3'),
(4, 'Организатор 4'),
(5, 'Организатор 5'),
(6, 'Организатор 6');

-- --------------------------------------------------------

--
-- Структура таблицы `org_sorevnovaniya`
--

CREATE TABLE `org_sorevnovaniya` (
  `id` int NOT NULL,
  `id_org` int NOT NULL,
  `id_sorevnovaniya` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `org_sorevnovaniya`
--

INSERT INTO `org_sorevnovaniya` (`id`, `id_org`, `id_sorevnovaniya`) VALUES
(4, 1, 1),
(5, 1, 2),
(6, 3, 3),
(7, 4, 14),
(8, 5, 15),
(9, 6, 16);

-- --------------------------------------------------------

--
-- Структура таблицы `prizer`
--

CREATE TABLE `prizer` (
  `id` int NOT NULL,
  `mesto` int NOT NULL,
  `nagrada` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `prizer`
--

INSERT INTO `prizer` (`id`, `mesto`, `nagrada`) VALUES
(1, 1, 'Золотая медаль'),
(2, 2, 'Серебряная медаль'),
(3, 3, 'Бронзовая медаль');

-- --------------------------------------------------------

--
-- Структура таблицы `sorevnovaniya`
--

CREATE TABLE `sorevnovaniya` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_structure` int NOT NULL,
  `id_vid_sporta` int NOT NULL,
  `data_provedeniya` date NOT NULL,
  `id_prizer` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `sorevnovaniya`
--

INSERT INTO `sorevnovaniya` (`id`, `name`, `id_structure`, `id_vid_sporta`, `data_provedeniya`, `id_prizer`) VALUES
(1, 'Зимний кубок', 1, 1, '2021-09-20', 1),
(2, 'Весенний кубок', 5, 3, '2021-09-21', 2),
(3, 'Летний кубок', 3, 2, '2002-05-20', 3),
(14, 'Баскетбольный турнир 1', 9, 1, '2020-03-01', 1),
(15, 'Футбольный чемпионат 1', 2, 2, '2020-07-01', 1),
(16, 'Волейбольный кубок 1', 4, 3, '2020-08-15', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `sportsmen`
--

CREATE TABLE `sportsmen` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `razryad` int NOT NULL,
  `id_sport_club` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `sportsmen`
--

INSERT INTO `sportsmen` (`id`, `name`, `razryad`, `id_sport_club`) VALUES
(8, 'Kise', 3, 4),
(9, 'Aomine', 3, 5),
(10, 'Akashi', 3, 6),
(11, 'Nebuya', 2, 6),
(13, 'Kasamatsu', 2, 4),
(14, 'Midorima', 3, 10),
(15, 'Kuroko', 3, 11),
(16, 'Kagami', 3, 11),
(17, 'Murasakibara', 3, 12);

-- --------------------------------------------------------

--
-- Структура таблицы `sportsmen_prizer`
--

CREATE TABLE `sportsmen_prizer` (
  `id` int NOT NULL,
  `id_sportsmen` int NOT NULL,
  `id_prizer` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `sportsmen_prizer`
--

INSERT INTO `sportsmen_prizer` (`id`, `id_sportsmen`, `id_prizer`) VALUES
(1, 10, 1),
(2, 9, 1),
(5, 16, 1),
(6, 14, 2),
(7, 13, 2),
(8, 17, 2),
(9, 8, 3),
(10, 15, 3),
(11, 11, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `sportsmen_sorevnovaniya`
--

CREATE TABLE `sportsmen_sorevnovaniya` (
  `id` int NOT NULL,
  `id_sportsmen` int NOT NULL,
  `id_sorevnovaniya` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `sportsmen_sorevnovaniya`
--

INSERT INTO `sportsmen_sorevnovaniya` (`id`, `id_sportsmen`, `id_sorevnovaniya`) VALUES
(17, 10, 1),
(29, 14, 1),
(31, 15, 1),
(33, 9, 2),
(34, 13, 2),
(35, 8, 2),
(36, 10, 3),
(37, 17, 3),
(38, 15, 3),
(39, 16, 14),
(40, 14, 14),
(41, 8, 14),
(42, 8, 15),
(43, 16, 15),
(45, 17, 15),
(46, 11, 16),
(47, 10, 16),
(48, 13, 16);

-- --------------------------------------------------------

--
-- Структура таблицы `sportsmen_treners`
--

CREATE TABLE `sportsmen_treners` (
  `id` int NOT NULL,
  `id_sportsmen` int NOT NULL,
  `id_treners` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `sportsmen_treners`
--

INSERT INTO `sportsmen_treners` (`id`, `id_sportsmen`, `id_treners`) VALUES
(1, 8, 1),
(2, 9, 1),
(3, 10, 1),
(4, 8, 2),
(5, 11, 3),
(6, 11, 6),
(7, 13, 5),
(8, 14, 4),
(9, 15, 5),
(10, 16, 1),
(11, 17, 6),
(12, 17, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `sportsmen_vidSporta`
--

CREATE TABLE `sportsmen_vidSporta` (
  `id` int NOT NULL,
  `id_sportsmen` int NOT NULL,
  `id_vid_sporta` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `sportsmen_vidSporta`
--

INSERT INTO `sportsmen_vidSporta` (`id`, `id_sportsmen`, `id_vid_sporta`) VALUES
(1, 8, 1),
(2, 9, 1),
(3, 10, 1),
(4, 11, 1),
(5, 13, 1),
(6, 8, 2),
(7, 11, 3),
(8, 14, 1),
(9, 15, 1),
(10, 16, 1),
(11, 17, 1),
(12, 17, 2),
(13, 16, 2),
(14, 10, 3),
(15, 13, 3),
(16, 8, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `sport_club`
--

CREATE TABLE `sport_club` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `sport_club`
--

INSERT INTO `sport_club` (`id`, `name`) VALUES
(4, 'Kaijo'),
(5, 'Too'),
(6, 'Rakuzan'),
(10, 'Shutoku'),
(11, 'Seirin'),
(12, 'Yosen');

-- --------------------------------------------------------

--
-- Структура таблицы `structure`
--

CREATE TABLE `structure` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(255) NOT NULL,
  `structure_namesid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `structure`
--

INSERT INTO `structure` (`id`, `name`, `type`, `structure_namesid`) VALUES
(1, 'Спартак', 'Стадион', 5),
(2, 'Динамо ', 'Стадион', 5),
(3, 'Сельмаш', 'Стадион', 5),
(4, 'Номер 1 ', 'Корт', 6),
(5, 'Номер 2', 'Корт', 6),
(6, 'Фитрон ', 'Спортивный зал', 7),
(7, 'WGym', 'Спортивный зал', 7),
(8, 'Подвальная качалка', 'Спортивный зал', 7),
(9, 'Манеж ДГТУ', 'Манеж', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `structure_chars`
--

CREATE TABLE `structure_chars` (
  `id` int NOT NULL,
  `id_structure` int NOT NULL,
  `vmestimost` int DEFAULT NULL,
  `tip_pokritiya` varchar(255) DEFAULT NULL,
  `kolvo_oborydovaniya` int DEFAULT NULL,
  `kolvo_tribun` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `structure_chars`
--

INSERT INTO `structure_chars` (`id`, `id_structure`, `vmestimost`, `tip_pokritiya`, `kolvo_oborydovaniya`, `kolvo_tribun`) VALUES
(1, 1, 100, NULL, NULL, NULL),
(2, 2, 250, NULL, NULL, NULL),
(3, 3, 450, NULL, NULL, NULL),
(4, 4, NULL, 'Резина', NULL, NULL),
(5, 5, NULL, 'Трава', NULL, NULL),
(6, 6, NULL, NULL, 250, NULL),
(7, 7, NULL, NULL, 325, NULL),
(8, 8, NULL, NULL, 40, NULL),
(9, 9, NULL, NULL, NULL, 500);

-- --------------------------------------------------------

--
-- Структура таблицы `treners`
--

CREATE TABLE `treners` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_vid_sporta` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `treners`
--

INSERT INTO `treners` (`id`, `name`, `id_vid_sporta`) VALUES
(1, 'Коби Брайант', 1),
(2, 'Леонель Месси', 2),
(3, 'Лоренцо Бернарди', 3),
(4, 'Леброн Джеймс', 1),
(5, 'Кайри Ирвинг', 1),
(6, 'Виктор Вембаньяма', 1),
(7, 'Криштиану Роналду', 2),
(8, 'Неймар Да Силва Сантос Жуниор', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `vid_sporta`
--

CREATE TABLE `vid_sporta` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `vid_sporta`
--

INSERT INTO `vid_sporta` (`id`, `name`) VALUES
(1, 'Баскетбол'),
(2, 'Футбол'),
(3, 'Волейбол');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `org`
--
ALTER TABLE `org`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `org_sorevnovaniya`
--
ALTER TABLE `org_sorevnovaniya`
  ADD PRIMARY KEY (`id`),
  ADD KEY `org_sorevnovaniya` (`id_org`),
  ADD KEY `org_sorevnovaniya2` (`id_sorevnovaniya`);

--
-- Индексы таблицы `prizer`
--
ALTER TABLE `prizer`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sorevnovaniya`
--
ALTER TABLE `sorevnovaniya`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sorevnovaniya_structure` (`id_structure`),
  ADD KEY `sorevnovaniya_vidSporta` (`id_vid_sporta`),
  ADD KEY `sorevnovaniya_prizer` (`id_prizer`);

--
-- Индексы таблицы `sportsmen`
--
ALTER TABLE `sportsmen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sportsmen` (`id_sport_club`);

--
-- Индексы таблицы `sportsmen_prizer`
--
ALTER TABLE `sportsmen_prizer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sportsmen_prizer` (`id_sportsmen`),
  ADD KEY `sportsmen_prizer2` (`id_prizer`);

--
-- Индексы таблицы `sportsmen_sorevnovaniya`
--
ALTER TABLE `sportsmen_sorevnovaniya`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sportsmen_sorevnovaniya2` (`id_sorevnovaniya`) USING BTREE,
  ADD KEY `sportsmen_sorevnovaniya` (`id_sportsmen`) USING BTREE;

--
-- Индексы таблицы `sportsmen_treners`
--
ALTER TABLE `sportsmen_treners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sportsmen_treners` (`id_sportsmen`),
  ADD KEY `sportsmen_treners2` (`id_treners`);

--
-- Индексы таблицы `sportsmen_vidSporta`
--
ALTER TABLE `sportsmen_vidSporta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sportsmen_vidSporta` (`id_sportsmen`),
  ADD KEY `sportsmen_vidSporta2` (`id_vid_sporta`);

--
-- Индексы таблицы `sport_club`
--
ALTER TABLE `sport_club`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `structure`
--
ALTER TABLE `structure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `struture_names_ctructure1` (`structure_namesid`) USING BTREE;

--
-- Индексы таблицы `structure_chars`
--
ALTER TABLE `structure_chars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `structure_chars` (`id_structure`);

--
-- Индексы таблицы `treners`
--
ALTER TABLE `treners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_vid_sportafk` (`id_vid_sporta`);

--
-- Индексы таблицы `vid_sporta`
--
ALTER TABLE `vid_sporta`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `org`
--
ALTER TABLE `org`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `org_sorevnovaniya`
--
ALTER TABLE `org_sorevnovaniya`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `prizer`
--
ALTER TABLE `prizer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `sorevnovaniya`
--
ALTER TABLE `sorevnovaniya`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `sportsmen`
--
ALTER TABLE `sportsmen`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `sportsmen_prizer`
--
ALTER TABLE `sportsmen_prizer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `sportsmen_sorevnovaniya`
--
ALTER TABLE `sportsmen_sorevnovaniya`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблицы `sportsmen_treners`
--
ALTER TABLE `sportsmen_treners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `sportsmen_vidSporta`
--
ALTER TABLE `sportsmen_vidSporta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `sport_club`
--
ALTER TABLE `sport_club`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `structure`
--
ALTER TABLE `structure`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `structure_chars`
--
ALTER TABLE `structure_chars`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `treners`
--
ALTER TABLE `treners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `vid_sporta`
--
ALTER TABLE `vid_sporta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `org_sorevnovaniya`
--
ALTER TABLE `org_sorevnovaniya`
  ADD CONSTRAINT `org_sorevnovaniya_ibfk_1` FOREIGN KEY (`id_org`) REFERENCES `org` (`id`),
  ADD CONSTRAINT `org_sorevnovaniya_ibfk_2` FOREIGN KEY (`id_sorevnovaniya`) REFERENCES `sorevnovaniya` (`id`);

--
-- Ограничения внешнего ключа таблицы `sorevnovaniya`
--
ALTER TABLE `sorevnovaniya`
  ADD CONSTRAINT `sorevnovaniya_ibfk_1` FOREIGN KEY (`id_structure`) REFERENCES `structure` (`id`),
  ADD CONSTRAINT `sorevnovaniya_ibfk_2` FOREIGN KEY (`id_vid_sporta`) REFERENCES `vid_sporta` (`id`),
  ADD CONSTRAINT `sorevnovaniya_ibfk_4` FOREIGN KEY (`id_prizer`) REFERENCES `prizer` (`id`);

--
-- Ограничения внешнего ключа таблицы `sportsmen`
--
ALTER TABLE `sportsmen`
  ADD CONSTRAINT `sportsmen_ibfk_1` FOREIGN KEY (`id_sport_club`) REFERENCES `sport_club` (`id`);

--
-- Ограничения внешнего ключа таблицы `sportsmen_prizer`
--
ALTER TABLE `sportsmen_prizer`
  ADD CONSTRAINT `sportsmen_prizer_ibfk_1` FOREIGN KEY (`id_sportsmen`) REFERENCES `sportsmen` (`id`),
  ADD CONSTRAINT `sportsmen_prizer_ibfk_2` FOREIGN KEY (`id_prizer`) REFERENCES `prizer` (`id`);

--
-- Ограничения внешнего ключа таблицы `sportsmen_sorevnovaniya`
--
ALTER TABLE `sportsmen_sorevnovaniya`
  ADD CONSTRAINT `sportsmen_sorevnovaniya_ibfk_2` FOREIGN KEY (`id_sportsmen`) REFERENCES `sportsmen` (`id`),
  ADD CONSTRAINT `sportsmen_sorevnovaniya_ibfk_3` FOREIGN KEY (`id_sorevnovaniya`) REFERENCES `sorevnovaniya` (`id`);

--
-- Ограничения внешнего ключа таблицы `sportsmen_treners`
--
ALTER TABLE `sportsmen_treners`
  ADD CONSTRAINT `sportsmen_treners_ibfk_1` FOREIGN KEY (`id_sportsmen`) REFERENCES `sportsmen` (`id`),
  ADD CONSTRAINT `sportsmen_treners_ibfk_2` FOREIGN KEY (`id_treners`) REFERENCES `treners` (`id`);

--
-- Ограничения внешнего ключа таблицы `sportsmen_vidSporta`
--
ALTER TABLE `sportsmen_vidSporta`
  ADD CONSTRAINT `sportsmen_vidsporta_ibfk_1` FOREIGN KEY (`id_sportsmen`) REFERENCES `sportsmen` (`id`),
  ADD CONSTRAINT `sportsmen_vidsporta_ibfk_2` FOREIGN KEY (`id_vid_sporta`) REFERENCES `vid_sporta` (`id`);

--
-- Ограничения внешнего ключа таблицы `structure_chars`
--
ALTER TABLE `structure_chars`
  ADD CONSTRAINT `structure_chars_ibfk_1` FOREIGN KEY (`id_structure`) REFERENCES `structure` (`id`);

--
-- Ограничения внешнего ключа таблицы `treners`
--
ALTER TABLE `treners`
  ADD CONSTRAINT `treners_ibfk_1` FOREIGN KEY (`id_vid_sporta`) REFERENCES `vid_sporta` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
