-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2018 at 03:17 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `cancer_type`
--

CREATE TABLE `cancer_type` (
  `name_cancer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `doctor_name` varchar(100) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `id` int(11) NOT NULL,
  `name` int(11) DEFAULT NULL,
  `pan_no` int(11) DEFAULT NULL,
  `phone_no` int(10) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `payment_amt` int(10) DEFAULT NULL,
  `mode_of_payment` varchar(10) NOT NULL,
  `purpose_of_donation` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `id` int(11) NOT NULL,
  `hospital_name` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `phone_no` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kit`
--

CREATE TABLE `kit` (
  `id` int(11) NOT NULL,
  `kit_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `main_program`
--

CREATE TABLE `main_program` (
  `name` varchar(100) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `hospital` varchar(100) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `type_of_cancer` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `date_of_reg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gender` varchar(10) NOT NULL,
  `file_no` varchar(100) NOT NULL,
  `phone_no` int(10) NOT NULL,
  `follow_up` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient_volunteer_relation`
--

CREATE TABLE `patient_volunteer_relation` (
  `patient_id` int(11) NOT NULL,
  `volunteer_id` int(11) NOT NULL,
  `sub_program_id` int(11) NOT NULL,
  `date_of_allotment` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `kit_id` int(11) NOT NULL,
  `quantity` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `description`) VALUES
(1, 'Admin', 'Administrative'),
(2, 'Volunteer', 'Volunteering'),
(3, 'Help Desk', 'Umeed');

-- --------------------------------------------------------

--
-- Table structure for table `sub_program`
--

CREATE TABLE `sub_program` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `main_program_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `query` varchar(100) DEFAULT NULL,
  `type_of_cancer` varchar(100) DEFAULT NULL,
  `phone_no` int(10) NOT NULL,
  `age` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `id` int(11) NOT NULL,
  `volunteer_name` varchar(10) DEFAULT NULL,
  `skills` varchar(100) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `phone_no` int(10) NOT NULL,
  `role_id` int(11) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cancer_type`
--
ALTER TABLE `cancer_type`
  ADD PRIMARY KEY (`name_cancer`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk` (`hospital_id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location` (`location`);

--
-- Indexes for table `kit`
--
ALTER TABLE `kit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_program`
--
ALTER TABLE `main_program`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_of_cancer` (`type_of_cancer`);

--
-- Indexes for table `patient_volunteer_relation`
--
ALTER TABLE `patient_volunteer_relation`
  ADD KEY `fk_patient` (`patient_id`),
  ADD KEY `fk_volunteer` (`volunteer_id`),
  ADD KEY `fk_sub_program` (`sub_program_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_key` (`kit_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_program`
--
ALTER TABLE `sub_program`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_program_id` (`main_program_id`);

--
-- Indexes for table `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_location` (`location`),
  ADD KEY `fk_cancer` (`type_of_cancer`);

--
-- Indexes for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kit`
--
ALTER TABLE `kit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_program`
--
ALTER TABLE `main_program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_program`
--
ALTER TABLE `sub_program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor`
--
ALTER TABLE `visitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `volunteer`
--
ALTER TABLE `volunteer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `fk` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`id`);

--
-- Constraints for table `hospital`
--
ALTER TABLE `hospital`
  ADD CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`location`) REFERENCES `city` (`name`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`type_of_cancer`) REFERENCES `cancer_type` (`name_cancer`);

--
-- Constraints for table `patient_volunteer_relation`
--
ALTER TABLE `patient_volunteer_relation`
  ADD CONSTRAINT `fk_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  ADD CONSTRAINT `fk_sub_program` FOREIGN KEY (`sub_program_id`) REFERENCES `sub_program` (`id`),
  ADD CONSTRAINT `fk_volunteer` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `foreign_key` FOREIGN KEY (`kit_id`) REFERENCES `kit` (`id`);

--
-- Constraints for table `sub_program`
--
ALTER TABLE `sub_program`
  ADD CONSTRAINT `sub_program_ibfk_1` FOREIGN KEY (`main_program_id`) REFERENCES `main_program` (`id`);

--
-- Constraints for table `visitor`
--
ALTER TABLE `visitor`
  ADD CONSTRAINT `fk_cancer` FOREIGN KEY (`type_of_cancer`) REFERENCES `cancer_type` (`name_cancer`),
  ADD CONSTRAINT `fk_location` FOREIGN KEY (`location`) REFERENCES `city` (`name`);

--
-- Constraints for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD CONSTRAINT `volunteer_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
