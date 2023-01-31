-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2021 at 09:58 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
(1, 'beni', '$2y$10$n44qKkas1BkXO7DD3pgd6.IAfWJ//ExaYTCP7mTpSvhU28uBN8.AO', 'Joseph', 'Benipayo', 'profi.jpg', '2018-04-30');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_in` time NOT NULL,
  `status` int(1) NOT NULL,
  `time_out` time NOT NULL,
  `num_hr` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `date`, `time_in`, `status`, `time_out`, `num_hr`) VALUES
(100, 11, '2020-12-27', '17:42:14', 0, '00:00:00', 0),
(101, 8, '2020-12-27', '18:01:40', 0, '00:00:00', 0),
(102, 11, '2020-12-30', '01:40:11', 1, '00:00:00', 0),
(103, 8, '2020-12-30', '05:10:51', 1, '00:00:00', 0),
(104, 9, '2020-12-30', '05:10:54', 1, '00:00:00', 0),
(106, 11, '2020-12-31', '15:20:59', 0, '15:21:24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(15) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `birthdate` date NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `position_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `employee_id`, `firstname`, `lastname`, `address`, `birthdate`, `contact_info`, `gender`, `position_id`, `schedule_id`, `photo`, `created_on`) VALUES
(5, 'JEB215370689', 'Nica ', 'Adlawan', 'Road 7 street Barangay Bagong Silangan Quezon City', '2000-06-20', '09354429253', 'Female', 1, 3, '', '2020-11-06'),
(6, 'IUY965170238', 'Jayvee', 'Aldovino ', '1654 Bato-Bato St. Brgy. Commonwealth Quezon City', '1999-12-04', '09291112008', 'Male', 1, 3, '', '2020-11-06'),
(7, 'NAT927814035', 'Aira', 'Alvarez', '203 Rosal St. Payatas A Quezon City.', '1999-11-04', '09484735275', 'Female', 1, 3, '', '2020-11-06'),
(8, 'GWE247856301', 'Rafael', 'Ardiente ', '24 Paguio cmpd Sitio 1 Brgy Sta.Lucia Nova Quezon City', '2001-08-29', '09616031524', 'Male', 1, 3, '', '2020-11-06'),
(9, 'SZL326941085', 'Jhomel', 'Balagan', '12-A Saint Vincent Brgy. Holy Spirit Quezon City', '2000-03-17', '09773962095', 'Male', 1, 3, '', '2020-11-06'),
(10, 'LKM958204763', 'Honey Lea', 'Barcos', '266 Sto Domingo St Brgy Holy Spirit Quezon City', '2000-09-27', '09654078243', 'Female', 1, 3, '', '2020-11-06'),
(11, 'CAS051867234', 'Joseph', 'Benipayo', '309 A Bato-Bato Street Barangay Commonwealth Quezon City', '2001-03-30', '09952659613', 'Male', 1, 3, '', '2020-11-06'),
(12, 'PKJ812306974', 'Harold', 'Bonete', 'Purok 6 Unit 7 Lower Nawasa Brgy. Commonwealth Quezon City', '2000-08-09', '09260140179', 'Male', 1, 3, '', '2020-11-06');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `description` varchar(150) NOT NULL,
  `rate` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `description`, `rate`) VALUES
(1, 'BAIT-2F', 100);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `time_in`, `time_out`) VALUES
(3, '15:00:00', '17:00:00'),
(4, '18:00:00', '21:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
