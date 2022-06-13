-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2022 at 03:14 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resort`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerId` int(11) NOT NULL,
  `customerName` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `isMale` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerId`, `customerName`, `age`, `isMale`) VALUES
(0, 'customerName', 0, b'1'),
(123066857, 'Rodi Bulluck', 35, b'1'),
(133417356, 'Myrtia Beamand', 76, b'1'),
(146535121, 'Julianne Frontczak', 31, b'1'),
(163224362, 'Bartlet Hriinchenko', 80, b'1'),
(172630122, 'Kandace Oakland', 31, b'1'),
(177305485, 'Adrian Bratton', 53, b'1'),
(186699146, 'Earlie Iacovo', 56, b'1'),
(204847760, 'Iggie Baily', 31, b'1'),
(204851352, 'Petronilla Anselmi', 73, b'1'),
(208109030, 'Cosme Duiged', 68, b'1'),
(211427849, 'Berry Robertsen', 35, b'1'),
(213006292, 'Sophia Polkinghorne', 19, b'1'),
(221927758, 'Trixi Jeppensen', 32, b'1'),
(230347233, 'Lil Spoor', 52, b'1'),
(232365711, 'Cyrus Eddis', 65, b'1'),
(251523168, 'Othelia Kupec', 26, b'1'),
(254433957, 'Quintana Chrystie', 21, b'1'),
(263915420, 'Barthel Bakeup', 36, b'1'),
(286849969, 'Claybourne Bolduc', 52, b'1'),
(291961423, 'Bev Fildery', 69, b'1'),
(302258541, 'Alix Losbie', 63, b'1'),
(305746335, 'Irita Whereat', 38, b'1'),
(305978472, 'Daile McCuffie', 69, b'1'),
(312434414, 'Minerva Gresham', 56, b'1'),
(315759520, 'Hoebart Ickeringill', 42, b'1'),
(318034453, 'Remy Gladtbach', 69, b'1'),
(318749633, 'Talia Kiss', 18, b'1'),
(336449867, 'Dottie Seven', 69, b'1'),
(337518856, 'Evey Collicott', 27, b'1'),
(357279089, 'Shannah Burniston', 28, b'1'),
(358892284, 'Roch Eccleston', 25, b'1'),
(364909620, 'Gabbi Dey', 71, b'1'),
(367961379, 'Dorella Simpson', 53, b'1'),
(377686168, 'Jeffry Littlefield', 49, b'1'),
(383661037, 'Nelia Gascoigne', 65, b'1'),
(387632402, 'Elora Saket', 66, b'1'),
(397713704, 'Hilliard Pothergill', 49, b'1'),
(413881287, 'Louella Bjorkan', 71, b'1'),
(417913516, 'Chas Wiggett', 78, b'1'),
(448568179, 'Gale Dobney', 51, b'1'),
(457277965, 'Amelia Tye', 28, b'1'),
(463790273, 'Ruggiero Griffith', 75, b'1'),
(477362139, 'Granny Verrell', 41, b'1'),
(480283757, 'Lombard Ballantine', 45, b'1'),
(481085986, 'Hogan Roddick', 50, b'1'),
(493751465, 'Wyn Oganian', 41, b'1'),
(498334101, 'Crin Bartolic', 35, b'1'),
(502034985, 'Cinnamon Roddick', 25, b'1'),
(530943985, 'Guenevere Houlston', 18, b'1'),
(542789795, 'Burt McHarry', 80, b'1'),
(543296475, 'Wynn McIlvenny', 57, b'1'),
(559649213, 'Zack Tivolier', 25, b'1'),
(572395771, 'Vernice Amys', 45, b'1'),
(573521518, 'Renault Komorowski', 72, b'1'),
(578408138, 'Thibaut Morritt', 77, b'1'),
(588837958, 'Mathilde Ansley', 76, b'1'),
(592872857, 'Karylin Salzberger', 72, b'1'),
(598258432, 'Moreen Manueli', 74, b'1'),
(611798418, 'Fairfax Woodhead', 51, b'1'),
(613060350, 'Lib Iltchev', 18, b'1'),
(615933751, 'Ferris Kellington', 20, b'1'),
(621723470, 'Alameda Alloisi', 23, b'1'),
(655982402, 'Arlene Melin', 44, b'1'),
(658045080, 'Guy Mahon', 51, b'1'),
(669380266, 'Holly-anne Clace', 77, b'1'),
(671424135, 'Gris Cooley', 43, b'1'),
(681575163, 'Son Kurdani', 75, b'1'),
(709943000, 'Joseph Jindrich', 71, b'1'),
(716195565, 'Jarrad Hutcheon', 41, b'1'),
(723264711, 'Isacco Morch', 68, b'1'),
(723349016, 'Tamiko Nethercott', 42, b'1'),
(723590231, 'Werner Nobles', 59, b'1'),
(729850135, 'Court Blacksland', 18, b'1'),
(730873648, 'Lionello Roberds', 25, b'1'),
(733265452, 'Leandra Kime', 77, b'1'),
(739937875, 'Sloane Bater', 35, b'1'),
(770366393, 'Hewe Whale', 32, b'1'),
(778413001, 'Montague Zorer', 22, b'1'),
(803404828, 'Cleveland Chrystie', 67, b'1'),
(804901782, 'Anstice Horsburgh', 79, b'1'),
(819922494, 'Miguela Ellingsworth', 55, b'1'),
(839727483, 'Price Kindall', 61, b'1'),
(848995636, 'Luther Allaker', 30, b'1'),
(857484217, 'Care Halladey', 35, b'1'),
(862415749, 'Magdalene Von Der Empten', 66, b'1'),
(866534594, 'Tadeas Geke', 47, b'1'),
(876302338, 'Prentiss McCormack', 40, b'1'),
(884435761, 'Shirley Scarman', 70, b'1'),
(885861122, 'Skell Jehan', 80, b'1'),
(889891012, 'Burk Ortsmann', 44, b'1'),
(897715431, 'Arnold Ganning', 47, b'1'),
(901138604, 'Tansy Garman', 75, b'1'),
(909994279, 'Marion Thonason', 35, b'1'),
(919173948, 'Rodrique Keyworth', 77, b'1'),
(923284223, 'Brnaba Eggle', 60, b'1'),
(950730568, 'Reena Major', 32, b'1'),
(973801389, 'Melli McCosh', 65, b'1'),
(974330622, 'Errick Crose', 60, b'1'),
(975238745, 'Waylan Breslauer', 42, b'1'),
(997199590, 'Edee Aubry', 44, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `diningroomorder`
--

CREATE TABLE `diningroomorder` (
  `orderNum` int(4) NOT NULL,
  `name` varchar(30) NOT NULL,
  `orderTime` datetime NOT NULL DEFAULT current_timestamp(),
  `tableNum` int(1) NOT NULL,
  `dinersNum` int(1) NOT NULL,
  `mealTime` datetime NOT NULL,
  `vegan` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dish_details`
