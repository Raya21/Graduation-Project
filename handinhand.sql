-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 24, 2022 at 04:14 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

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
  `id` int NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `topic` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`id`, `username`, `email`, `topic`, `message`, `date`) VALUES
(1, '', '', '', '', '2022-11-17'),
(2, 'raya', 'rta@gmail.com', 'c', 'c', '2022-11-17'),
(3, 'h', 'hh@gmail.com', 'موضوع', 'لا وووو', '2022-11-17'),
(4, 'raya', 'rta@gmail.com', '', '', '2022-11-17'),
(5, 'raya', 'rta@gmail.com', '', '', '2022-11-17'),
(6, 'raya', 'rta@gmail.com', 'uu', 'cf', '2022-11-17'),
(7, 'raya', 'rta@gmail.com', 'الىىى', 'متتت', '2022-11-17'),
(8, 'raya', 'rta@gmail.com', 'gg', 'ggggg', '2022-11-17'),
(9, 'raya', 'rta@gmail.com', 't', 'h', '2022-11-17'),
(10, 'raya', 'rta@gmail.com', 'rrr', 'fffff', '2022-11-17'),
(11, 'raya', 'rta@gmail.com', 'r', 'v', '2022-11-17'),
(12, 'raya', 'rta@gmail.com', 't', 's', '2022-11-17'),
(13, 'raya', 'rta@gmail.com', 'ff', 'gg', '2022-11-17'),
(14, 'raya', 'rta@gmail.com', 'cc', 'c', '2022-11-17'),
(15, '', '', '', '', '2022-11-19');

-- --------------------------------------------------------

--
-- Table structure for table `familydatas1`
--

