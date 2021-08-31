-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2021 at 04:49 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `intercollegiate_athletic`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `custno` char(4) NOT NULL,
  `custname` varchar(30) NOT NULL,
  `address` varchar(20) NOT NULL,
  `Internal` enum('Y','N') NOT NULL,
  `contact` varchar(20) NOT NULL,
  `phone` char(7) NOT NULL,
  `city` varchar(12) NOT NULL,
  `state` char(2) NOT NULL,
  `zip` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`custno`, `custname`, `address`, `Internal`, `contact`, `phone`, `city`, `state`, `zip`) VALUES
('c100', 'Football', 'Box 352200', 'Y', 'Mary Manager', '6857100', 'Boulder', 'C0', '80309'),
('C101', 'Men\'s Basektball', 'Box 352400', 'Y', 'Sally Supervisor', '5431700', 'Boulder', 'C0', '80309'),
('C103', 'Baseball', 'Box 352020', 'Y', 'Bill Baseball', '5431234', 'Boulder', 'C0', '80309'),
('C104', 'Women\'s Softball', 'Box 351200', 'Y', 'Sue Softball', '5434321', 'Boulder', 'C0', '80309'),
('C105', 'High School', '123 AnyStreet', 'N', 'Coach Bob', '441234', 'Louisville', 'C0', '80027');

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE `facility` (
  `facno` char(4) NOT NULL,
  `facname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`facno`, `facname`) VALUES
('F102', 'Baseball field'),
('F101', 'Basketball arena'),
('F100', 'Football Stadium'),
('F103', 'Recreation room');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `locno` char(4) NOT NULL,
  `facno` char(4) NOT NULL,
  `locname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`locno`, `facno`, `locname`) VALUES
('L100', 'F100', 'Locker room'),
('L101', 'F100', 'Plaza'),
('L102', 'F100', 'Vehicle gate'),
('L103', 'F101', 'Locker room'),
('L104', 'F100', 'Ticket Booth'),
('L105', 'F101', 'Gate'),
('L106', 'F100', 'Pedestrian');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`custno`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`facno`),
  ADD UNIQUE KEY `facname` (`facname`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`locno`),
  ADD KEY `facno` (`facno`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`facno`) REFERENCES `facility` (`facno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
