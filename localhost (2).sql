-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 17, 2022 at 12:12 PM
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
CREATE DATABASE IF NOT EXISTS `handinhand` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `handinhand`;

-- --------------------------------------------------------

--
-- Table structure for table `brothersdata`
--

CREATE TABLE `brothersdata` (
  `userId` int NOT NULL,
  `userIdCard` int NOT NULL,
  `BrotherId` int NOT NULL,
  `StudentName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RegistrationNumber` int NOT NULL,
  `CollegeName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UniversityName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brothersdata`
--

INSERT INTO `brothersdata` (`userId`, `userIdCard`, `BrotherId`, `StudentName`, `RegistrationNumber`, `CollegeName`, `UniversityName`) VALUES
(1, 85236977, 0, 'j', 3, 'u', 'vvvbbb'),
(1, 85236977, 1, 'toop', 6699, 'hggv', 'moop'),
(1, 85236977, 2, 'ghhho', 33369, 'hoo', 'bcvcd'),
(9, 85236977, 0, 'غنى احمد', 1193365, 'طب', 'النجاح '),
(11, 233689, 0, 'حسن احمدمحمود', 11722369, 'طب', 'النجاح'),
(11, 233689, 1, ' معتصم عمر ', 1142258, ' هندسة ', ' القدس '),
(19, 99, 0, 'احمد محمد', 113699, 'طب', 'النجاح الوطنية ');

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
  `userId` int NOT NULL,
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
  `parentsSocialSit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `familydatas1`
--

INSERT INTO `familydatas1` (`studentIdCard`, `userId`, `studentName`, `studentNumber`, `fatherName`, `fatherIdCard`, `fatherCareerStatus`, `fatherWorkPlace`, `fatherJob`, `fatherWorkNature`, `fatherJobDesc`, `motherName`, `motherIdCard`, `motherCareerStatus`, `motherWorkPlace`, `motherJob`, `motherWorkNature`, `motherJobDesc`, `hwName`, `hwIdCard`, `hwCareerStatus`, `hwWorkPlace`, `hwJob`, `hwWorkNature`, `hwJobDesc`, `studentSocialSit`, `parentsSocialSit`) VALUES
(2, 13, 'b', 5, 'bb', 9, 'يعمل', 'وزارة الصحة', 'مدير عام فأعلى', 'موظف', '', 'f', 222, 'متقاعد', 'وزارة الصحة', 'مدير عام فأعلى', 'موظف', 'yy', 'gg', 55, 'مسن / مريض', 'وزارة التربية والتعليم العالي', 'مدير عام فأعلى', 'موظف', '', 'أعزب', 'مطلقان'),
(99, 19, 'u', 3, 'gg', 3, 'لا يعمل', 'وزارة الصحة', 'مدير عام فأعلى', 'موظف', 'g', 'g', 8, 'أسير', 'باقي الوزارات', 'مدير عام فأعلى', 'موظف', 'bbb', 'l', 3, 'لا يعمل', 'وزارة التربية والتعليم العالي', 'مدير عام فأعلى', 'موظف', 'g', 'أعزب', 'متزوجان'),
(211, 1, 'd', 22, 'y', 3, 'أسير', 'وزارة الصحة', 'مدير عام فأعلى', 'موظف', '', 'y', 2, 'متوفي', 'باقي الوزارات', 'مدير عام فأعلى', 'مستأجر مكان / أدوات للعمل', 'hy', 'c', 5, 'أسير', 'وزارة الصحة', 'مدير', 'موظف', 'hh', 'أعزب', 'متزوجان'),
(233689, 11, 'raya', 11820056, 'Ahmad Mohammad ahmad ', 999632285, 'يعمل', 'ليست وظيفة حكومية', 'مقاول', 'يمتلك مكانًا / أدوات عمل', '', 'jamela Ahmed ', 99882003, 'يعمل', 'وزارة التربية والتعليم العالي', 'معلم', 'موظف', '', '', 0, ' ', ' ', ' ', ' ', '', 'أعزب', 'متزوجان'),
(85236977, 9, 'عمر', 1123369, 'محمد', 8895632, 'يعمل', 'وزارة التربية والتعليم العالي', 'مدير', 'موظف', '', 'علا', 8845523, 'لا يعمل', '----', '----', '----', '', '', 0, ' ', ' ', ' ', ' ', '', 'أعزب', 'متزوجان');

-- --------------------------------------------------------

--
-- Table structure for table `familydatas2`
--

CREATE TABLE `familydatas2` (
  `studentIdCard` int NOT NULL,
  `userId` int NOT NULL,
  `relativeRelation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idNumber` int DEFAULT NULL,
  `workPlace` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `familydatas2`
--

INSERT INTO `familydatas2` (`studentIdCard`, `userId`, `relativeRelation`, `name`, `idNumber`, `workPlace`, `job`, `note`) VALUES
(2, 13, 'الأم', '', 0, ' ', ' ', ''),
(33, 333, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 911, '', NULL, NULL, NULL, NULL, NULL),
(99, 19, 'الأب', '', 0, 'وزارة الصحة', 'مدير', ''),
(211, 1, 'الأب', '', 0, 'وزارة التربية والتعليم العالي', 'مدير عام فأعلى', ''),
(233689, 11, 'الأم', 'bb', 6, ' ', ' ', ''),
(85236977, 9, 'الأب', '', 0, ' ', ' ', '');

-- --------------------------------------------------------

--
-- Table structure for table `familydatas3`
--

CREATE TABLE `familydatas3` (
  `studentIdCard` int NOT NULL,
  `userId` int NOT NULL,
  `numFamilyMem` int DEFAULT NULL,
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
(2, 13, 2, 3, '0 - 2000', 'لا', 0, 'ملك', ' ', 'مدينة', 0, 1, 0, 0, 'لا', 0),
(99, 19, 5, 3, '0 - 2000', 'لا', 99, 'ملك', ' ', 'قرية', 1, 0, 0, 99999, 'لا', 1),
(233689, 11, 5, 2, '0 - 2000', 'لا', 0, 'ملك', ' ', 'مدينة', 0, 0, 0, 0, 'لا', 2),
(85236977, 1, 69, 699, '3001 - 4000', 'لا', 66, 'تقيم مع عائلة أخرى دون دفع إيجار', '2001 _ 3000', 'مخيم', 2, 2, 2, 2555, 'لا', 3);

-- --------------------------------------------------------

--
-- Table structure for table `profileimages`
--

CREATE TABLE `profileimages` (
  `id` int NOT NULL,
  `image` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profileimages`
--

INSERT INTO `profileimages` (`id`, `image`) VALUES
(1, '9f9c9a39-94b5-46a5-a7c1-1bc21ad5709a903048475225789295.jpg'),
(11, '0f491b65-6975-4648-b20c-68b149ad136d6668788706764526992.jpg'),
(13, '8df0c0e5-630e-4abc-a4b4-1044f7216fc21011706274850762759.jpg'),
(19, 'image_picker2154091686283058091.png');

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
-- Indexes for table `brothersdata`
--
ALTER TABLE `brothersdata`
  ADD PRIMARY KEY (`userId`,`BrotherId`);

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
-- Indexes for table `profileimages`
--
ALTER TABLE `profileimages`
  ADD PRIMARY KEY (`id`);

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
