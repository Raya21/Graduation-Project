-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2022 at 12:58 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `handinhand`
--

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `topic` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `date` date NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'not read'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`id`, `username`, `email`, `topic`, `message`, `date`, `status`) VALUES
(1, '', '', '', '', '2022-11-17', 'not read'),
(2, 'raya', 'rta@gmail.com', 'c', 'c', '2022-11-17', 'not read'),
(3, 'h', 'hh@gmail.com', 'موضوع', 'لا وووو', '2022-11-17', 'not read'),
(4, 'raya', 'rta@gmail.com', '', '', '2022-11-17', 'not read'),
(5, 'raya', 'rta@gmail.com', '', '', '2022-11-17', 'not read'),
(6, 'raya', 'rta@gmail.com', 'uu', 'cf', '2022-11-17', 'not read'),
(7, 'raya', 'rta@gmail.com', 'الىىى', 'متتت', '2022-11-17', 'not read'),
(8, 'raya', 'rta@gmail.com', 'gg', 'ggggg', '2022-11-17', 'not read'),
(9, 'raya', 'rta@gmail.com', 't', 'h', '2022-11-17', 'not read'),
(10, 'raya', 'rta@gmail.com', 'rrr', 'fffff', '2022-11-17', 'not read'),
(11, 'raya', 'rta@gmail.com', 'r', 'v', '2022-11-17', 'not read'),
(12, 'raya', 'rta@gmail.com', 't', 's', '2022-11-17', 'not read'),
(13, 'raya', 'rta@gmail.com', 'ff', 'gg', '2022-11-17', 'not read'),
(14, 'raya', 'rta@gmail.com', 'cc', 'c', '2022-11-17', 'not read'),
(15, '', '', '', '', '2022-11-19', 'not read');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
