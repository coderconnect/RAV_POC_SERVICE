-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 20, 2016 at 06:49 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ravdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_charts`
--

CREATE TABLE `active_charts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `chart_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `active_charts`
--

INSERT INTO `active_charts` (`id`, `user_id`, `chart_id`) VALUES
(1, 1, 9),
(5, 3, 1),
(16, 2, 5),
(17, 4, 14),
(18, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `Charts`
--

CREATE TABLE `Charts` (
  `id` int(11) NOT NULL,
  `name` varchar(110) NOT NULL,
  `member_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `reason_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL,
  `uri` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Charts`
--

INSERT INTO `Charts` (`id`, `name`, `member_id`, `provider_id`, `comment`, `reason_id`, `status`, `uri`) VALUES
(1, 'Chart1', 1, 1, '', 0, 0, 'http://localhost:3000/resources/pdf/Chart1.pdf'),
(2, 'Chart2', 2, 2, '', 0, 0, NULL),
(3, 'Chart3', 3, 3, '', 0, 0, NULL),
(4, 'Chart4', 4, 4, '', 0, 0, NULL),
(5, 'Chart5', 5, 5, '', 0, 0, NULL),
(6, 'Chart6', 6, 6, '', 0, 0, NULL),
(7, 'Chart7', 7, 7, '', 0, 0, 'http://localhost:3000/resources/pdf/Chart7.pdf'),
(8, 'Chart8', 8, 8, '', 0, 0, 'http://localhost:3000/resources/pdf/Chart8.pdf'),
(9, 'Chart9', 9, 9, '', 0, 0, NULL),
(10, 'Chart10', 10, 10, '', 0, 0, NULL),
(11, 'Chart11', 11, 1, '', 0, 0, NULL),
(12, 'Chart12', 12, 2, '', 0, 0, 'http://localhost:3000/resources/pdf/Chart12.pdf'),
(13, 'Chart13', 13, 3, '', 0, 0, NULL),
(14, 'Chart14', 14, 4, '', 0, 0, NULL),
(15, 'Chart15', 15, 5, '', 0, 0, 'http://localhost:3000/resources/pdf/Chart15.pdf'),
(16, 'Chart16', 16, 6, '', 0, 0, NULL),
(17, 'Chart17', 17, 7, '', 0, 0, NULL),
(18, 'Chart18', 18, 8, '', 0, 0, 'http://localhost:3000/resources/pdf/Chart18.pdf'),
(19, 'Chart19', 19, 9, '', 0, 0, NULL),
(20, 'Chart20', 20, 10, '', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chart_claims`
--

CREATE TABLE `chart_claims` (
  `id` int(11) NOT NULL,
  `chart_id` int(11) NOT NULL,
  `claim_id` varchar(110) NOT NULL,
  `comment` text NOT NULL,
  `status` int(11) NOT NULL,
  `date_of_service` date NOT NULL,
  `coding_date` date NOT NULL,
  `provider_id` int(11) NOT NULL,
  `reviewed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chart_claims`
--

INSERT INTO `chart_claims` (`id`, `chart_id`, `claim_id`, `comment`, `status`, `date_of_service`, `coding_date`, `provider_id`, `reviewed`) VALUES
(1, 1, 'a1b2c3d4e5f6g7h8', 'test', 0, '2016-09-05', '2016-10-12', 1, 0),
(2, 1, 'b2c3d4e5f6g7h8a1', '', 0, '2016-09-06', '2016-10-13', 1, 0),
(3, 1, 'c3d4e5f6g7h8a1b2', '', 0, '2016-09-07', '2016-10-14', 1, 0),
(4, 1, 'c1d4e5f6g7h8a1b2', '', 0, '2016-09-07', '2016-10-11', 1, 0),
(5, 1, 'c2d4e5f6g7h8a1b2', '', 0, '2016-06-07', '2016-11-12', 1, 0),
(6, 1, 'c4d4e5f6g7h8a1b2', '', 0, '2016-05-07', '2016-12-13', 1, 0),
(7, 2, 'c5d4e5f6g7h8a1b2', '', 0, '2016-04-07', '2016-10-14', 2, 0),
(8, 2, 'c6d4e5f6g7h8a1b2', '', 0, '2016-03-07', '2016-11-15', 2, 0),
(9, 3, 'c7d4e5f6g7h8a1b2', '', 0, '2016-02-07', '2016-12-16', 3, 0),
(10, 3, 'c8d4e5f6g7h8a1b2', '', 0, '2016-01-08', '2016-10-17', 3, 0),
(11, 4, 'c9d4e5f6g7h8a1b2', '', 0, '2016-07-09', '2016-11-18', 4, 0),
(12, 4, 'c0d4e5f6g7h8a1b2', '', 0, '2016-08-10', '2016-12-19', 4, 0),
(13, 5, 'c3d1e5f6g7h8a1b2', '', 0, '2016-01-11', '2016-10-10', 5, 0),
(14, 5, 'c3d2e5f6g7h8a1b2', '', 0, '2016-02-12', '2016-11-11', 5, 0),
(15, 6, 'c3d3e5f6g7h8a1b2', '', 0, '2016-03-12', '2016-12-12', 6, 0),
(16, 6, 'c3d5e5f6g7h8a1b2', '', 0, '2016-04-13', '2016-10-13', 6, 0),
(17, 7, 'c3d6e5f6g7h8a1b2', '', 0, '2016-05-14', '2016-11-14', 7, 0),
(18, 7, 'c3d7e5f6g7h8a1b2', '', 0, '2016-06-15', '2016-12-15', 7, 0),
(19, 8, 'c3d8e5f6g7h8a1b2', '', 0, '2016-07-16', '2016-10-16', 8, 0),
(20, 8, 'c3d9e5f6g7h8a1b2', '', 0, '2016-08-17', '2016-11-17', 8, 0),
(21, 9, 'c3d0e5f6g7h8a1b2', '', 0, '2016-09-18', '2016-12-18', 9, 0),
(22, 9, 'c3d4e1f6g7h8a1b2', '', 0, '2016-01-19', '2016-10-19', 9, 0),
(23, 10, 'c3d4e2f6g7h8a1b2', '', 0, '2016-02-20', '2016-11-10', 10, 0),
(24, 10, 'c3d4e3f6g7h8a1b2', '', 0, '2016-03-21', '2016-12-11', 10, 0),
(25, 11, 'c3d4e4f6g7h8a1b2', '', 0, '2016-04-21', '2016-10-12', 1, 0),
(26, 11, 'c3d4e6f6g7h8a1b2', '', 0, '2016-05-22', '2016-11-13', 1, 0),
(27, 12, 'c3d4e7f6g7h8a1b2', '', 0, '2016-06-23', '2016-12-14', 2, 0),
(28, 12, 'c3d4e8f6g7h8a1b2', '', 0, '2016-07-23', '2016-10-15', 2, 0),
(29, 13, 'c3d4e9f6g7h8a1b2', '', 0, '2016-08-24', '2016-11-16', 3, 0),
(30, 13, 'c3d4e0f6g7h8a1b2', '', 0, '2016-09-25', '2016-12-17', 3, 0),
(31, 14, 'c3d4e5f1g7h8a1b2', '', 0, '2016-01-26', '2016-10-18', 4, 0),
(32, 14, 'c3d4e5f2g7h8a1b2', '', 0, '2016-02-27', '2016-11-19', 4, 0),
(33, 15, 'c3d4e5f3g7h8a1b2', '', 0, '2016-03-28', '2016-12-20', 5, 0),
(34, 15, 'c3d4e5f4g7h8a1b2', '', 0, '2016-04-29', '2016-10-11', 5, 0),
(35, 15, 'c3d4e5f5g7h8a1b2', '', 0, '2016-05-30', '2016-11-12', 5, 0),
(36, 15, 'c3d4e5f7g7h8a1b2', '', 0, '2016-06-30', '2016-12-13', 5, 0),
(37, 16, 'c3d4e5f8g7h8a1b2', '', 0, '2016-07-01', '2016-10-14', 6, 0),
(38, 16, 'c3d4e5f9g7h8a1b2', '', 0, '2016-08-02', '2016-11-15', 6, 0),
(39, 17, 'c3d4e5f6g1h8a1b2', '', 0, '2016-09-03', '2016-12-16', 7, 0),
(40, 17, 'c3d4e5f6g2h8a1b2', '', 0, '2016-01-04', '2016-10-17', 7, 0),
(41, 18, 'c3d4e5f6g3h8a1b2', '', 0, '2016-02-05', '2016-11-18', 8, 0),
(42, 18, 'c3d4e5f6g4h8a1b2', '', 0, '2016-03-06', '2016-12-19', 8, 0),
(43, 19, 'c3d4e5f6g5h8a1b2', '', 0, '2016-04-08', '2016-10-20', 9, 0),
(44, 19, 'c3d4e5f6g6h8a1b2', '', 0, '2016-09-09', '2016-10-11', 9, 0),
(45, 20, 'c3d4e5f6g8h8a1b2', 'This is a test comment.', 0, '2016-09-10', '2016-10-12', 10, 0),
(46, 20, 'c3d4e5f6g9h8a1b2', 'New comment in demo', 0, '2016-09-11', '2016-10-13', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `telephone` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cpt_claims`
--

CREATE TABLE `cpt_claims` (
  `id` int(11) NOT NULL,
  `claim_id` varchar(110) NOT NULL,
  `cpt_id` int(11) NOT NULL,
  `modifiers` varchar(220) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cpt_claims`
--

INSERT INTO `cpt_claims` (`id`, `claim_id`, `cpt_id`, `modifiers`, `comment`) VALUES
(1, 'c1d4e5f6g7h8a1b2', 1, '', ''),
(2, 'c1d4e5f6g7h8a1b2', 2, '', ''),
(3, 'c1d4e5f6g7h8a1b2', 3, '', ''),
(4, 'c1d4e5f6g7h8a1b2', 4, '', ''),
(5, 'c1d4e5f6g7h8a1b2', 5, '', ''),
(6, 'c2d4e5f6g7h8a1b2', 6, '', ''),
(7, 'c2d4e5f6g7h8a1b2', 7, '', ''),
(8, 'c2d4e5f6g7h8a1b2', 8, '', ''),
(9, 'c2d4e5f6g7h8a1b2', 9, '', ''),
(10, 'c2d4e5f6g7h8a1b2', 10, '', ''),
(11, 'c2d4e5f6g7h8a1b2', 11, '', ''),
(12, 'c4d4e5f6g7h8a1b2', 12, '', ''),
(13, 'c4d4e5f6g7h8a1b2', 1, '', ''),
(14, 'c4d4e5f6g7h8a1b2', 2, '', ''),
(15, 'c4d4e5f6g7h8a1b2', 3, '', ''),
(16, 'c4d4e5f6g7h8a1b2', 4, '', ''),
(17, 'c5d4e5f6g7h8a1b2', 5, '', ''),
(18, 'c5d4e5f6g7h8a1b2', 6, '', ''),
(19, 'c5d4e5f6g7h8a1b2', 7, '', ''),
(20, 'c5d4e5f6g7h8a1b2', 8, '', ''),
(21, 'c5d4e5f6g7h8a1b2', 9, '', ''),
(22, 'c6d4e5f6g7h8a1b2', 10, '', ''),
(23, 'c6d4e5f6g7h8a1b2', 11, '', ''),
(24, 'c6d4e5f6g7h8a1b2', 12, '', ''),
(25, 'c6d4e5f6g7h8a1b2', 1, '', ''),
(26, 'c7d4e5f6g7h8a1b2', 2, '', ''),
(27, 'c7d4e5f6g7h8a1b2', 3, '', ''),
(28, 'c7d4e5f6g7h8a1b2', 4, '', ''),
(29, 'c8d4e5f6g7h8a1b2', 5, '', ''),
(30, 'c8d4e5f6g7h8a1b2', 6, '', ''),
(31, 'c8d4e5f6g7h8a1b2', 7, '', ''),
(32, 'c9d4e5f6g7h8a1b2', 8, '', ''),
(33, 'c9d4e5f6g7h8a1b2', 9, '', ''),
(34, 'c9d4e5f6g7h8a1b2', 10, '', ''),
(35, 'c0d4e5f6g7h8a1b2', 11, '', ''),
(36, 'c0d4e5f6g7h8a1b2', 12, '', ''),
(37, 'c0d4e5f6g7h8a1b2', 1, '', ''),
(38, 'c3d1e5f6g7h8a1b2', 2, '', ''),
(39, 'c3d1e5f6g7h8a1b2', 3, '', ''),
(40, 'c3d2e5f6g7h8a1b2', 4, '', ''),
(41, 'c3d2e5f6g7h8a1b2', 5, '', ''),
(42, 'c3d2e5f6g7h8a1b2', 6, '', ''),
(43, 'c3d3e5f6g7h8a1b2', 7, '', ''),
(44, 'c3d3e5f6g7h8a1b2', 8, '', ''),
(45, 'c3d3e5f6g7h8a1b2', 9, '', ''),
(46, 'c3d5e5f6g7h8a1b2', 10, '', ''),
(47, 'c3d5e5f6g7h8a1b2', 11, '', ''),
(48, 'c3d5e5f6g7h8a1b2', 12, '', ''),
(49, 'c3d6e5f6g7h8a1b2', 1, '', ''),
(50, 'c3d6e5f6g7h8a1b2', 2, '', ''),
(51, 'c3d6e5f6g7h8a1b2', 3, '', ''),
(52, 'c3d6e5f6g7h8a1b2', 4, '', ''),
(53, 'c3d7e5f6g7h8a1b2', 5, '', ''),
(54, 'c3d7e5f6g7h8a1b2', 6, '', ''),
(55, 'c3d7e5f6g7h8a1b2', 7, '', ''),
(56, 'c3d8e5f6g7h8a1b2', 8, '', ''),
(57, 'c3d8e5f6g7h8a1b2', 9, '', ''),
(58, 'c3d8e5f6g7h8a1b2', 10, '', ''),
(59, 'c3d8e5f6g7h8a1b2', 11, '', ''),
(60, 'c3d9e5f6g7h8a1b2', 12, '', ''),
(61, 'c3d9e5f6g7h8a1b2', 1, '', ''),
(62, 'c3d9e5f6g7h8a1b2', 2, '', ''),
(63, 'c3d0e5f6g7h8a1b2', 3, '', ''),
(64, 'c3d0e5f6g7h8a1b2', 4, '', ''),
(65, 'c3d0e5f6g7h8a1b2', 5, '', ''),
(66, 'c3d4e1f6g7h8a1b2', 6, '', ''),
(67, 'c3d4e1f6g7h8a1b2', 7, '', ''),
(68, 'c3d4e1f6g7h8a1b2', 8, '', ''),
(69, 'c3d4e1f6g7h8a1b2', 9, '', ''),
(70, 'c3d4e2f6g7h8a1b2', 10, '', ''),
(71, 'c3d4e2f6g7h8a1b2', 11, '', ''),
(72, 'c3d4e2f6g7h8a1b2', 12, '', ''),
(73, 'c3d4e2f6g7h8a1b2', 1, '', ''),
(74, 'c3d4e3f6g7h8a1b2', 2, '', ''),
(75, 'c3d4e3f6g7h8a1b2', 3, '', ''),
(76, 'c3d4e3f6g7h8a1b2', 4, '', ''),
(77, 'c3d4e4f6g7h8a1b2', 5, '', ''),
(78, 'c3d4e4f6g7h8a1b2', 6, '', ''),
(79, 'c3d4e4f6g7h8a1b2', 7, '', ''),
(80, 'c3d4e6f6g7h8a1b2', 8, '', ''),
(81, 'c3d4e6f6g7h8a1b2', 9, '', ''),
(82, 'c3d4e6f6g7h8a1b2', 10, '', ''),
(83, 'c3d4e7f6g7h8a1b2', 11, '', ''),
(84, 'c3d4e7f6g7h8a1b2', 12, '', ''),
(85, 'c3d4e7f6g7h8a1b2', 1, '', ''),
(86, 'c3d4e8f6g7h8a1b2', 2, '', ''),
(87, 'c3d4e8f6g7h8a1b2', 3, '', ''),
(88, 'c3d4e8f6g7h8a1b2', 4, '', ''),
(89, 'c3d4e9f6g7h8a1b2', 5, '', ''),
(90, 'c3d4e9f6g7h8a1b2', 6, '', ''),
(91, 'c3d4e9f6g7h8a1b2', 7, '', ''),
(92, 'c3d4e0f6g7h8a1b2', 8, '', ''),
(93, 'c3d4e0f6g7h8a1b2', 9, '', ''),
(94, 'c3d4e0f6g7h8a1b2', 10, '', ''),
(95, 'c3d4e5f1g7h8a1b2', 11, '', ''),
(96, 'c3d4e5f1g7h8a1b2', 12, '', ''),
(97, 'c3d4e5f1g7h8a1b2', 1, '', ''),
(98, 'c3d4e5f2g7h8a1b2', 2, '', ''),
(99, 'c3d4e5f2g7h8a1b2', 3, '', ''),
(100, 'c3d4e5f2g7h8a1b2', 4, '', ''),
(101, 'c3d4e5f3g7h8a1b2', 5, '', ''),
(102, 'c3d4e5f3g7h8a1b2', 6, '', ''),
(103, 'c3d4e5f3g7h8a1b2', 7, '', ''),
(104, 'c3d4e5f4g7h8a1b2', 8, '', ''),
(105, 'c3d4e5f4g7h8a1b2', 9, '', ''),
(106, 'c3d4e5f4g7h8a1b2', 10, '', ''),
(107, 'c3d4e5f5g7h8a1b2', 11, '', ''),
(108, 'c3d4e5f5g7h8a1b2', 12, '', ''),
(109, 'c3d4e5f5g7h8a1b2', 1, '', ''),
(110, 'c3d4e5f7g7h8a1b2', 2, '', ''),
(111, 'c3d4e5f7g7h8a1b2', 3, '', ''),
(112, 'c3d4e5f7g7h8a1b2', 4, '', ''),
(113, 'c3d4e5f8g7h8a1b2', 5, '', ''),
(114, 'c3d4e5f8g7h8a1b2', 6, '', ''),
(115, 'c3d4e5f8g7h8a1b2', 7, '', ''),
(116, 'c3d4e5f9g7h8a1b2', 8, '', ''),
(117, 'c3d4e5f9g7h8a1b2', 9, '', ''),
(118, 'c3d4e5f9g7h8a1b2', 10, '', ''),
(119, 'c3d4e5f6g1h8a1b2', 11, '', ''),
(120, 'c3d4e5f6g1h8a1b2', 12, '', ''),
(121, 'c3d4e5f6g1h8a1b2', 1, '', ''),
(122, 'c3d4e5f6g2h8a1b2', 2, '', ''),
(123, 'c3d4e5f6g2h8a1b2', 3, '', ''),
(124, 'c3d4e5f6g2h8a1b2', 4, '', ''),
(125, 'c3d4e5f6g3h8a1b2', 5, '', ''),
(126, 'c3d4e5f6g3h8a1b2', 6, '', ''),
(127, 'c3d4e5f6g3h8a1b2', 7, '', ''),
(128, 'c3d4e5f6g4h8a1b2', 8, '', ''),
(129, 'c3d4e5f6g4h8a1b2', 9, '', ''),
(130, 'c3d4e5f6g4h8a1b2', 10, '', ''),
(131, 'c3d4e5f6g5h8a1b2', 11, '', ''),
(132, 'c3d4e5f6g5h8a1b2', 12, '', ''),
(133, 'c3d4e5f6g5h8a1b2', 1, '', ''),
(134, 'c3d4e5f6g6h8a1b2', 3, '', ''),
(135, 'c3d4e5f6g6h8a1b2', 5, '', ''),
(136, 'c3d4e5f6g6h8a1b2', 6, '', ''),
(137, 'c3d4e5f6g8h8a1b2', 7, '', ''),
(138, 'c3d4e5f6g8h8a1b2', 8, '', ''),
(139, 'c3d4e5f6g8h8a1b2', 9, '', ''),
(140, 'c3d4e5f6g9h8a1b2', 10, '', ''),
(141, 'c3d4e5f6g9h8a1b2', 11, '', ''),
(142, 'c3d4e5f6g9h8a1b2', 12, '', ''),
(143, 'c3d4e5f6g9h8a1cpt', 13, '', ''),
(144, 'a1b2c3d4e5f6g7h8', 1, '', ''),
(145, 'a1b2c3d4e5f6g7h8', 2, '', ''),
(146, 'a1b2c3d4e5f6g7h8', 3, '', ''),
(147, 'a1b2c3d4e5f6g7h8', 4, '', ''),
(148, 'a1b2c3d4e5f6g7h8', 5, '', ''),
(149, 'b2c3d4e5f6g7h8a1', 6, '', ''),
(150, 'b2c3d4e5f6g7h8a1', 7, '', ''),
(151, 'b2c3d4e5f6g7h8a1', 8, '', ''),
(152, 'b2c3d4e5f6g7h8a1', 9, '', ''),
(153, 'b2c3d4e5f6g7h8a1', 10, '', ''),
(154, 'c3d4e5f6g7h8a1b2', 11, '', ''),
(155, 'c3d4e5f6g7h8a1b2', 12, '', ''),
(156, 'c3d4e5f6g7h8a1b2', 9, '', ''),
(157, 'c3d4e5f6g7h8a1b2', 5, '', ''),
(158, 'c3d4e5f6g7h8a1b2', 8, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cpt_codes`
--

CREATE TABLE `cpt_codes` (
  `id` int(11) NOT NULL,
  `cptcode` varchar(110) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cpt_codes`
--

INSERT INTO `cpt_codes` (`id`, `cptcode`, `description`) VALUES
(2, '99253', 'Initial inpatient consultation'),
(3, '11770', 'Excision of pilonidal cyst'),
(4, '33512', 'Coronary artery bypass'),
(5, '62270', 'Spinal puncture'),
(6, '76498', 'Unlisted diagnostic radiographic procedures'),
(7, '78205', 'Liver imaging (SPECT)'),
(8, '86900', 'Blood typing'),
(9, '93010', 'Electrocardiogram'),
(10, '0001F', 'Blood pressure measured'),
(11, '0002F', 'Tobacco use, smoking, assessed'),
(12, '0003F', 'Tobacco use, non-smoking'),
(13, '0004F', 'Tobacco use, counseling'),
(14, '0005F', 'Tobacco use, pharmacologic therapy'),
(15, '0006F', 'Statin therapy, prescribed'),
(16, '0007F', 'Beta-blocker therapy, prescribed'),
(17, '0008F', 'Ace inhibitor therapy, prescribed'),
(18, '0009F', 'Anginal symptoms'),
(19, '0058T', 'Cryopreservation');

-- --------------------------------------------------------

--
-- Table structure for table `dx_claims`
--

CREATE TABLE `dx_claims` (
  `id` int(11) NOT NULL,
  `claim_id` varchar(110) NOT NULL,
  `dx_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `provider_id` int(11) NOT NULL,
  `reason_id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dx_claims`
--

INSERT INTO `dx_claims` (`id`, `claim_id`, `dx_id`, `comment`, `provider_id`, `reason_id`, `status`) VALUES
(1, 'a1b2c3d4e5f6g7h8', 1, '', 1, 0, 0),
(2, 'a1b2c3d4e5f6g7h8', 2, '', 1, 0, 0),
(3, 'a1b2c3d4e5f6g7h8', 3, '', 1, 0, 0),
(4, 'a1b2c3d4e5f6g7h8', 4, '', 1, 0, 0),
(5, 'a1b2c3d4e5f6g7h8', 5, '', 1, 0, 0),
(6, 'b2c3d4e5f6g7h8a1', 6, '', 1, 0, 0),
(7, 'b2c3d4e5f6g7h8a1', 7, '', 1, 0, 0),
(8, 'b2c3d4e5f6g7h8a1', 8, '', 1, 0, 0),
(9, 'b2c3d4e5f6g7h8a1', 9, '', 1, 0, 0),
(10, 'b2c3d4e5f6g7h8a1', 10, '', 1, 0, 0),
(11, 'c3d4e5f6g7h8a1b2', 11, '', 1, 0, 0),
(12, 'c3d4e5f6g7h8a1b2', 12, '', 1, 0, 0),
(13, 'c3d4e5f6g7h8a1b2', 9, '', 1, 0, 0),
(14, 'c3d4e5f6g7h8a1b2', 5, '', 1, 0, 0),
(15, 'c3d4e5f6g7h8a1b2', 8, '', 1, 0, 0),
(16, 'c1d4e5f6g7h8a1b2', 1, '', 1, 0, 0),
(17, 'c1d4e5f6g7h8a1b2', 2, '', 1, 0, 0),
(18, 'c1d4e5f6g7h8a1b2', 3, '', 1, 0, 0),
(19, 'c1d4e5f6g7h8a1b2', 4, '', 1, 0, 0),
(20, 'c1d4e5f6g7h8a1b2', 5, '', 1, 0, 0),
(21, 'c2d4e5f6g7h8a1b2', 6, '', 1, 0, 0),
(22, 'c2d4e5f6g7h8a1b2', 7, '', 1, 0, 0),
(23, 'c2d4e5f6g7h8a1b2', 8, '', 1, 0, 0),
(24, 'c2d4e5f6g7h8a1b2', 9, '', 1, 0, 0),
(25, 'c2d4e5f6g7h8a1b2', 10, '', 1, 0, 0),
(26, 'c2d4e5f6g7h8a1b2', 11, '', 1, 0, 0),
(27, 'c4d4e5f6g7h8a1b2', 12, '', 1, 0, 0),
(28, 'c4d4e5f6g7h8a1b2', 1, '', 1, 0, 0),
(29, 'c4d4e5f6g7h8a1b2', 2, '', 1, 0, 0),
(30, 'c4d4e5f6g7h8a1b2', 3, '', 1, 0, 0),
(31, 'c4d4e5f6g7h8a1b2', 4, '', 1, 0, 0),
(32, 'c5d4e5f6g7h8a1b2', 5, '', 2, 0, 0),
(33, 'c5d4e5f6g7h8a1b2', 6, '', 2, 0, 0),
(34, 'c5d4e5f6g7h8a1b2', 7, '', 2, 0, 0),
(35, 'c5d4e5f6g7h8a1b2', 8, '', 2, 0, 0),
(36, 'c5d4e5f6g7h8a1b2', 9, '', 2, 0, 0),
(37, 'c6d4e5f6g7h8a1b2', 10, '', 2, 0, 0),
(38, 'c6d4e5f6g7h8a1b2', 11, '', 2, 0, 0),
(39, 'c6d4e5f6g7h8a1b2', 12, '', 2, 0, 0),
(40, 'c6d4e5f6g7h8a1b2', 1, '', 2, 0, 0),
(41, 'c7d4e5f6g7h8a1b2', 2, '', 3, 0, 0),
(42, 'c7d4e5f6g7h8a1b2', 3, '', 3, 0, 0),
(43, 'c7d4e5f6g7h8a1b2', 4, '', 3, 0, 0),
(44, 'c8d4e5f6g7h8a1b2', 5, '', 3, 0, 0),
(45, 'c8d4e5f6g7h8a1b2', 6, '', 3, 0, 0),
(46, 'c8d4e5f6g7h8a1b2', 7, '', 3, 0, 0),
(47, 'c9d4e5f6g7h8a1b2', 8, '', 4, 0, 0),
(48, 'c9d4e5f6g7h8a1b2', 9, '', 4, 0, 0),
(49, 'c9d4e5f6g7h8a1b2', 10, '', 4, 0, 0),
(50, 'c0d4e5f6g7h8a1b2', 11, '', 4, 0, 0),
(51, 'c0d4e5f6g7h8a1b2', 12, '', 4, 0, 0),
(52, 'c0d4e5f6g7h8a1b2', 1, '', 4, 0, 0),
(53, 'c3d1e5f6g7h8a1b2', 2, '', 5, 0, 0),
(54, 'c3d1e5f6g7h8a1b2', 3, '', 5, 0, 0),
(55, 'c3d2e5f6g7h8a1b2', 4, '', 5, 0, 0),
(56, 'c3d2e5f6g7h8a1b2', 5, '', 5, 0, 0),
(57, 'c3d2e5f6g7h8a1b2', 6, '', 5, 0, 0),
(58, 'c3d3e5f6g7h8a1b2', 7, '', 6, 0, 0),
(59, 'c3d3e5f6g7h8a1b2', 8, '', 6, 0, 0),
(60, 'c3d3e5f6g7h8a1b2', 9, '', 6, 0, 0),
(61, 'c3d5e5f6g7h8a1b2', 10, '', 6, 0, 0),
(62, 'c3d5e5f6g7h8a1b2', 11, '', 6, 0, 0),
(63, 'c3d5e5f6g7h8a1b2', 12, '', 6, 0, 0),
(64, 'c3d6e5f6g7h8a1b2', 1, '', 7, 0, 0),
(65, 'c3d6e5f6g7h8a1b2', 2, '', 7, 0, 0),
(66, 'c3d6e5f6g7h8a1b2', 3, '', 7, 0, 0),
(67, 'c3d6e5f6g7h8a1b2', 4, '', 7, 0, 0),
(68, 'c3d7e5f6g7h8a1b2', 5, '', 7, 0, 0),
(69, 'c3d7e5f6g7h8a1b2', 6, '', 7, 0, 0),
(70, 'c3d7e5f6g7h8a1b2', 7, '', 7, 0, 0),
(71, 'c3d8e5f6g7h8a1b2', 8, '', 8, 0, 0),
(72, 'c3d8e5f6g7h8a1b2', 9, '', 8, 0, 0),
(73, 'c3d8e5f6g7h8a1b2', 10, '', 8, 0, 0),
(74, 'c3d8e5f6g7h8a1b2', 11, '', 8, 0, 0),
(75, 'c3d9e5f6g7h8a1b2', 12, '', 8, 0, 0),
(76, 'c3d9e5f6g7h8a1b2', 1, '', 8, 0, 0),
(77, 'c3d9e5f6g7h8a1b2', 2, '', 8, 0, 0),
(78, 'c3d0e5f6g7h8a1b2', 3, '', 9, 0, 0),
(79, 'c3d0e5f6g7h8a1b2', 4, '', 9, 0, 0),
(80, 'c3d0e5f6g7h8a1b2', 5, '', 9, 0, 0),
(81, 'c3d4e1f6g7h8a1b2', 6, '', 9, 0, 0),
(82, 'c3d4e1f6g7h8a1b2', 7, '', 9, 0, 0),
(83, 'c3d4e1f6g7h8a1b2', 8, '', 9, 0, 0),
(84, 'c3d4e1f6g7h8a1b2', 9, '', 9, 0, 0),
(85, 'c3d4e2f6g7h8a1b2', 10, '', 10, 0, 0),
(86, 'c3d4e2f6g7h8a1b2', 11, '', 10, 0, 0),
(87, 'c3d4e2f6g7h8a1b2', 12, '', 10, 0, 0),
(88, 'c3d4e2f6g7h8a1b2', 1, '', 10, 0, 0),
(89, 'c3d4e3f6g7h8a1b2', 2, '', 10, 0, 0),
(90, 'c3d4e3f6g7h8a1b2', 3, '', 10, 0, 0),
(91, 'c3d4e3f6g7h8a1b2', 4, '', 10, 0, 0),
(92, 'c3d4e4f6g7h8a1b2', 5, '', 1, 0, 0),
(93, 'c3d4e4f6g7h8a1b2', 6, '', 1, 0, 0),
(94, 'c3d4e4f6g7h8a1b2', 7, '', 1, 0, 0),
(95, 'c3d4e6f6g7h8a1b2', 8, '', 1, 0, 0),
(96, 'c3d4e6f6g7h8a1b2', 9, '', 1, 0, 0),
(97, 'c3d4e6f6g7h8a1b2', 10, '', 1, 0, 0),
(98, 'c3d4e7f6g7h8a1b2', 11, '', 2, 0, 0),
(99, 'c3d4e7f6g7h8a1b2', 12, '', 2, 0, 0),
(100, 'c3d4e7f6g7h8a1b2', 1, '', 2, 0, 0),
(101, 'c3d4e8f6g7h8a1b2', 2, '', 2, 0, 0),
(102, 'c3d4e8f6g7h8a1b2', 3, '', 2, 0, 0),
(103, 'c3d4e8f6g7h8a1b2', 4, '', 2, 0, 0),
(104, 'c3d4e9f6g7h8a1b2', 5, '', 3, 0, 0),
(105, 'c3d4e9f6g7h8a1b2', 6, '', 3, 0, 0),
(106, 'c3d4e9f6g7h8a1b2', 7, '', 3, 0, 0),
(107, 'c3d4e0f6g7h8a1b2', 8, '', 3, 0, 0),
(108, 'c3d4e0f6g7h8a1b2', 9, '', 3, 0, 0),
(109, 'c3d4e0f6g7h8a1b2', 10, '', 3, 0, 0),
(110, 'c3d4e5f1g7h8a1b2', 11, '', 4, 0, 0),
(111, 'c3d4e5f1g7h8a1b2', 12, '', 4, 0, 0),
(112, 'c3d4e5f1g7h8a1b2', 1, '', 4, 0, 0),
(113, 'c3d4e5f2g7h8a1b2', 2, '', 4, 0, 0),
(114, 'c3d4e5f2g7h8a1b2', 3, '', 4, 0, 0),
(115, 'c3d4e5f2g7h8a1b2', 4, '', 4, 0, 0),
(116, 'c3d4e5f3g7h8a1b2', 5, '', 5, 0, 0),
(117, 'c3d4e5f3g7h8a1b2', 6, '', 5, 0, 0),
(118, 'c3d4e5f3g7h8a1b2', 7, '', 5, 0, 0),
(119, 'c3d4e5f4g7h8a1b2', 8, '', 5, 0, 0),
(120, 'c3d4e5f4g7h8a1b2', 9, '', 5, 0, 0),
(121, 'c3d4e5f4g7h8a1b2', 10, '', 5, 0, 0),
(122, 'c3d4e5f5g7h8a1b2', 11, '', 5, 0, 0),
(123, 'c3d4e5f5g7h8a1b2', 12, '', 5, 0, 0),
(124, 'c3d4e5f5g7h8a1b2', 1, '', 5, 0, 0),
(125, 'c3d4e5f7g7h8a1b2', 2, '', 5, 0, 0),
(126, 'c3d4e5f7g7h8a1b2', 3, '', 5, 0, 0),
(127, 'c3d4e5f7g7h8a1b2', 4, '', 5, 0, 0),
(128, 'c3d4e5f8g7h8a1b2', 5, '', 6, 0, 0),
(129, 'c3d4e5f8g7h8a1b2', 6, '', 6, 0, 0),
(130, 'c3d4e5f8g7h8a1b2', 7, '', 6, 0, 0),
(131, 'c3d4e5f9g7h8a1b2', 8, '', 6, 0, 0),
(132, 'c3d4e5f9g7h8a1b2', 9, '', 6, 0, 0),
(133, 'c3d4e5f9g7h8a1b2', 10, '', 6, 0, 0),
(134, 'c3d4e5f6g1h8a1b2', 11, '', 7, 0, 0),
(135, 'c3d4e5f6g1h8a1b2', 12, '', 7, 0, 0),
(136, 'c3d4e5f6g1h8a1b2', 1, '', 7, 0, 0),
(137, 'c3d4e5f6g2h8a1b2', 2, '', 7, 0, 0),
(138, 'c3d4e5f6g2h8a1b2', 3, '', 7, 0, 0),
(139, 'c3d4e5f6g2h8a1b2', 4, '', 7, 0, 0),
(140, 'c3d4e5f6g3h8a1b2', 5, '', 8, 0, 0),
(141, 'c3d4e5f6g3h8a1b2', 6, '', 8, 0, 0),
(142, 'c3d4e5f6g3h8a1b2', 7, '', 8, 0, 0),
(143, 'c3d4e5f6g4h8a1b2', 8, '', 8, 0, 0),
(144, 'c3d4e5f6g4h8a1b2', 9, '', 8, 0, 0),
(145, 'c3d4e5f6g4h8a1b2', 10, '', 8, 0, 0),
(146, 'c3d4e5f6g5h8a1b2', 11, '', 9, 0, 0),
(147, 'c3d4e5f6g5h8a1b2', 12, '', 9, 0, 0),
(148, 'c3d4e5f6g5h8a1b2', 1, '', 9, 0, 0),
(149, 'c3d4e5f6g6h8a1b2', 3, '', 9, 0, 0),
(150, 'c3d4e5f6g6h8a1b2', 5, '', 9, 0, 0),
(151, 'c3d4e5f6g6h8a1b2', 6, '', 9, 0, 0),
(152, 'c3d4e5f6g8h8a1b2', 7, '', 10, 0, 0),
(153, 'c3d4e5f6g8h8a1b2', 8, '', 10, 0, 0),
(154, 'c3d4e5f6g8h8a1b2', 9, '', 10, 0, 0),
(155, 'c3d4e5f6g9h8a1b2', 2, '', 1, 0, 0),
(156, 'c3d4e5f6g9h8a1b2', 1, '', 1, 0, 0),
(157, 'c3d4e5f6g9h8a1b2', 2, '', 1, 0, 0),
(158, 'c3d4e5f6g9h8a1b2', 3, '', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dx_codes`
--

CREATE TABLE `dx_codes` (
  `id` int(11) NOT NULL,
  `dxcode` varchar(110) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dx_codes`
--

INSERT INTO `dx_codes` (`id`, `dxcode`, `description`) VALUES
(1, 'A0100', 'TYPHOID FEVER, UNSPECIFIED'),
(2, 'A011', 'PARATYPHOID FEVER A'),
(3, 'A012', 'PARATYPHOID FEVER B'),
(4, 'A013', 'PARATYPHOID FEVER C'),
(5, 'A014', 'PARATYPHOID FEVER, UNSPECIFIED'),
(6, 'B1001', 'HUMAN HERPESVIRUS 6 ENCEPHALITIS'),
(7, 'B1009', 'OTHER HUMAN HERPESVIRUS ENCEPHALITIS'),
(8, 'B1081', 'HUMAN HERPESVIRUS 6 INFECTION'),
(9, 'B1082', 'HUMAN HERPESVIRUS 7 INFECTION'),
(10, 'B1089', 'OTHER HUMAN HERPESVIRUS INFECTION'),
(11, 'D100', 'BENIGN NEOPLASM OF LIP'),
(12, 'D101', 'BENIGN NEOPLASM OF TONGUE');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `full_name` varchar(110) NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` varchar(210) NOT NULL,
  `memid` varchar(200) NOT NULL,
  `provider_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `full_name`, `date_of_birth`, `address`, `memid`, `provider_id`) VALUES
(1, 'Member One', '1968-05-10', 'South Dakota', '123456A', 1),
(2, 'Member Two', '1980-05-10', 'South Dakota', '234567B', 2),
(3, 'Member Three', '1979-05-10', 'South Dakota', '345678C', 3),
(4, 'Member Four', '1978-05-10', 'South Dakota', '456789D', 4),
(5, 'Member Five', '1977-05-10', 'South Dakota', '654321E', 5),
(6, 'Member Six', '1976-05-10', 'South Dakota', '765432F', 6),
(7, 'Member Seven', '1975-05-10', 'South Dakota', '876543G', 7),
(8, 'Member Eight', '1974-05-10', 'South Dakota', '987654H', 8),
(9, 'Member Nine', '1973-05-10', 'South Dakota', '123789I', 9),
(10, 'Member Ten', '1972-05-10', 'South Dakota', '135268J', 10),
(11, 'Member Eleven', '1971-05-10', 'South Dakota', '125690K', 1),
(12, 'Member Tweleve', '1970-05-10', 'South Dakota', '347800L', 2),
(13, 'Member Thirteen', '1960-05-10', 'South Dakota', '123567M', 3),
(14, 'Member Fourteen', '1961-05-10', 'South Dakota', '125567N', 4),
(15, 'Member Fifteen', '1962-05-10', 'South Dakota', '789123O', 5),
(16, 'Member Sixteen', '1963-05-10', 'South Dakota', '793456P', 6),
(17, 'Member Seventeen', '1964-05-10', 'South Dakota', '784235Q', 7),
(18, 'Member Eighteen', '1965-05-10', 'South Dakota', '125678R', 8),
(19, 'Member Nineteen', '1966-05-10', 'South Dakota', '122324S', 9),
(20, 'Member Twenty', '1967-05-10', 'South Dakota', '222333T', 10);

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` int(11) NOT NULL,
  `full_name` varchar(210) NOT NULL,
  `npi` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `full_name`, `npi`) VALUES
(1, 'Dr. Provider One', 1234567890),
(2, 'Dr. Provider Two', 2345678901),
(3, 'Dr. Provider Three', 4567890123),
(4, 'Dr. Provider Four', 5678901234),
(5, 'Dr. Provider Five', 6789012345),
(6, 'Dr. Provider Six', 7890123456),
(7, 'Dr. Provider Seven', 8901234567),
(8, 'Dr. Provider Eight', 9012345678),
(9, 'Dr. Provider Nine', 9876543210),
(10, 'Dr. Provider Ten', 8765432109);

-- --------------------------------------------------------

--
-- Table structure for table `reasons`
--

CREATE TABLE `reasons` (
  `id` int(11) NOT NULL,
  `name` varchar(220) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reasons`
--

INSERT INTO `reasons` (`id`, `name`) VALUES
(1, 'Cannot read chart'),
(2, 'Wrong chart'),
(3, 'Incorrect Claims'),
(4, 'Wrong doc.'),
(5, 'Other'),
(6, 'Chart size is as long as this text');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(110) NOT NULL,
  `email` varchar(110) NOT NULL,
  `username` varchar(110) NOT NULL,
  `password` varchar(110) NOT NULL,
  `role` varchar(110) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `username`, `password`, `role`, `status`) VALUES
(1, 'RAV One User', 'rav.one@rav.com', 'ravone', 'one', 'coder', 1),
(2, 'RAV Two User', 'rav.two@rav.com', 'ravtwo', 'two', 'coder', 1),
(3, 'RAV Three User', 'rav.three@rav.com', 'ravthree', 'three', 'coder', 1),
(4, 'RAV Four User', 'rav.four@rav.com', 'ravfour', 'four', 'coder', 1),
(5, 'RAV Five User', 'rav.five@rav.com', 'ravfive', 'five', 'coder', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_charts`
--

CREATE TABLE `user_charts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `chart_id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_charts`
--

INSERT INTO `user_charts` (`id`, `user_id`, `chart_id`, `status`) VALUES
(1, 1, 7, 0),
(2, 2, 5, 0),
(3, 3, 15, 0),
(4, 4, 2, 0),
(5, 5, 6, 0),
(6, 1, 8, 0),
(7, 2, 10, 0),
(8, 3, 12, 0),
(9, 4, 14, 0),
(10, 5, 16, 0),
(11, 1, 18, 0),
(12, 2, 3, 0),
(13, 3, 1, 0),
(14, 4, 11, 0),
(15, 5, 13, 0),
(16, 1, 4, 0),
(17, 1, 9, 0),
(18, 1, 17, 0),
(19, 1, 19, 0),
(20, 1, 20, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `active_charts`
--
ALTER TABLE `active_charts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `Charts`
--
ALTER TABLE `Charts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart_claims`
--
ALTER TABLE `chart_claims`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `cpt_claims`
--
ALTER TABLE `cpt_claims`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cpt_codes`
--
ALTER TABLE `cpt_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dx_claims`
--
ALTER TABLE `dx_claims`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dx_codes`
--
ALTER TABLE `dx_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reasons`
--
ALTER TABLE `reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_charts`
--
ALTER TABLE `user_charts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `active_charts`
--
ALTER TABLE `active_charts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `Charts`
--
ALTER TABLE `Charts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `chart_claims`
--
ALTER TABLE `chart_claims`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `cpt_claims`
--
ALTER TABLE `cpt_claims`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;
--
-- AUTO_INCREMENT for table `cpt_codes`
--
ALTER TABLE `cpt_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `dx_claims`
--
ALTER TABLE `dx_claims`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;
--
-- AUTO_INCREMENT for table `dx_codes`
--
ALTER TABLE `dx_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `reasons`
--
ALTER TABLE `reasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user_charts`
--
ALTER TABLE `user_charts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
