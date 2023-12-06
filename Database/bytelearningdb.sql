-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2023 at 08:20 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bytelearningdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Id` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `Password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Id`, `Name`, `Password`) VALUES
(1, 'Admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `doubts`
--

CREATE TABLE `doubts` (
  `Id` int(11) NOT NULL,
  `DoubtTitle` varchar(255) NOT NULL,
  `DoubtDescription` text NOT NULL,
  `ProfessorId` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL,
  `PlaylistId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `Id` int(11) NOT NULL,
  `FollowerStudentId` int(11) NOT NULL,
  `FollowingProfessorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`Id`, `FollowerStudentId`, `FollowingProfessorId`) VALUES
(2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ownedplaylist`
--

CREATE TABLE `ownedplaylist` (
  `Id` int(11) NOT NULL,
  `PlaylistId` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE `playlist` (
  `Id` int(11) NOT NULL,
  `ProfessorId` int(11) NOT NULL,
  `SubjectId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `DateOfPublication` date NOT NULL,
  `Status` varchar(20) NOT NULL DEFAULT 'Disapproved'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playlist`
--

INSERT INTO `playlist` (`Id`, `ProfessorId`, `SubjectId`, `Name`, `Description`, `DateOfPublication`, `Status`) VALUES
(1, 1, 1, 'Testing Name 1', 'Testing Description 1', '2023-12-12', 'Disapproved');

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE `professors` (
  `Id` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `About` varchar(250) NOT NULL,
  `Gender` varchar(250) NOT NULL,
  `Age` varchar(10) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Education` varchar(250) NOT NULL,
  `JoiningDate` date NOT NULL,
  `ProfessorImageName` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`Id`, `Name`, `Password`, `About`, `Gender`, `Age`, `Email`, `Education`, `JoiningDate`, `ProfessorImageName`) VALUES
(1, 'testing testing', '123', 'This is about testing', 'Male', '12', 'testing@gmail.com', 'Graduate', '2023-02-02', 'image.png');

-- --------------------------------------------------------

--
-- Table structure for table `ratingandreview`
--

CREATE TABLE `ratingandreview` (
  `Id` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL,
  `ProfessorId` int(11) NOT NULL,
  `PlaylistId` int(11) NOT NULL,
  `Rating` int(11) NOT NULL,
  `Review` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `About` varchar(250) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Age` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Education` varchar(255) NOT NULL,
  `JoiningDate` date NOT NULL,
  `StudentImageName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`Id`, `Name`, `Password`, `About`, `Gender`, `Age`, `Email`, `Education`, `JoiningDate`, `StudentImageName`) VALUES
(1, 'testing testing', '123', 'This is about testing', 'Male', 12, 'testing@gmail.com', 'Graduate', '2023-02-02', 'studentImage.png');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ImageName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`Id`, `Name`, `ImageName`) VALUES
(1, 'Android', 'android.png');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `Id` int(11) NOT NULL,
  `PlaylistId` int(11) NOT NULL,
  `Video` blob NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `VideoThumbnail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `doubts`
--
ALTER TABLE `doubts`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ProfessorId` (`ProfessorId`),
  ADD KEY `StudentId` (`StudentId`),
  ADD KEY `PlaylistId` (`PlaylistId`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FollowerStudentId` (`FollowerStudentId`),
  ADD KEY `FollowingProfessorId` (`FollowingProfessorId`);

--
-- Indexes for table `ownedplaylist`
--
ALTER TABLE `ownedplaylist`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `PlaylistId` (`PlaylistId`),
  ADD KEY `StudentId` (`StudentId`);

--
-- Indexes for table `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ProfessorId` (`ProfessorId`),
  ADD KEY `SubjectId` (`SubjectId`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `ratingandreview`
--
ALTER TABLE `ratingandreview`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `StudentId` (`StudentId`),
  ADD KEY `ProfessorId` (`ProfessorId`),
  ADD KEY `PlaylistId` (`PlaylistId`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `PlaylistId` (`PlaylistId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doubts`
--
ALTER TABLE `doubts`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ownedplaylist`
--
ALTER TABLE `ownedplaylist`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `playlist`
--
ALTER TABLE `playlist`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `professors`
--
ALTER TABLE `professors`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ratingandreview`
--
ALTER TABLE `ratingandreview`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doubts`
--
ALTER TABLE `doubts`
  ADD CONSTRAINT `doubts_ibfk_1` FOREIGN KEY (`ProfessorId`) REFERENCES `professors` (`Id`),
  ADD CONSTRAINT `doubts_ibfk_2` FOREIGN KEY (`StudentId`) REFERENCES `students` (`Id`),
  ADD CONSTRAINT `doubts_ibfk_3` FOREIGN KEY (`PlaylistId`) REFERENCES `playlist` (`Id`);

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_ibfk_1` FOREIGN KEY (`FollowerStudentId`) REFERENCES `students` (`Id`),
  ADD CONSTRAINT `followers_ibfk_2` FOREIGN KEY (`FollowingProfessorId`) REFERENCES `professors` (`Id`);

--
-- Constraints for table `ownedplaylist`
--
ALTER TABLE `ownedplaylist`
  ADD CONSTRAINT `ownedplaylist_ibfk_1` FOREIGN KEY (`PlaylistId`) REFERENCES `playlist` (`Id`),
  ADD CONSTRAINT `ownedplaylist_ibfk_2` FOREIGN KEY (`StudentId`) REFERENCES `students` (`Id`);

--
-- Constraints for table `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`SubjectId`) REFERENCES `subjects` (`Id`),
  ADD CONSTRAINT `playlist_ibfk_2` FOREIGN KEY (`ProfessorId`) REFERENCES `professors` (`Id`),
  ADD CONSTRAINT `playlist_ibfk_3` FOREIGN KEY (`SubjectId`) REFERENCES `subjects` (`Id`);

--
-- Constraints for table `ratingandreview`
--
ALTER TABLE `ratingandreview`
  ADD CONSTRAINT `ratingandreview_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `students` (`Id`),
  ADD CONSTRAINT `ratingandreview_ibfk_2` FOREIGN KEY (`StudentId`) REFERENCES `students` (`Id`),
  ADD CONSTRAINT `ratingandreview_ibfk_3` FOREIGN KEY (`ProfessorId`) REFERENCES `professors` (`Id`),
  ADD CONSTRAINT `ratingandreview_ibfk_4` FOREIGN KEY (`PlaylistId`) REFERENCES `playlist` (`Id`);

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`PlaylistId`) REFERENCES `playlist` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
