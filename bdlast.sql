-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.5.53 - MySQL Community Server (GPL)
-- Операционная система:         Win32
-- HeidiSQL Версия:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных dbsewing
DROP DATABASE IF EXISTS `dbsewing`;
CREATE DATABASE IF NOT EXISTS `dbsewing` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbsewing`;

-- Дамп структуры для таблица dbsewing.sew_categories
DROP TABLE IF EXISTS `sew_categories`;
CREATE TABLE IF NOT EXISTS `sew_categories` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '№ курса',
  `name` varchar(200) NOT NULL COMMENT 'Наименование',
  `content` text NOT NULL COMMENT 'Содержание',
  `comments_on` tinyint(1) DEFAULT '0' COMMENT 'Отзывы разрешены',
  `description` varchar(300) NOT NULL COMMENT 'Описание краткое',
  `bgcolor` char(7) NOT NULL DEFAULT '#607D8B' COMMENT 'Цвет',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Опубликован',
  `cena` float DEFAULT '0' COMMENT 'Цена',
  `date_start` varchar(10) DEFAULT NULL COMMENT 'Дата начала',
  `date_end` varchar(10) DEFAULT NULL COMMENT 'Дата окончания',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dbsewing.sew_categories: ~5 rows (приблизительно)
DELETE FROM `sew_categories`;
/*!40000 ALTER TABLE `sew_categories` DISABLE KEYS */;
INSERT INTO `sew_categories` (`id`, `name`, `content`, `comments_on`, `description`, `bgcolor`, `published`, `cena`, `date_start`, `date_end`);
/*!40000 ALTER TABLE `sew_categories` ENABLE KEYS */;

-- Дамп структуры для таблица dbsewing.sew_formus
DROP TABLE IF EXISTS `sew_formus`;
CREATE TABLE IF NOT EXISTS `sew_formus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '№ сообщения/заявки',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Имя',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Фамилия',
  `categoriya_id` mediumint(8) unsigned DEFAULT NULL COMMENT '№ Курса',
  `email` varchar(50) DEFAULT NULL COMMENT 'Email',
  `phone` varchar(20) DEFAULT NULL COMMENT 'Телефон',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '№ пользователя',
  `message` text COMMENT 'Сообщения',
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `viewed` tinyint(4) DEFAULT '0' COMMENT 'Отметка о просмотре',
  PRIMARY KEY (`id`),
  KEY `inxdx_categoriya_id` (`categoriya_id`),
  KEY `indx_user_id` (`user_id`),
  CONSTRAINT `FK_sew_formus_sew_categories` FOREIGN KEY (`categoriya_id`) REFERENCES `sew_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sew_formus_sew_users` FOREIGN KEY (`user_id`) REFERENCES `sew_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dbsewing.sew_formus: ~11 rows (приблизительно)
DELETE FROM `sew_formus`;
/*!40000 ALTER TABLE `sew_formus` DISABLE KEYS */;
INSERT INTO `sew_formus` (`id`, `firstname`, `lastname`, `categoriya_id`, `email`, `phone`, `user_id`, `message`, `createdate`, `viewed`) VALUES
	(5, 'r3r3r', '3r3r3', NULL, 'r3r3rr33@ddgdg.yt', '4343453535', NULL, 'ghfhfhfhfhshfshshsfhshs', '2017-02-13 04:38:17', 1),
	(6, 'dfghjkljhgfdsasdfghj', 'zxcvbnmkl;lkjhgf', NULL, 'sdfghjgfdsadf@hdhddhd.ru', '244242424', NULL, 'fbbgdsgsdgdsgsg', '2017-03-18 10:34:29', 1);
/*!40000 ALTER TABLE `sew_formus` ENABLE KEYS */;

-- Дамп структуры для таблица dbsewing.sew_groups
DROP TABLE IF EXISTS `sew_groups`;
CREATE TABLE IF NOT EXISTS `sew_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '№ группы',
  `name` varchar(20) NOT NULL COMMENT 'Наименование',
  `description` varchar(100) NOT NULL COMMENT 'Описание',
  `bgcolor` char(7) NOT NULL DEFAULT '#607D8B' COMMENT 'Цвет',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dbsewing.sew_groups: ~3 rows (приблизительно)
