-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2018 at 01:42 AM
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
('Nagpur'),
('Pune'),
('Trivandrum');

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

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `doctor_name`, `specialization`, `hospital_id`) VALUES
(1, 'Dr. Ishaan Avasthi', 'Throat Cancer Specialist', 1),
(2, 'Dr. Sanjay Shah', 'Lung Cancer Specialist', 2),
(3, 'Dr. Rustom ', 'Colon Cancer Specialist', 3),
(4, 'Dr. Irfan Khan', 'Bladder Cancer Specialist', 2),
(5, 'Dr. P.K Jain', 'Colorectal Cancer Specialist', 1),
(6, 'Dr. Chander Agarwal', 'Bone Cancer Specialist', 1),
(7, 'Dr. Suvarna Shinde', 'Prostate Cancer Specialist', 3);

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
  `purpose_of_donation` varchar(100) NOT NULL,
  `Date And Time Of Donation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email_id` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`id`, `name`, `pan_no`, `phone_no`, `address`, `payment_amt`, `mode_of_payment`, `purpose_of_donation`, `Date And Time Of Donation`, `email_id`, `password`) VALUES
(1, 'John Keates', 'AJUPS4789R', '9322218765', 'Mumbai', 25000, 'Cheque', '', '2018-07-21 23:04:26', 'John@abc.com', 'john'),
(2, 'Michael Socrates', 'HFPX8973R', '9322217890', 'Delhi', 30000, 'Cash', '', '2018-07-21 23:04:26', 'Michael@abc.com', 'michael'),
(3, 'Nigam Shah', 'AMGS7856E', '8080567489', 'Pune', 78000, 'Neft', '', '2018-07-21 23:04:26', 'Nigam@abc.com', 'nigam'),
(4, 'Shane Warne', 'HGXY7895D', '9702568432', 'Bangalore', 56000, 'DD', '', '2018-07-21 23:04:26', 'shane@abc.com', 'shane'),
(5, 'Kalp Shah', 'AJYUS4321F', '9354217890', 'Nagpur', 47000, 'Cheque', '', '2018-07-21 23:04:27', 'kshah@xyz.com', 'kalp'),
(6, 'Atul Vohra', 'HGFX4562P', '7738657432', 'Mumbai', 77000, 'DD', '', '2018-07-21 23:04:27', 'atul@xyz.com', 'atul'),
(7, 'Tanishk Patni', 'AJUYS4532Y', '9029675348', 'Pune', 125000, 'DD', '', '2018-07-21 23:04:27', 'tanishk@abc.com', 'tanishk'),
(8, 'Neel Pandya', 'AJUIO5674R', '9929067530', 'Bangalore', 500000, 'Cash', '', '2018-07-21 23:04:28', 'neel@abc.com', 'neel'),
(9, 'Piyush Bag', 'HUPY7894I', '9892988772', 'Hydrebad', 378000, 'Neft', '', '2018-07-21 23:04:28', 'piyush@abc.com', 'piyush'),
(10, 'Nikhil Sakpal', 'AJTY5O674R', '8828657149', 'Trivandrum', 569000, 'DD', '', '2018-07-21 23:04:28', 'nikhil@xyz.com', 'nikhil');

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

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`id`, `hospital_name`, `location`, `phone_no`) VALUES
(1, 'JR Hospital', 'Mumbai', '9334187651'),
(2, 'City Hospital', 'Hydrebad', '9876812451'),
(3, 'MM Hospital', 'Pune', '8037675482');

-- --------------------------------------------------------

--
-- Table structure for table `kit`
--

