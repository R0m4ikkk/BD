-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Ноя 21 2022 г., 13:28
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_efremov4559_60591erv`
--

-- --------------------------------------------------------

--
-- Структура таблицы `car`
--

CREATE TABLE `car` (
  `id` int UNSIGNED NOT NULL,
  `model_id` int UNSIGNED NOT NULL,
  `model_name` varchar(300) NOT NULL COMMENT 'Модель',
  `color` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'цвет',
  `gearbox` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'тип коробки',
  `consumption` int UNSIGNED NOT NULL COMMENT 'расход топлива',
  `power` int UNSIGNED NOT NULL COMMENT 'мощность',
  `Year` int UNSIGNED NOT NULL COMMENT 'год выпуска',
  `rent` int UNSIGNED NOT NULL COMMENT 'сколько раз брали',
  `mileage` int UNSIGNED NOT NULL COMMENT 'пробег'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='конкретный автомобиль';

--
-- Дамп данных таблицы `car`
--

INSERT INTO `car` (`id`, `model_id`, `model_name`, `color`, `gearbox`, `consumption`, `power`, `Year`, `rent`, `mileage`) VALUES
(5, 7, 'рио', 'blACK', 'avtomat', 9, 90, 2021, 1, 10),
(6, 6, 'Веста', 'White', 'MT', 10, 100, 2022, 1, 1000);

-- --------------------------------------------------------

--
-- Структура таблицы `car_model`
--

CREATE TABLE `car_model` (
  `id` int UNSIGNED NOT NULL,
  `price` int UNSIGNED NOT NULL COMMENT 'Стоимость аренды',
  `Brand_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Марка'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Автопарк в целом(модели)';

--
-- Дамп данных таблицы `car_model`
--

INSERT INTO `car_model` (`id`, `price`, `Brand_name`) VALUES
(6, 10000, 'Лада'),
(7, 5000, 'Kia');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int UNSIGNED NOT NULL,
  `id_car` int UNSIGNED NOT NULL,
  `id_user` int UNSIGNED NOT NULL,
  `start_rent` datetime NOT NULL COMMENT 'начало аренды',
  `stop_rent` datetime NOT NULL COMMENT 'конец аренды',
  `Fact_stop_rent` datetime NOT NULL COMMENT 'фактическое время окончания аренды',
  `comment` varchar(300) NOT NULL COMMENT 'замечания к авто'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='карточка аренды(документ)';

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `id_car`, `id_user`, `start_rent`, `stop_rent`, `Fact_stop_rent`, `comment`) VALUES
(2, 6, 1, '2022-11-13 18:00:00', '2022-11-20 18:00:00', '2022-11-21 17:30:00', 'Замечаний к авто нет. Вернул вовремя.');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `firstname` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Имя',
  `lastname` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Фамилия',
  `age` int NOT NULL COMMENT 'Возраст',
  `login` varchar(300) NOT NULL COMMENT 'логин пользователя',
  `password` int NOT NULL COMMENT 'Пароль',
  `is_admin` tinyint(1) DEFAULT NULL COMMENT 'является адм?'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Клиенты';

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `age`, `login`, `password`, `is_admin`) VALUES
(1, 'Вася', 'Пупкин', 21, 'pupok_01', 12345, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_id` (`model_id`);

--
-- Индексы таблицы `car_model`
--
ALTER TABLE `car_model`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_car` (`id_car`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `car`
--
ALTER TABLE `car`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `car_model`
--
ALTER TABLE `car_model`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `car_model` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_car`) REFERENCES `car` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
