-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2023 at 10:53 AM
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
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` bigint(50) NOT NULL,
  `date` date NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `date`, `starttime`, `endtime`, `status`) VALUES
(7650546554, '2023-05-25', '06:00:00', '07:00:00', 'NotDone');

-- --------------------------------------------------------

--
-- Table structure for table `diagnose`
--

CREATE TABLE `diagnose` (
  `appt` bigint(50) NOT NULL,
  `doctor` varchar(50) NOT NULL,
  `diagnosis` varchar(40) NOT NULL,
  `prescription` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `diagnose`
--

INSERT INTO `diagnose` (`appt`, `doctor`, `diagnosis`, `prescription`) VALUES
(7650546554, 'doc@doc.doc', 'Not Yet Diagnosed', 'Not Yet Diagnosed');

-- --------------------------------------------------------

--
-- Table structure for table `docshaveschedules`
--

CREATE TABLE `docshaveschedules` (
  `sched` int(11) NOT NULL,
  `doctor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `email` varchar(50) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`email`, `gender`, `password`, `name`) VALUES
('doc@doc.doc', 'Male', '12345678', 'Chrg Doc');

-- --------------------------------------------------------

--
-- Table structure for table `doctorviewshistory`
--

CREATE TABLE `doctorviewshistory` (
  `history` int(11) NOT NULL,
  `doctor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medicalhistory`
--

CREATE TABLE `medicalhistory` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `conditions` varchar(100) NOT NULL,
  `surgeries` varchar(100) NOT NULL,
  `medication` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(60) NOT NULL,
  `gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`email`, `password`, `name`, `address`, `gender`) VALUES
('test@test.test', '12345678', 'Chirag Chrg', 'mlore', 'Male'),
('testa@doc.com', '12345678', 'test A', 'mlore', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `patientsattendappointments`
--

CREATE TABLE `patientsattendappointments` (
  `patient` varchar(50) NOT NULL,
  `appt` bigint(50) NOT NULL,
  `concerns` varchar(40) NOT NULL,
  `symptoms` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patientsattendappointments`
--

INSERT INTO `patientsattendappointments` (`patient`, `appt`, `concerns`, `symptoms`) VALUES
('testa@doc.com', 7650546554, 'dvsds', 'svsdvsdvsv');

-- --------------------------------------------------------

--
-- Table structure for table `patientsfillhistory`
--

CREATE TABLE `patientsfillhistory` (
  `patient` varchar(50) NOT NULL,
  `history` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `breaktime` time NOT NULL,
  `day` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diagnose`
--
ALTER TABLE `diagnose`
  ADD PRIMARY KEY (`appt`,`doctor`),
  ADD KEY `doctor` (`doctor`);

--
-- Indexes for table `docshaveschedules`
--
ALTER TABLE `docshaveschedules`
  ADD PRIMARY KEY (`sched`,`doctor`),
  ADD KEY `doctor` (`doctor`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `doctorviewshistory`
--
ALTER TABLE `doctorviewshistory`
  ADD PRIMARY KEY (`history`,`doctor`),
  ADD KEY `doctor` (`doctor`);

--
-- Indexes for table `medicalhistory`
--
ALTER TABLE `medicalhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `patientsattendappointments`
--
ALTER TABLE `patientsattendappointments`
  ADD PRIMARY KEY (`patient`,`appt`),
  ADD KEY `appt` (`appt`);

--
-- Indexes for table `patientsfillhistory`
--
ALTER TABLE `patientsfillhistory`
  ADD PRIMARY KEY (`history`),
  ADD KEY `patient` (`patient`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`,`starttime`,`endtime`,`breaktime`,`day`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `diagnose`
--
ALTER TABLE `diagnose`
  ADD CONSTRAINT `diagnose_ibfk_1` FOREIGN KEY (`appt`) REFERENCES `appointment` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `diagnose_ibfk_2` FOREIGN KEY (`doctor`) REFERENCES `doctor` (`email`) ON DELETE CASCADE;

--
-- Constraints for table `docshaveschedules`
--
ALTER TABLE `docshaveschedules`
  ADD CONSTRAINT `docshaveschedules_ibfk_1` FOREIGN KEY (`sched`) REFERENCES `schedule` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `docshaveschedules_ibfk_2` FOREIGN KEY (`doctor`) REFERENCES `doctor` (`email`) ON DELETE CASCADE;

--
-- Constraints for table `doctorviewshistory`
--
ALTER TABLE `doctorviewshistory`
  ADD CONSTRAINT `doctorviewshistory_ibfk_1` FOREIGN KEY (`doctor`) REFERENCES `doctor` (`email`) ON DELETE CASCADE,
  ADD CONSTRAINT `doctorviewshistory_ibfk_2` FOREIGN KEY (`history`) REFERENCES `medicalhistory` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `patientsattendappointments`
--
ALTER TABLE `patientsattendappointments`
  ADD CONSTRAINT `patientsattendappointments_ibfk_1` FOREIGN KEY (`patient`) REFERENCES `patient` (`email`) ON DELETE CASCADE,
  ADD CONSTRAINT `patientsattendappointments_ibfk_2` FOREIGN KEY (`appt`) REFERENCES `appointment` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `patientsfillhistory`
--
ALTER TABLE `patientsfillhistory`
  ADD CONSTRAINT `patientsfillhistory_ibfk_1` FOREIGN KEY (`patient`) REFERENCES `patient` (`email`) ON DELETE CASCADE,
  ADD CONSTRAINT `patientsfillhistory_ibfk_2` FOREIGN KEY (`history`) REFERENCES `medicalhistory` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
