-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 13, 2018 at 11:42 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `transport`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `licence_plate_number` int(11) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `model` varchar(55) DEFAULT NULL,
  `driver_name` varchar(55) DEFAULT NULL,
  `fk_route_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bus_station`
--

CREATE TABLE `bus_station` (
  `bus_station_id` int(11) NOT NULL,
  `address` varchar(55) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `fk_city_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cover`
--

CREATE TABLE `cover` (
  `cover_id` int(11) NOT NULL,
  `fk_city_id` int(11) DEFAULT NULL,
  `fk_route_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `route_code` int(11) NOT NULL,
  `total_distance` int(11) DEFAULT NULL,
  `route_source` varchar(55) DEFAULT NULL,
  `route_destination` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `travel_order`
--

CREATE TABLE `travel_order` (
  `order_number` int(11) NOT NULL,
  `fk_route_code` int(11) DEFAULT NULL,
  `fk_bus_station_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`licence_plate_number`),
  ADD KEY `fk_route_code` (`fk_route_code`);

--
-- Indexes for table `bus_station`
--
ALTER TABLE `bus_station`
  ADD PRIMARY KEY (`bus_station_id`),
  ADD KEY `fk_city_id` (`fk_city_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `cover`
--
ALTER TABLE `cover`
  ADD PRIMARY KEY (`cover_id`),
  ADD KEY `fk_city_id` (`fk_city_id`),
  ADD KEY `fk_route_code` (`fk_route_code`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_code`);

--
-- Indexes for table `travel_order`
--
ALTER TABLE `travel_order`
  ADD PRIMARY KEY (`order_number`),
  ADD KEY `fk_route_code` (`fk_route_code`),
  ADD KEY `fk_bus_station_id` (`fk_bus_station_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`fk_route_code`) REFERENCES `route` (`route_code`);

--
-- Constraints for table `bus_station`
--
ALTER TABLE `bus_station`
  ADD CONSTRAINT `bus_station_ibfk_1` FOREIGN KEY (`fk_city_id`) REFERENCES `city` (`city_id`);

--
-- Constraints for table `cover`
--
ALTER TABLE `cover`
  ADD CONSTRAINT `cover_ibfk_1` FOREIGN KEY (`fk_city_id`) REFERENCES `city` (`city_id`),
  ADD CONSTRAINT `cover_ibfk_2` FOREIGN KEY (`fk_route_code`) REFERENCES `route` (`route_code`);

--
-- Constraints for table `travel_order`
--
ALTER TABLE `travel_order`
  ADD CONSTRAINT `travel_order_ibfk_1` FOREIGN KEY (`fk_route_code`) REFERENCES `route` (`route_code`),
  ADD CONSTRAINT `travel_order_ibfk_2` FOREIGN KEY (`fk_bus_station_id`) REFERENCES `bus_station` (`bus_station_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
