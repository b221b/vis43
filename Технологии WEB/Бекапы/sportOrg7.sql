-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 20 2024 г., 19:25
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
-- Структура таблицы `org`
--

CREATE TABLE `org` (
  `id` int NOT NULL,
  `fio` varchar(255) NOT NULL,
  `count_sorevov` int NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `org_sorevnovaniya`
--

CREATE TABLE `org_sorevnovaniya` (
  `id` int NOT NULL,
  `id_org` int NOT NULL,
  `id_sorevnovaniya` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `prizer`
--

CREATE TABLE `prizer` (
  `id` int NOT NULL,
  `mesto` int NOT NULL,
  `nagrada` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

-- --------------------------------------------------------

--
-- Структура таблицы `sportsmen_prizer`
--

CREATE TABLE `sportsmen_prizer` (
  `id` int NOT NULL,
  `id_sportsmen` int NOT NULL,
  `id_prizer` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sportsmen_sorevnovaniya`
--

CREATE TABLE `sportsmen_sorevnovaniya` (
  `id` int NOT NULL,
  `id_sportsmen` int NOT NULL,
  `id_sorevnovaniya` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sportsmen_treners`
--

CREATE TABLE `sportsmen_treners` (
  `id` int NOT NULL,
  `id_sportsmen` int NOT NULL,
  `id_treners` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sportsmen_vidSporta`
--

CREATE TABLE `sportsmen_vidSporta` (
  `id` int NOT NULL,
  `id_sportsmen` int NOT NULL,
  `id_vid_sporta` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sport_club`
--

CREATE TABLE `sport_club` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `chislo_sportsmen` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `structure`
--

CREATE TABLE `structure` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

-- --------------------------------------------------------

--
-- Структура таблицы `treners`
--

CREATE TABLE `treners` (
  `id` int NOT NULL,
  `fio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `vid_sporta`
--

CREATE TABLE `vid_sporta` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_treners` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  ADD UNIQUE KEY `sportsmen_sorevnovaniya2` (`id_sorevnovaniya`),
  ADD UNIQUE KEY `sportsmen_sorevnovaniya` (`id_sportsmen`) USING BTREE;

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `vid_sporta`
--
ALTER TABLE `vid_sporta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vid_sporta_trener` (`id_treners`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `org`
--
ALTER TABLE `org`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `org_sorevnovaniya`
--
ALTER TABLE `org_sorevnovaniya`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `prizer`
--
ALTER TABLE `prizer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sportsmen`
--
ALTER TABLE `sportsmen`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `sportsmen_prizer`
--
ALTER TABLE `sportsmen_prizer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sportsmen_sorevnovaniya`
--
ALTER TABLE `sportsmen_sorevnovaniya`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sportsmen_treners`
--
ALTER TABLE `sportsmen_treners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sportsmen_vidSporta`
--
ALTER TABLE `sportsmen_vidSporta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sport_club`
--
ALTER TABLE `sport_club`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `structure`
--
ALTER TABLE `structure`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `structure_chars`
--
ALTER TABLE `structure_chars`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `treners`
--
ALTER TABLE `treners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `vid_sporta`
--
ALTER TABLE `vid_sporta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `sportsmen_sorevnovaniya_ibfk_1` FOREIGN KEY (`id_sorevnovaniya`) REFERENCES `sorevnovaniya` (`id`),
  ADD CONSTRAINT `sportsmen_sorevnovaniya_ibfk_2` FOREIGN KEY (`id_sportsmen`) REFERENCES `sportsmen` (`id`);

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
-- Ограничения внешнего ключа таблицы `vid_sporta`
--
ALTER TABLE `vid_sporta`
  ADD CONSTRAINT `vid_sporta_ibfk_1` FOREIGN KEY (`id_treners`) REFERENCES `treners` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
