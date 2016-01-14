-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 10, 2015 at 02:36 PM
-- Server version: 5.5.46-0ubuntu0.14.04.2
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `elunch_portal_no_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `tracking_users`
--

CREATE TABLE IF NOT EXISTS `tracking_users` (
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `manually_set` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tracking_users`
--

INSERT INTO `tracking_users` (`user_id`, `status_id`, `manually_set`, `created_at`, `updated_at`) VALUES
(85, 1, 0, '2015-11-09 08:22:02', '2015-11-09 08:22:02'),
(86, 1, 0, '2015-11-09 08:22:02', '2015-11-09 08:22:02'),
(87, 1, 0, '2015-11-09 08:22:02', '2015-11-09 08:22:02'),
(88, 1, 0, '2015-11-09 08:26:56', '2015-11-09 08:26:56'),
(89, 1, 0, '2015-11-09 08:26:56', '2015-11-09 08:26:56'),
(90, 1, 0, '2015-11-09 08:26:56', '2015-11-09 08:26:56'),
(91, 1, 0, '2015-11-09 08:32:41', '2015-11-09 08:32:41'),
(92, 1, 0, '2015-11-09 08:32:41', '2015-11-09 08:32:41'),
(93, 1, 0, '2015-11-09 08:32:41', '2015-11-09 08:32:41'),
(94, 1, 0, '2015-11-09 08:32:41', '2015-11-09 08:32:41'),
(95, 1, 0, '2015-11-09 08:32:42', '2015-11-09 08:32:42'),
(96, 1, 0, '2015-11-09 08:32:42', '2015-11-09 08:32:42'),
(97, 1, 0, '2015-11-09 08:32:42', '2015-11-09 08:32:42'),
(98, 1, 0, '2015-11-09 08:32:42', '2015-11-09 08:32:42'),
(99, 1, 0, '2015-11-09 08:32:42', '2015-11-09 08:32:42'),
(100, 1, 0, '2015-11-09 08:41:12', '2015-11-09 08:41:12'),
(101, 1, 0, '2015-11-09 08:41:12', '2015-11-09 08:41:12'),
(102, 1, 0, '2015-11-09 08:41:12', '2015-11-09 08:41:12'),
(103, 1, 0, '2015-11-09 08:41:12', '2015-11-09 08:41:12'),
(104, 1, 0, '2015-11-09 08:41:12', '2015-11-09 08:41:12'),
(105, 1, 0, '2015-11-09 08:41:13', '2015-11-09 08:41:13'),
(106, 1, 0, '2015-11-09 08:41:13', '2015-11-09 08:41:13'),
(107, 1, 0, '2015-11-09 08:41:13', '2015-11-09 08:41:13'),
(108, 1, 0, '2015-11-09 08:41:13', '2015-11-09 08:41:13'),
(109, 1, 0, '2015-11-09 08:49:09', '2015-11-09 08:49:09'),
(110, 1, 0, '2015-11-09 08:49:09', '2015-11-09 08:49:09'),
(111, 1, 0, '2015-11-09 08:49:09', '2015-11-09 08:49:09'),
(112, 1, 0, '2015-11-09 08:49:09', '2015-11-09 08:49:09'),
(113, 1, 0, '2015-11-09 08:49:09', '2015-11-09 08:49:09'),
(114, 1, 0, '2015-11-09 08:49:09', '2015-11-09 08:49:09'),
(115, 1, 0, '2015-11-09 08:49:09', '2015-11-09 08:49:09'),
(116, 1, 0, '2015-11-09 08:49:09', '2015-11-09 08:49:09'),
(117, 1, 0, '2015-11-09 08:49:09', '2015-11-09 08:49:09'),
(118, 1, 0, '2015-11-09 08:56:05', '2015-11-09 08:56:05'),
(119, 1, 0, '2015-11-09 08:56:05', '2015-11-09 08:56:05'),
(120, 1, 0, '2015-11-09 08:56:05', '2015-11-09 08:56:05'),
(121, 1, 0, '2015-11-09 08:56:05', '2015-11-09 08:56:05'),
(122, 1, 0, '2015-11-09 08:56:05', '2015-11-09 08:56:05'),
(123, 1, 0, '2015-11-09 08:56:05', '2015-11-09 08:56:05'),
(124, 1, 0, '2015-11-09 08:56:05', '2015-11-09 08:56:05'),
(125, 1, 0, '2015-11-09 08:56:05', '2015-11-09 08:56:05'),
(126, 1, 0, '2015-11-09 08:56:06', '2015-11-09 08:56:06'),
(127, 1, 0, '2015-11-09 08:56:06', '2015-11-09 08:56:06'),
(128, 1, 0, '2015-11-09 08:56:06', '2015-11-09 08:56:06'),
(129, 1, 0, '2015-11-09 08:56:06', '2015-11-09 08:56:06'),
(130, 1, 0, '2015-11-09 08:56:06', '2015-11-09 08:56:06'),
(131, 1, 0, '2015-11-09 08:56:06', '2015-11-09 08:56:06'),
(132, 1, 0, '2015-11-09 09:03:19', '2015-11-09 09:03:19'),
(133, 1, 0, '2015-11-09 09:03:19', '2015-11-09 09:03:19'),
(134, 1, 0, '2015-11-09 09:03:19', '2015-11-09 09:03:19'),
(135, 1, 0, '2015-11-09 09:03:19', '2015-11-09 09:03:19'),
(136, 1, 0, '2015-11-09 09:03:19', '2015-11-09 09:03:19'),
(137, 1, 0, '2015-11-09 09:03:19', '2015-11-09 09:03:19'),
(138, 1, 0, '2015-11-09 09:03:19', '2015-11-09 09:03:19'),
(139, 1, 0, '2015-11-09 09:03:19', '2015-11-09 09:03:19'),
(140, 1, 0, '2015-11-09 09:03:19', '2015-11-09 09:03:19'),
(141, 1, 0, '2015-11-09 09:03:20', '2015-11-09 09:03:20'),
(142, 1, 0, '2015-11-09 09:03:20', '2015-11-09 09:03:20'),
(143, 1, 0, '2015-11-09 09:03:20', '2015-11-09 09:03:20'),
(144, 1, 0, '2015-11-09 09:03:20', '2015-11-09 09:03:20'),
(145, 1, 0, '2015-11-09 09:03:20', '2015-11-09 09:03:20'),
(146, 1, 0, '2015-11-09 09:08:56', '2015-11-09 09:08:56'),
(147, 1, 0, '2015-11-09 09:08:57', '2015-11-09 09:08:57'),
(148, 1, 0, '2015-11-09 09:08:57', '2015-11-09 09:08:57'),
(149, 1, 0, '2015-11-09 09:08:57', '2015-11-09 09:08:57'),
(150, 1, 0, '2015-11-09 09:08:57', '2015-11-09 09:08:57'),
(151, 1, 0, '2015-11-09 09:08:57', '2015-11-09 09:08:57'),
(152, 1, 0, '2015-11-09 09:08:57', '2015-11-09 09:08:57'),
(153, 1, 0, '2015-11-09 09:08:57', '2015-11-09 09:08:57'),
(154, 1, 0, '2015-11-09 09:08:57', '2015-11-09 09:08:57'),
(155, 1, 0, '2015-11-09 09:08:57', '2015-11-09 09:08:57'),
(156, 1, 0, '2015-11-09 09:08:57', '2015-11-09 09:08:57'),
(157, 1, 0, '2015-11-09 09:08:57', '2015-11-09 09:08:57'),
(158, 1, 0, '2015-11-09 09:08:57', '2015-11-09 09:08:57'),
(159, 1, 0, '2015-11-09 09:08:57', '2015-11-09 09:08:57'),
(160, 1, 0, '2015-11-09 09:16:36', '2015-11-09 09:16:36'),
(161, 1, 0, '2015-11-09 09:16:36', '2015-11-09 09:16:36'),
(162, 1, 0, '2015-11-09 09:16:36', '2015-11-09 09:16:36'),
(163, 1, 0, '2015-11-09 09:16:37', '2015-11-09 09:16:37'),
(164, 1, 0, '2015-11-09 09:16:37', '2015-11-09 09:16:37'),
(165, 1, 0, '2015-11-09 09:16:37', '2015-11-09 09:16:37'),
(166, 1, 0, '2015-11-09 09:16:37', '2015-11-09 09:16:37'),
(167, 1, 0, '2015-11-09 09:16:37', '2015-11-09 09:16:37'),
(168, 1, 0, '2015-11-09 09:16:37', '2015-11-09 09:16:37'),
(169, 1, 0, '2015-11-09 09:16:37', '2015-11-09 09:16:37'),
(170, 1, 0, '2015-11-09 09:16:37', '2015-11-09 09:16:37'),
(171, 1, 0, '2015-11-09 09:16:37', '2015-11-09 09:16:37'),
(172, 1, 0, '2015-11-09 09:16:37', '2015-11-09 09:16:37'),
(173, 1, 0, '2015-11-09 09:16:37', '2015-11-09 09:16:37'),
(174, 1, 0, '2015-11-09 09:41:10', '2015-11-09 09:41:10'),
(175, 1, 0, '2015-11-09 09:41:10', '2015-11-09 09:41:10'),
(176, 1, 0, '2015-11-09 09:41:10', '2015-11-09 09:41:10'),
(177, 1, 0, '2015-11-09 09:41:10', '2015-11-09 09:41:10'),
(178, 1, 0, '2015-11-09 09:41:10', '2015-11-09 09:41:10'),
(179, 1, 0, '2015-11-09 09:41:10', '2015-11-09 09:41:10'),
(180, 1, 0, '2015-11-09 09:41:10', '2015-11-09 09:41:10'),
(181, 1, 0, '2015-11-09 09:41:10', '2015-11-09 09:41:10'),
(182, 1, 0, '2015-11-09 09:41:10', '2015-11-09 09:41:10'),
(183, 1, 0, '2015-11-09 09:41:10', '2015-11-09 09:41:10'),
(184, 1, 0, '2015-11-09 09:41:11', '2015-11-09 09:41:11'),
(185, 1, 0, '2015-11-09 09:41:11', '2015-11-09 09:41:11'),
(186, 1, 0, '2015-11-09 09:41:11', '2015-11-09 09:41:11'),
(187, 1, 0, '2015-11-09 09:41:11', '2015-11-09 09:41:11'),
(188, 1, 0, '2015-11-09 09:41:11', '2015-11-09 09:41:11'),
(189, 1, 0, '2015-11-09 09:41:11', '2015-11-09 09:41:11'),
(190, 1, 0, '2015-11-09 09:41:11', '2015-11-09 09:41:11'),
(191, 1, 0, '2015-11-09 09:41:11', '2015-11-09 09:41:11'),
(192, 1, 0, '2015-11-09 09:41:11', '2015-11-09 09:41:11'),
(193, 1, 0, '2015-11-09 09:41:11', '2015-11-09 09:41:11'),
(194, 1, 0, '2015-11-09 09:41:11', '2015-11-09 09:41:11'),
(195, 1, 0, '2015-11-09 09:41:11', '2015-11-09 09:41:11'),
(196, 1, 0, '2015-11-09 09:41:11', '2015-11-09 09:41:11'),
(197, 1, 0, '2015-11-09 09:41:12', '2015-11-09 09:41:12'),
(198, 1, 0, '2015-11-09 09:41:12', '2015-11-09 09:41:12'),
(199, 1, 0, '2015-11-09 09:41:12', '2015-11-09 09:41:12'),
(200, 1, 0, '2015-11-09 09:41:12', '2015-11-09 09:41:12'),
(201, 1, 0, '2015-11-09 09:41:12', '2015-11-09 09:41:12'),
(202, 1, 0, '2015-11-09 09:41:12', '2015-11-09 09:41:12'),
(203, 1, 0, '2015-11-09 09:41:12', '2015-11-09 09:41:12'),
(204, 1, 0, '2015-11-09 09:41:12', '2015-11-09 09:41:12'),
(205, 1, 0, '2015-11-09 09:41:12', '2015-11-09 09:41:12'),
(206, 1, 0, '2015-11-09 09:41:12', '2015-11-09 09:41:12'),
(207, 1, 0, '2015-11-09 09:41:12', '2015-11-09 09:41:12'),
(208, 1, 0, '2015-11-09 09:41:12', '2015-11-09 09:41:12'),
(209, 1, 0, '2015-11-09 09:41:12', '2015-11-09 09:41:12'),
(210, 1, 0, '2015-11-09 09:41:12', '2015-11-09 09:41:12'),
(211, 1, 0, '2015-11-09 09:41:13', '2015-11-09 09:41:13'),
(212, 1, 0, '2015-11-09 09:41:13', '2015-11-09 09:41:13'),
(213, 1, 0, '2015-11-09 09:41:13', '2015-11-09 09:41:13'),
(214, 1, 0, '2015-11-09 09:41:13', '2015-11-09 09:41:13'),
(215, 1, 0, '2015-11-09 09:41:13', '2015-11-09 09:41:13'),
(216, 1, 0, '2015-11-09 09:41:13', '2015-11-09 09:41:13'),
(217, 1, 0, '2015-11-09 09:41:13', '2015-11-09 09:41:13'),
(218, 1, 0, '2015-11-09 09:41:13', '2015-11-09 09:41:13'),
(219, 1, 0, '2015-11-09 09:41:13', '2015-11-09 09:41:13'),
(220, 1, 0, '2015-11-09 09:41:13', '2015-11-09 09:41:13'),
(221, 1, 0, '2015-11-09 09:41:13', '2015-11-09 09:41:13'),
(222, 1, 0, '2015-11-09 09:41:13', '2015-11-09 09:41:13'),
(223, 1, 0, '2015-11-09 09:41:14', '2015-11-09 09:41:14'),
(224, 1, 0, '2015-11-09 09:41:14', '2015-11-09 09:41:14');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