CREATE TABLE `kit` (
  `id` int(11) NOT NULL,
  `kit_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kit`
--

INSERT INTO `kit` (`id`, `kit_name`) VALUES
(1, 'Nutritional Kit'),
(2, 'Childcare Kit'),
(3, 'Dignity Kit');

-- --------------------------------------------------------

--
-- Table structure for table `main_program`
--

CREATE TABLE `main_program` (
  `name` varchar(100) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_program`
--

INSERT INTO `main_program` (`name`, `id`) VALUES
('Low Income Finance', 1),
('Nutrional Support', 2),
('Childcare Support', 3),
('Ensuring Dignity Of Patients', 4);

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
  `password` varchar(100) NOT NULL,
  `email_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `name`, `hospital`, `age`, `type_of_cancer`, `address`, `date_of_reg`, `last_modified`, `gender`, `file_no`, `phone_no`, `follow_up`, `password`, `email_id`) VALUES
(1, 'Aditya Sharma', 'JR Hospital', 29, 'Throat Cancer', 'Mumbai', '2018-07-21 23:13:18', '2018-07-07 18:47:31', 'Male', 'JR583234', '9029456987', 'Follow Up Required weekly', 'aditya', 'aditya@abc.com'),
(2, 'Sahil Sawant', 'City Hospital', 47, 'Lung Cancer', 'Hydrebad', '2018-07-21 23:01:39', '2018-04-10 18:37:27', 'Male', 'CH678954', '9322218763', 'Medicines Required', 'sahil', 'sahil@xyz.com'),
(3, 'Vatsaliya Mehta', 'MM Hospital', 58, 'Colon Cancer', 'Pune', '2018-07-21 23:01:39', '2017-09-26 18:43:12', 'Female', 'MM786543', '9920876431', 'Emotional support required', 'vatsaliya', 'vatsaliya@abc.com'),
(4, 'Riya Singh', 'City Hospital', 42, 'Bladder Cancer', 'Nagpur', '2018-07-21 23:01:40', '2018-10-18 18:48:52', 'Female', 'CH678754', '8975278654', 'Financial Support Required', 'riya', 'riya@abc.com'),
(5, 'Menka Singh', 'JR Hospital', 56, 'Colorectal Cancer', 'Hydrebad', '2018-07-21 23:01:40', '2018-12-16 18:41:32', 'Female', 'JR987645', '9920768542', 'Medicine Required', 'menka', 'menka@abc.com'),
(6, 'Rahul Tiwari', 'City Hospital', 39, 'Colon Cancer', 'Bangalore', '2018-07-21 23:01:40', '2018-06-06 18:47:30', 'Male', 'CH897651', '8897543672', 'Weekly Follow-Up Required', 'rahul', 'rahul@abc.com'),
(7, 'Riddhi Mehta', 'MM Hospital', 49, 'Bladder Cancer', 'Pune', '2018-07-21 23:01:40', '2018-02-18 18:41:00', 'Female', 'MM896523', '7738790543', 'Financial Support Required', 'riddhi', 'riddhi@abc.com'),
(8, 'Saraswati Sharma', 'City Hospital', 55, 'Lung Cancer', 'Pune', '2018-07-21 23:01:40', '2018-01-22 18:42:30', 'Female', 'CH786543', '8080765432', 'No follow up required', 'saraswati', 'saraswati@xyz.com'),
(9, 'Rohit Sharma', 'JR Hospital', 38, 'Throat Cancer', 'Mumbai', '2018-07-21 23:01:40', '2017-06-30 18:41:00', 'Male', 'JR879065', '7758945321', 'Medicines Required', 'rohit', 'rohit@abc.com'),
(10, 'Shikhar Mishra', 'City Hospital', 67, 'Throat Cancer', 'Pune', '2018-07-21 23:29:33', '2017-08-11 18:48:00', 'Male', 'CH786543', '8080654378', 'no follow up required', 'shikhar', 'shikhar@abc.com');

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

--
-- Dumping data for table `patient_volunteer_relation`
--

INSERT INTO `patient_volunteer_relation` (`patient_id`, `volunteer_id`, `sub_program_id`, `date_of_allotment`, `comment`) VALUES
(1, 1, 1, '2018-04-21 18:43:00', 'Patient Fully Funded By V-care'),
(2, 2, 2, '2017-12-21 18:39:00', 'Patient Provided Funds Under Special Finance'),
(3, 3, 3, '2018-02-06 18:47:00', 'Partial Funds Provided to Patient '),
(4, 4, 4, '2018-05-09 18:47:00', 'Patient Funds Under Process'),
(5, 5, 1, '2018-05-11 18:49:00', 'Patient Is Fully Funded');

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

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_name`, `kit_id`, `quantity`) VALUES
(1, 'General Day Care', 1, 1),
(2, 'Protein Powder', 1, 1),
(3, 'Food Coupons', 1, 5),
(4, 'Fruits', 1, 3),
(5, 'Infusion bottles', 1, 2),
(6, 'Retinoblastoma', 2, 2),
(7, 'Infection Control kit', 2, 1),
(8, 'Ice Box', 2, 1),
(9, 'Discharge Gifts', 2, 2),
(10, 'Prosthesis', 3, 2),
(11, 'Wig', 3, 1),
(12, 'Antim Sanskar Seva', 3, 1),
(13, 'Umbrella', 3, 1),
(14, 'Confidence Bags', 3, 2);

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

--
-- Dumping data for table `sub_program`
--

INSERT INTO `sub_program` (`id`, `name`, `main_program_id`) VALUES
(1, 'A \'Unique\' Funding Feature Of V Care', 1),
(2, 'Special Finance', 1),
(3, 'Bone Marrow Transplant', 1),
(4, 'Germ Cell Tumor', 1),
(5, 'Young Adult Finance', 1),
(6, 'General Day Care', 2),
(7, 'Protein Powder', 2),
(8, 'Food Support', 2),
(9, 'Food Coupons', 2),
(10, 'Ek Pyala Chai!', 2),
(11, 'Infusion Bottles', 2),
(12, 'Retinoblastoma', 3),
(13, 'Infection Control Kit', 3),
(14, 'Ice Box', 3),
(15, 'Discharge Gifts', 3),
(16, 'Prosthesis', 4),
(17, 'Wigs', 4),
(18, 'Antim Sanskar Seva', 4),
(19, 'Umbrella', 4),
(20, 'Confidence Bags', 4);

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
  `password` varchar(100) NOT NULL,
  `email_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `volunteer`
--

INSERT INTO `volunteer` (`id`, `volunteer_name`, `skills`, `address`, `phone_no`, `role_id`, `password`, `email_id`) VALUES
(1, 'Rishi', 'Motivation', 'Mumbai', '9387217890', 2, 'rishi', 'rishi@abc.com'),
(2, 'Tanvi Sharma', 'Motivation', 'Bangalore', '9878654731', 3, 'tanvi', 'tanvi@xyz.com'),
(3, 'Hardik Shah', 'Motivation', 'Pune', '8080675482', 1, 'hardik', 'hardik@xyz.com'),
(4, 'Yuzvendra', 'Good Communication Skills', 'Nagpur', '7738976548', 2, 'yuzvendra', 'yuzvendra@abc.com'),
(5, 'Swapnil', 'Motivation', 'Trivandrum', '7738790564', 3, 'swapnil', 'swapnil@abc.com'),
(6, 'Mithali ', 'Motivation', 'Delhi', '8080797653', 2, 'mithali', 'mihtali@abc.com');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kit`
--
ALTER TABLE `kit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `main_program`
--
ALTER TABLE `main_program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sub_program`
--
ALTER TABLE `sub_program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