CREATE TABLE `familydatas1` (
  `studentIdCard` int NOT NULL,
  `studentName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `studentNumber` int NOT NULL,
  `fatherName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fatherIdCard` int NOT NULL,
  `fatherCareerStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fatherWorkPlace` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fatherJob` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fatherWorkNature` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fatherJobDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `motherName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `motherIdCard` int NOT NULL,
  `motherCareerStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `motherWorkPlace` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `motherJob` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `motherWorkNature` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `motherJobDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hwName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hwIdCard` int DEFAULT NULL,
  `hwCareerStatus` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hwWorkPlace` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hwJob` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hwWorkNature` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hwJobDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `studentSocialSit` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `parentsSocialSit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `userId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `familydatas1`
--

INSERT INTO `familydatas1` (`studentIdCard`, `studentName`, `studentNumber`, `fatherName`, `fatherIdCard`, `fatherCareerStatus`, `fatherWorkPlace`, `fatherJob`, `fatherWorkNature`, `fatherJobDesc`, `motherName`, `motherIdCard`, `motherCareerStatus`, `motherWorkPlace`, `motherJob`, `motherWorkNature`, `motherJobDesc`, `hwName`, `hwIdCard`, `hwCareerStatus`, `hwWorkPlace`, `hwJob`, `hwWorkNature`, `hwJobDesc`, `studentSocialSit`, `parentsSocialSit`, `userId`) VALUES
(0, 'tt', 888, 'gg', 55, 'Prisoner', 'The Ministry of Education and Higher Education', 'General Manager and above', 'Employee', 'gggg', 'gg', 888, 'Deceased', 'The rest of the ministries', 'Administrator', 'Employee', 'vv', 'vv', 555, 'Aged/Sickly', 'The rest of the ministries', 'General Manager and above', 'Employee', 'v ', 'Single', 'One of them is dead', 1),
(2, 'e', 9, 'g', 6, 'LL', 'KK', 'KK', 'KK', 'r', 'f', 2, 'KK', 'KK', 'KK', 'KK', 'v', 'g', 5, 'KK', 'KK', 'KK', 'KK', 'c', 'KK', 'KK', 0),
(3, 'ث', 0, 'u', 6, 'Works', 'Ministry of Health', 'General Manager and above', 'Tenant of place/tools for work', 'y', 'r', 22, 'Aged/Sickly', 'The Ministry of Education and Higher Education', 'General Manager and above', 'Employee', 'u', 'y', 3, 'Retired', 'The Ministry of Education and Higher Education', 'General Manager and above', 'Tenant of place/tools for work', 'y', 'Single', 'One of them is dead', 0),
(99, 'g', 6, 'y', 8, 'Retired', 'Not a government job', 'Head of the Department', 'Employee', 'f', 'h', 9, 'Aged/Sickly', 'Not a government job', 'Administrator', 'Employee', 'y', 'f', 22, 'Aged/Sickly', 'Ministry of Health', 'General Manager and above', 'Employee', 't.', 'Married', 'Something Else', 19);

-- --------------------------------------------------------

--
-- Table structure for table `familydatas2`
--

CREATE TABLE `familydatas2` (
  `studentIdCard` int NOT NULL,
  `relativeRelation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idNumber` int DEFAULT NULL,
  `workPlace` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `userId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `familydatas2`
--

INSERT INTO `familydatas2` (`studentIdCard`, `relativeRelation`, `name`, `idNumber`, `workPlace`, `job`, `note`, `userId`) VALUES
(0, 'Husband/Wife', 'bbb', 666, 'Security Services', 'Head of the Department', 'hhh', 1),
(99, 'Me personally', ' ', 6, 'The rest of the ministries', 'Head of the Department', 'bb', 19);

-- --------------------------------------------------------

--
-- Table structure for table `familydatas3`
--

CREATE TABLE `familydatas3` (
  `studentIdCard` int NOT NULL,
  `userId` int NOT NULL,
  `numFamilyMem` int NOT NULL,
  `numMemDiseases` int NOT NULL,
  `familyIncome` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `familyAssistance` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cardNumber` int DEFAULT NULL,
  `familyHousing` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `monthlyRent` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `familyResidence` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `numPrivate` int NOT NULL,
  `numPublic` int NOT NULL,
  `numCommercial` int NOT NULL,
  `studentHousingFee` int DEFAULT NULL,
  `smoke` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `numUniversityStu` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `familydatas3`
--

INSERT INTO `familydatas3` (`studentIdCard`, `userId`, `numFamilyMem`, `numMemDiseases`, `familyIncome`, `familyAssistance`, `cardNumber`, `familyHousing`, `monthlyRent`, `familyResidence`, `numPrivate`, `numPublic`, `numCommercial`, `studentHousingFee`, `smoke`, `numUniversityStu`) VALUES
(9, 77, 1, 2, '2001 - 3000', 'لا', 6, 'تقيم مع عائلة أخرى دون دفع إيجار', '2001 _ 3000', 'في الخارج', 1, 1, 5, 5, 'لا', 2),
(99, 19, 1, 2, '0 - 2000', 'لا', 3, 'إيجار', '1000 _ 2000', 'مخيم', 2, 6, 5, 3, 'نعم', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'raya', 'rta@gmail.com', 'nn'),
(3, 'vv', 'rae@gmail.com', 'hhh'),
(4, 'ff', 'tt@gmail.com', 'rt'),
(5, 'yi', 'yy@gmail.com', 'jj'),
(6, 'y', 'yh@gmail.com', 'nbj'),
(7, 'u', 'gh@gmail.com', '87'),
(8, 'h', 'hh@gmail.com', 'bh'),
(9, 'y', 'gg@gmail.com', 'trr'),
(10, 'cç', 'vv', 'bbb'),
(11, 'ggg', 'ff', 'ff'),
(12, 'tt', 'tmt@gmail.com', 'oo'),
(13, 'bv', 'tr', 'oo'),
(15, 'gg', 'gbg@gmail.com', 'kk'),
(17, 'raya', 'raya52754@gmail.com', 'mm'),
(18, 'tt', 're@gmail.com', 'nnm'),
(19, '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `familydatas1`
--
ALTER TABLE `familydatas1`
  ADD PRIMARY KEY (`studentIdCard`);

--
-- Indexes for table `familydatas2`
--
ALTER TABLE `familydatas2`
  ADD PRIMARY KEY (`studentIdCard`);

--
-- Indexes for table `familydatas3`
--
ALTER TABLE `familydatas3`
  ADD PRIMARY KEY (`studentIdCard`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