DELETE FROM `sew_groups`;
/*!40000 ALTER TABLE `sew_groups` DISABLE KEYS */;
INSERT INTO `sew_groups` (`id`, `name`, `description`, `bgcolor`) VALUES
	(1, 'admin', 'Администратор', '#f44336'),
	(2, 'students', 'Студенты курса имеют доступ только в личному кабинету и подписанным курсам', '#2196f3'),
	(3, 'teacher', 'Преподаватели', '#9c27b0');
/*!40000 ALTER TABLE `sew_groups` ENABLE KEYS */;

-- Дамп структуры для таблица dbsewing.sew_lessons
DROP TABLE IF EXISTS `sew_lessons`;
CREATE TABLE IF NOT EXISTS `sew_lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '№ урока',
  `name` varchar(300) NOT NULL COMMENT 'Наименование',
  `content` text COMMENT 'Содержание',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создани',
  `teacher_id` int(11) DEFAULT NULL COMMENT '№ преподавателя',
  `edited` timestamp NULL DEFAULT NULL COMMENT 'Дата изменения',
  `published` tinyint(4) DEFAULT '0' COMMENT 'Опубликовано',
  `short_content` text COMMENT 'Краткое описание',
  `author` varchar(255) DEFAULT NULL COMMENT 'Автор',
  `editor` varchar(255) DEFAULT NULL COMMENT 'Редактор',
  `comments_on` tinyint(1) DEFAULT '0' COMMENT 'Комментарии разрешены',
  `image` varchar(255) DEFAULT NULL COMMENT 'Фото',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dbsewing.sew_lessons: ~6 rows (приблизительно)
DELETE FROM `sew_lessons`;
/*!40000 ALTER TABLE `sew_lessons` DISABLE KEYS */;
INSERT INTO `sew_lessons` (`id`, `name`, `content`, `created`, `teacher_id`, `edited`, `published`, `short_content`, `author`, `editor`, `comments_on`, `image`) VALUES
		(8, 'zxcvnnm,./', '<p>xcvbnm,</p>', '2017-03-10 00:46:52', 3, NULL, 1, '<p>zxcvbnm,</p>', 'Иван Иванов', NULL, 1, 'http://englishcourse/upload/images/3273-600x398.jpg');
/*!40000 ALTER TABLE `sew_lessons` ENABLE KEYS */;

-- Дамп структуры для таблица dbsewing.sew_lessons_categories
DROP TABLE IF EXISTS `sew_lessons_categories`;
CREATE TABLE IF NOT EXISTS `sew_lessons_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '№ связи',
  `lesson_id` int(11) NOT NULL COMMENT '№ урока',
  `categoriya_id` mediumint(8) unsigned NOT NULL COMMENT '№курса',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_les_cat` (`categoriya_id`,`lesson_id`),
  KEY `Индекс 3` (`lesson_id`),
  KEY `Индекс 4` (`categoriya_id`),
  CONSTRAINT `FK_sew_lessons_categories_sew_categories` FOREIGN KEY (`categoriya_id`) REFERENCES `sew_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sew_lessons_categories_sew_lessons` FOREIGN KEY (`lesson_id`) REFERENCES `sew_lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dbsewing.sew_lessons_categories: ~6 rows (приблизительно)
DELETE FROM `sew_lessons_categories`;
/*!40000 ALTER TABLE `sew_lessons_categories` DISABLE KEYS */;
INSERT INTO `sew_lessons_categories` (`id`, `lesson_id`, `categoriya_id`) VALUES
	(37, 3, 4),
	(38, 5, 4),
	(30, 7, 6),
	(29, 8, 6),
	(39, 4, 7),
	(40, 6, 7);
/*!40000 ALTER TABLE `sew_lessons_categories` ENABLE KEYS */;

