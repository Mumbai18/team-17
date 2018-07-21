-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2018 at 06:56 PM
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

--
-- Dumping data for table `cancer_type`
--

INSERT INTO `cancer_type` (`name_cancer`) VALUES
('Bladder Cancer'),
('Bone Cancer'),
('Boney Cancer'),
('Colon Cancer'),
('Colorectal Cancer'),
('Lung Cancer'),
('Prostate Cancer'),
('Throat Cancer');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`name`) VALUES
('Bangalore'),
('Delhi'),
('Hydrebad'),
('Mumbai'),
('Pune');

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
  `name` text,
  `pan_no` varchar(11) DEFAULT NULL,
  `phone_no` varchar(10) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `payment_amt` int(10) DEFAULT NULL,
  `mode_of_payment` varchar(10) NOT NULL,
  `purpose_of_donation` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`id`, `name`, `pan_no`, `phone_no`, `address`, `payment_amt`, `mode_of_payment`, `purpose_of_donation`) VALUES
(1, 'John Keates', 'AJUPS4789R', '9322218765', 'Andheri West', 25000, 'Cheque', ''),
(2, 'Michael Socrates', 'HFPX8973R', '9322217890', 'Bandra West', 30000, 'Cash', ''),
(3, 'Nigam Shah', 'AMGS7856E', '8080567489', 'Borivali East', 78000, 'Neft', ''),
(4, 'Shane Warne', 'HGXY7895D', '9702568432', 'Dadar West', 56000, 'DD', ''),
(5, 'Kalp Shah', 'AJYUS4321F', '9354217890', 'Nagpur', 47000, 'Cheque', ''),
(6, 'Atul Vohra', 'HGFX4562P', '7738657432', 'Bhayander East', 77000, 'DD', ''),
(7, 'Tanishk Patni', 'AJUYS4532Y', '9029675348', 'Pune', 125000, 'DD', ''),
(8, 'Neel Pandya', 'AJUIO5674R', '9929067530', 'Bangalore', 500000, 'Cash', ''),
(9, 'Piyush Bag', 'HUPY7894I', '9892988772', 'Hydrebad', 378000, 'Neft', ''),
(10, 'Nikhil Sakpal', 'AJTY5O674R', '8828657149', 'Trivandrum', 569000, 'DD', '');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `id` int(11) NOT NULL,
  `hospital_name` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `phone_no` varchar(10) NOT NULL
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
  `phone_no` varchar(10) NOT NULL,
  `follow_up` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `name`, `hospital`, `age`, `type_of_cancer`, `address`, `date_of_reg`, `last_modified`, `gender`, `file_no`, `phone_no`, `follow_up`, `password`) VALUES
(1, 'Aditya Sharma', 'JR Hospital', 29, 'Throat Cancer', 'Bhayander East', '2018-07-04 18:37:27', '2018-07-07 18:47:31', 'Male', 'TH765832', '9029456987', 'Follow Up Required weekly', 'aditya'),
(2, 'Sahil Sawant', 'City Hospital', 47, 'Lung Cancer', 'Mira Road', '2018-04-04 18:48:48', '2018-04-10 18:37:27', 'Male', 'CH678954', '9322218763', 'Medicines Required', 'sahil'),
(3, 'Vatsaliya Mehta', 'MM Hospital', 58, 'Colon Cancer', 'Kandivali West', '2017-09-18 18:42:27', '2017-09-26 18:43:12', 'Female', 'MM786543', '9920876431', 'Emotional support required', 'vatsaliya'),
(4, 'Riya Singh', 'City Hospital', 42, 'Bladder Cancer', 'Nagpur', '2018-10-04 18:45:48', '2018-10-18 18:48:52', 'Female', 'CH678754', '8975278654', 'Financial Support Required', 'riya'),
(5, 'Menka Singh', 'JR Hospital', 56, 'Colorectal Cancer', 'Hydrebad', '2018-12-04 18:48:27', '2018-12-16 18:41:32', 'Female', 'JR987645', '9920768542', 'Medicine Required', 'menka'),
(6, 'Rahul Tiwari', 'City Hospital', 39, 'Colon Cancer', 'Bangalore', '2018-05-18 18:42:27', '2018-06-06 18:47:30', 'Male', 'CH897651', '8897543672', 'Weekly Follow-Up Required', 'rahul'),
(7, 'Riddhi Mehta', 'MM Hospital', 49, 'Bladder Cancer', 'Pune', '2018-02-04 18:50:00', '2018-02-18 18:41:00', 'Female', 'MM896523', '7738790543', 'Financial Support Required', 'riddhi'),
(8, 'Saraswati Sharma', 'City Hospital', 55, 'Lung Cancer', 'Pune', '2018-01-08 18:50:36', '2018-01-22 18:42:30', 'Female', 'CH786543', '8080765432', 'No follow up required', 'saraswati'),
(9, 'Rohit Sharma', 'JR Hospital', 38, 'Throat Cancer', 'Bhayander East', '2017-06-04 18:42:30', '2017-06-30 18:41:00', 'Male', 'JR879065', '7758945321', 'Medicines Required', 'rohit'),
(10, 'Shikhar Mishra', 'City Hospital', 53, 'Throat Cancer', 'Pune', '2017-08-04 18:42:00', '2017-08-11 18:48:00', 'Male', 'CH786543', '8080654378', 'no follow up required', 'shikhar');

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
  `phone_no` varchar(10) NOT NULL,
  `age` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`id`, `name`, `location`, `gender`, `query`, `type_of_cancer`, `phone_no`, `age`) VALUES
(1, 'Vaibhav Shah', 'Bangalore', 'Male', 'Inquiry Regarding Funding For Relative', 'Bone Cancer', '9334218765', 34),
(2, 'Aaral Patni', 'Delhi', 'Female', 'Inquiry Regarding Mode of Payment For Donation', NULL, '7738796432', 29),
(3, 'Nitesh Shah', 'Hydrebad', 'Male', 'Inquiry Regarding Funding For Self', 'Throat Cancer', '8034675482', 61),
(4, 'Shalini Sharma', 'Pune', 'Female', 'Inquiry Regarding Organization', 'Colon Cancer', '8768956432', 43),
(5, 'Arpit Shah', 'Mumbai', 'Male', 'Inquiry Regarding Funding For Relative', 'Bladder Cancer', '7738795432', 49);

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `id` int(11) NOT NULL,
  `volunteer_name` varchar(20) DEFAULT NULL,
  `skills` varchar(100) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `role_id` int(11) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `volunteer`
--

INSERT INTO `volunteer` (`id`, `volunteer_name`, `skills`, `address`, `phone_no`, `role_id`, `password`) VALUES
(1, 'Rishi', 'Motivation', 'Bhayander East', '9387217890', 2, 'rishi'),
(2, 'Tanvi Sharma', 'Motivation', 'Bandra East', '9878654731', 3, 'tanvi'),
(3, 'Hardik Shah', 'Motivation', 'Bangalore', '8080675482', 1, 'hardik'),
(4, 'Yuzvendra', 'Good Communication Skills', 'Pune', '7738976548', 2, 'yuzvendra'),
(5, 'Swapnil', 'Motivation', 'Borivali west', '7738790564', 3, 'swapnil'),
(6, 'Mithali ', 'Motivation', 'Pune', '8080797653', 2, 'mithali');

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
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `volunteer`
--
ALTER TABLE `volunteer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
