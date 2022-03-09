-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2022 at 06:27 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `client_id` int(11) NOT NULL,
  `client_name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `isMale` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `maintane`
--

CREATE TABLE `maintane` (
  `room_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `maintenanceemp`
--

CREATE TABLE `maintenanceemp` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `isMale` bit(1) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `max_people` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roomorder`
--

CREATE TABLE `roomorder` (
  `OrderId` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `room_number` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `maintane`
--
ALTER TABLE `maintane`
  ADD KEY `room_id` (`room_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `maintenanceemp`
--
ALTER TABLE `maintenanceemp`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `roomorder`
--
ALTER TABLE `roomorder`
  ADD PRIMARY KEY (`OrderId`),
  ADD KEY `room_number` (`room_number`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `maintane`
--
ALTER TABLE `maintane`
  ADD CONSTRAINT `maintane_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `maintane_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `maintenanceemp` (`emp_id`) ON DELETE CASCADE;

--
-- Constraints for table `maintenanceemp`
--
ALTER TABLE `maintenanceemp`
  ADD CONSTRAINT `maintenanceemp_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE CASCADE;

--
-- Constraints for table `roomorder`
--
ALTER TABLE `roomorder`
  ADD CONSTRAINT `roomorder_ibfk_1` FOREIGN KEY (`room_number`) REFERENCES `room` (`room_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `roomorder_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`client_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
