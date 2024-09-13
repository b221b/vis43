-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 13 2024 г., 19:24
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

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
-- Структура таблицы `sorevnovaniya`
--

CREATE TABLE `sorevnovaniya` (
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sportsmen`
--

CREATE TABLE `sportsmen` (
  `id` int NOT NULL,
  `fio` varchar(255) NOT NULL,
  `vid_sporta` varchar(255) NOT NULL,
  `razryad` int NOT NULL,
  `id_sorev` int NOT NULL,
  `id_trener` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sport_club`
--

CREATE TABLE `sport_club` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `chislo_sportsmen` int NOT NULL,
  `flag` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `structure`
--

CREATE TABLE `structure` (
  `id` int NOT NULL,
  `type_structure` varchar(255) NOT NULL,
  `vmestimost` int DEFAULT NULL,
  `type_pokritie` varchar(255) DEFAULT NULL,
  `ploshad` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `treners`
--

CREATE TABLE `treners` (
  `id` int NOT NULL,
  `fio` varchar(255) NOT NULL,
  `id_vid_sporta` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `sportsmen`
--
ALTER TABLE `sportsmen`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sport_club`
--
ALTER TABLE `sport_club`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `structure`
--
ALTER TABLE `structure`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `treners`
--
ALTER TABLE `treners`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `sportsmen`
--
ALTER TABLE `sportsmen`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sport_club`
--
ALTER TABLE `sport_club`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `structure`
--
ALTER TABLE `structure`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `treners`
--
ALTER TABLE `treners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
