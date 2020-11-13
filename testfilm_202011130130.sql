--
-- Скрипт сгенерирован Devart dbForge Studio 2020 for MySQL, Версия 9.0.435.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 13.11.2020 1:30:16
-- Версия сервера: 10.5.6
-- Версия клиента: 4.1
--

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Установка базы данных по умолчанию
--
USE testfilm;

--
-- Удалить таблицу `age_rating`
--
DROP TABLE IF EXISTS age_rating;

--
-- Удалить таблицу `genre`
--
DROP TABLE IF EXISTS genre;

--
-- Удалить таблицу `producer`
--
DROP TABLE IF EXISTS producer;

--
-- Удалить таблицу `session`
--
DROP TABLE IF EXISTS session;

--
-- Удалить таблицу `film`
--
DROP TABLE IF EXISTS film;

--
-- Удалить таблицу `hall`
--
DROP TABLE IF EXISTS hall;

--
-- Установка базы данных по умолчанию
--
USE testfilm;

--
-- Создать таблицу `hall`
--
CREATE TABLE hall (
  id int(11) NOT NULL AUTO_INCREMENT,
  Name varchar(50) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 11,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать таблицу `film`
--
CREATE TABLE film (
  id int(11) NOT NULL AUTO_INCREMENT,
  NameFilm varchar(255) NOT NULL,
  Genre_id int(11) NOT NULL,
  Duration varchar(255) NOT NULL,
  ageRating_id int(11) NOT NULL,
  Comment varchar(255) NOT NULL,
  Producer_id int(11) NOT NULL,
  Year varchar(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 21,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать таблицу `session`
--
CREATE TABLE session (
  id int(11) NOT NULL AUTO_INCREMENT,
  Date_time varchar(255) NOT NULL,
  Number_hall_id int(11) NOT NULL,
  Film_id int(11) NOT NULL,
  cost varchar(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 11,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE session
ADD CONSTRAINT FK_session_Film FOREIGN KEY (Film_id)
REFERENCES film (id) ON DELETE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE session
ADD CONSTRAINT FK_session_Number_hall FOREIGN KEY (Number_hall_id)
REFERENCES hall (id) ON DELETE NO ACTION;

--
-- Создать таблицу `producer`
--
CREATE TABLE producer (
  id int(11) NOT NULL AUTO_INCREMENT,
  Name varchar(50) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 10,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать таблицу `genre`
--
CREATE TABLE genre (
  id int(11) NOT NULL AUTO_INCREMENT,
  Name varchar(50) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 14,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать таблицу `age_rating`
--
CREATE TABLE age_rating (
  id int(11) NOT NULL AUTO_INCREMENT,
  Name varchar(50) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 9,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

-- 
-- Вывод данных для таблицы hall
--
INSERT INTO hall VALUES
(3, 'small'),
(6, 'big'),
(7, 'small2'),
(8, 'middle'),
(9, 'маленький'),
(10, 'Аниме');

-- 
-- Вывод данных для таблицы film
--
INSERT INTO film VALUES
(2, 'Cowboy bebop', 13, '15:15', 4, 'good', 2, '666'),
(14, 'How train your dragon 3', 6, '1,45', 2, 'dragon', 3, '2019'),
(15, 'Demon’s Souls', 6, '2400', 4, 'dark', 2, '2009'),
(16, 'The Mandalorian', 10, '46', 6, 'star wars', 5, '2019'),
(17, 'Drive', 9, '1.40', 4, 'R', 6, '2011'),
(18, 'Transformers: Dark of the Moon', 6, '2.05', 6, 'e', 7, '2011'),
(19, 'Сталкер', 6, '2,43', 6, 'В этой ленте, снятой по мотивам повести братьев Стругацких «Пикник на обочине», действие происходит в некой запретной Зоне, где, по слухам, существует комната, где исполняются самые заветные желания.', 8, '1979'),
(20, 'Ходячий замок', 13, '1,19', 2, 'Злая ведьма заточила 18-летнюю Софи в тело старухи. Девушка-бабушка бежит из города куда глаза глядят и встречает удивительный дом на ножках, где знакомится с могущественным волшебником Хаулом и демоном Кальцифером. ', 9, '2004');

-- 
-- Вывод данных для таблицы session
--
INSERT INTO session VALUES
(3, '18.09.2020 0:00:00', 3, 2, '400'),
(4, '01.06.2019 0:00:00', 6, 14, '200'),
(5, '08.06.2009 0:00:00', 3, 15, '2200'),
(6, '16.11.2020 0:00:00', 8, 17, '150'),
(7, '02.10.2020 0:00:00', 6, 16, '200'),
(8, '08.11.2020 9:59:59', 6, 18, '300'),
(9, '03.06.2020 20:00:00', 9, 19, '150'),
(10, '13.01.2020 15:00:00', 10, 20, '300');

-- 
-- Вывод данных для таблицы producer
--
INSERT INTO producer VALUES
(1, 'Mia'),
(2, 'Hidetaka Miyazaki'),
(3, 'Ruslan'),
(5, 'Jon Favreau'),
(6, 'Michel Litvak'),
(7, 'Michael Bay'),
(8, 'Андрей Тарковский'),
(9, 'Хаяо Миядзаки');

-- 
-- Вывод данных для таблицы genre
--
INSERT INTO genre VALUES
(3, 'neonuar'),
(6, 'fantasy'),
(8, 'dark fantasy'),
(9, 'triller'),
(10, 'science fiction'),
(11, 'criminal'),
(12, 'комедия'),
(13, 'Аниме');

-- 
-- Вывод данных для таблицы age_rating
--
INSERT INTO age_rating VALUES
(1, '1+'),
(2, '6+'),
(4, '18+'),
(6, '16+'),
(7, '0+'),
(8, '12+');

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
--
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;