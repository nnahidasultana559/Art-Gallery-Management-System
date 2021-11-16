-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2021 at 07:36 PM
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
-- Database: `art_gallery`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE `access` (
  `art_code` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `access`
--

INSERT INTO `access` (`art_code`, `cust_id`) VALUES
(15, 3),
(20, 10),
(25, 7);

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `artist_name` varchar(100) NOT NULL,
  `birth_place` varchar(200) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `style_of_art` varchar(1000) NOT NULL,
  `age` int(11) NOT NULL,
  `about` varchar(2000) NOT NULL,
  `artist_image` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artist_name`, `birth_place`, `artist_id`, `style_of_art`, `age`, `about`, `artist_image`) VALUES
('Irena Belcovski', 'Canada', 12, 'Abstract, Modern, Canvas, Cubism', 35, 'Irena Belcovski is an internationally recognized contemporary abstract painter. ', 'artist1.jpg'),
('Birgit Huttemann-Holz', 'Detroit, MI, United States', 14, 'Abstract, Modern, Real life', 54, 'Birgit\'s energetic works show a lush world, where nature is in constant celebration. Orchids, verdant gardens, and imaginary spaces become synonym with sanctuaries. ', 'artist2.jpg'),
('Evan Shevaski', 'Italy', 22, 'Sketch,Canvas,Abstract', 56, 'Evan Shevaski is an internationally recognized contemporary abstract painter.', 'artist3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `art_work`
--

CREATE TABLE `art_work` (
  `name` varchar(200) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `type_of_art` varchar(1000) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `art_code` int(11) NOT NULL,
  `year_made` varchar(100) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `cart_item_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `art_work`
--

INSERT INTO `art_work` (`name`, `title`, `type_of_art`, `price`, `image`, `art_code`, `year_made`, `artist_id`, `gallery_id`, `cart_item_code`) VALUES
('Imaginary Dream 1', 'BETWEEN THE WORLD AND ME', 'Canvas', '2200.00', 'acrylic.jpg', 15, '1990-07-07', 12, 1, 1),
('Revolution-1', 'revolution Iranian modern painting', 'Modern Art', '1500.00', 'modern1.jpg', 20, '1996-12-30', 14, 1, 3),
('where time does not exist II', 'the title does not exist', 'Sketch', '1650.00', 'modern2.jpg', 25, '1980-04-26', 22, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `product_name` varchar(200) NOT NULL,
  `product_price` decimal(9,2) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_img` varchar(1000) NOT NULL,
  `total_price` decimal(9,2) NOT NULL,
  `cart_item_code` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`product_name`, `product_price`, `product_quantity`, `product_img`, `total_price`, `cart_item_code`, `payment_id`) VALUES
('Imaginary Dream 1', '2200.00', 2, 'acrylic.jpg', '4400.00', 1, 11),
('Revolution-1', '1500.00', 1, 'modern1.jpg', '1500.00', 3, 15),
('where time does not exist II', '1650.00', 1, 'modern2.jpg', '1650.00', 7, 30);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `F_name` varchar(100) NOT NULL,
  `L_name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `F_name`, `L_name`, `address`, `email`, `gallery_id`, `user_id`) VALUES
(3, 'Mahbub', 'Hasan', '45,dholpur', 'mahbub56@gmail.com', 1, 7),
(7, 'Nazifa', 'Bhuiyan', '30,bashabo,Dhaka', 'nazifabhuiyan19@gmail.com', 1, 19),
(10, 'Nahida', 'sultana', '57,Shantibagh,dhaka', 'nnahidasultana559@gmail.com', 1, 18);

-- --------------------------------------------------------

--
-- Table structure for table `customer_phone`
--

CREATE TABLE `customer_phone` (
  `phone` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_phone`
--

INSERT INTO `customer_phone` (`phone`, `cust_id`) VALUES
(1759898948, 7),
(1762268237, 10),
(1799926765, 10);

-- --------------------------------------------------------

--
-- Table structure for table `exhibition`
--

CREATE TABLE `exhibition` (
  `exhibition_id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `theme` varchar(1000) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` varchar(20) NOT NULL,
  `end_time` varchar(20) NOT NULL,
  `e_artist_details` varchar(2000) NOT NULL,
  `place` varchar(200) NOT NULL,
  `ticket_price` decimal(9,2) NOT NULL,
  `gallery_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exhibition`
--

INSERT INTO `exhibition` (`exhibition_id`, `title`, `theme`, `start_date`, `end_date`, `start_time`, `end_time`, `e_artist_details`, `place`, `ticket_price`, `gallery_id`) VALUES
(1, 'Gaze', 'Canvas, Figure, Cubism', '2021-10-01', '2021-10-30', '3 p.m', '9 p.m', 'Irfan Onurmen\'s first solo exhibition \"Gaze\"\r\nIrfan Onurmen\'s Gaze Series\' large sized portraits give way to psychological and political readings, relate to the anonymous yet  familiar  characters and feelings to reference to our external and internal worlds.', 'Uk, 4 Mandeville Place, W1U 2BG.London', '300.00', 1),
(2, 'Revolution', 'Modern Art', '2021-10-02', '2021-10-30', '3 p.m', '9 p.m', 'Birgit\'s energetic works show a lush world, where nature is in constant celebration.  ', 'Saskatchewan,Canada', '200.00', 1),
(3, 'Imaginary World', 'Visualization', '2021-10-07', '2021-11-07', '3 p.m', '9 p.m', 'Evan Shevaski is an internationally recognized contemporary abstract painter. His work has been exhibited by numerous independent French galleries and is found in private collections the world over.', 'Wilington, Newzealand', '350.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `gallery_id` int(11) NOT NULL,
  `gallery_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`gallery_id`, `gallery_name`) VALUES
(1, 'National art gallery');

-- --------------------------------------------------------

--
-- Table structure for table `has`
--

CREATE TABLE `has` (
  `artist_id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `has`
--

INSERT INTO `has` (`artist_id`, `gallery_id`) VALUES
(12, 1),
(14, 1),
(22, 1);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `msg_id` int(11) NOT NULL,
  `msg_title` varchar(1000) NOT NULL,
  `msg_body` varchar(2000) NOT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`msg_id`, `msg_title`, `msg_body`, `gallery_id`, `cust_id`) VALUES
(3, 'About exhibition', 'Is there any chance to expand the exhibition end date?', 1, 10),
(7, 'About artwork', 'What is the purpose of the gallery artwork to the people?', 1, 3),
(13, 'About artist', 'Please, give me the artist details.', 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `payment_module`
--

CREATE TABLE `payment_module` (
  `payment_id` int(11) NOT NULL,
  `payment_type` varchar(500) NOT NULL,
  `products` varchar(1000) NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `payment_date` date NOT NULL,
  `cust_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_module`
--

INSERT INTO `payment_module` (`payment_id`, `payment_type`, `products`, `amount`, `payment_date`, `cust_id`) VALUES
(11, 'Card', 'Imaginary Dream-1', '4400.00', '2021-09-04', 3),
(15, 'bank', 'Revolution-1', '1650.00', '2021-09-05', 10),
(30, 'net banking', 'where time does not exist II', '1500.00', '2021-09-06', 7);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(500) NOT NULL,
  `email` varchar(100) NOT NULL,
  `ticket_number` varchar(100) NOT NULL,
  `exp_time` varchar(100) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cust_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `name`, `address`, `email`, `ticket_number`, `exp_time`, `price`, `quantity`, `cust_id`) VALUES
(7, 'Nahida', '57,Shantibagh,Dhaka', 'nnahidasultana559@gmail.com', '#AB-100', '2021-10-30', '700.00', 2, 10),
(10, 'Mahbub', '45,dholpur', 'mahbub56@gmail.com', 'Abcd-21', '2021-10-30', '400.00', 2, 3),
(20, 'Nazifa', '30,bashabo,Dhaka', 'nazifabhuiyan19@gmail.com', '#AB-101', '2021-11-06', '900.00', 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `discount` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `discount`) VALUES
(7, 'mahbub56@gmail.com', 'hasan56mahbub', '100.00'),
(18, 'nnahidasultana559@gmail.com', 'nnahidhgfjgsd', '100.00'),
(19, 'nazifabhuiyan19@gmail.com', 'bhuiyannazifa', '100.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access`
--
ALTER TABLE `access`
  ADD PRIMARY KEY (`art_code`,`cust_id`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indexes for table `art_work`
--
ALTER TABLE `art_work`
  ADD PRIMARY KEY (`art_code`),
  ADD UNIQUE KEY `title` (`title`) USING HASH,
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `gallery_id` (`gallery_id`),
  ADD KEY `cart_item_code` (`cart_item_code`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_item_code`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`),
  ADD KEY `gallery_id` (`gallery_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `customer_phone`
--
ALTER TABLE `customer_phone`
  ADD PRIMARY KEY (`phone`,`cust_id`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `exhibition`
--
ALTER TABLE `exhibition`
  ADD PRIMARY KEY (`exhibition_id`),
  ADD KEY `gallery_id` (`gallery_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`gallery_id`);

--
-- Indexes for table `has`
--
ALTER TABLE `has`
  ADD PRIMARY KEY (`artist_id`,`gallery_id`),
  ADD KEY `gallery_id` (`gallery_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`msg_id`),
  ADD KEY `gallery_id` (`gallery_id`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `payment_module`
--
ALTER TABLE `payment_module`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `access`
--
ALTER TABLE `access`
  ADD CONSTRAINT `access_ibfk_1` FOREIGN KEY (`art_code`) REFERENCES `art_work` (`art_code`),
  ADD CONSTRAINT `access_ibfk_2` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`);

--
-- Constraints for table `art_work`
--
ALTER TABLE `art_work`
  ADD CONSTRAINT `art_work_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`),
  ADD CONSTRAINT `art_work_ibfk_2` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`gallery_id`),
  ADD CONSTRAINT `art_work_ibfk_3` FOREIGN KEY (`cart_item_code`) REFERENCES `cart` (`cart_item_code`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment_module` (`payment_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`gallery_id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `customer_phone`
--
ALTER TABLE `customer_phone`
  ADD CONSTRAINT `customer_phone_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`);

--
-- Constraints for table `exhibition`
--
ALTER TABLE `exhibition`
  ADD CONSTRAINT `exhibition_ibfk_1` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`gallery_id`);

--
-- Constraints for table `has`
--
ALTER TABLE `has`
  ADD CONSTRAINT `has_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`),
  ADD CONSTRAINT `has_ibfk_2` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`gallery_id`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`gallery_id`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`);

--
-- Constraints for table `payment_module`
--
ALTER TABLE `payment_module`
  ADD CONSTRAINT `payment_module_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