--

CREATE TABLE `dish_details` (
  `dishName` varchar(30) NOT NULL,
  `prodName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dish_prices`
--

CREATE TABLE `dish_prices` (
  `dishName` varchar(30) NOT NULL,
  `price` float NOT NULL,
  `rating` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `isMale` bit(1) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `bankAccount` varchar(20) DEFAULT NULL,
  `hourlyWage` int(11) NOT NULL,
  `hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `age`, `isMale`, `role`, `bankAccount`, `hourlyWage`, `hours`) VALUES
(1, 'Zorina Whitchurch', 34, b'1', 'General Manager', '640705', 99, 98),
(2, 'Herold Shakle', 71, b'1', 'Food Chemist', '217432', 45, 262),
(3, 'Ilene Paten', 26, b'1', 'Paralegal', '287881', 61, 158),
(4, 'Rabi Westcarr', 35, b'1', 'Help Desk Technician', '696950', 72, 38),
(5, 'Eachelle Pordal', 31, b'1', 'GIS Technical Archit', '646081', 65, 401),
(6, 'Madeleine Cornillot', 48, b'1', 'Analyst Programmer', '717184', 63, 222),
(7, 'Mae Scrowston', 49, b'1', 'Operator', '415817', 77, 205),
(8, 'Ashlee Cestard', 74, b'1', 'Geological Engineer', '353412', 85, 156),
(9, 'Alexandra Boakes', 38, b'1', 'Structural Engineer', '915817', 92, 404),
(10, 'Luci Pape', 29, b'1', 'Statistician II', '993103', 78, 456),
(11, 'Augusto Highton', 38, b'1', 'Staff Accountant I', '871762', 55, 38),
(12, 'Giorgia Cucinotta', 62, b'1', 'Programmer Analyst I', '266222', 76, 468),
(13, 'Sheppard Biasio', 45, b'1', 'Sales Associate', '514259', 70, 354),
(14, 'Leslie Makiver', 46, b'1', 'Design Engineer', '861537', 95, 112),
(15, 'Cheston Sedworth', 75, b'1', 'Mechanical Systems E', '845143', 85, 81),
(16, 'Mahmoud Hankey', 33, b'1', 'Nurse', '340829', 44, 264),
(17, 'Ruttger Jansky', 36, b'1', 'Accountant II', '889913', 80, 117),
(18, 'Sheridan Murdoch', 26, b'1', 'Environmental Specia', '844864', 70, 266),
(19, 'Lois Pirouet', 52, b'1', 'Staff Scientist', '751285', 60, 36),
(20, 'Isiahi Nutbeam', 54, b'1', 'Desktop Support Tech', '700349', 53, 469),
(21, 'Farlie Seymour', 28, b'1', 'Director of Sales', '762474', 75, 168),
(22, 'Amabelle Spiring', 37, b'1', 'Structural Engineer', '942081', 89, 296),
(23, 'Magdaia MacNaughton', 73, b'1', 'Marketing Assistant', '127643', 50, 281),
(24, 'Jaynell Klos', 30, b'1', 'Recruiting Manager', '151958', 66, 414),
(25, 'Anthony Gammill', 78, b'1', 'Data Coordiator', '502602', 78, 460),
(26, 'Lorita Hedau', 69, b'1', 'Chief Design Enginee', '112974', 71, 171),
(27, 'Violette Aysik', 48, b'1', 'Environmental Specia', '971526', 95, 179),
(28, 'Janie Arlett', 52, b'1', 'Help Desk Operator', '526928', 70, 16),
(29, 'Ivory Abramov', 42, b'1', 'VP Product Managemen', '868995', 85, 306),
(30, 'Riannon Just', 67, b'1', 'Safety Technician II', '809685', 84, 296),
(31, 'Winfred Goodrick', 48, b'1', 'Compensation Analyst', '375930', 76, 339),
(32, 'Heath Gallahar', 59, b'1', 'Food Chemist', '311169', 53, 168),
(33, 'Gaspard Nind', 56, b'1', 'Office Assistant II', '966147', 68, 332),
(34, 'Brod Saffle', 53, b'1', 'Administrative Offic', '498545', 76, 58),
(35, 'Verge Mellanby', 27, b'1', 'Programmer II', '566987', 41, 9),
(36, 'Harlene Shave', 62, b'1', 'Occupational Therapi', '334296', 66, 465),
(37, 'Kaja Knox', 50, b'1', 'Accountant IV', '903100', 62, 66),
(38, 'Colly Tarrant', 56, b'1', 'Account Executive', '449014', 95, 314),
(39, 'Mavis Cholonin', 28, b'1', 'VP Marketing', '625365', 98, 382),
(40, 'Ruthi Littleproud', 61, b'1', 'Teacher', '929286', 79, 471),
(41, 'Constancia Nouch', 58, b'1', 'Assistant Media Plan', '893904', 84, 129),
(42, 'Ronald Bessant', 43, b'1', 'Librarian', '205140', 79, 131),
(43, 'Luci Woodham', 27, b'1', 'Software Engineer II', '604735', 67, 274),
(44, 'Kipper Arnfield', 26, b'1', 'Legal Assistant', '582473', 83, 7),
(45, 'Melinda Killingworth', 45, b'1', 'Statistician II', '821319', 71, 427),
(46, 'Thorpe McGeorge', 80, b'1', 'Senior Developer', '275471', 86, 174),
(47, 'Cece Mosco', 58, b'1', 'Media Manager III', '770675', 48, 246),
(48, 'Jasper Halgarth', 55, b'1', 'Human Resources Mana', '233921', 82, 295),
(49, 'Nehemiah Hailes', 74, b'1', 'Marketing Manager', '597497', 66, 160),
(50, 'Jessa Wyness', 61, b'1', 'Physical Therapy Ass', '343805', 87, 380),
(51, 'Stefania Lankford', 69, b'1', 'Editor', '904816', 77, 75),
(52, 'Bidget Knocker', 61, b'1', 'Chemical Engineer', '523921', 51, 313),
(53, 'Beryle Mantram', 21, b'1', 'Safety Technician II', '942255', 92, 36),
(54, 'Hercule Stainer', 75, b'1', 'Statistician III', '590739', 82, 396),
(55, 'Lowe Stoffler', 69, b'1', 'Design Engineer', '612072', 92, 434),
(56, 'Alie Farebrother', 61, b'1', 'Dental Hygienist', '881316', 42, 500),
(57, 'Bobbi Dinnis', 54, b'1', 'Marketing Manager', '768741', 47, 201),
(58, 'Alvira McCarrick', 28, b'1', 'Recruiting Manager', '549965', 86, 480),
(59, 'Maritsa Robecon', 56, b'1', 'Programmer I', '553649', 82, 103),
(60, 'Kylie Godden', 34, b'1', 'Pharmacist', '772970', 68, 65),
(61, 'Shana Bedenham', 34, b'1', 'Help Desk Operator', '433251', 47, 332),
(62, 'Brittan Lamberton', 27, b'1', 'Health Coach II', '136921', 51, 103),
(63, 'Cully De Andreis', 47, b'1', 'Food Chemist', '279010', 49, 10),
(64, 'Amble Lascelles', 60, b'1', 'Physical Therapy Ass', '244719', 76, 437),
(65, 'Elaina MacCard', 39, b'1', 'Human Resources Assi', '455701', 64, 275),
(66, 'Marian Wretham', 46, b'1', 'Research Assistant I', '884289', 66, 75),
(67, 'Blair Morpeth', 36, b'1', 'Physical Therapy Ass', '707005', 52, 357),
(68, 'Ermina Mapes', 53, b'1', 'Geological Engineer', '699516', 45, 246),
(69, 'Mallory Danniel', 36, b'1', 'Computer Systems Ana', '200866', 84, 42),
(70, 'Farica Matzkaitis', 69, b'1', 'Administrative Offic', '664702', 79, 152),
(71, 'Nadine Cullin', 65, b'1', 'Help Desk Technician', '260863', 100, 218),
(72, 'Ingemar Wagg', 59, b'1', 'Safety Technician I', '510067', 75, 396),
(73, 'Matias Abley', 20, b'1', 'Analyst Programmer', '220859', 93, 434),
(74, 'Kylie Markie', 50, b'1', 'Recruiter', '699785', 67, 214),
(75, 'Giulia Camp', 27, b'1', 'General Manager', '270033', 88, 247),
(76, 'Celestyna Degoix', 78, b'1', 'General Manager', '531230', 82, 240),
(77, 'Xylina Zoellner', 74, b'1', 'Actuary', '697619', 94, 309),
(78, 'Urbain Gibbons', 68, b'1', 'Senior Developer', '981356', 86, 439),
(79, 'Christoph Durber', 68, b'1', 'Actuary', '556374', 91, 217),
(80, 'Gertie Somers', 40, b'1', 'Legal Assistant', '672820', 89, 95),
(81, 'Thorny Drohane', 18, b'1', 'Senior Sales Associa', '695939', 86, 68),
(82, 'Sheila Coleman', 30, b'1', 'Desktop Support Tech', '601492', 47, 182),
(83, 'Shel Goricke', 49, b'1', 'Analog Circuit Desig', '675044', 74, 446),
(84, 'Edeline Von Gladbach', 41, b'1', 'Product Engineer', '869449', 92, 35),
(85, 'Rolfe Heake', 32, b'1', 'Account Representati', '691764', 41, 11),
(86, 'Shelby Kynd', 74, b'1', 'Speech Pathologist', '308499', 79, 47),
(87, 'Marjory Johnys', 25, b'1', 'Compensation Analyst', '936303', 42, 171),
(88, 'Benjamen Potier', 26, b'1', 'VP Sales', '592816', 78, 454),
(89, 'Betteanne Rowlands', 45, b'1', 'Research Associate', '535192', 46, 145),
(90, 'Titus Stemson', 56, b'1', 'Assistant Media Plan', '258526', 59, 313),
(91, 'Davin Botly', 58, b'1', 'Payment Adjustment C', '709772', 69, 355),
(92, 'Willi Vasyunichev', 75, b'1', 'Speech Pathologist', '276550', 74, 312),
(93, 'Sheridan Kubacki', 54, b'1', 'Software Test Engine', '827458', 71, 26),
(94, 'Killy Seedhouse', 76, b'1', 'VP Quality Control', '137547', 42, 240),
(95, 'Kiley Brownlie', 20, b'1', 'Geologist III', '789100', 63, 125),
(96, 'Peter Winkett', 43, b'1', 'Developer II', '518334', 60, 220),
(97, 'Minnnie Volkes', 49, b'1', 'Business Systems Dev', '330446', 87, 117),
(98, 'Denny Roantree', 48, b'1', 'Design Engineer', '193691', 92, 470),
(99, 'Mufinella Ioannidis', 74, b'1', 'Actuary', '736385', 59, 309),
(100, 'Stillmann Goldes', 26, b'1', 'Pharmacist', '175092', 50, 168),
(123, 'shoham', 19, b'1', 'manager', '123456', 100, 240),
(45312, 'mom', 45, b'0', 'chef', '156756', 80, 240);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `prodName` varchar(30) NOT NULL,
  `amount` int(2) NOT NULL,
  `allergen` varchar(30) DEFAULT NULL,
  `vegan` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `maintain`
--

CREATE TABLE `maintain` (
  `roomId` int(11) DEFAULT NULL,
  `empId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomId` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `maxPeople` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomId`, `name`, `maxPeople`, `price`) VALUES
(123, 'bed', 2, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `roomorder`
--

CREATE TABLE `roomorder` (
  `OrderId` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `roomNumber` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers_orders`
--

CREATE TABLE `suppliers_orders` (
  `orderId` int(4) NOT NULL,
  `prodName` varchar(30) NOT NULL,
  `amount` int(2) NOT NULL,
  `suppliersId` int(4) NOT NULL,
  `priority` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerId`);

--
-- Indexes for table `diningroomorder`
--
ALTER TABLE `diningroomorder`
  ADD PRIMARY KEY (`orderNum`);

--
-- Indexes for table `dish_details`
--
ALTER TABLE `dish_details`
  ADD PRIMARY KEY (`dishName`,`prodName`),
  ADD KEY `prodName` (`prodName`);

--
-- Indexes for table `dish_prices`
--
ALTER TABLE `dish_prices`
  ADD PRIMARY KEY (`dishName`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`prodName`);

--
-- Indexes for table `maintain`
--
ALTER TABLE `maintain`
  ADD KEY `roomId` (`roomId`),
  ADD KEY `empId` (`empId`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomId`);

--
-- Indexes for table `roomorder`
--
ALTER TABLE `roomorder`
  ADD PRIMARY KEY (`OrderId`),
  ADD KEY `roomNumber` (`roomNumber`),
  ADD KEY `customerId` (`customerId`);

--
-- Indexes for table `suppliers_orders`
--
ALTER TABLE `suppliers_orders`
  ADD PRIMARY KEY (`prodName`,`orderId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dish_details`
--
ALTER TABLE `dish_details`
  ADD CONSTRAINT `dish_details_ibfk_1` FOREIGN KEY (`dishName`) REFERENCES `dish_prices` (`dishName`) ON DELETE CASCADE,
  ADD CONSTRAINT `dish_details_ibfk_2` FOREIGN KEY (`prodName`) REFERENCES `suppliers_orders` (`prodName`) ON DELETE CASCADE;

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`prodName`) REFERENCES `suppliers_orders` (`prodName`) ON DELETE CASCADE;

--
-- Constraints for table `maintain`
--
ALTER TABLE `maintain`
  ADD CONSTRAINT `maintain_ibfk_1` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`) ON DELETE CASCADE,
  ADD CONSTRAINT `maintain_ibfk_2` FOREIGN KEY (`empId`) REFERENCES `employee` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roomorder`
--
ALTER TABLE `roomorder`
  ADD CONSTRAINT `roomorder_ibfk_1` FOREIGN KEY (`roomNumber`) REFERENCES `room` (`roomId`) ON DELETE CASCADE,
  ADD CONSTRAINT `roomorder_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