-- Дамп структуры для таблица dbsewing.sew_users
DROP TABLE IF EXISTS `sew_users`;
CREATE TABLE IF NOT EXISTS `sew_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '№ пользователя',
  `ip_address` varchar(15) NOT NULL COMMENT 'IP адрес',
  `username` varchar(100) NOT NULL COMMENT 'Логин',
  `password` varchar(255) DEFAULT NULL COMMENT 'Пароль',
  `email` varchar(100) NOT NULL COMMENT 'Email',
  `activation_code` varchar(40) DEFAULT NULL COMMENT 'Код активации',
  `forgotten_password_code` varchar(40) DEFAULT NULL COMMENT 'Код вспомнить пароль',
  `forgotten_password_time` int(11) unsigned DEFAULT NULL COMMENT 'Дата кода вспомнить пароль',
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL COMMENT 'Дата создания',
  `last_login` int(11) unsigned DEFAULT NULL COMMENT 'Дата последнего входа',
  `active` tinyint(1) unsigned DEFAULT NULL COMMENT 'Активен',
  `first_name` varchar(50) DEFAULT NULL COMMENT 'Имя',
  `last_name` varchar(50) DEFAULT NULL COMMENT 'Фамилия',
  `skype` varchar(100) DEFAULT NULL COMMENT 'Skype',
  `phone` varchar(20) DEFAULT NULL COMMENT 'Телефон',
  `salt` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dbsewing.sew_users: ~3 rows (приблизительно)
DELETE FROM `sew_users`;
/*!40000 ALTER TABLE `sew_users` DISABLE KEYS */;
INSERT INTO `sew_users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `skype`, `phone`, `salt`) VALUES
	(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', 'admin@englishcourse.by', '', 'mspSP.ljSmmNCWYMhSG9n.7664b0911b3c7529ff', 1491915107, 'VRJs3xyPxSlZTgZZ3zvKMe', 1268889823, 1492004439, 1, 'Иван', 'Иванов', 'админы', '7957686754213', NULL),
	(2, '127.0.0.1', '', '$2y$08$TCFJ5LNTVQQ1B3TyNjQcZehob2vb1ShIHHpWum2oRMACeAVssR8Ky', 'stud@mrk.by', NULL, NULL, NULL, NULL, 1486944279, 1492004204, 1, 'Алексе', 'Петров', 'Невозмоная', '232323766', NULL),
	(3, '127.0.0.1', '', '$2y$08$Tp9WHl63wUiqzYxIy3HpEOtlCEPLOxUtoykx1F0QraPdXvlv4jvui', 'elena@english.by', NULL, NULL, NULL, NULL, 1491976933, 1491977250, 1, 'Алла', 'Федорова', 'allla', '4444444444', NULL);
/*!40000 ALTER TABLE `sew_users` ENABLE KEYS */;

-- Дамп структуры для таблица dbsewing.sew_users_categories
DROP TABLE IF EXISTS `sew_users_categories`;
CREATE TABLE IF NOT EXISTS `sew_users_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '№ связи',
  `user_id` int(11) unsigned NOT NULL COMMENT '№пользователя',
  `categoriya_id` mediumint(8) unsigned NOT NULL COMMENT '№курса',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_categoriya` (`user_id`,`categoriya_id`),
  KEY `fk_users_categoriya_users1_idx` (`user_id`),
  KEY `fk_users_categoriya_categoriya1_idx` (`categoriya_id`),
  CONSTRAINT `FK_sew_users_categories_sew_categories` FOREIGN KEY (`categoriya_id`) REFERENCES `sew_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sew_users_categories_sew_users` FOREIGN KEY (`user_id`) REFERENCES `sew_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Дамп данных таблицы dbsewing.sew_users_categories: ~4 rows (приблизительно)
DELETE FROM `sew_users_categories`;
/*!40000 ALTER TABLE `sew_users_categories` DISABLE KEYS */;
INSERT INTO `sew_users_categories` (`id`, `user_id`, `categoriya_id`) VALUES
	(7, 1, 6),
	(10, 2, 4),
	(11, 2, 6),
	(12, 2, 7);
/*!40000 ALTER TABLE `sew_users_categories` ENABLE KEYS */;

-- Дамп структуры для таблица dbsewing.sew_users_groups
DROP TABLE IF EXISTS `sew_users_groups`;
CREATE TABLE IF NOT EXISTS `sew_users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '№ связи',
  `user_id` int(11) unsigned NOT NULL COMMENT '№ пользователя',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '№ группы',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `sew_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `sew_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dbsewing.sew_users_groups: ~3 rows (приблизительно)
DELETE FROM `sew_users_groups`;
/*!40000 ALTER TABLE `sew_users_groups` DISABLE KEYS */;
INSERT INTO `sew_users_groups` (`id`, `user_id`, `group_id`) VALUES
	(9, 1, 1),
	(6, 2, 2),
	(11, 3, 3);
/*!40000 ALTER TABLE `sew_users_groups` ENABLE KEYS */;

-- Дамп структуры для таблица dbsewing.sew_user_categories_comment
DROP TABLE IF EXISTS `sew_user_categories_comment`;
CREATE TABLE IF NOT EXISTS `sew_user_categories_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '№ отзыва',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '№ пользователя',
  `categoriya_id` mediumint(8) unsigned DEFAULT NULL COMMENT '№ курса',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `content` text COMMENT 'Содержание',
  `published` tinyint(4) DEFAULT '0' COMMENT 'Опубликован',
  PRIMARY KEY (`id`),
  KEY `FK_sew_user_categories_comment_sew_users` (`user_id`),
  KEY `FK_sew_user_categories_comment_sew_categories` (`categoriya_id`),
  CONSTRAINT `FK_sew_user_categories_comment_sew_categories` FOREIGN KEY (`categoriya_id`) REFERENCES `sew_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sew_user_categories_comment_sew_users` FOREIGN KEY (`user_id`) REFERENCES `sew_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dbsewing.sew_user_categories_comment: ~1 rows (приблизительно)
DELETE FROM `sew_user_categories_comment`;
/*!40000 ALTER TABLE `sew_user_categories_comment` DISABLE KEYS */;
INSERT INTO `sew_user_categories_comment` (`id`, `user_id`, `categoriya_id`, `created`, `content`, `published`);
	
/*!40000 ALTER TABLE `sew_user_categories_comment` ENABLE KEYS */;

-- Дамп структуры для таблица dbsewing.sew_user_lessons_categories
DROP TABLE IF EXISTS `sew_user_lessons_categories`;
CREATE TABLE IF NOT EXISTS `sew_user_lessons_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '№ задания',
  `lesson_id` int(11) NOT NULL COMMENT '№ урока',
  `categoriya_id` mediumint(8) unsigned NOT NULL COMMENT '№ курса',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `teacher_id` int(11) unsigned DEFAULT NULL COMMENT '№ преподавателя',
  `content` text COMMENT 'Содержание задания',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_user_les_cat` (`categoriya_id`,`lesson_id`,`teacher_id`),
  KEY `FK_sew_user_lessons_categories_sew_lessons` (`lesson_id`),
  KEY `FK_sew_user_lessons_categories_sew_categories` (`categoriya_id`),
  KEY `FK_sew_user_lessons_categories_sew_users_2` (`teacher_id`),
  CONSTRAINT `FK_sew_user_lessons_categories_sew_categories` FOREIGN KEY (`categoriya_id`) REFERENCES `sew_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sew_user_lessons_categories_sew_lessons` FOREIGN KEY (`lesson_id`) REFERENCES `sew_lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sew_user_lessons_categories_sew_users_2` FOREIGN KEY (`teacher_id`) REFERENCES `sew_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dbsewing.sew_user_lessons_categories: ~3 rows (приблизительно)
DELETE FROM `sew_user_lessons_categories`;
/*!40000 ALTER TABLE `sew_user_lessons_categories` DISABLE KEYS */;
INSERT INTO `sew_user_lessons_categories` (`id`, `lesson_id`, `categoriya_id`, `created`, `teacher_id`, `content`) VALUES
	(2, 3, 4, '2017-03-24 01:11:37', 3, '<p>вчаспмритьбж.тимисмить.</p>');
/*!40000 ALTER TABLE `sew_user_lessons_categories` ENABLE KEYS */;

-- Дамп структуры для таблица dbsewing.sew_user_lessons_categories_values
DROP TABLE IF EXISTS `sew_user_lessons_categories_values`;
CREATE TABLE IF NOT EXISTS `sew_user_lessons_categories_values` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '№ связи',
  `user_lessons_categories_id` int(11) unsigned NOT NULL COMMENT '№ задания',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `ocenka` mediumint(8) DEFAULT '0' COMMENT 'Оценка в баллах',
  `done` tinyint(1) DEFAULT '0' COMMENT 'Зачтено',
  `homework` text COMMENT 'Ссылка на выполненное задание',
  `student_id` int(11) unsigned NOT NULL COMMENT '№ студента',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Student_ocenka` (`user_lessons_categories_id`,`student_id`),
  KEY `FK_sew_user_lessons_categories_values_sew_users` (`student_id`),
  KEY `FK_user_lessons_categories_id` (`user_lessons_categories_id`),
  CONSTRAINT `FK_sew_user_lessons_categories_iid` FOREIGN KEY (`user_lessons_categories_id`) REFERENCES `sew_user_lessons_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sew_user_lessons_categories_values_sew_users` FOREIGN KEY (`student_id`) REFERENCES `sew_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Дамп данных таблицы dbsewing.sew_user_lessons_categories_values: ~4 rows (приблизительно)
DELETE FROM `sew_user_lessons_categories_values`;
/*!40000 ALTER TABLE `sew_user_lessons_categories_values` DISABLE KEYS */;
INSERT INTO `sew_user_lessons_categories_values` (`id`, `user_lessons_categories_id`, `created`, `ocenka`, `done`, `homework`, `student_id`) VALUES
	(5, 2, '2017-04-11 16:42:25', 7, 1, '', 1),
	(6, 6, '2017-04-12 08:06:00', 0, 0, 'dfghgfdfghhgfdfghj', 2),
	(7, 2, '2017-04-12 16:37:26', 4, 1, 'fghjdjjdj', 2),
	(8, 4, '2017-04-12 16:37:35', 5, 1, 'fdhdfhfhd', 2);
/*!40000 ALTER TABLE `sew_user_lessons_categories_values` ENABLE KEYS */;

-- Дамп структуры для таблица dbsewing.sew_user_lessons_comment
DROP TABLE IF EXISTS `sew_user_lessons_comment`;
CREATE TABLE IF NOT EXISTS `sew_user_lessons_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '№ комментария',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '№ пользователя',
  `lesson_id` int(11) DEFAULT NULL COMMENT '№ урока',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `content` text COMMENT 'Содержание',
  `published` tinyint(4) DEFAULT '0' COMMENT 'Опубликован',
  PRIMARY KEY (`id`),
  KEY `FK_sew_user_lessons_comment_sew_users` (`user_id`),
  KEY `FK_sew_user_lessons_comment_sew_lessons` (`lesson_id`),
  CONSTRAINT `FK_sew_user_lessons_comment_sew_lessons` FOREIGN KEY (`lesson_id`) REFERENCES `sew_lessons` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sew_user_lessons_comment_sew_users` FOREIGN KEY (`user_id`) REFERENCES `sew_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dbsewing.sew_user_lessons_comment: ~13 rows (приблизительно)
DELETE FROM `sew_user_lessons_comment`;
/*!40000 ALTER TABLE `sew_user_lessons_comment` DISABLE KEYS */;
INSERT INTO `sew_user_lessons_comment` (`id`, `user_id`, `lesson_id`, `created`, `content`, `published`) VALUES
	(1, NULL, 3, '2017-03-22 18:28:43', 'sdfsf', 1),
	(2, 2, 3, '2017-03-22 18:31:42', 'sdfsf', 1);
/*!40000 ALTER TABLE `sew_user_lessons_comment` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
