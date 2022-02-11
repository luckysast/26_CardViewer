-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: service
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('admin','1',1525606922);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('admin',1,'Администратор',NULL,NULL,1525606922,1525606922),('guest',1,'Посетитель',NULL,NULL,1525606922,1525606922),('user',1,'Участник',NULL,NULL,1525606922,1525606922);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('admin','user'),('user','guest');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'AMD'),(1,'NVIDIA');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ',
  `id_product` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `text` text,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments-product` (`id_product`),
  KEY `comments-user` (`id_user`),
  CONSTRAINT `comments-product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments-user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1525606836),('m140506_102106_rbac_init',1525606907),('m170907_052038_rbac_add_index_on_auth_assignment_user_id',1525606907),('m180429_043324_addAllTables',1525606921),('m180506_111803_AddRoles',1525606922),('m180529_062128_addReviewsTable',1527575270);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ',
  `id_owner` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `text` text,
  PRIMARY KEY (`id`),
  KEY `notes-owner` (`id_owner`),
  KEY `notes-user` (`id_user`),
  CONSTRAINT `notes-owner` FOREIGN KEY (`id_owner`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notes-user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ',
  `id_category` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `preview` text,
  `description` text,
  `images` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `category-product` (`id_category`),
  CONSTRAINT `category-product` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'GeForce GTX 1050 Ti','Уже прошло достаточно много времени, после того как появилось ядро первого поколения – Maxwell. За всё это время nVidia не отдыхали, и предоставили замену таким моделям, как GeForce GTX 750 и GTX 750 Ti. Хотя они и обладали хорошей скоростью и были энергоемкими, но прогресс на этом не остановился.','<h3>Характеристики GPU</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Ядер CUDA</td>\r\n										<td class=\"TD2\">768</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Базовая тактовая частота</td>\r\n										<td class=\"TD2\">1290 MHz</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тактовая частота с ускорением</td>\r\n										<td class=\"TD2\">1392 MHz</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Архитектура GPU</td>\r\n										<td class=\"TD2\">Pascal</td>\r\n									</tr>\r\n								</table>\r\n					<h3>Характеристики памяти</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\'>\r\n									<tr>\r\n										<td class=\"TD1\">Быстродействие памяти</td>\r\n										<td class=\"TD2\">7 Gbps</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Стандартная конфигурация памяти</td>\r\n										<td class=\"TD2\">4 GB GDDR5</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Полоса пропускания шины памяти</td>\r\n										<td class=\"TD2\">128-bit</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Пропускная способность памяти</td>\r\n										<td class=\"TD2\">112 GB/sec</td>\r\n									</tr>\r\n								</table>\r\n					<h3>Поддержка технологий:</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\'>\r\n									<tr>\r\n										<td class=\"TD1\">Мультипроекция</td>\r\n										<td class=\"TD2\">Да</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Поддержка VR</td>\r\n										<td class=\"TD2\">Нет</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Ansel</td>\r\n										<td class=\"TD2\">Да</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Да</td>\r\n										<td class=\"TD2\">Нет</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">G-Sync</td>\r\n										<td class=\"TD2\">Да</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">GameStream</td>\r\n										<td class=\"TD2\">Да</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">GPU Boost</td>\r\n										<td class=\"TD2\">3.0</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">DirectX</td>\r\n										<td class=\"TD2\">12 API with feature level 12_1</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Vulkan API</td>\r\n										<td class=\"TD2\">Да</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">OpenGL</td>\r\n										<td class=\"TD2\">4.5</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Шина</td>\r\n										<td class=\"TD2\">PCIe 3.0</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Поддержка ОС</td>\r\n										<td class=\"TD2\">Windows 7-10, Linux, FreeBSDx86</td>\r\n									</tr>\r\n								</table>\r\n				<h3>Мощность и температура:</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\'>\r\n									<tr>\r\n										<td class=\"TD1\">Максимальная температура GPU</td>\r\n										<td class=\"TD2\">97C</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Потребление энергии</td>\r\n										<td class=\"TD2\">75 W</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Рекомендованные требования по питанию</td>\r\n										<td class=\"TD2\">300 W</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Дополнительные разъемы питания</td>\r\n										<td class=\"TD2\">Нет</td>\r\n									</tr>\r\n								</table>\r\n<h3>Производители</h3>\r\n<h4>MSI GeForce GTX 1050 Ti OC</h4>\r\n<p>Видеокарта от MSI оснащена одним вентилятором. Выполнена она из черного пластика с белыми вставками. Для работы видеокарты будет достаточно блока питания мощностью от 300 ватт. Также она практически не выделяет тепла, что не может не радовать.\r\nЕсли говорить о характеристиках, то она имеет 4гб видеопамяти с частотой 7008 МГц и 128 битной шиной.\r\nГрафический процессор работает на частоте 1341 МГц. Можно разогнать до 1455 МГц. Но греется она прилично, и поэтому если охлаждение плохое, лучше не баловаться с разгоном.</p>\r\n\r\n<h4>GIGABYTE GeForce GTX 1050 Ti</h4>\r\n<p>Этот бренд всегда предоставляет видеоадаптеры по низкой цене и имеющие высокую производительность, но не в этот раз. К дизайну вопросов нет. Имеется два вентилятора. Но вот параметры на сей раз не радуют. Графический чип GP107-300 – далеко не самый лучший. Графический процессор работает на частоте 1379 Мгц. Объём видеопамяти всего 2 гигабайта, а частота 7008 МГц.\r\nИмеется два режима разгона: игровой (до 1493Мгц) и OC (до 1518 МГц). Эти показатели выше чем у MSI, но в играх она лишь совсем немного мощнее своих конкурентов.</p>\r\n\r\n<h4>Palit GeForce GTX 1050 Ti</h4>\r\n<p>Она компактна, и легко устанавливается в корпуса небольших размеров. На ней имеется один кулер. Корпус изготовлен из пластика черного цвета. На нем присутствует логотип компании. Графический процессор работает на частоте 1290 МГц. Видеопамять имеет объем 4 гигабайта с частотой до 7000МГц.\r\nЭнергии она потребляет мало, следовательно тепла выделяет тоже немного. Одного кулера хватит для охлаждения. Можно разгонять до 1392 МГц, прирост будет достаточный для онлайн игр.</p>\r\n\r\n<h4>ASUS ROG Strix</h4>\r\n<p>Единственная из вышеперечисленных версий 1050 Ti, на которой имеется 6-пиновый разъём для дополнительного питания. Это значит, что карточка от Асус Стрикс пригодна для разгона.\r\nОхлаждение представлено двумя вентиляторами. Заднюю панель закрывает стилизованный под серию ROG металлиический бэкплэйт (backplate). Подсветка отсутствует. Комплектация отличается наличием двух наклеек для корпуса. Самое интересное в этой видеокарте — возможность разгона.</p>','/img/1050ti/0.jpg,/img/1050ti/1.jpg,/img/1050ti/2.jpg,/img/1050ti/3.jpg,/img/1050ti/4.jpg,/img/1050ti/5.jpg,/img/1050ti/6.jpg,/img/1050ti/7.jpg,/img/1050ti/8.jpg'),(2,2,'Radeon RX 550X','Radeon RX 550 пришел на смену розничной модели Radeon R7 350 и нескольким OEM-позициям нижнего уровня в 300-й и 400-й серии. Во всех них используются GPU Cape Verde и Olland образца 2012–2013 года, произведенные по норме 28 нм. Как следствие, от Radeon RX 550 можно ожидать серьезного рывка в производительности и энергоэффективности за счет усовершенствований архитектуры GCN и нового полупроводникового техпроцесса. Polaris содержит и функциональные нововведения, востребованные в нише HTPC (Home Theater PC), — поддержку новых интерфейсов вывода изображения и декодирование форматов видео HEVC и VP9.','<h3>Характеристики GPU</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Название</td>\r\n										<td class=\"TD2\">Polaris 12</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Микроархитектура</td>\r\n										<td class=\"TD2\">GCN 1.3</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Техпроцесс, нм</td>\r\n										<td class=\"TD2\">14 нм FinFET</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число транзисторов, млн</td>\r\n										<td class=\"TD2\">2200</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тактовая частота, МГц: Base Clock / Boost Clock</td>\r\n										<td class=\"TD2\">1100/1183</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число шейдерных ALU</td>\r\n										<td class=\"TD2\">512</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число блоков наложения текстур</td>\r\n										<td class=\"TD2\">32</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число ROP</td>\r\n										<td class=\"TD2\">16</td>\r\n									</tr>\r\n								</table>\r\n					<h3>Характеристики памяти</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Разрядность шины, бит</td>\r\n										<td class=\"TD2\">128</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тип микросхем</td>\r\n										<td class=\"TD2\">GDDR5 SDRAM</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тактовая частота, МГц (пропускная способность на контакт, Мбит/с)</td>\r\n										<td class=\"TD2\">1750 (7000)</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Объем, Мбайт</td>\r\n										<td class=\"TD2\">2048/4096</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Шина ввода/вывода</td>\r\n										<td class=\"TD2\">PCI Express 3.0 x8</td>\r\n									</tr>\r\n								</table>\r\n					<h3>Производительность</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Пиковая производительность FP32, GFLOPS (из расчета максимальной указанной частоты)</td>\r\n										<td class=\"TD2\">1211</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Производительность FP32/FP64</td>\r\n										<td class=\"TD2\">1/16</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Пропускная способность оперативной памяти, Гбайт/с</td>\r\n										<td class=\"TD2\">112</td>\r\n									</tr>\r\n								</table>\r\n				<h3>Вывод изображения</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Интерфейсы вывода изображения</td>\r\n										<td class=\"TD2\">DL DVI, HDMI 2.0b, DisplayPort 1.3/1.4</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">TDP, Вт</td>\r\n										<td class=\"TD2\">50</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Розничная цена (США, без налога), $</td>\r\n										<td class=\"TD2\">79 (рекомендованная на момент выхода)</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Розничная цена (Россия), руб.</td>\r\n										<td class=\"TD2\">5 369 (рекомендованная на момент выхода)</td>\r\n									</tr>\r\n								</table>\r\n								\r\n<p>В основе Radeon RX 550 лежит графический процессор Polaris 12. По названию чипа может сложиться впечатление, что он относится к первому поколению Polaris, наряду с Polaris 10 и Polaris 11, которые использовались в серии Radeon RX 400. Тем не менее это новый GPU, и вряд ли AMD упустила возможность заложить в него все преимущества оптимизированной схемотехники и фотолитографии, которыми обладают чипы Polaris второго поколения.</p>\r\n\r\n<p>Так как AMD долгое время не занималась развитием младшего сегмента дискретных GPU, Polaris 12 во всех отношениях представляет большой шаг вперед и по сравнению с предыдущим GPU стартового уровня — Olland. По конфигурации архитектурных элементов (512 шейдерных ALU и 64 блока наложения текстур, распределенные по 8 Compute Units) Polaris 12 выглядит как половина следующего по рангу GPU — Polaris 11/21. Такими же ресурсами располагает интегрированная графика в старших версиях APU на ядрах Kaveri/Godavari и Bristol Ridge. С другой стороны, у Polaris 12 и Polaris 21 абсолютно одинаковый back-end, в который входят 16 ROP и 128-битная шина памяти. Благодаря этому быстродействие Radeon RX 550 не сдерживается бутылочным горлышком двухканальной памяти DDR3/DDR4, которую интегрированный GPU в составе APU вынужден делить с ядрами x86.</p>\r\n\r\n<p>Помимо игр, GTX1080 превосходит по производительности GTX 980 Ti в 3D рендере в 1,5-2 и физике в 1,5 раза. Из этого можно сделать вывод, что в современных 3D реалиях Full HD разрешение уже сильно теряет популярность и производители как видеокарт, так и мониторов делают ставку на 2,4 и 8К разрешение. К этому стоит прислушаться, и если есть возможность заменить монитор, то лучше всего брать его хотя бы с разрешением в 2К.</p>\r\n\r\n<p>Вместе с тем микроархитектура GCN 1.3 содержит массу нововведений, устранивших слабости конвейера рендеринга в предыдущих итерациях Graphics Core Next.\r\n\r\nPolaris 12 содержит 2200 млн транзисторов — лишь на 800 млн, или 27 %, меньше, чем Polaris 11/21, а площадь кристалла сократилась всего на 18 %,  несмотря на то, что число программируемых блоков у них различается вдвое. В компактных GPU логика фиксированной функциональности занимает относительно бoльшую площадь, нежели в крупных чипах, поэтому эффективно сокращать транзисторный бюджет за счет шейдерных ALU можно лишь до определенного предела.</p>','/img/550/0.jpg,/img/550/1.jpg,/img/550/2.jpg,/img/550/3.jpg,/img/550/4.jpg,/img/550/5.jpg,/img/550/6.jpg,/img/550/7.jpg,/img/550/8.jpg'),(3,1,'GeForce GTX 1060','NVIDIA начала продажи GeForce GTX 1060 19 июля 2016 по рекомендованной цене 237.11$. Это десктопная видеокарта на архитектуре Pascal и техпроцессе 16 нм, в первую очередь рассчитанная на геймеров. На ней установлено 6 Гб памяти GDDR5 на частоте 8 ГГц, и вкупе с 192-битным интерфейсом это создает пропускную способность 192 Гб/с. С точки зрения совместимости это двухслотовая карта. Длина референсной версии – 25 см. Для подключения требуется дополнительный 6-pin кабель питания, а потребляемая мощность – 120 Вт.','			<h3>Графический процессор</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Кодовое название</td>\r\n										<td class=\"TD2\">GP106</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число транзисторов, млн</td>\r\n										<td class=\"TD2\">4 400</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Техпроцесс</td>\r\n										<td class=\"TD2\">16 нм FinFET	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тактовая частота, МГц: Base Clock / Boost Clock</td>\r\n										<td class=\"TD2\">1506/1708</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число ядер CUDA</td>\r\n										<td class=\"TD2\">1 280	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число блоков наложения текстур</td>\r\n										<td class=\"TD2\">80</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число ROP</td>\r\n										<td class=\"TD2\">48	</td>\r\n									</tr>\r\n								</table>\r\n					<h3>Оперативная память</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Разрядность шины, бит</td>\r\n										<td class=\"TD2\">192	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тип микросхем</td>\r\n										<td class=\"TD2\">GDDR5 SDRAM</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тактовая частота, МГц (пропускная способность, Мбит/с на линию)</td>\r\n										<td class=\"TD2\">2000 (8000)</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Объем, Мбайт</td>\r\n										<td class=\"TD2\">6 144</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Шина ввода/вывода</td>\r\n										<td class=\"TD2\">PCI Express 3.0 x16</td>\r\n									</tr>\r\n								</table>\r\n					<h3>Производительность</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Вычислительная мощность шейдерных ALU, FP32 (на основании Boost Clock)</td>\r\n										<td class=\"TD2\">4 373	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Производительность FP32/FP64</td>\r\n										<td class=\"TD2\">1/32	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Пропускная способность оперативной памяти, Гбайт/с</td>\r\n										<td class=\"TD2\">192</td>\r\n									</tr>\r\n								</table>\r\n				<h3>Вывод изображения</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Интерфейсы вывода изображения</td>\r\n										<td class=\"TD2\">HDMI 2.0b, DisplayPort 1.3/1.4, DL-DVI</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">TDP, Вт</td>\r\n										<td class=\"TD2\">120	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Розничная цена на момент выпуска (рекомендованная для США, без налогов), $</td>\r\n										<td class=\"TD2\">249/299</td>\r\n									</tr>\r\n								</table>\r\n\r\n<p>Плата GeForce GTX 1060 несет три разъема DisplayPort 1.3/1.4 и один HDMI 2.0b, что позволяет выводить сигнал с разрешением 4К и 5К при частоте 60 Гц (через HDMI и DisplayPort соответственно) с поддержкой HDR (уже сейчас в HDMI 2.0b и в будущем DisplayPort 1.4, который на данный момент является незавершенным стандартом).</p>\r\n\r\n<p>Как можно было заметить по фотографиям GTX 1060, которые NVIDIA опубликовала заблаговременно, видеокарта лишена разъема SLI. Очевидно, что производитель хочет зарезервировать эту технологию за топовыми GPU. В противном случае большой объем RAM и более низкая цена пары GTX 1060 по сравнению с одним GTX 1080 могли бы сделать многопроцессорную конфигурацию более привлекательной, чем флагманская модель. Впрочем, в этом отношении для GTX 1060 не все потеряно, так как DirectX 12 среди прочего позволяет объединять усилия нескольких GPU без помощи драйвера видеокарты (хотя потеря «мостика», безусловно, снизит производительность в данном случае).</p>\r\n\r\n<p>GeForce GTX 1060 спроектирован под термопакет 120 Вт — это на 30 Вт меньше TDP, которым обладает Radeon RX 480 (150 Вт).</p>\r\n\r\n<p>Рекомендованная цена GeForce GTX 1060 составляет $299 за эталонную версию (Founder’s Edition) и $249 за карты оригинального дизайна (США, без налога на продажи). Цена для российского рынка установлена на уровне 18 999 руб. Партнерские карты должны поступить в продажу начиная с сегодняшнего дня, поэтому Founder’s Edition можно приобрести только непосредственно на сайте NVIDIA в избранных странах (к которым, к сожалению, Россия не относится).</p>','/img/1060/0.jpg,/img/1060/1.jpg,/img/1060/2.jpg,/img/1060/3.jpg,/img/1060/4.jpg,/img/1060/5.jpg,/img/1060/6.jpg'),(4,1,'GeForce GTX 1070','NVIDIA начала продажи GeForce GTX 1070 10 июня 2016 по рекомендованной цене 379$. Это топовая десктопная видеокарта на архитектуре Pascal и техпроцессе 16 нм, в первую очередь рассчитанная на геймеров. На ней установлено 8 Гб памяти GDDR5 на частоте 8 Гб/с, и вкупе с 256-битным интерфейсом это создает пропускную способность 256 Гб/с.\r\n\r\nС точки зрения совместимости это двухслотовая карта, подключаемая по интерфейсу PCIe 3.0 x16. Длина референсной версии – 26.7 см. Для подключения требуется дополнительный 8-pin кабель питания, а потребляемая мощность – 150 Ватт.','			<h3>Графический процессор</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Кодовое название</td>\r\n										<td class=\"TD2\">GP104	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число транзисторов, млн</td>\r\n										<td class=\"TD2\">7 200</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Техпроцесс</td>\r\n										<td class=\"TD2\">16 нм FinFET</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тактовая частота, МГц: Base Clock / Boost Clock</td>\r\n										<td class=\"TD2\">1506/1683	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число ядер CUDA</td>\r\n										<td class=\"TD2\">1 920</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число блоков наложения текстур</td>\r\n										<td class=\"TD2\">120</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число ROP</td>\r\n										<td class=\"TD2\">64</td>\r\n									</tr>\r\n								</table>\r\n					<h3>Оперативная память</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Разрядность шины, бит</td>\r\n										<td class=\"TD2\">256</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тип микросхем</td>\r\n										<td class=\"TD2\">GDDR5 SDRAM</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тактовая частота, МГц (пропускная способность, Мбит/с на линию)</td>\r\n										<td class=\"TD2\">2000 (8000)</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Объем, Мбайт</td>\r\n										<td class=\"TD2\">8 192</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Шина ввода/вывода</td>\r\n										<td class=\"TD2\">PCI Express 3.0 x16</td>\r\n									</tr>\r\n								</table>\r\n					<h3>Производительность</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Вычислительная мощность шейдерных ALU, FP32 (на основании Boost Clock)</td>\r\n										<td class=\"TD2\">6 463	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Производительность FP32/FP64</td>\r\n										<td class=\"TD2\">1/32	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Пропускная способность оперативной памяти, Гбайт/с</td>\r\n										<td class=\"TD2\">256	</td>\r\n									</tr>\r\n								</table>\r\n				<h3>Вывод изображения</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Интерфейсы вывода изображения</td>\r\n										<td class=\"TD2\">HDMI 2.0b, DisplayPort 1.3/1.4, DL-DVI</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">TDP, Вт</td>\r\n										<td class=\"TD2\">150	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Розничная цена на момент выпуска (рекомендованная для США, без налогов), $</td>\r\n										<td class=\"TD2\">379/449	</td>\r\n									</tr>\r\n								</table>\r\n\r\n<p>Модель GeForce GTX 1070 стала второй видеокартой на базе первого графического процессора архитектуры Nvidia Pascal — GP104. Новинка поддерживает абсолютно все возможности архитектуры Pascal, описанные нами в базовом обзоре топовой версии, включая мультипроецирование — одновременную отрисовку в нескольких разных проекциях, позволяющую улучшить изображение на многомониторных конфигурациях и повысить производительность в среде виртуальной реальности. Из других интересных технологий можно отметить VRWorks Audio, служащую для точного расчета распространения звуковых волн при помощи GPU.</p>\r\n\r\n<p>Графический процессор GP104 отличается от предыдущих чипов семейства Maxwell по большей части применением нового технологического процесса 16 нм, который позволил сделать более сложный чип, имеющий большее количество исполнительных блоков и работающий на высокой тактовой частоте. Как и в старшей модификации, графический процессор GeForce GTX 1070 работает на частотах выше 1,6 ГГц, но урезание по количеству функциональных блоков (а возможно также и использование менее скоростной GDDR5-памяти) привело к снижению типичного энергопотребления до 150 Вт. Это стало возможным в основном благодаря применению продвинутого технологического процесса 16 нм FinFET на фабриках TSMC при изготовлении видеочипа GP104, получившего большее количество транзисторов, по сравнению с аналогичными решениями архитектуры Maxwell.</p>\r\n\r\n<p>Видеочип в составе видеокарты GeForce GTX 1070 имеет слегка сниженные характеристики производительности, он работает на высокой частоте, содержит 1920 потоковых вычислительных ядер и 120 блоков TMU при неизменных 64 блоках ROP. Это хоть и меньше, чем у GTX 1080, но привело к приличному росту общей производительности 3D-рендеринга, по сравнению с GPU предыдущего поколения. Сочетание архитектурных преимуществ Pascal, нового более «тонкого» техпроцесса, а также весьма быстрой GDDR5-памяти вылилось в преимущество в скорости над GeForce GTX 970 на величину порядка 50-70% (в среднем около 60%) по данным самой Nvidia. Возможно, цифра производителя GPU слишком оптимистична, реальный прирост скорости рендеринга в играх мы самостоятельно определим далее в нашем материале. Но в том, что GeForce GTX 1070 получилась очень быстрой, нет никаких сомнений.</p>','/img/1070/0.jpg,/img/1070/1.jpg,/img/1070/2.jpg,/img/1070/3.jpg,/img/1070/4.jpg,/img/1070/5.jpg,/img/1070/6.jpg'),(5,1,'GeForce GTX 1080',NULL,'<h3>Графический процессор</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Кодовое название</td>\r\n										<td class=\"TD2\">GP104</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число транзисторов, млн</td>\r\n										<td class=\"TD2\">7 200</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Техпроцесс</td>\r\n										<td class=\"TD2\">16 нм FinFET	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тактовая частота, МГц: Base Clock / Boost Clock</td>\r\n										<td class=\"TD2\">1607/1733</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число ядер CUDA</td>\r\n										<td class=\"TD2\">2 560	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число блоков наложения текстур</td>\r\n										<td class=\"TD2\">160</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число ROP</td>\r\n										<td class=\"TD2\">64</td>\r\n									</tr>\r\n								</table>\r\n					<h3>Оперативная память</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Разрядность шины, бит</td>\r\n										<td class=\"TD2\">256	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тип микросхем</td>\r\n										<td class=\"TD2\">GDDR5 SDRAM</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тактовая частота, МГц (пропускная способность, Мбит/с на линию)</td>\r\n										<td class=\"TD2\">1250 (10000)</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Объем, Мбайт</td>\r\n										<td class=\"TD2\">8 192</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Шина ввода/вывода</td>\r\n										<td class=\"TD2\">PCI Express 3.0 x16</td>\r\n									</tr>\r\n								</table>\r\n					<h3>Производительность</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Вычислительная мощность шейдерных ALU, FP32 (на основании Boost Clock)</td>\r\n										<td class=\"TD2\">8 872	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Производительность FP32/FP64</td>\r\n										<td class=\"TD2\">1/32	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Пропускная способность оперативной памяти, Гбайт/с</td>\r\n										<td class=\"TD2\">320</td>\r\n									</tr>\r\n								</table>\r\n				<h3>Вывод изображения</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Интерфейсы вывода изображения</td>\r\n										<td class=\"TD2\">HDMI 2.0b, DisplayPort 1.3/1.4, DL-DVI</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">TDP, Вт</td>\r\n										<td class=\"TD2\">180	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Розничная цена на момент выпуска (рекомендованная для США, без налогов), $</td>\r\n										<td class=\"TD2\">599/699</td>\r\n									</tr>\r\n								</table>\r\n\r\n<p>Видеокарта построена на новом 16-нанометровом техпроцессоре NVIDIA Pascal. На это было потрачено практически 3 года. Стоит упомянуть, что 6 карт предыдущей серии были построены на старом 28-нанометровом техпроцессоре. Разница заключается в том, что на 1 квадратном сантиметре подложки 16-нанометровой матрицы можно разместить значительно больше транзисторов, что сильно повышает производимость.</p>\r\n\r\n<p>Вычислительная мощность GPU на этой видеокарте будет составлять 9 TFLOPS (для сравнения ВЧ у GTX 980 Ti только 7 TFLOPS), а плотность упаковки транзисторов возросла вдвое: с 3,5 до 7,2 млрд. В различных тестах игр GTX 1080 показывает прирост производительности, в среднем, в 1,5 раза по сравнению с топовой видеокартой прошлого поколения. Это довольно положительная тенденция, учитывая то, что в предыдущем поколении разницы между моделями были не столь значительны из-за одинаковой базы техпроцесса.</p>\r\n\r\n<p>Помимо игр, GTX1080 превосходит по производительности GTX 980 Ti в 3D рендере в 1,5-2 и физике в 1,5 раза. Из этого можно сделать вывод, что в современных 3D реалиях Full HD разрешение уже сильно теряет популярность и производители как видеокарт, так и мониторов делают ставку на 2,4 и 8К разрешение. К этому стоит прислушаться, и если есть возможность заменить монитор, то лучше всего брать его хотя бы с разрешением в 2К.</p>\r\n\r\n<p>Помимо этого с новой матрицей повысилась и пропускная способность памяти до 320 Гбит/с — это очень большой скачек по сравнению с GTX 80 Ti. Такой прирост скорости был достигнут еще и благодаря более эффективной работе шины. К старому кодированию цифрового изображения были добавлены еще более высокие степени сжатия, что дало возможность повысить производительность шины в 1,2 раза.</p>\r\n\r\n<p>Разгон карточки так же перешел на новый уровень: теперь при помощи новой системы GPU Boost 3.0 для разгона практически не требуется участие пользователя. Программа сама определяет оптимальный уровень разгона каждой конкретной видеокарты и поэтому теперь не нужно волноваться о перегреве карты или сбоях в работе питания. Также стоит отметить поддержку новых функций, таких как NVIDIA Ansel, NVIDIA SLI.</p>','/img/1080/0.jpg,/img/1080/1.jpg,/img/1080/2.jpg,/img/1080/3.jpg,/img/1080/4.jpg,/img/1080/5.jpg'),(6,2,'Radeon RX 560X','Radeon RX 550 пришел на смену розничной модели Radeon R7 350 и нескольким OEM-позициям нижнего уровня в 300-й и 400-й серии. Во всех них используются GPU Cape Verde и Olland образца 2012–2013 года, произведенные по норме 28 нм. Как следствие, от Radeon RX 550 можно ожидать серьезного рывка в производительности и энергоэффективности за счет усовершенствований архитектуры GCN и нового полупроводникового техпроцесса. Polaris содержит и функциональные нововведения, востребованные в нише HTPC (Home Theater PC), — поддержку новых интерфейсов вывода изображения и декодирование форматов видео HEVC и VP9.','<h3>Характеристики GPU</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Название</td>\r\n										<td class=\"TD2\">Polaris 12</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Микроархитектура</td>\r\n										<td class=\"TD2\">GCN 1.3</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Техпроцесс, нм</td>\r\n										<td class=\"TD2\">14 нм FinFET</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число транзисторов, млн</td>\r\n										<td class=\"TD2\">2200</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тактовая частота, МГц: Base Clock / Boost Clock</td>\r\n										<td class=\"TD2\">1100/1183</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число шейдерных ALU</td>\r\n										<td class=\"TD2\">512</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число блоков наложения текстур</td>\r\n										<td class=\"TD2\">32</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число ROP</td>\r\n										<td class=\"TD2\">16</td>\r\n									</tr>\r\n								</table>\r\n					<h3>Характеристики памяти</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Разрядность шины, бит</td>\r\n										<td class=\"TD2\">128</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тип микросхем</td>\r\n										<td class=\"TD2\">GDDR5 SDRAM</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тактовая частота, МГц (пропускная способность на контакт, Мбит/с)</td>\r\n										<td class=\"TD2\">1750 (7000)</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Объем, Мбайт</td>\r\n										<td class=\"TD2\">2048/4096</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Шина ввода/вывода</td>\r\n										<td class=\"TD2\">PCI Express 3.0 x8</td>\r\n									</tr>\r\n								</table>\r\n					<h3>Производительность</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Пиковая производительность FP32, GFLOPS (из расчета максимальной указанной частоты)</td>\r\n										<td class=\"TD2\">1211</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Производительность FP32/FP64</td>\r\n										<td class=\"TD2\">1/16</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Пропускная способность оперативной памяти, Гбайт/с</td>\r\n										<td class=\"TD2\">112</td>\r\n									</tr>\r\n								</table>\r\n				<h3>Вывод изображения</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Интерфейсы вывода изображения</td>\r\n										<td class=\"TD2\">DL DVI, HDMI 2.0b, DisplayPort 1.3/1.4</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">TDP, Вт</td>\r\n										<td class=\"TD2\">50</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Розничная цена (США, без налога), $</td>\r\n										<td class=\"TD2\">79 (рекомендованная на момент выхода)</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Розничная цена (Россия), руб.</td>\r\n										<td class=\"TD2\">5 369 (рекомендованная на момент выхода)</td>\r\n									</tr>\r\n								</table>\r\n								\r\n<p>В основе Radeon RX 550 лежит графический процессор Polaris 12. По названию чипа может сложиться впечатление, что он относится к первому поколению Polaris, наряду с Polaris 10 и Polaris 11, которые использовались в серии Radeon RX 400. Тем не менее это новый GPU, и вряд ли AMD упустила возможность заложить в него все преимущества оптимизированной схемотехники и фотолитографии, которыми обладают чипы Polaris второго поколения.</p>\r\n\r\n<p>Так как AMD долгое время не занималась развитием младшего сегмента дискретных GPU, Polaris 12 во всех отношениях представляет большой шаг вперед и по сравнению с предыдущим GPU стартового уровня — Olland. По конфигурации архитектурных элементов (512 шейдерных ALU и 64 блока наложения текстур, распределенные по 8 Compute Units) Polaris 12 выглядит как половина следующего по рангу GPU — Polaris 11/21. Такими же ресурсами располагает интегрированная графика в старших версиях APU на ядрах Kaveri/Godavari и Bristol Ridge. С другой стороны, у Polaris 12 и Polaris 21 абсолютно одинаковый back-end, в который входят 16 ROP и 128-битная шина памяти. Благодаря этому быстродействие Radeon RX 550 не сдерживается бутылочным горлышком двухканальной памяти DDR3/DDR4, которую интегрированный GPU в составе APU вынужден делить с ядрами x86.</p>\r\n\r\n<p>Помимо игр, GTX1080 превосходит по производительности GTX 980 Ti в 3D рендере в 1,5-2 и физике в 1,5 раза. Из этого можно сделать вывод, что в современных 3D реалиях Full HD разрешение уже сильно теряет популярность и производители как видеокарт, так и мониторов делают ставку на 2,4 и 8К разрешение. К этому стоит прислушаться, и если есть возможность заменить монитор, то лучше всего брать его хотя бы с разрешением в 2К.</p>\r\n\r\n<p>Вместе с тем микроархитектура GCN 1.3 содержит массу нововведений, устранивших слабости конвейера рендеринга в предыдущих итерациях Graphics Core Next.\r\n\r\nPolaris 12 содержит 2200 млн транзисторов — лишь на 800 млн, или 27 %, меньше, чем Polaris 11/21, а площадь кристалла сократилась всего на 18 %,  несмотря на то, что число программируемых блоков у них различается вдвое. В компактных GPU логика фиксированной функциональности занимает относительно бoльшую площадь, нежели в крупных чипах, поэтому эффективно сокращать транзисторный бюджет за счет шейдерных ALU можно лишь до определенного предела.</p>','/img/560/0.jpg,/img/560/1.jpg,/img/560/2.jpg,/img/560/3.jpg,/img/560/4.jpg,/img/560/5.jpg,/img/560/6.jpg'),(7,2,'Radeon RX 570X','Новые видеокарты 500-й серии AMD выпускаются на той же базовой микроархитектуре Polaris, что и предыдущее поколение 400-й. Акцент сделан на повышение производительности, они модифицированы за счет производства на 14нм техпроцессе, который разрешает работать еще быстрее.','<h3>Графический процессор</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Название</td>\r\n										<td class=\"TD2\">Polaris 20 XL</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Микроархитектура</td>\r\n										<td class=\"TD2\">GCN 1.3</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Техпроцесс, нм</td>\r\n										<td class=\"TD2\">14 нм FinFET</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тактовая частота, МГц: Base Clock / Boost Clock</td>\r\n										<td class=\"TD2\">1168/1244</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число шейдерных ALU</td>\r\n										<td class=\"TD2\">2048</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число блоков наложения текстур</td>\r\n										<td class=\"TD2\">128</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число ROP</td>\r\n										<td class=\"TD2\">32</td>\r\n									</tr>\r\n								</table>\r\n					<h3>Характеристики памяти</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Разрядность шины, бит</td>\r\n										<td class=\"TD2\">256</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тип микросхем</td>\r\n										<td class=\"TD2\">GDDR5 SDRAM</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тактовая частота, МГц (пропускная способность на контакт, Мбит/с)</td>\r\n										<td class=\"TD2\">1750 (7000)</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Объем, Мбайт</td>\r\n										<td class=\"TD2\">4096</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Шина ввода/вывода</td>\r\n										<td class=\"TD2\">PCI Express 3.0 x16</td>\r\n									</tr>\r\n								</table>\r\n					<h3>Производительность</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Пиковая производительность FP32, GFLOPS (из расчета максимальной указанной частоты)</td>\r\n										<td class=\"TD2\">5059</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Производительность FP32/FP64</td>\r\n										<td class=\"TD2\">1/16</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Пропускная способность оперативной памяти, Гбайт/с</td>\r\n										<td class=\"TD2\">224</td>\r\n									</tr>\r\n								</table>\r\n				<h3>Вывод изображения</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Интерфейсы вывода изображения</td>\r\n										<td class=\"TD2\">DL DVI, HDMI 2.0b, DisplayPort 1.3/1.4</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">TDP, Вт</td>\r\n										<td class=\"TD2\">150</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Розничная цена (США, без налога), $</td>\r\n										<td class=\"TD2\">169	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Розничная цена (Россия), руб.</td>\r\n										<td class=\"TD2\">11 299</td>\r\n									</tr>\r\n								</table>\r\n\r\n<p>Radeon RX 570 и RX 580 обладают такой же конфигурацией активных вычислительных блоков GPU, как, соответственно, Radeon RX 470 и RX 480. Radeon RX 570 утратил 4 из 36 CU, имеющихся в составе Polaris 20. Как следствие, при равной частоте RX 580 превосходит RX 570 лишь на 13% по скорости шейдерных операций и заполнения текселов. В то же время Radeon RX 570 достался в неизменности back-end графического процессора, включающий 32 ROP и 256-битную шину памяти.</p>\r\n\r\n<p>Поскольку речь идет об усовершенствованной версии флагманского чипа Polaris, в Radeon RX 570 по сравнению с RX 470 возросли одновременно и TDP, и тактовые частоты. Если сравнивать Radeon RX 470 и RX 570, с одной стороны, и RX 480 и RX 580, с другой, то разница в TDP видеокарт прошлого и нового поколений примерно одинакова — 23 и 25% соответственно. А вот изменения в тактовых частотах графического процессора Radeon RX 570 поначалу сбивают с толку: AMD лишь на 60 МГц подняла предельную частоту и в то же время базовая частота увеличилась на 194 МГц. По всей видимости, расширенный с 120 до 150 Вт тепловой пакет просто позволит видеокарте реже сбрасывать частоту GPU.</p>\r\n\r\n<p>Не так уж легко предсказать, как эти изменения отразятся на быстродействии ускорителя. С одной стороны, прибавка в производительности, совершенно несущественная по «табличным» расчетам на основе Boost Clock, в энергоемких задачах может оказаться и гораздо выше. К тому же, в дополнение к разгону GPU, AMD увеличила пропускную способность шины RAM с 6,6 до 7 Гбит/с на контакт, что также отражается на общем энергопотреблении ускорителя. Но, с другой стороны, референсные значения TDP не всегда справедливы для видеокарт оригинального дизайна. Поскольку эталонный вариант Radeon RX 470 выпускала только SAPPHIRE, а референсный вариант RX 570 вообще отсутствует в продаже, мы нисколько не удивимся, если не обнаружим фактической разницы в производительности между Radeon RX 570 на референсных частотах и лучшими образцами Radeon RX 470.</p>','/img/570/0.jpg,/img/570/1.jpg,/img/570/2.jpg,/img/570/3.jpg,/img/570/4.jpg,/img/570/5.jpg,/img/570/6.jpg'),(8,2,'Radeon RX 580X','Серия Radeon RX 400 стала большим коммерческим успехом для графического подразделения AMD. После четырех лет томительного ожидания производители GPU получили в свое распоряжение технологический процесс нового поколения — 14/16 нм FinFET, и AMD, на этот раз избравшая GlobalFoundries в качестве подрядчика по выпуску микросхем, в 2016 году представила линейку видеокарт Radeon RX 460, RX 470 и RX 480, охватившую низкий и средний сегменты производительности. Благодаря привлекательным ценам AMD удалось составит серьезную конкуренцию серии GeForce 10 от NVIDIA в соответствующих ценовых категориях, но с технической точки зрения семейство Polaris не вполне удовлетворило энтузиастов, поскольку соперник AMD гораздо лучше распорядился возможностями нового техпроцесса с точки зрения энергоэффективности и частотного потенциала GPU. Слухи о том, что AMD работает над глубокой ревизией линейки Polaris, возникли еще в октябре прошлого года — всего через пару месяцев после того, как последний представитель 400-й серии — Radeon RX 460 — поступил в продажу. И действительно, серия Radeon 500, по утверждению производителя, не просто состоит из перемаркированных моделей Radeon 400, а комплектуется кристаллами Polaris второго поколения, в которых оптимизированный дизайн сочетается с повзрослевшей технологией 14 нм FinFET.','<h3>Графический процессор</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Название</td>\r\n										<td class=\"TD2\">Polaris 20 XL</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Микроархитектура</td>\r\n										<td class=\"TD2\">GCN 1.3</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Техпроцесс, нм</td>\r\n										<td class=\"TD2\">14 нм FinFET</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тактовая частота, МГц: Base Clock / Boost Clock</td>\r\n										<td class=\"TD2\">1257/1340</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число шейдерных ALU</td>\r\n										<td class=\"TD2\">2304</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число блоков наложения текстур</td>\r\n										<td class=\"TD2\">144</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Число ROP</td>\r\n										<td class=\"TD2\">32</td>\r\n									</tr>\r\n								</table>\r\n					<h3>Характеристики памяти</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Разрядность шины, бит</td>\r\n										<td class=\"TD2\">256</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тип микросхем</td>\r\n										<td class=\"TD2\">GDDR5 SDRAM</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Тактовая частота, МГц (пропускная способность на контакт, Мбит/с)</td>\r\n										<td class=\"TD2\">2000 (8000)</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Объем, Мбайт</td>\r\n										<td class=\"TD2\">4096/8192</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Шина ввода/вывода</td>\r\n										<td class=\"TD2\">PCI Express 3.0 x16</td>\r\n									</tr>\r\n								</table>\r\n					<h3>Производительность</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Пиковая производительность FP32, GFLOPS (из расчета максимальной указанной частоты)</td>\r\n										<td class=\"TD2\">6175</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Производительность FP32/FP64</td>\r\n										<td class=\"TD2\">1/16</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Пропускная способность оперативной памяти, Гбайт/с</td>\r\n										<td class=\"TD2\">256</td>\r\n									</tr>\r\n								</table>\r\n				<h3>Вывод изображения</h3>\r\n								<table border=\'0\' cellspacing=\'0\' cellpadding=\'2\' class=\"TAB\">\r\n									<tr>\r\n										<td class=\"TD1\">Интерфейсы вывода изображения</td>\r\n										<td class=\"TD2\">DL DVI, HDMI 2.0b, DisplayPort 1.3/1.4</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">TDP, Вт</td>\r\n										<td class=\"TD2\">185</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Розничная цена (США, без налога), $</td>\r\n										<td class=\"TD2\">199/229	</td>\r\n									</tr>\r\n									<tr>\r\n										<td class=\"TD1\">Розничная цена (Россия), руб.</td>\r\n										<td class=\"TD2\">13 449 / 15 299</td>\r\n									</tr>\r\n								</table>\r\n\r\n<p>Графический процессор Polaris 20 представляет собой обновленную версию ядра Polaris 10, установленного в Radeon RX 480. Как следствие, состав вычислительных блоков не претерпел изменений. Как и Polaris 10, полностью функциональная версия Polaris 20 располагает 2304 шейдерными ALU, 144 блоками наложения текстур и 32 ROP, а с оперативной памятью чип соединен 256-битной шиной с пропускной способностью 8 Гбит/с на контакт.</p>\r\n\r\n<p>Напомним, что с точки зрения микроархитектуры серия Polaris имеет ряд отличий от предыдущих продуктов AMD на основе логики GCN версии 1.2 (чип Fiji в составе Radeon R9 Nano, R9 Fury и Fury X), среди которых важное место занимает компрессия цвета с соотношением вплоть до 8:1, позволяющая более эффективно расходовать пропускную способность шины RAM. Из прочих оптимизаций внутренней структуры GPU, представленных в GCN 1.3, отметим оптимизацию геометрического движка, способного отсекать на ранних стадиях конвейера полигоны нулевого размера либо не имеющие пикселов в проекции. Работа Compute Unit’а (основной структуры GCN, объединяющей шейдерные ALU и блоки наложения текстур) также подверглась тюнингу в Polaris c целью повышения его удельной производительности.</p>\r\n\r\n<p>Единственное изменение, которое принесла новая версия старшего ядра семейства Polaris в совокупности с оптимизированным техпроцессом 14 нм FinFET, заключается в тактовой частоте GPU, которую AMD по штатным спецификациям увеличила с 1266 МГц до того уровня, который был достигнут в лучших образцах Radeon RX 480 на базе печатных плат оригинального дизайна, — 1340 МГц. Эффективная частота чипов RAM по-прежнему составляет 8 ГГц, а стандартный объем равен 4 или 8 Гбайт. Вместе с тем AMD пришлось увеличить штатный тепловой пакет видеокарты со 150 до 185 Вт для того, чтобы дать дорогу повышенным тактовым частотам.</p>','/img/580/0.jpg,/img/580/1.jpg,/img/580/2.jpg,/img/580/3.jpg,/img/580/4.jpg,/img/580/5.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Первичный ключ',
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `selfdescription` text NOT NULL,
  `date_reg` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','obi.jpg','Администратор сайта','2018-06-07 00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-18 23:18:46
