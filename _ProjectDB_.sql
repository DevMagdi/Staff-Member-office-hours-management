-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 15, 2021 at 05:56 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `staffmember`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact_staffmember`
--

DROP TABLE IF EXISTS `contact_staffmember`;
CREATE TABLE IF NOT EXISTS `contact_staffmember` (
  `name` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_staffmember`
--

INSERT INTO `contact_staffmember` (`name`, `mail`, `department`) VALUES
('sherif zahran', 's.zahran@fci-cu.edu.eg', 'IS'),
('mohamed ramadan', 'm.ramadan@fci-cu.edu.eg', 'CS');

-- --------------------------------------------------------

--
-- Table structure for table `office_hours`
--

DROP TABLE IF EXISTS `office_hours`;
CREATE TABLE IF NOT EXISTS `office_hours` (
  `name` varchar(100) NOT NULL,
  `courseid` varchar(100) NOT NULL,
  `coursename` varchar(100) NOT NULL,
  `sat` varchar(100) NOT NULL,
  `sun` varchar(100) NOT NULL,
  `mon` varchar(100) NOT NULL,
  `tues` varchar(100) NOT NULL,
  `wed` varchar(100) NOT NULL,
  `thu` varchar(100) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `office_hours`
--

INSERT INTO `office_hours` (`name`, `courseid`, `coursename`, `sat`, `sun`, `mon`, `tues`, `wed`, `thu`) VALUES
('Dr: Abeer Elkorny', 'CS361', 'Artificial Intelligence', '', '09:30: 10:45', '', '', '02:30: 04:00', ''),
('Dr: Soha Makady', 'CS213', 'ObjectOrientedProgramming', '', '', '02:30: 04:00', '11:15: 12:30', '', '02:30: 04:00'),
('Dr: Besheer Abdelfatah', 'CS214', 'Data structure', '', '11:15: 12:30 & 02:30: 04:00', '', '', '', '02:30: 04:00'),
('Dr: Hoda Mokhtar', 'IS312', 'Database Systems II', '', '', '11:15: 12:30 & 02:30: 04:00', '', '', '01:15: 02:30 & 04:30: 06:00'),
('Dr: Ihab Ezat', 'IS313', 'Data Storage and Retrieval', '', '04:30: 06:00', '', '', '09:45: 02:30', ''),
('Dr: Neamat Abdelhady', 'IS352', 'Analysis and Design of Information Systems', '', '', '01:15: 02:30', '', '08:00: 09:45 ', ''),
('Dr: Mohamed Wahby', 'T241', 'Signals and Systems', '', '', '8:00 - 9:30', '9:30 - 1:00', '', '3:00 - 4:00'),
('Dr: Mohamed Elrefaay', 'IT222', 'Computer Networks -1', '', '', '8:30 - 11:30', '', '8:30 - 11:30', ''),
('Dr: Iman Sanad', 'T322', 'Computer Networks-2', '', '11:00 to 2:00 ', '11:00 to 2:00', '', '', '11:00 to 2:00'),
('Dr: Mohamed Saleh', 'DS241', 'Modeling and Simulation', '', '10:00-2:30', '1:00-2:30 ', '', '2:00-3:00', ''),
('Dr: Moataz Khorshid', 'DS332', 'Decision Support Systems and Applications', '', '12:00 - 6:00', '', '', '10:00 - 4:00', ''),
('Dr: Ihab Elkhodary', 'DS342', 'Computer Languages for Modeling and Operations Research (Excel) ', '', '12:00 - 3:00', '', '1:00 - 3:00', '', '10:00 - 1:00'),
('Ta: Ahmed Abdelaziz', 'IS313', 'Data Storage and Retrieval', '', '10:00-2:30', '2:00-3:00', '', '1:00-2:30', ''),
('Ta: Sherif Zahran', 'IS312', 'Database Systems II', '', '', '9:30 - 11:30', '9:30 - 12:30', '', '2:30 - 04:00'),
('Ta: Hayam Gamal', 'DS332', 'Decision Support Systems and Applications', '', '12:30 to 3:30', '1:00 to 3:00', '9:00 to 12:00', '', ''),
('Ta: Amr Magdy', 'CS361', 'Artificial Intelligence', '', '2:30 - 04:00', '', '9:30 - 12:30', '', '9:30 - 11:30 '),
('Ta: Mohamed Talaat', 'IT241', 'Signals and Systems', '', '', '10:00-12:00', '', '10:00-1:00', '10:00-12:00');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `members` varchar(50) NOT NULL,
  `slot` int(10) NOT NULL,
  `date` date NOT NULL,
  `Status` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `members`, `slot`, `date`, `Status`, `mail`) VALUES
(1, 'mmmm', 4, '2021-01-19', 'Cancelled', 'Mohamedmigo98@gmail.com'),
(2, 'sherif zahran', 4, '2020-12-29', 'Done', 'mmigo971@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `slots_reservation`
--

DROP TABLE IF EXISTS `slots_reservation`;
CREATE TABLE IF NOT EXISTS `slots_reservation` (
  `slot` int(50) NOT NULL,
  `from_date` varchar(50) NOT NULL,
  `to_date` varchar(50) NOT NULL,
  PRIMARY KEY (`slot`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slots_reservation`
--

INSERT INTO `slots_reservation` (`slot`, `from_date`, `to_date`) VALUES
(2, '09:30', '10:45'),
(1, '08:00', '09:30');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `mail`) VALUES
(20160219, 'mohamed magdy mohamed', 'mohamedmigo98@gmail.com');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
