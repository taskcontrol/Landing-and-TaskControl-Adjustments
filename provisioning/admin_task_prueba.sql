-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 06, 2020 at 11:58 AM
-- Server version: 5.7.27-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-10+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin_task`
--

-- --------------------------------------------------------

--
-- Table structure for table `absences`
--

CREATE TABLE `absences` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `absence_type_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `absences`
--

INSERT INTO `absences` (`id`, `created_at`, `updated_at`, `absence_type_id`, `project_id`, `comment`, `from`, `to`, `user_id`) VALUES
(1, '2020-04-04 15:43:05', '2020-04-20 15:51:59', 105, 7, 'Moving for Marcelo 19-20 April \'18', '2020-04-19', '2020-04-20', 556),
(2, '2020-04-04 15:43:40', '2020-04-04 15:43:40', 114, 7, 'Exam Day for Tanya', '2020-05-24', '2020-05-24', 551),
(3, '2020-04-04 15:44:32', '2020-04-26 14:35:19', 121, 7, 'Marriage License', '2020-06-04', '2020-06-08', 552);

-- --------------------------------------------------------

--
-- Table structure for table `absence_types`
--

CREATE TABLE `absence_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days` tinyint(4) NOT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `added_by` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `absence_types`
--

INSERT INTO `absence_types` (`id`, `created_at`, `updated_at`, `country_id`, `title`, `days`, `city_id`, `company_id`, `added_by`) VALUES
(104, '2020-03-20 12:34:10', '2020-03-20 12:34:10', 1, 'Moving License', 2, 2, 1, NULL),
(105, '2020-03-20 12:34:10', '2020-03-20 12:34:10', 1, 'Paternity License', 2, 2, 1, NULL),
(106, '2020-03-20 12:34:10', '2020-03-20 12:34:10', 1, 'Marriage License', 7, 2, 1, NULL),
(110, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 2, 'Maternity License', 90, 7, 1, NULL),
(111, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 2, 'Moving License', 2, 7, 1, NULL),
(112, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 2, 'Paternity License', 2, 7, 1, NULL),
(113, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 2, 'Marriage License', 7, 7, 1, NULL),
(114, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 2, 'Exam Day', 1, 7, 1, NULL),
(115, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 3, 'Maternity License', 90, 9, 1, NULL),
(116, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 3, 'Moving License', 2, 9, 1, NULL),
(117, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 3, 'Paternity License', 2, 9, 1, NULL),
(118, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 3, 'Marriage License', 7, 9, 1, NULL),
(119, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 3, 'Exam Day', 1, 9, 1, NULL),
(120, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 4, 'Maternity License', 90, 5, 1, NULL),
(121, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 4, 'Moving License', 2, 5, 1, NULL),
(122, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 4, 'Paternity License', 2, 5, 1, NULL),
(123, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 4, 'Marriage License', 7, 5, 1, NULL),
(124, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 4, 'Exam Day', 1, 5, 1, NULL),
(125, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 5, 'Maternity License', 90, 8, 1, NULL),
(126, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 5, 'Moving License', 2, 8, 1, NULL),
(127, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 5, 'Paternity License', 2, 8, 1, NULL),
(128, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 5, 'Marriage License', 7, 8, 1, NULL),
(129, '2020-03-20 18:29:28', '2020-03-20 18:29:28', 5, 'Exam Day', 1, 8, 1, NULL),
(130, '2020-03-20 18:36:35', '2020-03-20 18:36:35', 1, 'Maternity License', 90, 2, 1, NULL),
(131, '2020-04-03 23:22:30', '2020-04-03 23:22:30', 1, 'Exam Day', 1, 2, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `absence_types_template`
--

CREATE TABLE `absence_types_template` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `absence_types_template`
--

INSERT INTO `absence_types_template` (`id`, `created_at`, `updated_at`, `country_id`, `city_id`, `title`, `days`) VALUES
(13, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 1, 2, 'Maternity License', 90),
(14, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 1, 2, 'Moving License', 2),
(15, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 1, 2, 'Paternity License', 2),
(16, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 1, 2, 'Marriage License', 7),
(17, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 1, 2, 'Exam Day', 1),
(18, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 2, 7, 'Maternity License', 90),
(19, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 2, 7, 'Moving License', 2),
(20, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 2, 7, 'Paternity License', 2),
(21, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 2, 7, 'Marriage License', 7),
(22, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 2, 7, 'Exam Day', 1),
(23, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 3, 9, 'Maternity License', 90),
(24, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 3, 9, 'Moving License', 2),
(25, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 3, 9, 'Paternity License', 2),
(26, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 3, 9, 'Marriage License', 7),
(27, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 3, 9, 'Exam Day', 1),
(28, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 4, 5, 'Maternity License', 90),
(29, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 4, 5, 'Moving License', 2),
(30, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 4, 5, 'Paternity License', 2),
(31, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 4, 5, 'Marriage License', 7),
(32, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 4, 5, 'Exam Day', 1),
(33, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 4, 5, 'Maternity License', 90),
(34, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 4, 5, 'Moving License', 2),
(35, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 4, 5, 'Paternity License', 2),
(36, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 4, 5, 'Marriage License', 7),
(37, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 4, 5, 'Exam Day', 1),
(38, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 5, 8, 'Maternity License', 90),
(39, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 5, 8, 'Moving License', 2),
(40, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 5, 8, 'Paternity License', 2),
(41, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 5, 8, 'Marriage License', 7),
(42, '2020-03-20 17:19:24', '2020-03-20 17:19:24', 5, 8, 'Exam Day', 1);

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `activity_desc` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `created_at`, `updated_at`, `activity_desc`) VALUES
(1, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Agriculture'),
(2, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Construction'),
(3, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Engineering'),
(4, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Education & Trainingr'),
(5, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Finance & Accounting'),
(6, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Travel & Tourism');

-- --------------------------------------------------------

--
-- Table structure for table `activities_history`
--

CREATE TABLE `activities_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `agenda_id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `follower_id` int(10) UNSIGNED NOT NULL,
  `due` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activities_history`
--

INSERT INTO `activities_history` (`id`, `created_at`, `updated_at`, `agenda_id`, `date`, `description`, `follower_id`, `due`) VALUES
(1, '2020-04-05 16:05:19', '2020-04-17 18:08:12', 1, '2020-04-05 00:00:00', 'Device List received. Start the Redefining process', 551, '2020-04-18 00:00:00'),
(2, '2020-04-17 18:08:43', '2020-04-17 18:08:43', 1, '2020-04-16 00:00:00', 'Finishing the redefining process', 551, '2020-04-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `additional_hours`
--

CREATE TABLE `additional_hours` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `rate_id` int(10) UNSIGNED DEFAULT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `hours` tinyint(4) NOT NULL,
  `project_role_id` int(10) UNSIGNED DEFAULT NULL,
  `seniority_id` int(10) UNSIGNED DEFAULT NULL,
  `rate` float(18,2) DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `workplace` enum('onsite','offshore') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_id` int(10) UNSIGNED DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `additional_hours`
--

INSERT INTO `additional_hours` (`id`, `created_at`, `updated_at`, `project_id`, `user_id`, `rate_id`, `comments`, `date`, `hours`, `project_role_id`, `seniority_id`, `rate`, `currency_id`, `workplace`, `office_id`, `country_id`, `city_id`) VALUES
(1, '2020-04-04 15:57:14', '2020-04-16 15:07:58', 7, 551, 14, 'To finish the initial sofware analysis', '2020-04-03', 2, 1, 2, 18.75, 2, 'offshore', 5, 5, 8),
(2, '2020-04-04 16:02:11', '2020-04-16 15:08:12', 7, 553, 5, 'Extra-Work to help defining the Device Features', '2020-03-23', 4, 7, 3, 28.12, 2, 'offshore', 4, 3, 9),
(3, '2020-04-13 17:51:55', '2020-04-16 15:07:39', 7, 547, 14, 'Working on Saturday to finish the features analysis.', '2020-03-24', 3, 1, 2, 18.75, 2, 'offshore', 5, 5, 8),
(8, '2020-04-20 17:37:16', '2020-04-20 17:40:25', 7, 551, 14, 'To help finishing UI Layer', '2020-04-20', 2, 1, 2, 18.75, 2, 'offshore', 5, 5, 8);

-- --------------------------------------------------------

--
-- Table structure for table `agenda`
--

CREATE TABLE `agenda` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `knowledge_area` enum('Startup-Up & Integration Management','Scope Management','Time Management','Cost Management','Quality Management','Human Resource Management','Communications Management','StakeHolder Management','Risk Management','Procurement Management') COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_number` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `status` enum('Open','Pending Internal','Pending External','In Progress','Done','Closed','Cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `due` datetime NOT NULL,
  `creator_id` int(10) UNSIGNED NOT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agenda`
--

INSERT INTO `agenda` (`id`, `created_at`, `updated_at`, `company_id`, `project_id`, `knowledge_area`, `item_number`, `description`, `start`, `status`, `due`, `creator_id`, `owner_id`, `detail`) VALUES
(1, '2020-04-04 16:12:17', '2020-04-06 17:49:31', 1, 7, 'Scope Management', 1, 'Help in redefining the ALLDEV features with the PO', '2020-03-21 00:00:00', 'Pending Internal', '2020-03-21 00:00:00', 554, 553, 'Help in redefining the ALLDEV features with the PO'),
(3, '2020-04-06 17:48:25', '2020-04-20 11:52:32', 1, 7, 'Startup-Up & Integration Management', 2, 'Features Required Analysis to Start', '2020-03-21 00:00:00', 'Pending External', '2020-03-22 00:00:00', 554, 553, 'It is now depending on the Devices DB Provider');

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `date_action` date NOT NULL COMMENT 'Date of the Action',
  `process_name` varchar(40) NOT NULL COMMENT 'ie. Adjustments',
  `action_name` varchar(40) NOT NULL COMMENT 'ie. Add debts or Add  Credits adjustements',
  `user_id` int(10) NOT NULL COMMENT 'just the user id executing the action',
  `user_comment` varchar(80) NOT NULL,
  `reason` varchar(80) NOT NULL COMMENT 'why the user is executing this action'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='audit log table to control access mostly to financial data';

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `timezone` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `added_by` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `created_at`, `updated_at`, `name`, `location_name`, `country_id`, `timezone`, `company_id`, `added_by`) VALUES
(2, '2020-03-14 16:03:01', '2020-03-20 16:07:28', 'Buenos Aires', 'Provincia de Buenos Aires', 1, 'GMT-3', 1, NULL),
(5, '2020-03-14 17:08:29', '2020-03-15 23:10:20', 'Sao Paulo', 'Estado do Sao Paulo', 4, 'GMT-3', 1, NULL),
(6, '2020-03-14 17:09:29', '2020-03-14 17:09:29', 'Cordoba', 'Provincia de Cordoba', 1, 'GMT-3', 1, NULL),
(7, '2020-03-14 17:13:19', '2020-03-15 23:10:48', 'Austin', 'Texas', 2, 'GMT-5', 1, NULL),
(8, '2020-03-14 17:16:36', '2020-03-15 23:08:15', 'Bangalore', 'Bangalore', 5, 'GMT+5.3', 1, NULL),
(9, '2020-03-14 20:40:36', '2020-03-16 12:00:55', 'Bogota', 'Bogota', 3, 'GMT-5', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities_template`
--

CREATE TABLE `cities_template` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `timezone` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities_template`
--

INSERT INTO `cities_template` (`id`, `created_at`, `updated_at`, `name`, `location_name`, `country_id`, `timezone`) VALUES
(1, '2020-03-15 21:33:38', '2020-03-15 21:33:38', 'Capital Federal', 'Provincia de Buenos Aires', 1, 'GMT-3'),
(2, '2020-03-15 21:33:38', '2020-03-15 21:33:38', 'Cordoba', 'Provincia de Cordoba', 1, 'GMT-3'),
(4, '2020-03-15 21:33:38', '2020-03-15 21:33:38', 'Sao Paulo', 'Estado de Sao Paulo', 4, 'GMT-3'),
(6, '2020-03-15 21:33:38', '2020-03-15 21:33:38', 'Bangalore', 'Bangalore', 5, 'GMT+5.3'),
(7, '2020-03-15 21:33:38', '2020-03-15 21:33:38', 'Austin', 'Texas', 2, 'GMT-5'),
(8, '2020-03-15 21:33:38', '2020-03-15 21:33:38', 'Bogota', 'Bogota', 3, 'GMT-5');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number1` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number2` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number3` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swiftcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aba` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `industry_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `logo_path` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `created_at`, `updated_at`, `name`, `address`, `city_id`, `email`, `phone`, `billing_name`, `billing_address`, `tax_number1`, `tax_number2`, `tax_number3`, `bank_name`, `account_number`, `swiftcode`, `aba`, `currency_id`, `industry_id`, `user_id`, `logo_path`) VALUES
(1, '2020-03-14 15:55:36', '2020-09-02 14:47:20', 'GoitGlobal LLC', 'Cordoba Av. 6000, 7th Floor, Buenos Aires, Argentina', 2, 'admin.goitglobal@taskcontrol.net', '419-5040', 'GoItGlobal LLC', 'Cordoba Av. 6000, 7th Floor, Buenos Aires, Argentina', '2434234', NULL, NULL, 'Bank Of Boston', '7886-234', 'BOB12345678', '123456789', 2, 2, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_roles`
--

CREATE TABLE `company_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_roles`
--

INSERT INTO `company_roles` (`id`, `created_at`, `updated_at`, `company_id`, `title`) VALUES
(1, '2020-03-15 19:49:53', '2020-03-15 19:49:53', 1, 'Admin'),
(2, '2020-03-15 19:50:00', '2020-03-15 19:50:00', 1, 'User'),
(3, '2020-03-15 19:53:08', '2020-03-15 19:53:08', 1, 'Delivery Manager'),
(4, '2020-03-15 19:53:21', '2020-03-15 19:53:21', 1, 'Project Manager'),
(5, '2020-03-15 20:19:03', '2020-03-15 20:19:03', 1, 'Technical Leader');

-- --------------------------------------------------------

--
-- Table structure for table `company_role_templates`
--

CREATE TABLE `company_role_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_role_templates`
--

INSERT INTO `company_role_templates` (`id`, `created_at`, `updated_at`, `title`) VALUES
(1, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Project Manager'),
(2, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Program Manager'),
(3, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Delivery Manager'),
(4, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Technical Leader'),
(5, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Functional Analyst');

-- --------------------------------------------------------

--
-- Table structure for table `company_users`
--

CREATE TABLE `company_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_users`
--

INSERT INTO `company_users` (`id`, `created_at`, `updated_at`, `company_id`, `user_id`) VALUES
(544, '2020-03-14 00:00:00', '2020-03-14 00:00:00', 1, 547),
(548, '2020-03-15 12:35:11', '2020-03-15 12:35:11', 1, 551),
(549, '2020-03-15 12:39:53', '2020-03-15 12:39:53', 1, 552),
(550, '2020-03-15 12:45:25', '2020-03-15 12:45:25', 1, 553),
(551, '2020-03-15 12:48:04', '2020-03-15 12:48:04', 1, 554),
(552, '2020-03-15 12:51:21', '2020-03-15 12:51:21', 1, 555),
(553, '2020-03-15 12:54:15', '2020-03-15 12:54:15', 1, 556),
(554, '2020-03-15 12:57:09', '2020-03-15 12:57:09', 1, 557),
(558, '2020-03-20 20:13:29', '2020-03-20 20:13:29', 1, 561),
(559, '2020-04-04 15:48:46', '2020-04-04 15:48:46', 1, 562),
(560, '2020-09-10 21:25:58', '2020-09-10 21:25:58', 1, 563);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `industry_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `created_at`, `updated_at`, `company_id`, `project_id`, `name`, `company`, `department`, `country_id`, `city_id`, `industry_id`, `email`, `phone`, `comments`) VALUES
(12, '2020-03-26 18:21:12', '2020-03-26 18:21:12', 1, 7, 'Alexander Boss', 'FLEXDEV', 'Dept1', 2, 7, 9, 'aboss@flexdev.com', '234-2200-029', 'He\'s the PO for this Project'),
(13, '2020-03-26 18:22:52', '2020-03-26 18:22:52', 1, 7, 'Michael Smith', 'Microchips Inc,', 'Dept 1', 2, 7, 9, 'msmith@microchips.com', '1-233-2090', 'Contact him for Chips Purchase'),
(14, '2020-09-10 21:33:26', '2020-09-10 21:33:26', 1, 8, 'Roberto F. Giangreco', 'TaskControl LLC', 'Software Development', 1, 2, 2, 'roberto.giangreco@taskcontrol.com', '2915049524', 'PO del Proyecto TaskControl Finalization');

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `sow_number` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amendment_number` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `start_date` date NOT NULL,
  `finish_date` date NOT NULL,
  `engagement_id` int(10) UNSIGNED NOT NULL,
  `service_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `workinghours_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workinghours_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contracts`
--

INSERT INTO `contracts` (`id`, `created_at`, `updated_at`, `customer_id`, `project_id`, `sow_number`, `amendment_number`, `date`, `start_date`, `finish_date`, `engagement_id`, `service_description`, `workinghours_from`, `workinghours_to`, `currency_id`) VALUES
(1, '2020-04-03 13:23:14', '2020-04-09 23:01:16', 2, 7, 'SOW-14-MAR-2020-V1', 'None', '2020-03-14', '2020-03-21', '2020-06-21', 1, 'Hardware & Software Development for an standard pluggable device.', '09:00', '17:00', 2),
(2, '2020-09-10 21:21:35', '2020-09-10 21:21:35', 3, 8, 'TSKCTRL-01-01-2020', 'None', '2020-09-10', '2020-09-24', '2020-10-30', 2, 'Software Development', '09:00', '17:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contract_expenses`
--

CREATE TABLE `contract_expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expense_id` int(10) UNSIGNED DEFAULT NULL,
  `detail` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(18,2) NOT NULL,
  `cost` double(18,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `contract_id` int(10) UNSIGNED NOT NULL,
  `reimbursable` tinyint(1) NOT NULL,
  `frequency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contract_expenses`
--

INSERT INTO `contract_expenses` (`id`, `created_at`, `updated_at`, `expense_id`, `detail`, `amount`, `cost`, `currency_id`, `contract_id`, `reimbursable`, `frequency`) VALUES
(4, '2020-04-05 18:36:27', '2020-04-10 21:21:24', 6, 'Travel and others USA', 2000.00, 2000.00, 2, 1, 1, 'quarterly');

-- --------------------------------------------------------

--
-- Table structure for table `contract_materials`
--

CREATE TABLE `contract_materials` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `material_id` int(10) UNSIGNED DEFAULT NULL,
  `detail` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(18,2) NOT NULL,
  `cost` double(18,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `contract_id` int(10) UNSIGNED NOT NULL,
  `reimbursable` tinyint(1) NOT NULL,
  `frequency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contract_materials`
--

INSERT INTO `contract_materials` (`id`, `created_at`, `updated_at`, `material_id`, `detail`, `amount`, `cost`, `currency_id`, `contract_id`, `reimbursable`, `frequency`) VALUES
(3, '2020-04-05 19:26:24', '2020-04-10 21:17:23', 3, 'Digital Displays, Cables & Plastic Boxes', 500.00, 500.00, 2, 1, 1, 'monthly');

-- --------------------------------------------------------

--
-- Table structure for table `contract_resources`
--

CREATE TABLE `contract_resources` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_role_id` int(10) UNSIGNED NOT NULL,
  `seniority_id` int(10) UNSIGNED NOT NULL,
  `qty` tinyint(4) NOT NULL,
  `rate_id` int(10) UNSIGNED DEFAULT NULL,
  `rate` double(18,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `load` tinyint(4) NOT NULL,
  `workplace` enum('onsite','offshore') COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `contract_id` int(10) UNSIGNED NOT NULL,
  `office_id` int(10) UNSIGNED DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contract_resources`
--

INSERT INTO `contract_resources` (`id`, `created_at`, `updated_at`, `project_role_id`, `seniority_id`, `qty`, `rate_id`, `rate`, `currency_id`, `load`, `workplace`, `comments`, `contract_id`, `office_id`, `country_id`, `city_id`) VALUES
(1, '2020-04-05 18:32:10', '2020-04-10 18:31:10', 2, 3, 1, 1, 25.00, 2, 50, 'offshore', NULL, 1, 1, 1, 2),
(2, '2020-04-05 18:34:09', '2020-04-10 17:07:06', 7, 3, 1, 5, 28.12, 2, 50, 'offshore', NULL, 1, 4, 3, 9),
(3, '2020-04-05 18:53:32', '2020-04-10 16:36:29', 1, 2, 2, 14, 18.75, 2, 100, 'offshore', NULL, 1, 5, 5, 8),
(4, '2020-04-05 18:54:15', '2020-04-10 17:06:15', 4, 3, 1, 6, 15.62, 2, 100, 'offshore', NULL, 1, 3, 4, 5),
(5, '2020-04-05 18:55:13', '2020-04-10 17:14:58', 6, 3, 1, 2, 18.75, 2, 50, 'offshore', NULL, 1, 2, 1, 6),
(6, '2020-04-05 18:57:03', '2020-04-10 17:05:38', 3, 2, 1, 10, 15.62, 2, 100, 'offshore', NULL, 1, 2, 1, 6),
(7, '2020-04-05 19:08:37', '2020-04-10 17:08:51', 5, 3, 1, 4, 31.25, 2, 25, 'offshore', NULL, 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `contract_services`
--

CREATE TABLE `contract_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `service_id` int(10) UNSIGNED DEFAULT NULL,
  `detail` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(18,2) NOT NULL,
  `cost` double(18,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `contract_id` int(10) UNSIGNED NOT NULL,
  `reimbursable` tinyint(1) NOT NULL,
  `frequency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contract_services`
--

INSERT INTO `contract_services` (`id`, `created_at`, `updated_at`, `service_id`, `detail`, `amount`, `cost`, `currency_id`, `contract_id`, `reimbursable`, `frequency`) VALUES
(3, '2020-04-05 18:34:59', '2020-04-10 21:17:59', 4, 'Hosting & Devices compatibilities DB Services', 3333.33, 3333.33, 2, 1, 1, 'monthly');

-- --------------------------------------------------------

--
-- Table structure for table `costs`
--

CREATE TABLE `costs` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `seniority_id` int(10) UNSIGNED NOT NULL,
  `project_role_id` int(10) UNSIGNED NOT NULL,
  `workplace` enum('onsite','offshore') COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double(18,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `costs`
--

INSERT INTO `costs` (`id`, `created_at`, `updated_at`, `company_id`, `country_id`, `city_id`, `seniority_id`, `project_role_id`, `workplace`, `detail`, `value`, `currency_id`) VALUES
(1, '2020-03-14 21:15:22', '2020-04-04 14:03:45', 1, 5, 8, 2, 1, 'offshore', 'Developers India', 10.00, 2),
(2, '2020-03-14 21:15:50', '2020-04-04 13:43:10', 1, 4, 5, 3, 4, 'offshore', 'Web Dev Brasil', 8.50, 2),
(3, '2020-03-14 21:16:40', '2020-04-04 13:43:20', 1, 3, 9, 3, 7, 'offshore', 'Technical Leader Col.', 10.00, 2),
(4, '2020-03-14 21:17:23', '2020-04-04 13:43:30', 1, 1, 2, 3, 2, 'offshore', 'Project Manager Senior', 10.00, 2),
(5, '2020-03-14 21:17:50', '2020-04-04 13:43:38', 1, 1, 6, 3, 6, 'offshore', 'UX Senior', 13.00, 2),
(6, '2020-03-14 21:18:30', '2020-04-04 13:43:47', 1, 1, 2, 2, 3, 'offshore', 'QA Semi-Senior', 14.00, 2),
(7, '2020-03-14 21:18:59', '2020-04-04 13:43:56', 1, 1, 2, 3, 5, 'offshore', 'Delivery Manager', 15.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `created_at`, `updated_at`, `name`, `language_id`, `currency_id`, `code`) VALUES
(1, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Argentina', 1, 1, NULL),
(2, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'United States', 2, 2, NULL),
(3, '2020-03-14 17:02:18', '2020-03-14 17:02:18', 'Colombia', 1, 3, NULL),
(4, '2020-03-14 17:02:56', '2020-03-14 17:02:56', 'Brasil', 1, 1, NULL),
(5, '2020-03-14 17:16:02', '2020-03-14 17:16:02', 'India', 6, 5, NULL),
(903, '2020-03-20 20:01:08', '2020-03-20 20:01:08', 'Afghanistan', 223, NULL, NULL),
(904, '2020-03-20 20:01:09', '2020-03-20 20:01:09', 'Åland Islands', 226, NULL, NULL),
(905, '2020-03-20 20:01:09', '2020-03-20 20:01:09', 'Albania', 227, NULL, NULL),
(906, '2020-03-20 20:01:09', '2020-03-20 20:01:09', 'Algeria', 228, NULL, NULL),
(907, '2020-03-20 20:01:09', '2020-03-20 20:01:09', 'American Samoa', 2, NULL, NULL),
(908, '2020-03-20 20:01:09', '2020-03-20 20:01:09', 'Andorra', 230, NULL, NULL),
(909, '2020-03-20 20:01:09', '2020-03-20 20:01:09', 'Angola', 231, NULL, NULL),
(910, '2020-03-20 20:01:09', '2020-03-20 20:01:09', 'Anguilla', 2, NULL, NULL),
(911, '2020-03-20 20:01:10', '2020-03-20 20:01:10', 'Antarctica', 2, NULL, NULL),
(912, '2020-03-20 20:01:10', '2020-03-20 20:01:10', 'Antigua and Barbuda', 2, NULL, NULL),
(913, '2020-03-20 20:01:10', '2020-03-20 20:01:10', 'Armenia', 234, NULL, NULL),
(914, '2020-03-20 20:01:10', '2020-03-20 20:01:10', 'Aruba', 235, NULL, NULL),
(915, '2020-03-20 20:01:10', '2020-03-20 20:01:10', 'Australia', 2, NULL, NULL),
(916, '2020-03-20 20:01:11', '2020-03-20 20:01:11', 'Austria', 237, NULL, NULL),
(917, '2020-03-20 20:01:11', '2020-03-20 20:01:11', 'Azerbaijan', 238, NULL, NULL),
(918, '2020-03-20 20:01:11', '2020-03-20 20:01:11', 'Bahamas', 2, NULL, NULL),
(919, '2020-03-20 20:01:11', '2020-03-20 20:01:11', 'Bahrain', 228, NULL, NULL),
(920, '2020-03-20 20:01:11', '2020-03-20 20:01:11', 'Bangladesh', 239, NULL, NULL),
(921, '2020-03-20 20:01:11', '2020-03-20 20:01:11', 'Barbados', 2, NULL, NULL),
(922, '2020-03-20 20:01:11', '2020-03-20 20:01:11', 'Belarus', 240, NULL, NULL),
(923, '2020-03-20 20:01:12', '2020-03-20 20:01:12', 'Belgium', 235, NULL, NULL),
(924, '2020-03-20 20:01:12', '2020-03-20 20:01:12', 'Belize', 2, NULL, NULL),
(925, '2020-03-20 20:01:12', '2020-03-20 20:01:12', 'Benin', 241, NULL, NULL),
(926, '2020-03-20 20:01:12', '2020-03-20 20:01:12', 'Bermuda', 2, NULL, NULL),
(927, '2020-03-20 20:01:12', '2020-03-20 20:01:12', 'Bhutan', 242, NULL, NULL),
(928, '2020-03-20 20:01:12', '2020-03-20 20:01:12', 'Bolivia (Plurinational State of)', 1, NULL, NULL),
(929, '2020-03-20 20:01:12', '2020-03-20 20:01:12', 'Bonaire, Sint Eustatius and Saba', 235, NULL, NULL),
(930, '2020-03-20 20:01:13', '2020-03-20 20:01:13', 'Bosnia and Herzegovina', 245, NULL, NULL),
(931, '2020-03-20 20:01:13', '2020-03-20 20:01:13', 'Botswana', 2, NULL, NULL),
(932, '2020-03-20 20:01:13', '2020-03-20 20:01:13', 'Bouvet Island', 249, NULL, NULL),
(933, '2020-03-20 20:01:13', '2020-03-20 20:01:13', 'Brazil', 231, NULL, NULL),
(934, '2020-03-20 20:01:13', '2020-03-20 20:01:13', 'British Indian Ocean Territory', 2, NULL, NULL),
(935, '2020-03-20 20:01:13', '2020-03-20 20:01:13', 'United States Minor Outlying Islands', 2, NULL, NULL),
(936, '2020-03-20 20:01:13', '2020-03-20 20:01:13', 'Virgin Islands (British)', 2, NULL, NULL),
(937, '2020-03-20 20:01:14', '2020-03-20 20:01:14', 'Virgin Islands (U.S.)', 2, NULL, NULL),
(938, '2020-03-20 20:01:14', '2020-03-20 20:01:14', 'Brunei Darussalam', 252, NULL, NULL),
(939, '2020-03-20 20:01:14', '2020-03-20 20:01:14', 'Bulgaria', 253, NULL, NULL),
(940, '2020-03-20 20:01:14', '2020-03-20 20:01:14', 'Burkina Faso', 241, NULL, NULL),
(941, '2020-03-20 20:01:14', '2020-03-20 20:01:14', 'Burundi', 241, NULL, NULL),
(942, '2020-03-20 20:01:14', '2020-03-20 20:01:14', 'Cambodia', 256, NULL, NULL),
(943, '2020-03-20 20:01:15', '2020-03-20 20:01:15', 'Cameroon', 2, NULL, NULL),
(944, '2020-03-20 20:01:15', '2020-03-20 20:01:15', 'Canada', 2, NULL, NULL),
(945, '2020-03-20 20:01:15', '2020-03-20 20:01:15', 'Cabo Verde', 231, NULL, NULL),
(946, '2020-03-20 20:01:15', '2020-03-20 20:01:15', 'Cayman Islands', 2, NULL, NULL),
(947, '2020-03-20 20:01:15', '2020-03-20 20:01:15', 'Central African Republic', 241, NULL, NULL),
(948, '2020-03-20 20:01:15', '2020-03-20 20:01:15', 'Chad', 241, NULL, NULL),
(949, '2020-03-20 20:01:15', '2020-03-20 20:01:15', 'Chile', 1, NULL, NULL),
(950, '2020-03-20 20:01:16', '2020-03-20 20:01:16', 'China', 258, NULL, NULL),
(951, '2020-03-20 20:01:16', '2020-03-20 20:01:16', 'Christmas Island', 2, NULL, NULL),
(952, '2020-03-20 20:01:16', '2020-03-20 20:01:16', 'Cocos (Keeling) Islands', 2, NULL, NULL),
(953, '2020-03-20 20:01:16', '2020-03-20 20:01:16', 'Comoros', 228, NULL, NULL),
(954, '2020-03-20 20:01:16', '2020-03-20 20:01:16', 'Congo', 241, NULL, NULL),
(955, '2020-03-20 20:01:17', '2020-03-20 20:01:17', 'Congo (Democratic Republic of the)', 241, NULL, NULL),
(956, '2020-03-20 20:01:17', '2020-03-20 20:01:17', 'Cook Islands', 2, NULL, NULL),
(957, '2020-03-20 20:01:17', '2020-03-20 20:01:17', 'Costa Rica', 1, NULL, NULL),
(958, '2020-03-20 20:01:17', '2020-03-20 20:01:17', 'Croatia', 246, NULL, NULL),
(959, '2020-03-20 20:01:17', '2020-03-20 20:01:17', 'Cuba', 1, NULL, NULL),
(960, '2020-03-20 20:01:17', '2020-03-20 20:01:17', 'Curaçao', 235, NULL, NULL),
(961, '2020-03-20 20:01:17', '2020-03-20 20:01:17', 'Cyprus', 263, NULL, NULL),
(962, '2020-03-20 20:01:18', '2020-03-20 20:01:18', 'Czech Republic', 265, NULL, NULL),
(963, '2020-03-20 20:01:18', '2020-03-20 20:01:18', 'Denmark', 267, NULL, NULL),
(964, '2020-03-20 20:01:18', '2020-03-20 20:01:18', 'Djibouti', 241, NULL, NULL),
(965, '2020-03-20 20:01:18', '2020-03-20 20:01:18', 'Dominica', 2, NULL, NULL),
(966, '2020-03-20 20:01:18', '2020-03-20 20:01:18', 'Dominican Republic', 1, NULL, NULL),
(967, '2020-03-20 20:01:18', '2020-03-20 20:01:18', 'Ecuador', 1, NULL, NULL),
(968, '2020-03-20 20:01:18', '2020-03-20 20:01:18', 'Egypt', 228, NULL, NULL),
(969, '2020-03-20 20:01:19', '2020-03-20 20:01:19', 'El Salvador', 1, NULL, NULL),
(970, '2020-03-20 20:01:19', '2020-03-20 20:01:19', 'Equatorial Guinea', 1, NULL, NULL),
(971, '2020-03-20 20:01:19', '2020-03-20 20:01:19', 'Eritrea', 268, NULL, NULL),
(972, '2020-03-20 20:01:19', '2020-03-20 20:01:19', 'Estonia', 269, NULL, NULL),
(973, '2020-03-20 20:01:19', '2020-03-20 20:01:19', 'Ethiopia', 270, NULL, NULL),
(974, '2020-03-20 20:01:19', '2020-03-20 20:01:19', 'Falkland Islands (Malvinas)', 2, NULL, NULL),
(975, '2020-03-20 20:01:20', '2020-03-20 20:01:20', 'Faroe Islands', 271, NULL, NULL),
(976, '2020-03-20 20:01:20', '2020-03-20 20:01:20', 'Fiji', 2, NULL, NULL),
(977, '2020-03-20 20:01:20', '2020-03-20 20:01:20', 'Finland', 274, NULL, NULL),
(978, '2020-03-20 20:01:20', '2020-03-20 20:01:20', 'France', 241, NULL, NULL),
(979, '2020-03-20 20:01:20', '2020-03-20 20:01:20', 'French Guiana', 241, NULL, NULL),
(980, '2020-03-20 20:01:20', '2020-03-20 20:01:20', 'French Polynesia', 241, NULL, NULL),
(981, '2020-03-20 20:01:20', '2020-03-20 20:01:20', 'French Southern Territories', 241, NULL, NULL),
(982, '2020-03-20 20:01:21', '2020-03-20 20:01:21', 'Gabon', 241, NULL, NULL),
(983, '2020-03-20 20:01:21', '2020-03-20 20:01:21', 'Gambia', 2, NULL, NULL),
(984, '2020-03-20 20:01:21', '2020-03-20 20:01:21', 'Georgia', 275, NULL, NULL),
(985, '2020-03-20 20:01:21', '2020-03-20 20:01:21', 'Germany', 237, NULL, NULL),
(986, '2020-03-20 20:01:21', '2020-03-20 20:01:21', 'Ghana', 2, NULL, NULL),
(987, '2020-03-20 20:01:21', '2020-03-20 20:01:21', 'Gibraltar', 2, NULL, NULL),
(988, '2020-03-20 20:01:21', '2020-03-20 20:01:21', 'Greece', 263, NULL, NULL),
(989, '2020-03-20 20:01:22', '2020-03-20 20:01:22', 'Greenland', 276, NULL, NULL),
(990, '2020-03-20 20:01:22', '2020-03-20 20:01:22', 'Grenada', 2, NULL, NULL),
(991, '2020-03-20 20:01:22', '2020-03-20 20:01:22', 'Guadeloupe', 241, NULL, NULL),
(992, '2020-03-20 20:01:22', '2020-03-20 20:01:22', 'Guam', 2, NULL, NULL),
(993, '2020-03-20 20:01:22', '2020-03-20 20:01:22', 'Guatemala', 1, NULL, NULL),
(994, '2020-03-20 20:01:22', '2020-03-20 20:01:22', 'Guernsey', 2, NULL, NULL),
(995, '2020-03-20 20:01:23', '2020-03-20 20:01:23', 'Guinea', 241, NULL, NULL),
(996, '2020-03-20 20:01:23', '2020-03-20 20:01:23', 'Guinea-Bissau', 231, NULL, NULL),
(997, '2020-03-20 20:01:23', '2020-03-20 20:01:23', 'Guyana', 2, NULL, NULL),
(998, '2020-03-20 20:01:23', '2020-03-20 20:01:23', 'Haiti', 241, NULL, NULL),
(999, '2020-03-20 20:01:23', '2020-03-20 20:01:23', 'Heard Island and McDonald Islands', 2, NULL, NULL),
(1000, '2020-03-20 20:01:23', '2020-03-20 20:01:23', 'Holy See', 279, NULL, NULL),
(1001, '2020-03-20 20:01:23', '2020-03-20 20:01:23', 'Honduras', 1, NULL, NULL),
(1002, '2020-03-20 20:01:24', '2020-03-20 20:01:24', 'Hong Kong', 2, NULL, NULL),
(1003, '2020-03-20 20:01:24', '2020-03-20 20:01:24', 'Hungary', 281, NULL, NULL),
(1004, '2020-03-20 20:01:24', '2020-03-20 20:01:24', 'Iceland', 282, NULL, NULL),
(1005, '2020-03-20 20:01:24', '2020-03-20 20:01:24', 'Indonesia', 283, NULL, NULL),
(1006, '2020-03-20 20:01:24', '2020-03-20 20:01:24', 'Côte d\'Ivoire', 241, NULL, NULL),
(1007, '2020-03-20 20:01:24', '2020-03-20 20:01:24', 'Iran (Islamic Republic of)', 284, NULL, NULL),
(1008, '2020-03-20 20:01:25', '2020-03-20 20:01:25', 'Iraq', 228, NULL, NULL),
(1009, '2020-03-20 20:01:25', '2020-03-20 20:01:25', 'Ireland', 286, NULL, NULL),
(1010, '2020-03-20 20:01:25', '2020-03-20 20:01:25', 'Isle of Man', 2, NULL, NULL),
(1011, '2020-03-20 20:01:25', '2020-03-20 20:01:25', 'Israel', 288, NULL, NULL),
(1012, '2020-03-20 20:01:25', '2020-03-20 20:01:25', 'Italy', 280, NULL, NULL),
(1013, '2020-03-20 20:01:25', '2020-03-20 20:01:25', 'Jamaica', 2, NULL, NULL),
(1014, '2020-03-20 20:01:25', '2020-03-20 20:01:25', 'Japan', 289, NULL, NULL),
(1015, '2020-03-20 20:01:26', '2020-03-20 20:01:26', 'Jersey', 2, NULL, NULL),
(1016, '2020-03-20 20:01:26', '2020-03-20 20:01:26', 'Jordan', 228, NULL, NULL),
(1017, '2020-03-20 20:01:26', '2020-03-20 20:01:26', 'Kazakhstan', 290, NULL, NULL),
(1018, '2020-03-20 20:01:26', '2020-03-20 20:01:26', 'Kenya', 2, NULL, NULL),
(1019, '2020-03-20 20:01:26', '2020-03-20 20:01:26', 'Kiribati', 2, NULL, NULL),
(1020, '2020-03-20 20:01:26', '2020-03-20 20:01:26', 'Kuwait', 228, NULL, NULL),
(1021, '2020-03-20 20:01:26', '2020-03-20 20:01:26', 'Kyrgyzstan', 291, NULL, NULL),
(1022, '2020-03-20 20:01:27', '2020-03-20 20:01:27', 'Lao People\'s Democratic Republic', 292, NULL, NULL),
(1023, '2020-03-20 20:01:27', '2020-03-20 20:01:27', 'Latvia', 293, NULL, NULL),
(1024, '2020-03-20 20:01:27', '2020-03-20 20:01:27', 'Lebanon', 228, NULL, NULL),
(1025, '2020-03-20 20:01:27', '2020-03-20 20:01:27', 'Lesotho', 2, NULL, NULL),
(1026, '2020-03-20 20:01:27', '2020-03-20 20:01:27', 'Liberia', 2, NULL, NULL),
(1027, '2020-03-20 20:01:27', '2020-03-20 20:01:27', 'Libya', 228, NULL, NULL),
(1028, '2020-03-20 20:01:27', '2020-03-20 20:01:27', 'Liechtenstein', 237, NULL, NULL),
(1029, '2020-03-20 20:01:28', '2020-03-20 20:01:28', 'Lithuania', 295, NULL, NULL),
(1030, '2020-03-20 20:01:28', '2020-03-20 20:01:28', 'Luxembourg', 241, NULL, NULL),
(1031, '2020-03-20 20:01:28', '2020-03-20 20:01:28', 'Macao', 258, NULL, NULL),
(1032, '2020-03-20 20:01:28', '2020-03-20 20:01:28', 'Macedonia (the former Yugoslav Republic of)', 297, NULL, NULL),
(1033, '2020-03-20 20:01:28', '2020-03-20 20:01:28', 'Madagascar', 241, NULL, NULL),
(1034, '2020-03-20 20:01:28', '2020-03-20 20:01:28', 'Malawi', 2, NULL, NULL),
(1035, '2020-03-20 20:01:28', '2020-03-20 20:01:28', 'Malaysia', NULL, NULL, NULL),
(1036, '2020-03-20 20:01:29', '2020-03-20 20:01:29', 'Maldives', 300, NULL, NULL),
(1037, '2020-03-20 20:01:29', '2020-03-20 20:01:29', 'Mali', 241, NULL, NULL),
(1038, '2020-03-20 20:01:29', '2020-03-20 20:01:29', 'Malta', 301, NULL, NULL),
(1039, '2020-03-20 20:01:29', '2020-03-20 20:01:29', 'Marshall Islands', 2, NULL, NULL),
(1040, '2020-03-20 20:01:29', '2020-03-20 20:01:29', 'Martinique', 241, NULL, NULL),
(1041, '2020-03-20 20:01:29', '2020-03-20 20:01:29', 'Mauritania', 228, NULL, NULL),
(1042, '2020-03-20 20:01:29', '2020-03-20 20:01:29', 'Mauritius', 2, NULL, NULL),
(1043, '2020-03-20 20:01:30', '2020-03-20 20:01:30', 'Mayotte', 241, NULL, NULL),
(1044, '2020-03-20 20:01:30', '2020-03-20 20:01:30', 'Mexico', 1, NULL, NULL),
(1045, '2020-03-20 20:01:30', '2020-03-20 20:01:30', 'Micronesia (Federated States of)', 2, NULL, NULL),
(1046, '2020-03-20 20:01:30', '2020-03-20 20:01:30', 'Moldova (Republic of)', 303, NULL, NULL),
(1047, '2020-03-20 20:01:30', '2020-03-20 20:01:30', 'Monaco', 241, NULL, NULL),
(1048, '2020-03-20 20:01:30', '2020-03-20 20:01:30', 'Mongolia', 304, NULL, NULL),
(1049, '2020-03-20 20:01:30', '2020-03-20 20:01:30', 'Montenegro', 247, NULL, NULL),
(1050, '2020-03-20 20:01:31', '2020-03-20 20:01:31', 'Montserrat', 2, NULL, NULL),
(1051, '2020-03-20 20:01:31', '2020-03-20 20:01:31', 'Morocco', 228, NULL, NULL),
(1052, '2020-03-20 20:01:31', '2020-03-20 20:01:31', 'Mozambique', 231, NULL, NULL),
(1053, '2020-03-20 20:01:31', '2020-03-20 20:01:31', 'Myanmar', 305, NULL, NULL),
(1054, '2020-03-20 20:01:31', '2020-03-20 20:01:31', 'Namibia', 2, NULL, NULL),
(1055, '2020-03-20 20:01:31', '2020-03-20 20:01:31', 'Nauru', 2, NULL, NULL),
(1056, '2020-03-20 20:01:31', '2020-03-20 20:01:31', 'Nepal', 308, NULL, NULL),
(1057, '2020-03-20 20:01:32', '2020-03-20 20:01:32', 'Netherlands', 235, NULL, NULL),
(1058, '2020-03-20 20:01:32', '2020-03-20 20:01:32', 'New Caledonia', 241, NULL, NULL),
(1059, '2020-03-20 20:01:32', '2020-03-20 20:01:32', 'New Zealand', 2, NULL, NULL),
(1060, '2020-03-20 20:01:32', '2020-03-20 20:01:32', 'Nicaragua', 1, NULL, NULL),
(1061, '2020-03-20 20:01:32', '2020-03-20 20:01:32', 'Niger', 241, NULL, NULL),
(1062, '2020-03-20 20:01:32', '2020-03-20 20:01:32', 'Nigeria', 2, NULL, NULL),
(1063, '2020-03-20 20:01:32', '2020-03-20 20:01:32', 'Niue', 2, NULL, NULL),
(1064, '2020-03-20 20:01:33', '2020-03-20 20:01:33', 'Norfolk Island', 2, NULL, NULL),
(1065, '2020-03-20 20:01:33', '2020-03-20 20:01:33', 'Korea (Democratic People\'s Republic of)', 310, NULL, NULL),
(1066, '2020-03-20 20:01:33', '2020-03-20 20:01:33', 'Northern Mariana Islands', 2, NULL, NULL),
(1067, '2020-03-20 20:01:33', '2020-03-20 20:01:33', 'Norway', 249, NULL, NULL),
(1068, '2020-03-20 20:01:33', '2020-03-20 20:01:33', 'Oman', 228, NULL, NULL),
(1069, '2020-03-20 20:01:33', '2020-03-20 20:01:33', 'Pakistan', 2, NULL, NULL),
(1070, '2020-03-20 20:01:33', '2020-03-20 20:01:33', 'Palau', 2, NULL, NULL),
(1071, '2020-03-20 20:01:34', '2020-03-20 20:01:34', 'Palestine, State of', 228, NULL, NULL),
(1072, '2020-03-20 20:01:34', '2020-03-20 20:01:34', 'Panama', 1, NULL, NULL),
(1073, '2020-03-20 20:01:34', '2020-03-20 20:01:34', 'Papua New Guinea', 2, NULL, NULL),
(1074, '2020-03-20 20:01:34', '2020-03-20 20:01:34', 'Paraguay', 1, NULL, NULL),
(1075, '2020-03-20 20:01:34', '2020-03-20 20:01:34', 'Peru', 1, NULL, NULL),
(1076, '2020-03-20 20:01:34', '2020-03-20 20:01:34', 'Philippines', 2, NULL, NULL),
(1077, '2020-03-20 20:01:34', '2020-03-20 20:01:34', 'Pitcairn', 2, NULL, NULL),
(1078, '2020-03-20 20:01:35', '2020-03-20 20:01:35', 'Poland', 311, NULL, NULL),
(1079, '2020-03-20 20:01:35', '2020-03-20 20:01:35', 'Portugal', 231, NULL, NULL),
(1080, '2020-03-20 20:01:35', '2020-03-20 20:01:35', 'Puerto Rico', 1, NULL, NULL),
(1081, '2020-03-20 20:01:35', '2020-03-20 20:01:35', 'Qatar', 228, NULL, NULL),
(1082, '2020-03-20 20:01:35', '2020-03-20 20:01:35', 'Republic of Kosovo', 227, NULL, NULL),
(1083, '2020-03-20 20:01:35', '2020-03-20 20:01:35', 'Réunion', 241, NULL, NULL),
(1084, '2020-03-20 20:01:35', '2020-03-20 20:01:35', 'Romania', 303, NULL, NULL),
(1085, '2020-03-20 20:01:36', '2020-03-20 20:01:36', 'Russian Federation', 232, NULL, NULL),
(1086, '2020-03-20 20:01:36', '2020-03-20 20:01:36', 'Rwanda', 312, NULL, NULL),
(1087, '2020-03-20 20:01:36', '2020-03-20 20:01:36', 'Saint Barthélemy', 241, NULL, NULL),
(1088, '2020-03-20 20:01:36', '2020-03-20 20:01:36', 'Saint Helena, Ascension and Tristan da Cunha', 2, NULL, NULL),
(1089, '2020-03-20 20:01:36', '2020-03-20 20:01:36', 'Saint Kitts and Nevis', 2, NULL, NULL),
(1090, '2020-03-20 20:01:36', '2020-03-20 20:01:36', 'Saint Lucia', 2, NULL, NULL),
(1091, '2020-03-20 20:01:36', '2020-03-20 20:01:36', 'Saint Martin (French part)', 2, NULL, NULL),
(1092, '2020-03-20 20:01:37', '2020-03-20 20:01:37', 'Saint Pierre and Miquelon', 241, NULL, NULL),
(1093, '2020-03-20 20:01:37', '2020-03-20 20:01:37', 'Saint Vincent and the Grenadines', 2, NULL, NULL),
(1094, '2020-03-20 20:01:37', '2020-03-20 20:01:37', 'Samoa', 229, NULL, NULL),
(1095, '2020-03-20 20:01:37', '2020-03-20 20:01:37', 'San Marino', 280, NULL, NULL),
(1096, '2020-03-20 20:01:37', '2020-03-20 20:01:37', 'Sao Tome and Principe', 231, NULL, NULL),
(1097, '2020-03-20 20:01:37', '2020-03-20 20:01:37', 'Saudi Arabia', 228, NULL, NULL),
(1098, '2020-03-20 20:01:37', '2020-03-20 20:01:37', 'Senegal', 241, NULL, NULL),
(1099, '2020-03-20 20:01:38', '2020-03-20 20:01:38', 'Serbia', 247, NULL, NULL),
(1100, '2020-03-20 20:01:38', '2020-03-20 20:01:38', 'Seychelles', 241, NULL, NULL),
(1101, '2020-03-20 20:01:38', '2020-03-20 20:01:38', 'Sierra Leone', 2, NULL, NULL),
(1102, '2020-03-20 20:01:38', '2020-03-20 20:01:38', 'Singapore', 2, NULL, NULL),
(1103, '2020-03-20 20:01:38', '2020-03-20 20:01:38', 'Sint Maarten (Dutch part)', 235, NULL, NULL),
(1104, '2020-03-20 20:01:38', '2020-03-20 20:01:38', 'Slovakia', 266, NULL, NULL),
(1105, '2020-03-20 20:01:38', '2020-03-20 20:01:38', 'Slovenia', 314, NULL, NULL),
(1106, '2020-03-20 20:01:39', '2020-03-20 20:01:39', 'Solomon Islands', 2, NULL, NULL),
(1107, '2020-03-20 20:01:39', '2020-03-20 20:01:39', 'Somalia', 315, NULL, NULL),
(1108, '2020-03-20 20:01:39', '2020-03-20 20:01:39', 'South Africa', 306, NULL, NULL),
(1109, '2020-03-20 20:01:39', '2020-03-20 20:01:39', 'South Georgia and the South Sandwich Islands', 2, NULL, NULL),
(1110, '2020-03-20 20:01:39', '2020-03-20 20:01:39', 'Korea (Republic of)', 310, NULL, NULL),
(1111, '2020-03-20 20:01:39', '2020-03-20 20:01:39', 'South Sudan', 2, NULL, NULL),
(1112, '2020-03-20 20:01:39', '2020-03-20 20:01:39', 'Spain', 1, NULL, NULL),
(1113, '2020-03-20 20:01:40', '2020-03-20 20:01:40', 'Sri Lanka', 322, NULL, NULL),
(1114, '2020-03-20 20:01:40', '2020-03-20 20:01:40', 'Sudan', 228, NULL, NULL),
(1115, '2020-03-20 20:01:40', '2020-03-20 20:01:40', 'Suriname', 235, NULL, NULL),
(1116, '2020-03-20 20:01:40', '2020-03-20 20:01:40', 'Svalbard and Jan Mayen', 249, NULL, NULL),
(1117, '2020-03-20 20:01:40', '2020-03-20 20:01:40', 'Swaziland', 2, NULL, NULL),
(1118, '2020-03-20 20:01:40', '2020-03-20 20:01:40', 'Sweden', 226, NULL, NULL),
(1119, '2020-03-20 20:01:40', '2020-03-20 20:01:40', 'Switzerland', 237, NULL, NULL),
(1120, '2020-03-20 20:01:41', '2020-03-20 20:01:41', 'Syrian Arab Republic', 228, NULL, NULL),
(1121, '2020-03-20 20:01:41', '2020-03-20 20:01:41', 'Taiwan', 258, NULL, NULL),
(1122, '2020-03-20 20:01:41', '2020-03-20 20:01:41', 'Tajikistan', 323, NULL, NULL),
(1123, '2020-03-20 20:01:41', '2020-03-20 20:01:41', 'Tanzania, United Republic of', 261, NULL, NULL),
(1124, '2020-03-20 20:01:41', '2020-03-20 20:01:41', 'Thailand', 324, NULL, NULL),
(1125, '2020-03-20 20:01:41', '2020-03-20 20:01:41', 'Timor-Leste', 231, NULL, NULL),
(1126, '2020-03-20 20:01:41', '2020-03-20 20:01:41', 'Togo', 241, NULL, NULL),
(1127, '2020-03-20 20:01:42', '2020-03-20 20:01:42', 'Tokelau', 2, NULL, NULL),
(1128, '2020-03-20 20:01:42', '2020-03-20 20:01:42', 'Tonga', 2, NULL, NULL),
(1129, '2020-03-20 20:01:42', '2020-03-20 20:01:42', 'Trinidad and Tobago', 2, NULL, NULL),
(1130, '2020-03-20 20:01:42', '2020-03-20 20:01:42', 'Tunisia', 228, NULL, NULL),
(1131, '2020-03-20 20:01:42', '2020-03-20 20:01:42', 'Turkey', 264, NULL, NULL),
(1132, '2020-03-20 20:01:42', '2020-03-20 20:01:42', 'Turkmenistan', 225, NULL, NULL),
(1133, '2020-03-20 20:01:42', '2020-03-20 20:01:42', 'Turks and Caicos Islands', 2, NULL, NULL),
(1134, '2020-03-20 20:01:43', '2020-03-20 20:01:43', 'Tuvalu', 2, NULL, NULL),
(1135, '2020-03-20 20:01:43', '2020-03-20 20:01:43', 'Uganda', 2, NULL, NULL),
(1136, '2020-03-20 20:01:43', '2020-03-20 20:01:43', 'Ukraine', 326, NULL, NULL),
(1137, '2020-03-20 20:01:43', '2020-03-20 20:01:43', 'United Arab Emirates', 228, NULL, NULL),
(1138, '2020-03-20 20:01:43', '2020-03-20 20:01:43', 'United Kingdom of Great Britain and Northern Ireland', 2, NULL, NULL),
(1139, '2020-03-20 20:01:43', '2020-03-20 20:01:43', 'United States of America', 2, NULL, NULL),
(1140, '2020-03-20 20:01:44', '2020-03-20 20:01:44', 'Uruguay', 1, NULL, NULL),
(1141, '2020-03-20 20:01:44', '2020-03-20 20:01:44', 'Uzbekistan', 224, NULL, NULL),
(1142, '2020-03-20 20:01:44', '2020-03-20 20:01:44', 'Vanuatu', 327, NULL, NULL),
(1143, '2020-03-20 20:01:44', '2020-03-20 20:01:44', 'Venezuela (Bolivarian Republic of)', 1, NULL, NULL),
(1144, '2020-03-20 20:01:44', '2020-03-20 20:01:44', 'Viet Nam', 328, NULL, NULL),
(1145, '2020-03-20 20:01:44', '2020-03-20 20:01:44', 'Wallis and Futuna', 241, NULL, NULL),
(1146, '2020-03-20 20:01:44', '2020-03-20 20:01:44', 'Western Sahara', 1, NULL, NULL),
(1147, '2020-03-20 20:01:45', '2020-03-20 20:01:45', 'Yemen', 228, NULL, NULL),
(1148, '2020-03-20 20:01:45', '2020-03-20 20:01:45', 'Zambia', 2, NULL, NULL),
(1149, '2020-03-20 20:01:45', '2020-03-20 20:01:45', 'Zimbabwe', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `created_at`, `updated_at`, `code`, `name`) VALUES
(1, '2020-03-14 15:55:36', '2020-03-14 19:09:00', 'ARS', 'Argentine Pesos'),
(2, '2020-03-14 15:55:36', '2020-03-14 18:43:15', 'USD', 'United States Dollars'),
(3, '2020-03-14 15:55:36', '2020-03-14 19:09:14', 'COP', 'Colombian Pesos'),
(4, '2020-03-14 15:55:36', '2020-03-15 23:06:27', 'MXN', 'Mexican Pesos'),
(5, '2020-03-14 17:06:21', '2020-03-14 17:06:21', 'INR', 'Indian Rupia'),
(127, '2020-03-20 20:39:00', '2020-03-20 20:39:00', 'AED', 'United Arab Emirates Dirham (AED)'),
(128, '2020-03-20 20:39:00', '2020-03-20 20:39:00', 'ALL', 'Albanian Lek (ALL)'),
(129, '2020-03-20 20:39:00', '2020-03-20 20:39:00', 'AOA', 'Angolan Kwanza (AOA)'),
(130, '2020-03-20 20:39:00', '2020-03-20 20:39:00', 'ARS', 'Argentine Peso (ARS)'),
(131, '2020-03-20 20:39:00', '2020-03-20 20:39:00', 'AUD', 'Australian Dollar (AUD)'),
(132, '2020-03-20 20:39:00', '2020-03-20 20:39:00', 'BAM', 'Bosnia-Herzegovinian Convertible Mark (B'),
(133, '2020-03-20 20:39:00', '2020-03-20 20:39:00', 'BDT', 'Bangladeshi Taka (BDT)'),
(134, '2020-03-20 20:39:00', '2020-03-20 20:39:00', 'BGN', 'Bulgarian Lev (BGN)'),
(135, '2020-03-20 20:39:00', '2020-03-20 20:39:00', 'BRL', 'Brazilian Real (BRL)'),
(136, '2020-03-20 20:39:00', '2020-03-20 20:39:00', 'CAD', 'Canadian Dollar (CAD)'),
(137, '2020-03-20 20:39:00', '2020-03-20 20:39:00', 'CHF', 'Swiss Franc (CHF)'),
(138, '2020-03-20 20:39:01', '2020-03-20 20:39:01', 'CLP', 'Chilean Peso (CLP)'),
(139, '2020-03-20 20:39:01', '2020-03-20 20:39:01', 'CNY', 'Chinese Yuan (CNY)'),
(140, '2020-03-20 20:39:01', '2020-03-20 20:39:01', 'COP', 'Colombian Peso (COP)'),
(141, '2020-03-20 20:39:01', '2020-03-20 20:39:01', 'CZK', 'Czech Koruna (CZK)'),
(142, '2020-03-20 20:39:01', '2020-03-20 20:39:01', 'DKK', 'Danish Krone (DKK)'),
(143, '2020-03-20 20:39:01', '2020-03-20 20:39:01', 'DZD', 'Algerian Dinar (DZD)'),
(144, '2020-03-20 20:39:01', '2020-03-20 20:39:01', 'EGP', 'Egyptian Pound (EGP)'),
(145, '2020-03-20 20:39:01', '2020-03-20 20:39:01', 'EUR', 'Euro (EUR)'),
(146, '2020-03-20 20:39:01', '2020-03-20 20:39:01', 'GBP', 'British Pound (GBP)'),
(147, '2020-03-20 20:39:01', '2020-03-20 20:39:01', 'GTQ', 'Guatemalan Quetzal (GTQ)'),
(148, '2020-03-20 20:39:01', '2020-03-20 20:39:01', 'HKD', 'Hong Kong Dollar (HKD)'),
(149, '2020-03-20 20:39:01', '2020-03-20 20:39:01', 'HRK', 'Croatian Kuna (HRK)'),
(150, '2020-03-20 20:39:02', '2020-03-20 20:39:02', 'HUF', 'Hungarian Forint (HUF)'),
(151, '2020-03-20 20:39:02', '2020-03-20 20:39:02', 'IDR', 'Indonesian Rupiah (IDR)'),
(152, '2020-03-20 20:39:02', '2020-03-20 20:39:02', 'ILS', 'Israeli Shekel (ILS)'),
(153, '2020-03-20 20:39:02', '2020-03-20 20:39:02', 'INR', 'Indian Rupee (INR)'),
(154, '2020-03-20 20:39:02', '2020-03-20 20:39:02', 'JMD', 'Jamaican Dollar (JMD)'),
(155, '2020-03-20 20:39:02', '2020-03-20 20:39:02', 'JPY', 'Japanese Yen (JPY)'),
(156, '2020-03-20 20:39:02', '2020-03-20 20:39:02', 'KES', 'Kenyan Shilling (KES)'),
(157, '2020-03-20 20:39:02', '2020-03-20 20:39:02', 'KRW', 'South Korean Won (KRW)'),
(158, '2020-03-20 20:39:02', '2020-03-20 20:39:02', 'KWD', 'Kuwaiti Dinar (KWD)'),
(159, '2020-03-20 20:39:02', '2020-03-20 20:39:02', 'KZT', 'Kazakhstani Tenge (KZT)'),
(160, '2020-03-20 20:39:02', '2020-03-20 20:39:02', 'MAD', 'Moroccan Dirham (MAD)'),
(161, '2020-03-20 20:39:02', '2020-03-20 20:39:02', 'MKD', 'Macedonian Denar (MKD)'),
(162, '2020-03-20 20:39:03', '2020-03-20 20:39:03', 'MXN', 'Mexican Peso (MXN)'),
(163, '2020-03-20 20:39:03', '2020-03-20 20:39:03', 'MYR', 'Malaysian Ringgit (MYR)'),
(164, '2020-03-20 20:39:03', '2020-03-20 20:39:03', 'NGN', 'Nigerian Naira (NGN)'),
(165, '2020-03-20 20:39:03', '2020-03-20 20:39:03', 'NOK', 'Norwegian Krone (NOK)'),
(166, '2020-03-20 20:39:03', '2020-03-20 20:39:03', 'NZD', 'New Zealand Dollar (NZD)'),
(167, '2020-03-20 20:39:03', '2020-03-20 20:39:03', 'PEN', 'Peruvian Sol (PEN)'),
(168, '2020-03-20 20:39:03', '2020-03-20 20:39:03', 'PHP', 'Philippines Peso (PHP)'),
(169, '2020-03-20 20:39:03', '2020-03-20 20:39:03', 'PKR', 'Pakistani Rupee (PKR)'),
(170, '2020-03-20 20:39:03', '2020-03-20 20:39:03', 'PLN', 'Polish Złoty (PLN)'),
(171, '2020-03-20 20:39:03', '2020-03-20 20:39:03', 'QAR', 'Qatari Riyal (QAR)'),
(172, '2020-03-20 20:39:03', '2020-03-20 20:39:03', 'RON', 'Romanian Leu (RON)'),
(173, '2020-03-20 20:39:03', '2020-03-20 20:39:03', 'RSD', 'Serbian Dinar (RSD)'),
(174, '2020-03-20 20:39:03', '2020-03-20 20:39:03', 'RUB', 'Russian Ruble (RUB)'),
(175, '2020-03-20 20:39:04', '2020-03-20 20:39:04', 'SAR', 'Saudi Riyal (SAR)'),
(176, '2020-03-20 20:39:04', '2020-03-20 20:39:04', 'SEK', 'Swedish Krona (SEK)'),
(177, '2020-03-20 20:39:04', '2020-03-20 20:39:04', 'SGD', 'Singapore Dollar (SGD)'),
(178, '2020-03-20 20:39:04', '2020-03-20 20:39:04', 'THB', 'Thailand Baht (THB)'),
(179, '2020-03-20 20:39:04', '2020-03-20 20:39:04', 'TND', 'Tunisian Dinar (TND)'),
(180, '2020-03-20 20:39:04', '2020-03-20 20:39:04', 'TRY', 'Turkish Lira (TRY)'),
(181, '2020-03-20 20:39:04', '2020-03-20 20:39:04', 'TWD', 'Taiwan Dollar (TWD)'),
(182, '2020-03-20 20:39:04', '2020-03-20 20:39:04', 'UAH', 'Ukrainian Hryvnia (UAH)'),
(183, '2020-03-20 20:39:04', '2020-03-20 20:39:04', 'USD', 'United States Dollar (USD)'),
(184, '2020-03-20 20:39:04', '2020-03-20 20:39:04', 'UYU', 'Uruguayan Peso (UYU)'),
(185, '2020-03-20 20:39:04', '2020-03-20 20:39:04', 'VND', 'Vietnamese Dong (VND)'),
(186, '2020-03-20 20:39:04', '2020-03-20 20:39:04', 'ZAR', 'South African Rand (ZAR)');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number1` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number2` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number3` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swiftcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aba` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `industry_id` int(10) UNSIGNED DEFAULT NULL,
  `logo_path` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `created_at`, `updated_at`, `company_id`, `name`, `address`, `city_id`, `email`, `phone`, `billing_name`, `billing_address`, `tax_number1`, `tax_number2`, `tax_number3`, `bank_name`, `account_number`, `swiftcode`, `aba`, `currency_id`, `industry_id`, `logo_path`) VALUES
(2, '2020-03-26 18:12:20', '2020-04-03 23:17:53', 1, 'FlexDevice', 'Martin\'s Street 323 80 Floor', 7, 'contact@flexdevice.com', '2342342', 'FlexDevice Inc.', 'Martin\'s Street 323 80 Floor', '123-4331-12311', NULL, NULL, 'City Bank', '090-002-087', 'FDV12345678', '123456789', 2, 10, NULL),
(3, '2020-09-10 21:08:12', '2020-09-10 21:08:12', 1, 'TaskControl LLC', 'Juramento 4630 PB 2', 2, 'admin@taskcontrol.com', '2915049524', 'TaskControl LLC', 'Juramento 4630 PB 2', '989898797', NULL, NULL, 'BBVA', '123123', '123123', '123123', 1, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `office_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `created_at`, `updated_at`, `office_id`, `title`) VALUES
(1, '2020-03-14 20:44:27', '2020-09-02 15:49:25', 2, 'Development (DEV)'),
(2, '2020-03-14 20:45:31', '2020-03-20 16:02:47', 2, 'Development (DEV)'),
(3, '2020-03-14 20:45:58', '2020-03-20 16:02:59', 3, 'Support & Research (S&R)'),
(4, '2020-03-14 20:46:26', '2020-03-20 16:03:14', 5, 'Engineering (ENG)'),
(5, '2020-03-14 20:46:57', '2020-03-20 16:03:26', 4, 'Customer Delivery Management (CDM)'),
(6, '2020-03-19 12:39:22', '2020-03-20 16:03:38', 7, 'Quality Assurance (QA)'),
(7, '2020-03-22 14:26:02', '2020-03-22 14:26:23', 1, 'Customer Sales  (BS.AS.)');

-- --------------------------------------------------------

--
-- Table structure for table `directories`
--

CREATE TABLE `directories` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `borrado_logico` tinyint(1) NOT NULL,
  `parent` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `directories`
--

INSERT INTO `directories` (`id`, `nombre`, `path`, `borrado_logico`, `parent`) VALUES
(1, 'Initial', 'initiating', 0, NULL),
(2, 'Planning', 'planning', 0, NULL),
(3, 'Executing', 'executing', 0, NULL),
(4, 'Monitoring & Control', 'monitoring', 0, NULL),
(5, 'Closing', 'closing', 0, NULL),
(6, 'Plans', 'plans', 0, 1),
(7, 'Minutes', 'minutes', 0, 1),
(8, 'Mails', 'mails', 0, 1),
(9, 'Reports', 'reports', 0, 1),
(10, 'Others', 'others', 0, 1),
(11, 'Archives', 'archives', 0, 1),
(12, 'Public', 'public', 0, 1),
(13, 'Plans', 'plans', 0, 2),
(14, 'Legal', 'legal', 0, 2),
(15, 'Reports', 'reports', 0, 2),
(16, 'Mails', 'mails', 0, 2),
(17, 'Others', 'others', 0, 2),
(18, 'Archives', 'archives', 0, 2),
(19, 'Public', 'public', 0, 2),
(20, 'Minutes', 'minutes', 0, 3),
(21, 'Reports', 'reports', 0, 3),
(22, 'Mails', 'mails', 0, 3),
(23, 'Billing', 'billing', 0, 3),
(24, 'Others', 'others', 0, 3),
(25, 'Archives', 'archives', 0, 3),
(26, 'Public', 'public', 0, 3),
(27, 'Plans', 'plans', 0, 49),
(28, 'Legal', 'legal', 0, 49),
(29, 'Minutes', 'minutes', 0, 49),
(30, 'Mails', 'mails', 0, 49),
(31, 'Reports', 'reports', 0, 49),
(32, 'Others', 'others', 0, 49),
(33, 'Archives', 'archives', 0, 49),
(34, 'Public', 'public', 0, 49),
(35, 'Minutes', 'minutes', 0, 50),
(36, 'Reports', 'reports', 0, 50),
(37, 'Metrics', 'metrics', 0, 50),
(38, 'Mails', 'mails', 0, 50),
(39, 'Others', 'others', 0, 50),
(40, 'Archives', 'archives', 0, 50),
(41, 'Public', 'public', 0, 50),
(42, 'Reports', 'reports', 0, 51),
(43, 'Metrics', 'metrics', 0, 51),
(44, 'Mails', 'metrics', 0, 51),
(45, 'Others', 'others', 0, 51),
(46, 'Archives', 'archives', 0, 51),
(47, 'Public', 'public', 0, 51),
(48, 'Quality management', 'quality_management', 0, 4),
(49, 'Scope management', 'scope_management', 0, 4),
(50, 'Time management', 'time_management', 0, 4),
(51, 'Financial management', 'financial_management', 0, 4),
(52, 'Reports', 'reports', 0, 48),
(53, 'Metrics', 'metrics', 0, 48),
(54, 'Mails', 'metrics', 0, 48),
(55, 'Others', 'others', 0, 48),
(56, 'Archives', 'archives', 0, 48),
(57, 'Public', 'public', 0, 48),
(58, 'Human resources management', 'human_resources_management', 0, 4),
(59, 'Reports', 'reports', 0, 58),
(60, 'Metrics', 'metrics', 0, 58),
(61, 'Mails', 'metrics', 0, 58),
(62, 'Others', 'others', 0, 58),
(63, 'Archives', 'archives', 0, 58),
(64, 'Public', 'public', 0, 58),
(65, 'Comunications management', 'comunications_management', 0, 4),
(66, 'Plans', 'plans', 0, 65),
(67, 'Minutes', 'minutes', 0, 65),
(68, 'Mails', 'mails', 0, 65),
(69, 'Reports', 'reports', 0, 65),
(70, 'Others', 'others', 0, 65),
(71, 'Archives', 'archives', 0, 65),
(72, 'Public', 'public', 0, 65),
(73, 'Stakeholder management', 'stakeholder_management', 0, 4),
(74, 'Plans', 'plans', 0, 73),
(75, 'Legal', 'legal', 0, 73),
(76, 'Reports', 'reports', 0, 73),
(77, 'Mails', 'mails', 0, 73),
(78, 'Metrics', 'metrics', 0, 73),
(79, 'Others', 'others', 0, 73),
(80, 'Archives', 'archives', 0, 73),
(81, 'Public', 'public', 0, 73),
(82, 'Risk management', 'risk_management', 0, 4),
(83, 'Reports', 'reports', 0, 82),
(84, 'Metrics', 'metrics', 0, 82),
(85, 'Mails', 'mails', 0, 82),
(86, 'Others', 'others', 0, 82),
(87, 'Archives', 'archives', 0, 82),
(88, 'Public', 'public', 0, 82),
(89, 'Procurement management', 'stakeholder_management', 0, 4),
(90, 'Plans', 'plans', 0, 89),
(91, 'Legal', 'legal', 0, 89),
(92, 'Reports', 'reports', 0, 89),
(93, 'Mails', 'mails', 0, 89),
(94, 'Metrics', 'metrics', 0, 89),
(95, 'Others', 'others', 0, 89),
(96, 'Archives', 'archives', 0, 89),
(97, 'Public', 'public', 0, 89),
(98, 'Plans', 'plans', 0, 5),
(99, 'Reports', 'reports', 0, 5),
(100, 'Mails', 'mails', 0, 5),
(101, 'Others', 'others', 0, 5),
(102, 'Archives', 'archives', 0, 5),
(103, 'Public', 'public', 0, 5),
(104, 'Initiation', 'initiation', 0, NULL),
(105, 'Plans', 'plans', 0, 104),
(106, 'Mails', 'mails', 0, 104),
(107, 'Reports', 'reports', 0, 104),
(108, 'Others', 'others', 0, 104),
(109, 'Archives', 'archives', 0, 104),
(110, 'Public', 'public', 0, 104),
(111, 'Requirements', 'requirements', 0, NULL),
(112, 'Reports', 'reports', 0, 111),
(113, 'Mails', 'mails', 0, 111),
(114, 'Others', 'others', 0, 111),
(115, 'Archives', 'archives', 0, 111),
(116, 'Public', 'public', 0, 111),
(117, 'Design', 'design', 0, NULL),
(118, 'Reports', 'reports', 0, 117),
(119, 'Mails', 'mails', 0, 117),
(120, 'Others', 'others', 0, 117),
(121, 'Archives', 'archives', 0, 117),
(122, 'Public', 'public', 0, 117),
(123, 'Builds', 'builds', 0, NULL),
(124, 'Reports', 'reports', 0, 123),
(125, 'Mails', 'mails', 0, 123),
(126, 'Others', 'others', 0, 123),
(127, 'Archives', 'archives', 0, 123),
(128, 'Public', 'public', 0, 123),
(129, 'Testing', 'testing', 0, NULL),
(130, 'Reports', 'reports', 0, 129),
(131, 'Mails', 'mails', 0, 129),
(132, 'Others', 'others', 0, 129),
(133, 'Archives', 'archives', 0, 129),
(134, 'Public', 'public', 0, 129),
(135, 'Implementation', 'testing', 0, NULL),
(136, 'Reports', 'reports', 0, 135),
(137, 'Mails', 'mails', 0, 135),
(138, 'Others', 'others', 0, 135),
(139, 'Archives', 'archives', 0, 135),
(140, 'Public', 'public', 0, 135);

-- --------------------------------------------------------

--
-- Table structure for table `directory_role`
--

CREATE TABLE `directory_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `directory_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `read` tinyint(1) NOT NULL,
  `write` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `directory_role`
--

INSERT INTO `directory_role` (`id`, `created_at`, `updated_at`, `directory_id`, `role_id`, `read`, `write`) VALUES
(1, '2020-03-15 20:17:21', '2020-03-15 20:19:37', 6, 4, 1, 1),
(2, '2020-03-15 20:19:37', '2020-03-15 20:19:38', 7, 4, 1, 1),
(3, '2020-03-15 20:19:39', '2020-03-15 20:19:39', 8, 4, 1, 1),
(4, '2020-03-15 20:19:40', '2020-04-06 17:53:20', 1, 4, 1, 1),
(5, '2020-03-15 20:19:49', '2020-03-15 20:19:49', 49, 4, 1, 1),
(6, '2020-03-15 20:19:56', '2020-03-15 20:19:57', 27, 4, 1, 1),
(7, '2020-03-15 20:19:58', '2020-03-15 20:19:59', 28, 4, 1, 1),
(8, '2020-03-15 20:20:00', '2020-03-15 20:20:01', 29, 4, 1, 1),
(9, '2020-03-15 20:20:01', '2020-03-15 20:20:02', 30, 4, 1, 1),
(10, '2020-03-15 20:20:03', '2020-03-15 20:20:03', 31, 4, 1, 1),
(11, '2020-03-15 20:20:04', '2020-03-15 20:20:05', 32, 4, 1, 1),
(12, '2020-03-15 20:20:06', '2020-03-15 20:20:10', 33, 4, 1, 1),
(13, '2020-03-15 20:20:07', '2020-03-15 20:20:13', 34, 4, 1, 1),
(14, '2020-03-15 20:20:22', '2020-03-15 20:20:23', 9, 4, 1, 1),
(15, '2020-03-15 20:20:24', '2020-03-15 20:20:25', 10, 4, 1, 1),
(16, '2020-03-15 20:20:27', '2020-03-15 20:20:28', 11, 4, 1, 1),
(17, '2020-03-15 20:20:29', '2020-03-15 20:20:30', 12, 4, 1, 1),
(18, '2020-03-15 20:21:32', '2020-03-15 20:21:32', 12, 8, 1, 1),
(19, '2020-03-15 20:21:34', '2020-03-15 20:21:39', 19, 8, 1, 1),
(20, '2020-03-15 20:21:45', '2020-03-15 20:21:46', 26, 8, 1, 1),
(21, '2020-03-15 20:21:48', '2020-03-15 20:21:49', 34, 8, 1, 1),
(22, '2020-03-15 20:21:51', '2020-03-15 20:21:52', 57, 8, 1, 1),
(23, '2020-03-15 20:21:56', '2020-03-15 20:21:57', 41, 8, 1, 1),
(24, '2020-03-15 20:21:58', '2020-03-15 20:21:59', 47, 8, 1, 1),
(25, '2020-03-15 20:22:17', '2020-03-15 20:22:18', 64, 8, 1, 1),
(26, '2020-03-15 20:22:21', '2020-03-15 20:22:22', 72, 8, 1, 1),
(27, '2020-03-15 20:22:25', '2020-03-15 20:22:26', 81, 8, 1, 1),
(28, '2020-03-15 20:22:27', '2020-03-15 20:22:28', 88, 8, 1, 1),
(29, '2020-03-15 20:22:32', '2020-03-15 20:22:33', 97, 8, 1, 1),
(30, '2020-03-15 20:22:38', '2020-03-15 20:22:38', 103, 8, 1, 1),
(31, '2020-03-15 20:22:39', '2020-03-15 20:22:40', 110, 8, 1, 1),
(32, '2020-03-15 20:22:43', '2020-03-15 20:22:44', 116, 8, 1, 1),
(33, '2020-03-15 20:22:46', '2020-03-15 20:22:47', 122, 8, 1, 1),
(34, '2020-03-15 20:22:51', '2020-03-15 20:22:51', 128, 8, 1, 1),
(35, '2020-03-15 20:22:54', '2020-03-15 20:22:54', 134, 8, 1, 1),
(36, '2020-03-15 20:22:58', '2020-03-15 20:22:59', 140, 8, 1, 1),
(37, '2020-03-20 16:12:17', '2020-03-20 16:12:18', 1, 7, 1, 1),
(38, '2020-03-20 16:12:20', '2020-03-20 16:12:20', 6, 7, 1, 1),
(39, '2020-03-20 16:12:22', '2020-03-20 16:12:29', 12, 7, 1, 1),
(40, '2020-04-05 20:29:38', '2020-04-05 20:29:38', 5, 7, 1, 1),
(41, '2020-04-05 20:29:41', '2020-04-05 20:29:44', 98, 7, 0, 0),
(42, '2020-08-30 17:58:38', '2020-08-30 17:58:38', 2, 7, 1, 0),
(43, '2020-08-30 17:58:47', '2020-08-30 17:59:06', 13, 7, 1, 1),
(44, '2020-08-30 17:59:22', '2020-08-30 17:59:22', 14, 7, 1, 0),
(45, '2020-08-30 17:59:29', '2020-08-30 17:59:37', 19, 7, 1, 0),
(46, '2020-08-30 18:01:07', '2020-08-30 18:01:07', 1, 5, 1, 0),
(47, '2020-09-13 15:17:57', '2020-09-13 15:18:01', 21, 5, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(18,2) NOT NULL,
  `percentage` double(18,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `created_at`, `updated_at`, `company_id`, `detail`, `amount`, `percentage`, `currency_id`) VALUES
(1, '2020-03-14 21:25:40', '2020-03-14 21:25:40', 1, 'One-Time Discount', 0.00, 10.00, 2),
(2, '2020-03-14 21:25:58', '2020-03-14 21:25:58', 1, 'Others Discounts', 50.00, 0.00, 2),
(3, '2020-03-14 21:26:26', '2020-03-14 21:26:57', 1, 'Previous Period Discount', 10.00, 0.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `doctypes`
--

CREATE TABLE `doctypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type_desc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `directory_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_category_id` int(10) UNSIGNED NOT NULL,
  `added_by` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `created_at`, `updated_at`, `title`, `subject`, `body`, `email_category_id`, `added_by`) VALUES
(33, '2020-03-26 22:57:39', '2020-03-26 22:57:39', 'Billing Approval', 'Billing For the Last Period', 'Dear Customer: We are sending the billing information for your approval....', 43, 'reload'),
(34, '2020-03-26 22:57:39', '2020-03-26 22:57:39', 'RFP', 'New Request For Proposal', 'Dear Provider: We are sending below the new RFP for the service/product a,b & c based on our conversations...', 42, 'reload'),
(35, '2020-03-26 22:57:39', '2020-03-26 22:57:39', 'Quotation', 'Your Request Quotation For ....', 'Dear Customer: We are sending this quotation based on our last conversation...', 47, 'reload'),
(36, '2020-03-26 22:57:39', '2020-03-26 22:57:39', 'Status Report', 'Status Report for the Sprint #', 'Dear Customer: In atach the status report from Sprint # ....', 50, 'reload'),
(37, '2020-03-26 22:57:39', '2020-03-26 22:57:39', 'Team Survey', 'Team Survey for the Project', 'Dear Customer: We are sending this team survey as of Jan-2020. Please Kindly completed before .....Thanks in Advance,', 50, 'reload'),
(38, '2020-03-26 22:57:39', '2020-03-26 22:57:39', 'Communication Plan', 'Communication Plan for the Project', 'Dear Customer: In Atach the communication plan for the project xxxx. Please kindly check it and send us your confirmation. Thanks in Advance,', 48, 'reload'),
(40, '2020-04-04 14:05:55', '2020-09-04 18:54:59', 'New Email Template Category 2', 'For this new template category  2', 'Email body For Category 2 Bye!', 53, 'form'),
(41, '2020-04-04 14:07:19', '2020-04-04 14:07:19', 'Expectations Survey', 'Expectations Survey', 'Please kindly fill the survey as per the instructions in attach. Thanks', 44, 'form'),
(42, '2020-04-04 14:09:12', '2020-04-04 14:09:12', 'Roadmap', 'Roadmap', 'Hi!, this is the latest roadmap that we agree in the last tuesday meeting. Kindly check & revert. Thanks in Advance.', 45, 'form'),
(44, '2020-04-04 14:10:36', '2020-09-04 19:06:38', 'Planning for the next Sprint', 'Planning for the next Sprint', 'Hi: We are sending the planning for the next sprint in attach. Please kindly check & revert so we can proceed to execution. Thanks in Advance.', 49, 'form'),
(45, '2020-04-04 14:12:01', '2020-04-04 14:12:01', 'Lesson Learned', 'Lesson Learned Form', 'Hi: In attach you can find the lesson learned form. Please kindly fill-in and send back to us ASAP. Thanks in Advance.', 51, 'form'),
(46, '2020-04-04 14:14:42', '2020-04-04 14:14:42', 'Training in USA', 'Training in USA', 'Hi Al: In attach I\'m sending the training schedule in USA for 30-31 March, 2020. Please kindly confirm your assistance answering to this email. Thanks!', 46, 'form'),
(47, '2020-09-04 19:08:31', '2020-09-04 19:08:31', 'Templates for Email Category 1', 'For this new template category  1', 'This is the Email Body for Email Category # 1', 52, 'form');

-- --------------------------------------------------------

--
-- Table structure for table `email_categories`
--

CREATE TABLE `email_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `added_by` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_categories`
--

INSERT INTO `email_categories` (`id`, `created_at`, `updated_at`, `title`, `company_id`, `added_by`) VALUES
(42, '2020-03-26 20:08:38', '2020-03-26 20:08:38', 'Providers', 1, 'reload'),
(43, '2020-03-26 20:08:38', '2020-03-26 20:08:38', 'Customers', 1, 'reload'),
(44, '2020-03-26 20:08:38', '2020-03-26 20:08:38', 'Team', 1, 'reload'),
(45, '2020-03-26 20:08:38', '2020-03-26 20:08:38', 'Stakeholders', 1, 'reload'),
(46, '2020-03-26 20:08:38', '2020-03-26 20:08:38', 'Others', 1, 'reload'),
(47, '2020-03-26 20:08:38', '2020-03-26 20:08:38', 'Initiating', 1, 'reload'),
(48, '2020-03-26 20:08:38', '2020-03-26 20:08:38', 'Planning', 1, 'reload'),
(49, '2020-03-26 20:08:38', '2020-03-26 20:08:38', 'Executing', 1, 'reload'),
(50, '2020-03-26 20:08:38', '2020-03-26 20:08:38', 'Monitoring & Control', 1, 'reload'),
(51, '2020-03-26 20:08:38', '2020-03-26 20:08:38', 'Closing', 1, 'reload'),
(52, '2020-04-04 14:05:13', '2020-09-04 18:51:15', 'New Email Template Category1', 1, NULL),
(53, '2020-09-04 18:52:01', '2020-09-04 18:52:01', 'Categoria 2', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_category_templates`
--

CREATE TABLE `email_category_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_category_templates`
--

INSERT INTO `email_category_templates` (`id`, `created_at`, `updated_at`, `title`) VALUES
(1, '2020-03-14 16:04:58', '2020-03-14 16:04:58', 'Providers'),
(2, '2020-03-14 16:04:58', '2020-03-14 16:04:58', 'Customers'),
(3, '2020-03-14 16:04:58', '2020-03-14 16:04:58', 'Team'),
(4, '2020-03-14 16:04:58', '2020-03-14 16:04:58', 'Stakeholders'),
(5, '2020-03-14 16:04:58', '2020-03-14 16:04:58', 'Others'),
(6, '2020-03-14 16:04:58', '2020-03-14 16:04:58', 'Initiating'),
(7, '2020-03-14 16:04:58', '2020-03-14 16:04:58', 'Planning'),
(8, '2020-03-14 16:04:58', '2020-03-14 16:04:58', 'Executing'),
(9, '2020-03-14 16:04:58', '2020-03-14 16:04:58', 'Monitoring & Control'),
(10, '2020-03-14 16:04:58', '2020-09-02 13:48:46', 'Closing');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_category_template_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `created_at`, `updated_at`, `title`, `subject`, `body`, `email_category_template_id`) VALUES
(1, '2020-03-14 18:53:42', '2020-03-14 18:57:57', 'Billing Approval', 'Billing For the Last Period', 'Dear Customer: We are sending the billing information for your approval....', 2),
(2, '2020-03-14 18:55:16', '2020-03-14 18:57:33', 'RFP', 'New Request For Proposal', 'Dear Provider: We are sending below the new RFP for the service/product a,b & c based on our conversations...', 1),
(3, '2020-03-14 19:02:12', '2020-03-14 19:02:12', 'Quotation', 'Your Request Quotation For ....', 'Dear Customer: We are sending this quotation based on our last conversation...', 6),
(4, '2020-03-14 19:03:27', '2020-03-14 19:07:07', 'Status Report', 'Status Report for the Sprint #', 'Dear Customer: In atach the status report from Sprint # ....', 9),
(5, '2020-03-14 19:05:04', '2020-03-14 19:07:16', 'Team Survey', 'Team Survey for the Project', 'Dear Customer: We are sending this team survey as of Jan-2020. Please Kindly completed before .....Thanks in Advance,', 9),
(6, '2020-03-14 19:06:38', '2020-03-14 19:07:31', 'Communication Plan', 'Communication Plan for the Project', 'Dear Customer: In Atach the communication plan for the project xxxx. Please kindly check it and send us your confirmation. Thanks in Advance,', 7),
(7, '2020-03-20 13:44:41', '2020-09-02 13:55:06', 'Este es un email template de prueba soy rockknnnnn', 'New Planning', 'Dear Customer: In attach the new planning, we already checked in the last meeting as of xx-xx-xx.\r\nPlease kindly check & revert to us.\r\nThanks in Advance,\r\nxxxxxx', 7);

-- --------------------------------------------------------

--
-- Table structure for table `engagements`
--

CREATE TABLE `engagements` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `engagements`
--

INSERT INTO `engagements` (`id`, `created_at`, `updated_at`, `name`) VALUES
(1, '2020-03-26 20:39:00', '2020-03-26 20:39:00', 'Time & Material'),
(2, '2020-03-26 20:39:00', '2020-03-26 20:39:00', 'Fixed Price'),
(3, '2020-03-26 20:39:00', '2020-03-26 20:39:00', 'Incentive'),
(4, '2020-03-26 20:39:00', '2020-03-26 20:39:00', 'Unit Price'),
(5, '2020-03-26 20:39:00', '2020-03-26 20:39:00', 'Cost Plus'),
(6, '2020-03-26 20:39:00', '2020-03-26 20:39:00', 'Percentage of Construction Fee'),
(7, '2020-03-26 20:39:00', '2020-03-26 20:39:00', 'Staff Augmentation');

-- --------------------------------------------------------

--
-- Table structure for table `exchange_rates`
--

CREATE TABLE `exchange_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `value` double(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exchange_rates`
--

INSERT INTO `exchange_rates` (`id`, `created_at`, `updated_at`, `currency_id`, `company_id`, `value`) VALUES
(1, '2020-03-14 20:56:31', '2020-04-04 14:00:22', 130, 1, 20.19),
(2, '2020-03-14 20:56:45', '2020-04-04 13:59:52', 140, 1, 2794.12),
(3, '2020-03-14 20:56:58', '2020-04-04 13:59:37', 162, 1, 18.27),
(4, '2020-03-14 20:57:16', '2020-04-04 13:57:51', 153, 1, 65.08),
(5, '2020-09-02 17:09:30', '2020-09-02 17:09:30', 2, 1, 1.00);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reimbursable` tinyint(4) NOT NULL,
  `detail` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(18,2) NOT NULL,
  `cost` double(18,2) DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `cost_currency_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `created_at`, `updated_at`, `reimbursable`, `detail`, `amount`, `cost`, `company_id`, `cost_currency_id`, `currency_id`) VALUES
(1, '2020-03-14 21:20:42', '2020-03-14 21:20:42', 1, 'Passport', 150.00, 150.00, 1, 2, 2),
(2, '2020-03-14 21:21:05', '2020-03-14 21:21:05', 1, 'Hotel', 100.00, 100.00, 1, 2, 2),
(3, '2020-03-14 21:21:41', '2020-03-14 21:23:37', 1, 'Taxis', 100.00, 100.00, 1, 2, 2),
(4, '2020-03-14 21:22:16', '2020-03-14 21:22:16', 1, 'Food & Drink', 50.00, 50.00, 1, 2, 2),
(5, '2020-03-14 21:23:02', '2020-03-14 21:23:02', 1, 'Visa', 40.00, 40.00, 1, 2, 2),
(6, '2020-03-14 21:24:00', '2020-03-14 21:24:00', 1, 'Others', 30.00, 30.00, 1, 2, 2),
(7, '2020-03-14 21:24:49', '2020-03-14 21:24:49', 1, 'Intercity Travel (India)', 800.00, 800.00, 1, 5, 5),
(8, '2020-08-30 18:13:11', '2020-08-30 18:13:11', 1, 'Passport', 600.00, 600.00, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `created_at`, `updated_at`, `title`, `url`, `user_id`, `order`) VALUES
(1, '2020-03-22 13:34:33', '2020-03-22 13:34:33', 'Agenda', 'agendas', 554, 0);

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date` date NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `added_by` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `created_at`, `updated_at`, `date`, `description`, `country_id`, `company_id`, `added_by`) VALUES
(298, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-01-01', 'New Year', 1, 1, 'reload'),
(299, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-02-12', 'Carnival', 1, 1, 'reload'),
(300, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-02-13', 'Carnival', 1, 1, 'reload'),
(301, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-03-29', 'Maundy Day', 1, 1, 'reload'),
(302, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-03-30', 'Good Friday', 1, 1, 'reload'),
(303, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-04-02', 'Veteran\'s Day', 1, 1, 'reload'),
(304, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-04-30', 'Bridge Holiday Before Labour Day', 1, 1, 'reload'),
(305, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-05-01', 'Labour Day', 1, 1, 'reload'),
(306, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-05-25', 'May Day Revolution', 1, 1, 'reload'),
(307, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-06-20', 'National Flag Day', 1, 1, 'reload'),
(308, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-07-09', 'Día de la Independencia.', 1, 1, 'reload'),
(309, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-08-20', 'Paso a la Inmortalidad del Gral. José de San Martín (17/8).', 1, 1, 'reload'),
(310, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-10-15', 'Día del Respeto a la Diversidad Cultural', 1, 1, 'reload'),
(311, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-11-19', 'Día de la Soberanía Nacional (20/11)', 1, 1, 'reload'),
(312, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-12-24', 'Día no laboral con fines turísticos.', 1, 1, 'reload'),
(313, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-12-31', 'Día no laboral con fines turísticos.', 1, 1, 'reload'),
(314, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-12-25', 'Navidad.', 1, 1, 'reload'),
(315, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-01-01', 'Confraternização Universal', 4, 1, 'reload'),
(316, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-04-21', 'Tiradentes', 4, 1, 'reload'),
(317, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-05-31', 'Corpus Christi', 4, 1, 'reload'),
(318, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-10-12', 'Nossa Senhora Aparecida', 4, 1, 'reload'),
(319, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-03-30', 'Sexta-feira da Paixão', 4, 1, 'reload'),
(320, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-05-01', 'Dia do Trabalhador', 4, 1, 'reload'),
(321, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-09-07', 'Dia da Independência do Brasil', 4, 1, 'reload'),
(322, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-11-02', 'Finados', 4, 1, 'reload'),
(323, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-11-15', 'Proclamação da República', 4, 1, 'reload'),
(324, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-12-25', 'Natal', 4, 1, 'reload'),
(325, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-01-01', 'New Year\'s Day 2020', 2, 1, 'reload'),
(326, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-01-15', 'Martin Luther King', 2, 1, 'reload'),
(327, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-02-19', 'President\'s Day', 2, 1, 'reload'),
(328, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-04-16', 'Emancipation Day', 2, 1, 'reload'),
(329, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-05-28', 'Memorial Day', 2, 1, 'reload'),
(330, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-07-04', 'Independence Day', 2, 1, 'reload'),
(331, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-09-03', 'Labor Day', 2, 1, 'reload'),
(332, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-10-08', 'Columbus Day', 2, 1, 'reload'),
(333, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-11-12', 'Veteran\'s Day', 2, 1, 'reload'),
(334, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-11-22', 'Thanksgiving', 2, 1, 'reload'),
(335, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-12-25', 'Christmas Day', 2, 1, 'reload'),
(336, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-01-01', 'New Year\'s Day', 5, 1, 'reload'),
(337, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-01-26', 'Republic Day', 5, 1, 'reload'),
(338, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-02-14', 'Maha Shivaratri', 5, 1, 'reload'),
(339, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-03-02', 'Holi', 5, 1, 'reload'),
(340, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-03-29', 'Mahavir Jayanti', 5, 1, 'reload'),
(341, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-03-30', 'Good Friday', 5, 1, 'reload'),
(342, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-04-30', 'Budhha Purnima', 5, 1, 'reload'),
(343, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-05-01', 'Labor Day', 5, 1, 'reload'),
(344, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-08-15', 'Independence Day', 5, 1, 'reload'),
(345, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-08-22', 'Bakri Id / Eid ul-Adha', 5, 1, 'reload'),
(346, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-09-03', 'Janmashtami', 5, 1, 'reload'),
(347, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-09-13', 'Vinayaka Chaturthi', 5, 1, 'reload'),
(348, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-09-21', 'Muharram', 5, 1, 'reload'),
(349, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-10-02', 'Mathatma Gandhi Jayanti', 5, 1, 'reload'),
(350, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-10-19', 'Dussehra / Dasara', 5, 1, 'reload'),
(351, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-11-07', 'Diwali / Deepavali', 5, 1, 'reload'),
(352, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-11-21', 'Milad un Nabi', 5, 1, 'reload'),
(353, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-11-23', 'Guru Nanak\'s Birthday', 5, 1, 'reload'),
(354, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-12-25', 'Christmas', 5, 1, 'reload'),
(355, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-01-01', 'New Year', 3, 1, 'reload'),
(356, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-01-08', 'Ephifany (Observed)', 3, 1, 'reload'),
(357, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-03-19', 'Saint Joseph Day', 3, 1, 'reload'),
(358, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-03-29', 'Maundy Thursday', 3, 1, 'reload'),
(359, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-03-30', 'Good Friday', 3, 1, 'reload'),
(360, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-05-01', 'Labour Day', 3, 1, 'reload'),
(361, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-05-14', 'Ascension Day (Observed)', 3, 1, 'reload'),
(362, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-06-04', 'Chorpus Christi', 3, 1, 'reload'),
(363, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-06-11', 'Sacred Heart', 3, 1, 'reload'),
(364, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-07-02', 'Saint Peter & Saint Paul Day', 3, 1, 'reload'),
(365, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-07-20', 'Declaration of Independence', 3, 1, 'reload'),
(366, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-08-07', 'Batalla de Boyaca', 3, 1, 'reload'),
(367, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-08-20', 'Assumption Day', 3, 1, 'reload'),
(368, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-10-15', 'Columbus Day', 3, 1, 'reload'),
(369, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-11-05', 'All Saints Day', 3, 1, 'reload'),
(370, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-11-11', 'Cartagena Independence', 3, 1, 'reload'),
(371, '2020-03-19 12:40:23', '2020-03-19 12:40:23', '2020-12-25', 'Christmas Day', 3, 1, 'reload'),
(372, '2020-03-19 17:03:12', '2020-03-19 17:03:12', '2020-03-06', 'test giusepe', 2, 1, 'form');

-- --------------------------------------------------------

--
-- Table structure for table `holidays_templates`
--

CREATE TABLE `holidays_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date` date NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `holidays_templates`
--

INSERT INTO `holidays_templates` (`id`, `created_at`, `updated_at`, `date`, `description`, `country_id`) VALUES
(6, '2020-03-14 15:55:36', '2020-03-20 13:27:15', '2020-01-01', 'New Year', 1),
(7, '2020-03-14 17:21:26', '2020-03-14 19:09:57', '2020-02-12', 'Carnival', 1),
(8, '2020-03-14 17:21:55', '2020-03-14 19:10:09', '2020-02-13', 'Carnival', 1),
(10, '2020-03-14 17:25:27', '2020-03-14 19:12:13', '2020-03-29', 'Maundy Day', 1),
(11, '2020-03-14 17:26:28', '2020-03-14 19:12:29', '2020-03-30', 'Good Friday', 1),
(12, '2020-03-14 17:27:18', '2020-03-14 19:13:41', '2020-04-02', 'Veteran\'s Day', 1),
(13, '2020-03-14 17:27:52', '2020-03-14 19:14:26', '2020-04-30', 'Bridge Holiday Before Labour Day', 1),
(14, '2020-03-14 17:28:49', '2020-03-14 19:14:39', '2020-05-01', 'Labour Day', 1),
(15, '2020-03-14 17:29:15', '2020-03-14 19:15:00', '2020-05-25', 'May Day Revolution', 1),
(16, '2020-03-14 17:29:47', '2020-03-18 00:11:33', '2020-06-20', 'National Flag Day', 1),
(17, '2020-03-14 17:30:16', '2020-03-14 17:30:16', '2020-07-09', 'Día de la Independencia.', 1),
(18, '2020-03-14 17:30:50', '2020-03-14 17:30:50', '2020-08-20', 'Paso a la Inmortalidad del Gral. José de San Martín (17/8).', 1),
(19, '2020-03-14 17:32:24', '2020-03-14 17:32:24', '2020-10-15', 'Día del Respeto a la Diversidad Cultural', 1),
(20, '2020-03-14 17:32:52', '2020-03-14 17:32:52', '2020-11-19', 'Día de la Soberanía Nacional (20/11)', 1),
(21, '2020-03-14 17:33:42', '2020-03-14 17:33:42', '2020-12-24', 'Día no laboral con fines turísticos.', 1),
(22, '2020-03-14 17:34:04', '2020-03-14 17:34:04', '2020-12-31', 'Día no laboral con fines turísticos.', 1),
(23, '2020-03-14 17:34:26', '2020-03-14 17:34:26', '2020-12-25', 'Navidad.', 1),
(24, '2020-03-14 17:37:09', '2020-03-14 17:37:09', '2020-01-01', 'Confraternização Universal', 4),
(25, '2020-03-14 17:37:32', '2020-03-14 17:37:32', '2020-04-21', 'Tiradentes', 4),
(26, '2020-03-14 17:37:53', '2020-03-14 17:37:53', '2020-05-31', 'Corpus Christi', 4),
(27, '2020-03-14 17:38:20', '2020-03-14 17:38:20', '2020-10-12', 'Nossa Senhora Aparecida', 4),
(28, '2020-03-14 17:38:38', '2020-03-14 17:38:38', '2020-03-30', 'Sexta-feira da Paixão', 4),
(29, '2020-03-14 17:39:02', '2020-03-14 17:39:02', '2020-05-01', 'Dia do Trabalhador', 4),
(30, '2020-03-14 17:39:38', '2020-03-14 17:39:38', '2020-09-07', 'Dia da Independência do Brasil', 4),
(31, '2020-03-14 17:40:04', '2020-03-14 17:40:04', '2020-11-02', 'Finados', 4),
(32, '2020-03-14 17:40:32', '2020-03-14 17:40:32', '2020-11-15', 'Proclamação da República', 4),
(33, '2020-03-14 17:40:55', '2020-03-14 17:40:55', '2020-12-25', 'Natal', 4),
(34, '2020-03-14 17:42:39', '2020-03-14 17:42:39', '2020-01-01', 'New Year\'s Day 2020', 2),
(35, '2020-03-14 17:45:21', '2020-03-14 17:45:21', '2020-01-15', 'Martin Luther King', 2),
(36, '2020-03-14 17:46:58', '2020-03-14 17:46:58', '2020-02-19', 'President\'s Day', 2),
(37, '2020-03-14 17:47:45', '2020-03-14 17:47:45', '2020-04-16', 'Emancipation Day', 2),
(38, '2020-03-14 17:49:41', '2020-03-14 17:49:41', '2020-05-28', 'Memorial Day', 2),
(39, '2020-03-14 17:50:06', '2020-03-14 17:50:06', '2020-07-04', 'Independence Day', 2),
(40, '2020-03-14 17:51:12', '2020-03-14 17:51:12', '2020-09-03', 'Labor Day', 2),
(41, '2020-03-14 17:52:16', '2020-03-14 17:52:16', '2020-10-08', 'Columbus Day', 2),
(42, '2020-03-14 17:52:46', '2020-03-14 17:52:46', '2020-11-12', 'Veteran\'s Day', 2),
(43, '2020-03-14 17:53:23', '2020-03-14 17:53:23', '2020-11-22', 'Thanksgiving', 2),
(44, '2020-03-14 17:53:52', '2020-03-14 17:53:52', '2020-12-25', 'Christmas Day', 2),
(45, '2020-03-14 18:01:27', '2020-03-20 13:27:45', '2020-01-01', 'New Year\'s Day', 5),
(46, '2020-03-14 18:01:51', '2020-03-14 18:01:51', '2020-01-26', 'Republic Day', 5),
(47, '2020-03-14 18:02:23', '2020-03-14 18:02:23', '2020-02-14', 'Maha Shivaratri', 5),
(48, '2020-03-14 18:02:40', '2020-03-14 18:02:40', '2020-03-02', 'Holi', 5),
(49, '2020-03-14 18:03:01', '2020-03-14 18:03:01', '2020-03-29', 'Mahavir Jayanti', 5),
(50, '2020-03-14 18:03:18', '2020-03-14 18:03:18', '2020-03-30', 'Good Friday', 5),
(51, '2020-03-14 18:03:37', '2020-03-14 18:03:37', '2020-04-30', 'Budhha Purnima', 5),
(52, '2020-03-14 18:03:58', '2020-03-14 18:03:58', '2020-05-01', 'Labor Day', 5),
(53, '2020-03-14 18:04:57', '2020-03-14 18:04:57', '2020-08-15', 'Independence Day', 5),
(54, '2020-03-14 18:05:21', '2020-03-14 18:05:21', '2020-08-22', 'Bakri Id / Eid ul-Adha', 5),
(55, '2020-03-14 18:05:40', '2020-03-14 18:05:40', '2020-09-03', 'Janmashtami', 5),
(56, '2020-03-14 18:06:02', '2020-03-14 18:06:02', '2020-09-13', 'Vinayaka Chaturthi', 5),
(57, '2020-03-14 18:06:27', '2020-03-14 18:06:27', '2020-09-21', 'Muharram', 5),
(58, '2020-03-14 18:06:48', '2020-03-14 18:06:48', '2020-10-02', 'Mathatma Gandhi Jayanti', 5),
(59, '2020-03-14 18:07:22', '2020-03-14 18:07:22', '2020-10-19', 'Dussehra / Dasara', 5),
(60, '2020-03-14 18:07:46', '2020-03-14 18:07:46', '2020-11-07', 'Diwali / Deepavali', 5),
(61, '2020-03-14 18:08:17', '2020-03-14 18:08:17', '2020-11-21', 'Milad un Nabi', 5),
(62, '2020-03-14 18:08:42', '2020-03-14 18:08:42', '2020-11-23', 'Guru Nanak\'s Birthday', 5),
(63, '2020-03-14 18:09:06', '2020-03-14 18:09:06', '2020-12-25', 'Christmas', 5),
(64, '2020-03-14 18:17:00', '2020-03-14 18:17:00', '2020-01-01', 'New Year', 3),
(65, '2020-03-14 18:17:52', '2020-03-14 18:17:52', '2020-01-08', 'Ephifany (Observed)', 3),
(66, '2020-03-14 18:18:23', '2020-03-14 18:18:23', '2020-03-19', 'Saint Joseph Day', 3),
(67, '2020-03-14 18:20:01', '2020-03-14 18:20:01', '2020-03-29', 'Maundy Thursday', 3),
(68, '2020-03-14 18:20:26', '2020-03-14 18:20:26', '2020-03-30', 'Good Friday', 3),
(69, '2020-03-14 18:20:56', '2020-03-14 18:20:56', '2020-05-01', 'Labour Day', 3),
(70, '2020-03-14 18:21:29', '2020-03-14 18:21:29', '2020-05-14', 'Ascension Day (Observed)', 3),
(71, '2020-03-14 18:21:55', '2020-03-14 18:21:55', '2020-06-04', 'Chorpus Christi', 3),
(72, '2020-03-14 18:22:26', '2020-03-14 18:22:26', '2020-06-11', 'Sacred Heart', 3),
(73, '2020-03-14 18:22:52', '2020-03-14 18:22:52', '2020-07-02', 'Saint Peter & Saint Paul Day', 3),
(74, '2020-03-14 18:23:30', '2020-03-14 18:23:30', '2020-07-20', 'Declaration of Independence', 3),
(75, '2020-03-14 18:24:06', '2020-03-14 18:24:06', '2020-08-07', 'Batalla de Boyaca', 3),
(76, '2020-03-14 18:24:29', '2020-03-14 18:24:29', '2020-08-20', 'Assumption Day', 3),
(77, '2020-03-14 18:25:48', '2020-03-14 18:25:48', '2020-10-15', 'Columbus Day', 3),
(78, '2020-03-14 18:26:11', '2020-03-14 18:26:11', '2020-11-05', 'All Saints Day', 3),
(79, '2020-03-14 18:26:48', '2020-03-16 18:04:00', '2020-11-11', 'Cartagena Independence', 3),
(80, '2020-03-14 18:27:16', '2020-03-14 18:27:16', '2020-12-25', 'Christmas Day', 3);

-- --------------------------------------------------------

--
-- Table structure for table `industries`
--

CREATE TABLE `industries` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `industries`
--

INSERT INTO `industries` (`id`, `created_at`, `updated_at`, `name`) VALUES
(1, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Pharmaceutical'),
(2, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Internet & Information Technology'),
(3, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Legal & Law Enforcement'),
(4, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Mining'),
(5, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Entertainment'),
(6, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Sports & Recreation'),
(7, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Agriculture'),
(8, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Construction'),
(9, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Manufacturing'),
(10, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Engineering'),
(11, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Education & Training'),
(12, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Finance & Accounting'),
(13, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Government'),
(14, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Healthcare & Medical'),
(15, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Human Resources'),
(16, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Insurance'),
(17, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Operations & Logistics'),
(18, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Retail & Consumer'),
(19, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Goods & Services'),
(20, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Sales & Marketing'),
(21, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Science & Research'),
(22, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Telecommunications'),
(23, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Travel & Tourism');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `number` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_order` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `concept` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `due_date` date DEFAULT NULL,
  `total` double(8,2) NOT NULL,
  `bill_to` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remit_to` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emited` tinyint(1) NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `created_at`, `updated_at`, `project_id`, `number`, `purchase_order`, `concept`, `from`, `to`, `contact_id`, `currency_id`, `due_date`, `total`, `bill_to`, `remit_to`, `emited`, `comments`) VALUES
(1, '2020-04-08 19:49:42', '2020-04-08 19:49:42', 7, '8796', 'PO # 43242', 'Billing Period: March-2020', '2020-03-21', '2020-03-31', 12, 2, '2020-04-30', 0.00, 'FlexDevice', 'GoitGlobal', 0, 'Billing for March-2020 (from 21-Mar-2020 up to 31-3-2020)'),
(13, '2020-04-26 17:48:06', '2020-04-26 17:48:21', 7, 'Billing # 1', 'PO # 234234', 'March 2020', '2020-03-21', '2020-03-31', 12, 2, '2020-04-30', 102584.08, 'FlexDevice', 'GoitGlobal', 1, 'This biling period cover from March 21 up to March 31.'),
(14, '2020-04-26 17:48:14', '2020-04-26 17:48:21', 7, 'Billing # 1', 'PO # 234234', 'March 2020', '2020-03-21', '2020-03-31', 12, 2, '2020-04-30', 102584.08, 'FlexDevice', 'GoitGlobal', 0, 'This biling period cover from March 21 up to March 31.'),
(15, '2020-04-26 18:37:11', '2020-04-26 18:37:29', 7, '3123213', 'dasdas', 'adasd', '2020-03-21', '2020-06-21', 13, 2, '2020-04-18', 102734.08, 'FlexDevice', 'GoitGlobal', 1, NULL),
(16, '2020-09-12 19:25:58', '2020-09-12 19:26:33', 7, '1234', '1234', 'September Billing 2020', '2020-03-21', '2020-06-21', 12, 2, '0000-00-00', 79253.94, 'FlexDevice', 'GoitGlobal LLC', 1, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_discounts`
--

CREATE TABLE `invoice_discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(18,2) NOT NULL,
  `percentage` double(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_disc_codifier`
--

CREATE TABLE `invoice_disc_codifier` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` double(18,2) NOT NULL,
  `overfield` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_expenses`
--

CREATE TABLE `invoice_expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(18,2) NOT NULL,
  `cost` double(18,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_expenses`
--

INSERT INTO `invoice_expenses` (`id`, `created_at`, `updated_at`, `invoice_id`, `detail`, `amount`, `cost`, `currency_id`) VALUES
(7, '2020-04-26 17:48:13', '2020-04-26 17:48:13', 13, 'Travel and others USA', 300.00, 300.00, 2),
(8, '2020-04-26 17:48:21', '2020-04-26 17:48:21', 14, 'Travel and others USA', 300.00, 300.00, 2),
(9, '2020-04-26 18:37:16', '2020-04-26 18:37:16', 15, 'Travel and others USA', 300.00, 300.00, 2),
(10, '2020-09-12 19:26:11', '2020-09-12 19:26:11', 16, 'Travel and others USA', 300.00, 300.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_materials`
--

CREATE TABLE `invoice_materials` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(18,2) NOT NULL,
  `amount` double(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_materials`
--

INSERT INTO `invoice_materials` (`id`, `created_at`, `updated_at`, `invoice_id`, `currency_id`, `detail`, `cost`, `amount`) VALUES
(7, '2020-04-26 17:48:13', '2020-04-26 17:48:13', 13, 2, 'Digital Displays, Cables & Plastic Boxes', 1500.00, 1500.00),
(8, '2020-04-26 17:48:21', '2020-04-26 17:48:21', 14, 2, 'Digital Displays, Cables & Plastic Boxes', 1500.00, 1500.00),
(9, '2020-04-26 18:37:16', '2020-04-26 18:37:16', 15, 2, 'Digital Displays, Cables & Plastic Boxes', 1500.00, 1500.00),
(10, '2020-09-12 19:26:11', '2020-09-12 19:26:11', 16, 2, 'Digital Displays, Cables & Plastic Boxes', 1500.00, 1500.00);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_resources`
--

CREATE TABLE `invoice_resources` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `project_role_id` int(10) UNSIGNED NOT NULL,
  `seniority_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `load` tinyint(4) NOT NULL,
  `workplace` enum('onsite','offshore') COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(18,2) NOT NULL,
  `rate_id` int(10) UNSIGNED DEFAULT NULL,
  `hours` int(11) NOT NULL,
  `type` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `office_id` int(10) UNSIGNED DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_resources`
--

INSERT INTO `invoice_resources` (`id`, `created_at`, `updated_at`, `invoice_id`, `project_role_id`, `seniority_id`, `currency_id`, `load`, `workplace`, `rate`, `rate_id`, `hours`, `type`, `user_id`, `comments`, `office_id`, `country_id`, `city_id`) VALUES
(86, '2020-04-26 17:48:07', '2020-04-26 17:48:07', 13, 2, 3, 2, 50, 'offshore', 25.00, 1, 591, 'Project Manager', 554, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(87, '2020-04-26 17:48:07', '2020-04-26 17:48:07', 13, 7, 3, 2, 50, 'offshore', 28.12, 5, 296, 'Technical Leader', 553, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(88, '2020-04-26 17:48:07', '2020-04-26 17:48:07', 13, 7, 3, 2, 50, 'offshore', 28.12, 5, 4, 'Technical Leader Additional Hours', 553, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(89, '2020-04-26 17:48:08', '2020-04-26 17:48:08', 13, 1, 2, 2, 100, 'offshore', 18.75, 14, 612, 'Semi-Senior Developer', 547, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(90, '2020-04-26 17:48:08', '2020-04-26 17:48:08', 13, 1, 2, 2, 100, 'offshore', 18.75, 14, 3, 'Semi-Senior Developer Additional Hours', 547, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(91, '2020-04-26 17:48:09', '2020-04-26 17:48:09', 13, 1, 2, 2, 100, 'offshore', 18.75, 14, 605, 'Semi-Senior Developer', 551, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(92, '2020-04-26 17:48:09', '2020-04-26 17:48:09', 13, 1, 2, 2, 100, 'offshore', 18.75, 14, 0, 'Semi-Senior Developer Additional Hours', 551, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(93, '2020-04-26 17:48:09', '2020-04-26 17:48:09', 13, 4, 3, 2, 100, 'offshore', 15.62, 6, 427, 'Web Developer', 552, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(94, '2020-04-26 17:48:10', '2020-04-26 17:48:10', 13, 6, 3, 2, 50, 'offshore', 18.75, 2, 196, 'UX Designer', 556, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(95, '2020-04-26 17:48:10', '2020-04-26 17:48:10', 13, 3, 2, 2, 100, 'offshore', 15.62, 10, 282, 'QA Analyst OffShore', 555, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(96, '2020-04-26 17:48:11', '2020-04-26 17:48:11', 13, 5, 3, 2, 25, 'offshore', 31.25, 4, 146, 'Delivery Manager', 557, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(97, '2020-04-26 17:48:11', '2020-04-26 17:48:11', 13, 7, 3, 2, 0, 'offshore', 28.12, 5, 296, 'Technical Leader', 553, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(98, '2020-04-26 17:48:11', '2020-04-26 17:48:11', 13, 7, 3, 2, 0, 'offshore', 28.12, 5, 4, 'Technical Leader Additional Hours', 553, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(99, '2020-04-26 17:48:12', '2020-04-26 17:48:12', 13, 2, 3, 2, 0, 'offshore', 25.00, 1, 612, 'Project Manager', 547, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(100, '2020-04-26 17:48:12', '2020-04-26 17:48:12', 13, 1, 2, 2, 0, 'offshore', 18.75, 14, 3, 'Semi-Senior Developer Additional Hours', 547, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(101, '2020-04-26 17:48:13', '2020-04-26 17:48:13', 13, 1, 2, 2, 0, 'offshore', 18.75, 14, 605, 'Semi-Senior Developer', 551, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(102, '2020-04-26 17:48:13', '2020-04-26 17:48:13', 13, 1, 2, 2, 0, 'offshore', 18.75, 14, 0, 'Semi-Senior Developer Additional Hours', 551, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(103, '2020-04-26 17:48:14', '2020-04-26 17:48:14', 14, 2, 3, 2, 50, 'offshore', 25.00, 1, 591, 'Project Manager', 554, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(104, '2020-04-26 17:48:15', '2020-04-26 17:48:15', 14, 7, 3, 2, 50, 'offshore', 28.12, 5, 296, 'Technical Leader', 553, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(105, '2020-04-26 17:48:15', '2020-04-26 17:48:15', 14, 7, 3, 2, 50, 'offshore', 28.12, 5, 4, 'Technical Leader Additional Hours', 553, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(106, '2020-04-26 17:48:15', '2020-04-26 17:48:15', 14, 1, 2, 2, 100, 'offshore', 18.75, 14, 612, 'Semi-Senior Developer', 547, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(107, '2020-04-26 17:48:15', '2020-04-26 17:48:15', 14, 1, 2, 2, 100, 'offshore', 18.75, 14, 3, 'Semi-Senior Developer Additional Hours', 547, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(108, '2020-04-26 17:48:16', '2020-04-26 17:48:16', 14, 1, 2, 2, 100, 'offshore', 18.75, 14, 605, 'Semi-Senior Developer', 551, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(109, '2020-04-26 17:48:16', '2020-04-26 17:48:16', 14, 1, 2, 2, 100, 'offshore', 18.75, 14, 0, 'Semi-Senior Developer Additional Hours', 551, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(110, '2020-04-26 17:48:17', '2020-04-26 17:48:17', 14, 4, 3, 2, 100, 'offshore', 15.62, 6, 427, 'Web Developer', 552, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(111, '2020-04-26 17:48:17', '2020-04-26 17:48:17', 14, 6, 3, 2, 50, 'offshore', 18.75, 2, 196, 'UX Designer', 556, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(112, '2020-04-26 17:48:18', '2020-04-26 17:48:18', 14, 3, 2, 2, 100, 'offshore', 15.62, 10, 282, 'QA Analyst OffShore', 555, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(113, '2020-04-26 17:48:19', '2020-04-26 17:48:19', 14, 5, 3, 2, 25, 'offshore', 31.25, 4, 146, 'Delivery Manager', 557, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(114, '2020-04-26 17:48:19', '2020-04-26 17:48:19', 14, 7, 3, 2, 0, 'offshore', 28.12, 5, 296, 'Technical Leader', 553, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(115, '2020-04-26 17:48:19', '2020-04-26 17:48:19', 14, 7, 3, 2, 0, 'offshore', 28.12, 5, 4, 'Technical Leader Additional Hours', 553, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(116, '2020-04-26 17:48:20', '2020-04-26 17:48:20', 14, 2, 3, 2, 0, 'offshore', 25.00, 1, 612, 'Project Manager', 547, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(117, '2020-04-26 17:48:20', '2020-04-26 17:48:20', 14, 1, 2, 2, 0, 'offshore', 18.75, 14, 3, 'Semi-Senior Developer Additional Hours', 547, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(118, '2020-04-26 17:48:21', '2020-04-26 17:48:21', 14, 1, 2, 2, 0, 'offshore', 18.75, 14, 605, 'Semi-Senior Developer', 551, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(119, '2020-04-26 17:48:21', '2020-04-26 17:48:21', 14, 1, 2, 2, 0, 'offshore', 18.75, 14, 0, 'Semi-Senior Developer Additional Hours', 551, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(120, '2020-04-26 18:37:11', '2020-04-26 18:37:11', 15, 2, 3, 2, 50, 'offshore', 25.00, 1, 591, 'Project Manager', 554, 'test', NULL, NULL, NULL),
(121, '2020-04-26 18:37:12', '2020-04-26 18:37:12', 15, 7, 3, 2, 50, 'offshore', 28.12, 5, 296, 'Technical Leader', 553, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(122, '2020-04-26 18:37:12', '2020-04-26 18:37:12', 15, 7, 3, 2, 50, 'offshore', 28.12, 5, 4, 'Technical Leader Additional Hours', 553, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(123, '2020-04-26 18:37:12', '2020-04-26 18:37:12', 15, 1, 2, 2, 100, 'offshore', 18.75, 14, 612, 'Semi-Senior Developer', 547, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(124, '2020-04-26 18:37:12', '2020-04-26 18:37:12', 15, 1, 2, 2, 100, 'offshore', 18.75, 14, 3, 'Semi-Senior Developer Additional Hours', 547, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(125, '2020-04-26 18:37:13', '2020-04-26 18:37:13', 15, 1, 2, 2, 100, 'offshore', 18.75, 14, 605, 'Semi-Senior Developer', 551, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(126, '2020-04-26 18:37:13', '2020-04-26 18:37:13', 15, 1, 2, 2, 100, 'offshore', 18.75, 14, 4, 'Semi-Senior Developer Additional Hours', 551, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(127, '2020-04-26 18:37:13', '2020-04-26 18:37:13', 15, 4, 3, 2, 100, 'offshore', 15.62, 6, 427, 'Web Developer', 552, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(128, '2020-04-26 18:37:14', '2020-04-26 18:37:14', 15, 6, 3, 2, 50, 'offshore', 18.75, 2, 196, 'UX Designer', 556, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(129, '2020-04-26 18:37:14', '2020-04-26 18:37:14', 15, 3, 2, 2, 100, 'offshore', 15.62, 10, 282, 'QA Analyst OffShore', 555, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(130, '2020-04-26 18:37:15', '2020-04-26 18:37:15', 15, 5, 3, 2, 25, 'offshore', 31.25, 4, 146, 'Delivery Manager', 557, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(131, '2020-04-26 18:37:15', '2020-04-26 18:37:15', 15, 7, 3, 2, 0, 'offshore', 28.12, 5, 296, 'Technical Leader', 553, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(132, '2020-04-26 18:37:15', '2020-04-26 18:37:15', 15, 7, 3, 2, 0, 'offshore', 28.12, 5, 4, 'Technical Leader Additional Hours', 553, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(133, '2020-04-26 18:37:16', '2020-04-26 18:37:16', 15, 2, 3, 2, 0, 'offshore', 25.00, 1, 612, 'Project Manager', 547, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(134, '2020-04-26 18:37:16', '2020-04-26 18:37:16', 15, 1, 2, 2, 0, 'offshore', 18.75, 14, 3, 'Semi-Senior Developer Additional Hours', 547, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(135, '2020-04-26 18:37:16', '2020-04-26 18:37:16', 15, 1, 2, 2, 0, 'offshore', 18.75, 14, 605, 'Semi-Senior Developer', 551, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(136, '2020-04-26 18:37:16', '2020-04-26 18:37:16', 15, 1, 2, 2, 0, 'offshore', 18.75, 14, 4, 'Semi-Senior Developer Additional Hours', 551, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(137, '2020-09-12 19:25:59', '2020-09-12 19:25:59', 16, 2, 3, 2, 50, 'offshore', 25.00, 1, 240, 'Project Manager', 554, 'test1', NULL, NULL, NULL),
(138, '2020-09-12 19:26:00', '2020-09-12 19:26:00', 16, 7, 3, 2, 50, 'offshore', 28.12, 5, 244, 'Technical Leader', 553, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(139, '2020-09-12 19:26:00', '2020-09-12 19:26:00', 16, 7, 3, 2, 50, 'offshore', 28.12, 5, 4, 'Technical Leader Additional Hours', 553, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(140, '2020-09-12 19:26:01', '2020-09-12 19:26:01', 16, 1, 2, 2, 100, 'offshore', 18.75, 14, 508, 'Semi-Senior Developer', 547, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(141, '2020-09-12 19:26:01', '2020-09-12 19:26:01', 16, 1, 2, 2, 100, 'offshore', 18.75, 14, 3, 'Semi-Senior Developer Additional Hours', 547, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(142, '2020-09-12 19:26:02', '2020-09-12 19:26:02', 16, 1, 2, 2, 100, 'offshore', 18.75, 14, 501, 'Semi-Senior Developer', 551, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(143, '2020-09-12 19:26:02', '2020-09-12 19:26:02', 16, 1, 2, 2, 100, 'offshore', 18.75, 14, 4, 'Semi-Senior Developer Additional Hours', 551, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(144, '2020-09-12 19:26:03', '2020-09-12 19:26:03', 16, 4, 3, 2, 100, 'offshore', 15.62, 6, 357, 'Web Developer', 552, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(145, '2020-09-12 19:26:05', '2020-09-12 19:26:05', 16, 6, 3, 2, 50, 'offshore', 18.75, 2, 160, 'UX Designer', 556, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(146, '2020-09-12 19:26:06', '2020-09-12 19:26:06', 16, 3, 2, 2, 100, 'offshore', 15.62, 10, 234, 'QA Analyst OffShore', 555, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(147, '2020-09-12 19:26:07', '2020-09-12 19:26:07', 16, 5, 3, 2, 25, 'offshore', 31.25, 4, 120, 'Delivery Manager', 557, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(148, '2020-09-12 19:26:08', '2020-09-12 19:26:08', 16, 7, 3, 2, 0, 'offshore', 28.12, 5, 244, 'Technical Leader', 553, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(149, '2020-09-12 19:26:08', '2020-09-12 19:26:08', 16, 7, 3, 2, 0, 'offshore', 28.12, 5, 4, 'Technical Leader Additional Hours', 553, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(150, '2020-09-12 19:26:09', '2020-09-12 19:26:09', 16, 2, 3, 2, 0, 'offshore', 25.00, 1, 508, 'Project Manager', 547, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(151, '2020-09-12 19:26:09', '2020-09-12 19:26:09', 16, 1, 2, 2, 0, 'offshore', 18.75, 14, 3, 'Semi-Senior Developer Additional Hours', 547, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(152, '2020-09-12 19:26:11', '2020-09-12 19:26:11', 16, 1, 2, 2, 0, 'offshore', 18.75, 14, 501, 'Semi-Senior Developer', 551, 'First Billing Period Mar-2020', NULL, NULL, NULL),
(153, '2020-09-12 19:26:11', '2020-09-12 19:26:11', 16, 1, 2, 2, 0, 'offshore', 18.75, 14, 4, 'Semi-Senior Developer Additional Hours', 551, 'First Billing Period Mar-2020', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_services`
--

CREATE TABLE `invoice_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(18,2) NOT NULL,
  `cost` double(18,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_services`
--

INSERT INTO `invoice_services` (`id`, `created_at`, `updated_at`, `invoice_id`, `detail`, `amount`, `cost`, `currency_id`) VALUES
(7, '2020-04-26 17:48:13', '2020-04-26 17:48:13', 13, 'Hosting & Devices compatibilities DB Services', 250.00, 250.00, 2),
(8, '2020-04-26 17:48:21', '2020-04-26 17:48:21', 14, 'Hosting & Devices compatibilities DB Services', 250.00, 250.00, 2),
(9, '2020-04-26 18:37:16', '2020-04-26 18:37:16', 15, 'Hosting & Devices compatibilities DB Services', 250.00, 250.00, 2),
(10, '2020-09-12 19:26:11', '2020-09-12 19:26:11', 16, 'Hosting & Devices compatibilities DB Services', 250.00, 250.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_taxes`
--

CREATE TABLE `invoice_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(18,2) NOT NULL,
  `percentage` double(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_tax_codifier`
--

CREATE TABLE `invoice_tax_codifier` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` double(18,2) NOT NULL,
  `overfield` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kpis`
--

CREATE TABLE `kpis` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `category` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `query` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `graphic_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kpi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_of_result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kpis`
--

INSERT INTO `kpis` (`id`, `created_at`, `updated_at`, `company_id`, `category`, `description`, `query`, `graphic_type`, `nombre`, `kpi`, `type_of_result`) VALUES
(48, '2020-04-26 20:29:05', '2020-04-26 20:59:45', 1, 1, 'Budgeted Cost of Work Performed.  Total PV * % of Completion.', '$PCW  * $PB', 'BAR', 'Earned Value', 'EV or BCWP', 'NUMERIC'),
(49, '2020-04-26 20:30:56', '2020-04-26 20:30:56', 1, 1, 'Actual Cost of Work Performed', '$AV', NULL, 'Actual Cost', 'AC or ACWP', 'NUMERIC'),
(50, '2020-04-26 21:23:12', '2020-04-26 21:23:12', 1, 1, 'ROI= (Ganancia del Proyecto - Costo del Proyecto) / Costo  del Proyecto', '($PF-$AV)/$AV', 'DONUT', 'Return Of Investment', 'ROI', 'PERCENT');

-- --------------------------------------------------------

--
-- Table structure for table `kpis_category`
--

CREATE TABLE `kpis_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kpis_category`
--

INSERT INTO `kpis_category` (`id`, `created_at`, `updated_at`, `name`, `company_id`) VALUES
(1, '2020-04-26 20:27:24', '2020-04-26 20:27:24', 'Cost', 1),
(2, '2020-04-26 20:27:32', '2020-04-26 20:27:32', 'Schedule', 1),
(3, '2020-04-26 20:27:38', '2020-04-26 20:27:38', 'Resources', 1),
(4, '2020-04-26 20:27:38', '2020-04-26 20:27:38', 'Risk', 1),
(5, '2020-04-26 20:27:38', '2020-04-26 20:27:38', 'Quality', 1),
(7, '2020-04-26 20:27:38', '2020-04-26 20:27:38', 'Agile', 1);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `created_at`, `updated_at`, `name`, `code`) VALUES
(1, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Spanish', 'ES'),
(2, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'English', 'EN'),
(6, '2020-03-14 17:05:37', '2020-03-14 17:05:37', 'Hindi', 'HN'),
(223, '2020-03-20 18:27:08', '2020-03-20 18:27:08', 'Pashto', 'PS'),
(224, '2020-03-20 18:27:08', '2020-03-20 18:27:08', 'Uzbek', 'UZ'),
(225, '2020-03-20 18:27:08', '2020-03-20 18:27:08', 'Turkmen', 'TK'),
(226, '2020-03-20 18:27:08', '2020-03-20 18:27:08', 'Swedish', 'SV'),
(227, '2020-03-20 18:27:08', '2020-03-20 18:27:08', 'Albanian', 'SQ'),
(228, '2020-03-20 18:27:08', '2020-03-20 18:27:08', 'Arabic', 'AR'),
(229, '2020-03-20 18:27:08', '2020-03-20 18:27:08', 'Samoan', 'SM'),
(230, '2020-03-20 18:27:08', '2020-03-20 18:27:08', 'Catalan', 'CA'),
(231, '2020-03-20 18:27:08', '2020-03-20 18:27:08', 'Portuguese', 'PT'),
(232, '2020-03-20 18:27:09', '2020-03-20 18:27:09', 'Russian', 'RU'),
(233, '2020-03-20 18:27:09', '2020-03-20 18:27:09', 'Guaraní', 'GN'),
(234, '2020-03-20 18:27:09', '2020-03-20 18:27:09', 'Armenian', 'HY'),
(235, '2020-03-20 18:27:09', '2020-03-20 18:27:09', 'Dutch', 'NL'),
(236, '2020-03-20 18:27:09', '2020-03-20 18:27:09', '(Eastern) Punjabi', 'PA'),
(237, '2020-03-20 18:27:09', '2020-03-20 18:27:09', 'German', 'DE'),
(238, '2020-03-20 18:27:09', '2020-03-20 18:27:09', 'Azerbaijani', 'AZ'),
(239, '2020-03-20 18:27:09', '2020-03-20 18:27:09', 'Bengali', 'BN'),
(240, '2020-03-20 18:27:09', '2020-03-20 18:27:09', 'Belarusian', 'BE'),
(241, '2020-03-20 18:27:10', '2020-03-20 18:27:10', 'French', 'FR'),
(242, '2020-03-20 18:27:10', '2020-03-20 18:27:10', 'Dzongkha', 'DZ'),
(243, '2020-03-20 18:27:10', '2020-03-20 18:27:10', 'Aymara', 'AY'),
(244, '2020-03-20 18:27:10', '2020-03-20 18:27:10', 'Quechua', 'QU'),
(245, '2020-03-20 18:27:10', '2020-03-20 18:27:10', 'Bosnian', 'BS'),
(246, '2020-03-20 18:27:10', '2020-03-20 18:27:10', 'Croatian', 'HR'),
(247, '2020-03-20 18:27:10', '2020-03-20 18:27:10', 'Serbian', 'SR'),
(248, '2020-03-20 18:27:10', '2020-03-20 18:27:10', 'Tswana', 'TN'),
(249, '2020-03-20 18:27:11', '2020-03-20 18:27:11', 'Norwegian', 'NO'),
(250, '2020-03-20 18:27:11', '2020-03-20 18:27:11', 'Norwegian Bokmål', 'NB'),
(251, '2020-03-20 18:27:11', '2020-03-20 18:27:11', 'Norwegian Nynorsk', 'NN'),
(252, '2020-03-20 18:27:11', '2020-03-20 18:27:11', 'Malay', 'MS'),
(253, '2020-03-20 18:27:11', '2020-03-20 18:27:11', 'Bulgarian', 'BG'),
(254, '2020-03-20 18:27:11', '2020-03-20 18:27:11', 'Fula', 'FF'),
(255, '2020-03-20 18:27:11', '2020-03-20 18:27:11', 'Kirundi', 'RN'),
(256, '2020-03-20 18:27:11', '2020-03-20 18:27:11', 'Khmer', 'KM'),
(257, '2020-03-20 18:27:12', '2020-03-20 18:27:12', 'Sango', 'SG'),
(258, '2020-03-20 18:27:12', '2020-03-20 18:27:12', 'Chinese', 'ZH'),
(259, '2020-03-20 18:27:12', '2020-03-20 18:27:12', 'Lingala', 'LN'),
(260, '2020-03-20 18:27:12', '2020-03-20 18:27:12', 'Kongo', 'KG'),
(261, '2020-03-20 18:27:12', '2020-03-20 18:27:12', 'Swahili', 'SW'),
(262, '2020-03-20 18:27:12', '2020-03-20 18:27:12', 'Luba-Katanga', 'LU'),
(263, '2020-03-20 18:27:13', '2020-03-20 18:27:13', 'Greek (modern)', 'EL'),
(264, '2020-03-20 18:27:13', '2020-03-20 18:27:13', 'Turkish', 'TR'),
(265, '2020-03-20 18:27:13', '2020-03-20 18:27:13', 'Czech', 'CS'),
(266, '2020-03-20 18:27:13', '2020-03-20 18:27:13', 'Slovak', 'SK'),
(267, '2020-03-20 18:27:13', '2020-03-20 18:27:13', 'Danish', 'DA'),
(268, '2020-03-20 18:27:14', '2020-03-20 18:27:14', 'Tigrinya', 'TI'),
(269, '2020-03-20 18:27:14', '2020-03-20 18:27:14', 'Estonian', 'ET'),
(270, '2020-03-20 18:27:14', '2020-03-20 18:27:14', 'Amharic', 'AM'),
(271, '2020-03-20 18:27:14', '2020-03-20 18:27:14', 'Faroese', 'FO'),
(272, '2020-03-20 18:27:14', '2020-03-20 18:27:14', 'Fijian', 'FJ'),
(273, '2020-03-20 18:27:14', '2020-03-20 18:27:14', 'Urdu', 'UR'),
(274, '2020-03-20 18:27:14', '2020-03-20 18:27:14', 'Finnish', 'FI'),
(275, '2020-03-20 18:27:15', '2020-03-20 18:27:15', 'Georgian', 'KA'),
(276, '2020-03-20 18:27:15', '2020-03-20 18:27:15', 'Kalaallisut', 'KL'),
(277, '2020-03-20 18:27:15', '2020-03-20 18:27:15', 'Chamorro', 'CH'),
(278, '2020-03-20 18:27:16', '2020-03-20 18:27:16', 'Haitian', 'HT'),
(279, '2020-03-20 18:27:16', '2020-03-20 18:27:16', 'Latin', 'LA'),
(280, '2020-03-20 18:27:16', '2020-03-20 18:27:16', 'Italian', 'IT'),
(281, '2020-03-20 18:27:16', '2020-03-20 18:27:16', 'Hungarian', 'HU'),
(282, '2020-03-20 18:27:16', '2020-03-20 18:27:16', 'Icelandic', 'IS'),
(283, '2020-03-20 18:27:16', '2020-03-20 18:27:16', 'Indonesian', 'ID'),
(284, '2020-03-20 18:27:16', '2020-03-20 18:27:16', 'Persian (Farsi)', 'FA'),
(285, '2020-03-20 18:27:17', '2020-03-20 18:27:17', 'Kurdish', 'KU'),
(286, '2020-03-20 18:27:17', '2020-03-20 18:27:17', 'Irish', 'GA'),
(287, '2020-03-20 18:27:17', '2020-03-20 18:27:17', 'Manx', 'GV'),
(288, '2020-03-20 18:27:17', '2020-03-20 18:27:17', 'Hebrew (modern)', 'HE'),
(289, '2020-03-20 18:27:17', '2020-03-20 18:27:17', 'Japanese', 'JA'),
(290, '2020-03-20 18:27:17', '2020-03-20 18:27:17', 'Kazakh', 'KK'),
(291, '2020-03-20 18:27:17', '2020-03-20 18:27:17', 'Kyrgyz', 'KY'),
(292, '2020-03-20 18:27:18', '2020-03-20 18:27:18', 'Lao', 'LO'),
(293, '2020-03-20 18:27:18', '2020-03-20 18:27:18', 'Latvian', 'LV'),
(294, '2020-03-20 18:27:18', '2020-03-20 18:27:18', 'Southern Sotho', 'ST'),
(295, '2020-03-20 18:27:18', '2020-03-20 18:27:18', 'Lithuanian', 'LT'),
(296, '2020-03-20 18:27:18', '2020-03-20 18:27:18', 'Luxembourgish', 'LB'),
(297, '2020-03-20 18:27:18', '2020-03-20 18:27:18', 'Macedonian', 'MK'),
(298, '2020-03-20 18:27:18', '2020-03-20 18:27:18', 'Malagasy', 'MG'),
(299, '2020-03-20 18:27:19', '2020-03-20 18:27:19', 'Chichewa', 'NY'),
(300, '2020-03-20 18:27:19', '2020-03-20 18:27:19', 'Divehi', 'DV'),
(301, '2020-03-20 18:27:19', '2020-03-20 18:27:19', 'Maltese', 'MT'),
(302, '2020-03-20 18:27:19', '2020-03-20 18:27:19', 'Marshallese', 'MH'),
(303, '2020-03-20 18:27:19', '2020-03-20 18:27:19', 'Romanian', 'RO'),
(304, '2020-03-20 18:27:19', '2020-03-20 18:27:19', 'Mongolian', 'MN'),
(305, '2020-03-20 18:27:20', '2020-03-20 18:27:20', 'Burmese', 'MY'),
(306, '2020-03-20 18:27:20', '2020-03-20 18:27:20', 'Afrikaans', 'AF'),
(307, '2020-03-20 18:27:20', '2020-03-20 18:27:20', 'Nauruan', 'NA'),
(308, '2020-03-20 18:27:20', '2020-03-20 18:27:20', 'Nepali', 'NE'),
(309, '2020-03-20 18:27:20', '2020-03-20 18:27:20', 'Māori', 'MI'),
(310, '2020-03-20 18:27:20', '2020-03-20 18:27:20', 'Korean', 'KO'),
(311, '2020-03-20 18:27:21', '2020-03-20 18:27:21', 'Polish', 'PL'),
(312, '2020-03-20 18:27:22', '2020-03-20 18:27:22', 'Kinyarwanda', 'RW'),
(313, '2020-03-20 18:27:22', '2020-03-20 18:27:22', 'Tamil', 'TA'),
(314, '2020-03-20 18:27:23', '2020-03-20 18:27:23', 'Slovene', 'SL'),
(315, '2020-03-20 18:27:23', '2020-03-20 18:27:23', 'Somali', 'SO'),
(316, '2020-03-20 18:27:23', '2020-03-20 18:27:23', 'Southern Ndebele', 'NR'),
(317, '2020-03-20 18:27:23', '2020-03-20 18:27:23', 'Swati', 'SS'),
(318, '2020-03-20 18:27:23', '2020-03-20 18:27:23', 'Tsonga', 'TS'),
(319, '2020-03-20 18:27:23', '2020-03-20 18:27:23', 'Venda', 'VE'),
(320, '2020-03-20 18:27:23', '2020-03-20 18:27:23', 'Xhosa', 'XH'),
(321, '2020-03-20 18:27:23', '2020-03-20 18:27:23', 'Zulu', 'ZU'),
(322, '2020-03-20 18:27:24', '2020-03-20 18:27:24', 'Sinhalese', 'SI'),
(323, '2020-03-20 18:27:25', '2020-03-20 18:27:25', 'Tajik', 'TG'),
(324, '2020-03-20 18:27:25', '2020-03-20 18:27:25', 'Thai', 'TH'),
(325, '2020-03-20 18:27:26', '2020-03-20 18:27:26', 'Tonga (Tonga Islands', 'TO'),
(326, '2020-03-20 18:27:27', '2020-03-20 18:27:27', 'Ukrainian', 'UK'),
(327, '2020-03-20 18:27:27', '2020-03-20 18:27:27', 'Bislama', 'BI'),
(328, '2020-03-20 18:27:28', '2020-03-20 18:27:28', 'Vietnamese', 'VI'),
(329, '2020-03-20 18:27:28', '2020-03-20 18:27:28', 'Shona', 'SN'),
(330, '2020-03-20 18:27:29', '2020-03-20 18:27:29', 'Northern Ndebele', 'ND');

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reimbursable` tinyint(4) NOT NULL,
  `detail` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(18,2) NOT NULL,
  `cost` double(18,2) DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `cost_currency_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `created_at`, `updated_at`, `reimbursable`, `detail`, `amount`, `cost`, `company_id`, `cost_currency_id`, `currency_id`) VALUES
(1, '2020-03-14 21:54:07', '2020-03-14 21:54:21', 1, 'Cables & Plugs', 100.00, 40.00, 1, 1, 2),
(2, '2020-03-14 21:54:51', '2020-03-14 21:54:51', 1, 'Plastic Boxes', 100.00, 80.00, 1, 1, 2),
(3, '2020-04-03 13:57:41', '2020-04-03 13:57:41', 1, 'Generic Material', 100.00, 50.00, 1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `metadocu`
--

CREATE TABLE `metadocu` (
  `language` int(10) UNSIGNED NOT NULL,
  `activity` int(10) UNSIGNED NOT NULL,
  `document_type` int(10) UNSIGNED NOT NULL,
  `code` int(10) UNSIGNED NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_logo_left` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_logo_right` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_ref` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Esta columna es solo de referencia, seria el nombre del archivo final. Tendra que ser compatible con el archivo a cargar.',
  `document_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `metagrid`
--

CREATE TABLE `metagrid` (
  `language` int(10) UNSIGNED NOT NULL,
  `activity` int(10) UNSIGNED NOT NULL,
  `document_type` int(10) UNSIGNED NOT NULL,
  `code` int(10) UNSIGNED NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `variable_code` int(10) UNSIGNED NOT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `row_number` int(11) NOT NULL,
  `column_number` int(11) NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_type` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'T, P, N, D, I, L, HL',
  `image_link` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Para datatype imagen',
  `hyperlink_link` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Para datatype link o hyperlink'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `metavariable`
--

CREATE TABLE `metavariable` (
  `language` int(10) UNSIGNED NOT NULL,
  `activity` int(10) UNSIGNED NOT NULL,
  `document_type` int(10) UNSIGNED NOT NULL,
  `code` int(10) UNSIGNED NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `variable_code` int(10) UNSIGNED NOT NULL,
  `variable_type` int(10) UNSIGNED NOT NULL,
  `variable_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hyperlink_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dependencies` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_01_09_120130_create_companies_table', 1),
(2, '2017_01_10_120200_create_company_roles_table', 1),
(3, '2017_01_15_105324_create_roles_table', 1),
(4, '2017_01_26_115212_create_permissions_table', 1),
(5, '2017_04_10_120000_create_engagements_table', 1),
(6, '2017_04_10_120015_create_users_table', 1),
(7, '2017_04_10_120100_create_cities_table', 1),
(8, '2017_04_10_121714_create_costs_table', 1),
(9, '2017_04_10_121714_create_countries_table', 1),
(10, '2017_04_10_121714_create_currencies_table', 1),
(11, '2017_04_10_121714_create_customers_table', 1),
(12, '2017_04_10_121714_create_holidays_templates_table', 1),
(13, '2017_04_10_121714_create_industries_table', 1),
(14, '2017_04_10_121714_create_kpis_table', 1),
(15, '2017_04_10_121714_create_languages_table', 1),
(16, '2017_04_10_121714_create_materials_table', 1),
(17, '2017_04_10_121714_create_offices_table', 1),
(18, '2017_04_10_121714_create_project_roles_table', 1),
(19, '2017_04_10_121714_create_providers_table', 1),
(20, '2017_04_10_121714_create_quotation_lines_table', 1),
(21, '2017_04_10_121714_create_quotations_table', 1),
(22, '2017_04_10_121714_create_seniorities_table', 1),
(23, '2017_04_10_121714_create_services_table', 1),
(24, '2017_04_10_121714_create_user_social_networks_table', 1),
(25, '2017_04_10_121714_create_workgroups_table', 1),
(26, '2017_04_10_121715_create_absence_types_table', 1),
(27, '2017_04_10_121715_create_absences_table', 1),
(28, '2017_04_10_121715_create_discounts_table', 1),
(29, '2017_04_10_121715_create_holidays_table', 1),
(30, '2017_04_10_121715_create_permission_user_table', 1),
(31, '2017_04_10_121715_create_rates_table', 1),
(32, '2017_04_10_121715_create_replacements_table', 1),
(33, '2017_04_10_121715_create_role_user_table', 1),
(34, '2017_04_10_121715_create_taxes_table', 1),
(35, '2017_04_10_185223_create_departments_table', 1),
(36, '2017_04_11_121714_create_projects_table', 1),
(37, '2017_04_11_121715_create_procurements_table', 1),
(38, '2017_04_11_121717_create_contracts_table', 1),
(39, '2017_04_12_121715_create_teams_table', 1),
(40, '2017_04_12_121800_create_agenda_table', 1),
(41, '2017_04_12_165846_create_notes_table', 1),
(42, '2017_04_13_121716_create_contract_materials_table', 1),
(43, '2017_04_13_121716_create_contract_services_table', 1),
(44, '2017_04_13_121900_create_contacts_table', 1),
(45, '2017_04_13_122000_create_contract_resources_table', 1),
(46, '2017_04_13_132000_create_stakeholders_table', 1),
(47, '2017_04_21_175338_create_seniority_templates_table', 1),
(48, '2017_04_21_183737_create_project_role_templates_table', 1),
(49, '2017_04_24_122029_create_company_role_templates_table', 1),
(50, '2017_04_25_163101_create_favorites_table', 1),
(51, '2017_05_05_202314_create_exchange_rates_table', 1),
(52, '2017_05_10_121715_create_team_users_table', 1),
(53, '2017_05_18_193952_create_email_category_templates_table', 1),
(54, '2017_05_18_193953_create_email_templates_table', 1),
(55, '2017_05_19_193810_create_email_categories_table', 1),
(56, '2017_05_19_193819_create_emails_table', 1),
(57, '2017_06_02_174146_create_company_users_table', 1),
(58, '2017_06_15_120523_create_activities_table', 1),
(59, '2017_06_15_120524_create_activities_history_table', 1),
(60, '2017_06_16_130156_create_project_kpi_alerts_table', 1),
(61, '2017_06_22_182919_create_additional_hours_table', 1),
(62, '2017_06_23_140247_create_working_hours_table', 1),
(63, '2017_06_27_124506_create_project_resources_table', 1),
(64, '2017_06_27_132702_create_project_services_table', 1),
(65, '2017_06_27_132850_create_project_materials_table', 1),
(66, '2017_06_29_182038_create_expenses_table', 1),
(67, '2017_06_30_121715_create_contract_expenses_table', 1),
(68, '2017_06_30_132324_create_project_expenses_table', 1),
(69, '2017_06_30_134440_create_invoices_table', 1),
(70, '2017_06_30_191711_invoice_resources', 1),
(71, '2017_06_30_192235_invoice_expenses', 1),
(72, '2017_06_30_192525_create_invoice_services', 1),
(73, '2017_06_30_192606_create_invoice_materials', 1),
(74, '2017_06_30_192636_create_invoice_discounts', 1),
(75, '2017_06_30_192755_create_invoice_taxes', 1),
(76, '2017_07_16_133623_create_requirements_table', 1),
(77, '2017_07_17_180434_create_table_procurement_offers', 1),
(78, '2017_07_17_180724_create_table_tasks', 1),
(79, '2017_07_27_123255_create_task_material_table', 1),
(80, '2017_07_27_123420_create_task_resources_table', 1),
(81, '2017_07_27_123506_create_task_services_table', 1),
(82, '2017_07_27_123641_create_tickets_table', 1),
(83, '2017_07_27_124212_create_tickets_histories_table', 1),
(84, '2020_03_12_115523_create_permission_role_table', 1),
(85, '2020_03_13_110800_create_doctypes_table', 1),
(86, '2020_03_13_113000_create_invoice_disc_codifier_table', 1),
(87, '2020_03_13_120100_create_metagrid_table', 1),
(88, '2020_03_13_123641_create_directories_table', 1),
(89, '2020_03_13_123642_create_directory_role_table', 1),
(90, '2020_03_13_130900_create_documents_table', 1),
(91, '2020_03_13_133000_create_invoice_tax_codifier_table', 1),
(92, '2020_03_13_140600_create_metavariable_table', 1),
(93, '2020_03_13_155000_create_metadocu_table', 1),
(94, '2020_04_10_121725_create_foreign_keys', 1),
(96, '2020_04_11_111100_add_city_absence_types', 2),
(97, '2020_04_12_120100_create_cities_template_table', 2),
(98, '2020_04_13_111100_add_company_cities', 2),
(99, '2020_04_13_191715_create_absence_types_template_table', 3),
(100, '2020_04_14_111100_add_company_absence_types', 3),
(101, '2020_04_14_111101_add_added_by_absence_types', 4),
(102, '2020_04_14_111102_add_code_countries', 5),
(103, '2020_04_14_111103_edit_engagement_projects', 6),
(104, '2020_04_14_111104_add_index_tasks', 7),
(105, '2020_04_14_111104_add_added_by_emails', 8),
(106, '2020_04_14_111105_add_role_task_resources', 9),
(107, '2020_04_14_111105_add_hours_by_day_pojects', 10),
(108, '2020_04_14_111106_add_wek_holidays_pojects', 11),
(109, '2020_04_14_111107_add_cost_task_materials', 12),
(110, '2020_04_14_111108_add_rate_task_resources', 13),
(111, '2020_04_14_111109_add_seniority_task_resources', 14),
(112, '2020_04_14_111110_alter_quotations', 15),
(113, '2020_04_16_123506_create_task_expenses_table', 15),
(114, '2020_04_19_191711_quotation_resources', 16),
(115, '2020_04_19_192235_quotation_expenses', 16),
(116, '2020_04_19_192525_create_quotation_services', 16),
(117, '2020_04_19_192606_create_quotation_materials', 16),
(118, '2020_04_26_103100_create_kpis_category_table', 17);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `created_at`, `updated_at`, `title`, `description`, `color`, `tag`, `project_id`) VALUES
(3, '2020-04-17 18:10:43', '2020-04-18 14:45:47', 'Hi! this the board for the Team!!', 'Please don\'t forget to save your documents to the project repository!!', 'red', '', NULL),
(4, '2020-04-18 14:47:00', '2020-09-03 12:44:21', 'This is the note # 1', 'Just like a  simple notepad but in TaskControl...\r\nBye!', 'red', '', 7),
(5, '2020-04-20 11:56:11', '2020-09-03 12:46:57', 'This is the note # 2', 'Instead  of using notepad  we can now use Notes directly whithin TaskControl!!\r\nLet\'s do it !!', 'red', '', 7);

-- --------------------------------------------------------

--
-- Table structure for table `offices`
--

CREATE TABLE `offices` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `workinghours_from` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workinghours_to` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hours_by_day` int(10) UNSIGNED NOT NULL DEFAULT '8'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offices`
--

INSERT INTO `offices` (`id`, `created_at`, `updated_at`, `title`, `company_id`, `city_id`, `workinghours_from`, `workinghours_to`, `hours_by_day`) VALUES
(1, '2020-03-14 20:36:14', '2020-08-30 17:38:30', 'Buenos Aires Office', 1, 2, '09:00', '18:00', 8),
(2, '2020-03-14 20:37:13', '2020-03-14 20:39:25', 'Cordoba Office', 1, 6, '08:00', '17:00', 8),
(3, '2020-03-14 20:38:45', '2020-03-14 20:38:45', 'Sao Paulo Office', 1, 5, '10:00', '18:00', 7),
(4, '2020-03-14 20:42:31', '2020-03-14 20:42:48', 'Bogota Office', 1, 9, '09:00', '17:00', 7),
(5, '2020-03-14 20:43:28', '2020-03-14 20:43:28', 'Bangalore Office', 1, 8, '08:00', '17:00', 8),
(7, '2020-03-19 12:38:41', '2020-03-19 12:38:41', 'Austin Office', 1, 7, '09:00', '05:00', 8);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `description`, `model`, `created_at`, `updated_at`) VALUES
(1, 'Can View Users', 'view.users', 'Can view users', 'Permission', '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(2, 'Can Create Users', 'create.users', 'Can create new users', 'Permission', '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(3, 'Can Edit Users', 'edit.users', 'Can edit users', 'Permission', '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(4, 'Can Delete Users', 'delete.users', 'Can delete users', 'Permission', '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(5, 'View My Company', 'view.mycompany', 'View My Company', 'Permission', '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(6, 'Manage My Company', 'manage.mycompany', 'Manage My Company', 'Permission', '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(7, 'View Emails', 'view.emails', 'View Emails', 'Permission', '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(8, 'Manage Emails', 'manage.emails', 'Manage Emails', 'Permission', '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(9, 'View Customers', 'view.customers', 'View Customers', 'Permission', '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(10, 'Manage Customers', 'manage.customers', 'Manage Customers', 'Permission', '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(11, 'View Costs', 'view.costs', 'MaView Costs', 'Permission', '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(12, 'Manage Costs', 'manage.costs', 'Manage Costss', 'Permission', '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(13, 'View Company Rates', 'view.companyrates', 'View Company Rates', 'Permission', '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(14, 'Manage Company Rates', 'manage.companyrates', 'Manage Company Ratess', 'Permission', '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(15, 'View Projects', 'view.projects', 'View Projects', 'Permission', '2020-03-30 19:08:25', '2020-03-30 19:08:25'),
(16, 'View requirements', 'view.requirements', 'View requirements', 'Permission', '2020-03-30 19:08:25', '2020-03-30 19:08:25'),
(17, 'View providers', 'view.providers', 'View providers', 'Permission', '2020-03-30 19:08:25', '2020-03-30 19:08:25'),
(18, 'View stakeholders', 'view.stakeholders', 'View stakeholders', 'Permission', '2020-03-30 19:08:25', '2020-03-30 19:08:25'),
(19, 'View contracts', 'view.contracts', 'View contracts', 'Permission', '2020-03-30 19:08:25', '2020-03-30 19:08:25'),
(20, 'View members', 'view.members', 'View members', 'Permission', '2020-03-30 19:08:25', '2020-03-30 19:08:25'),
(21, 'View capacity planning', 'view.capacityplanning', 'View capacity planning', 'Permission', '2020-03-30 19:08:25', '2020-03-30 19:08:25'),
(22, 'View working hours', 'view.workinghours', 'View working hours', 'Permission', '2020-03-30 19:08:25', '2020-03-30 19:08:25'),
(23, 'View absences', 'view.absences', 'View absences', 'Permission', '2020-03-30 19:08:25', '2020-03-30 19:08:25'),
(24, 'View replacements', 'view.replacements', 'View replacements', 'Permission', '2020-03-30 19:08:25', '2020-03-30 19:08:25'),
(25, 'View additional hours', 'view.additionalhours', 'View additional hours', 'Permission', '2020-03-30 19:08:25', '2020-03-30 19:08:25'),
(26, 'View task status report', 'view.taskstatusreport', 'View task status report', 'Permission', '2020-03-30 19:08:25', '2020-03-30 19:08:25'),
(27, 'View project risk report', 'view.projectriskreport', 'View project risk report', 'Permission', '2020-03-30 19:08:25', '2020-03-30 19:08:25'),
(28, 'View project board gantt', 'view.projectboardgantt', 'View project board gantt', 'Permission', '2020-03-30 19:08:25', '2020-03-30 19:08:25'),
(29, 'View forecast', 'view.forecast', 'View forecast', 'Permission', '2020-03-30 19:08:25', '2020-03-30 19:08:25'),
(30, 'View profit and loss', 'view.profitandloss', 'View profit and loss', 'Permission', '2020-03-30 19:08:25', '2020-03-30 19:08:25'),
(31, 'View invoices', 'view.invoices', 'View invoices', 'Permission', '2020-03-30 19:08:25', '2020-03-30 19:08:25'),
(32, 'View gantt', 'view.gantt', 'View gantt', 'Permission', '2020-04-03 18:02:28', '2020-04-03 18:02:28'),
(33, 'View project requeriments', 'view.projectrequeriments', 'View project requeriments', 'Permission', '2020-04-17 00:12:29', '2020-04-17 00:12:29'),
(34, 'View agenda', 'view.agenda', 'View agenda', 'Permission', '2020-04-18 14:12:56', '2020-04-18 14:12:56'),
(35, 'View quotations', 'view.quotations', 'View quotations', 'Permission', '2020-04-23 16:49:14', '2020-04-23 16:49:14'),
(36, 'View kpis', 'view.kpis', 'View kpis', 'Permission', '2020-04-26 20:26:47', '2020-04-26 20:26:47');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(2, 2, 1, '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(3, 3, 1, '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(4, 4, 1, '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(5, 5, 1, '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(6, 6, 1, '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(7, 7, 1, '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(8, 8, 1, '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(9, 9, 1, '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(10, 10, 1, '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(11, 11, 1, '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(12, 12, 1, '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(13, 13, 1, '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(14, 14, 1, '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(15, 1, 4, '2020-03-15 19:51:47', '2020-03-15 19:51:47'),
(16, 2, 4, '2020-03-15 19:51:49', '2020-03-15 19:51:49'),
(17, 14, 4, '2020-03-15 19:51:50', '2020-03-15 19:51:50'),
(18, 13, 4, '2020-03-15 19:51:51', '2020-03-15 19:51:51'),
(19, 12, 4, '2020-03-15 19:51:52', '2020-03-15 19:51:52'),
(20, 11, 4, '2020-03-15 19:51:52', '2020-03-15 19:51:52'),
(21, 10, 4, '2020-03-15 19:51:52', '2020-03-15 19:51:52'),
(22, 9, 4, '2020-03-15 19:51:53', '2020-03-15 19:51:53'),
(23, 8, 4, '2020-03-15 19:51:54', '2020-03-15 19:51:54'),
(24, 7, 4, '2020-03-15 19:51:54', '2020-03-15 19:51:54'),
(25, 6, 4, '2020-03-15 19:51:55', '2020-03-15 19:51:55'),
(26, 5, 4, '2020-03-15 19:51:55', '2020-03-15 19:51:55'),
(27, 4, 4, '2020-03-15 19:51:56', '2020-03-15 19:51:56'),
(28, 3, 4, '2020-03-15 19:51:56', '2020-03-15 19:51:56'),
(39, 2, 7, '2020-03-20 16:11:33', '2020-03-20 16:11:33'),
(40, 3, 7, '2020-03-20 16:11:34', '2020-03-20 16:11:34'),
(41, 4, 7, '2020-03-20 16:11:35', '2020-03-20 16:11:35'),
(42, 5, 7, '2020-03-20 16:11:35', '2020-03-20 16:11:35'),
(43, 6, 7, '2020-03-20 16:11:36', '2020-03-20 16:11:36'),
(44, 7, 7, '2020-03-20 16:11:37', '2020-03-20 16:11:37'),
(46, 9, 7, '2020-03-20 16:11:38', '2020-03-20 16:11:38'),
(47, 10, 7, '2020-03-20 16:11:38', '2020-03-20 16:11:38'),
(48, 11, 7, '2020-03-20 16:11:39', '2020-03-20 16:11:39'),
(49, 12, 7, '2020-03-20 16:11:39', '2020-03-20 16:11:39'),
(50, 13, 7, '2020-03-20 16:11:40', '2020-03-20 16:11:40'),
(51, 14, 7, '2020-03-20 16:11:40', '2020-03-20 16:11:40'),
(52, 15, 7, '2020-03-30 19:09:48', '2020-03-30 19:09:48'),
(53, 16, 7, '2020-03-30 19:09:49', '2020-03-30 19:09:49'),
(54, 17, 7, '2020-03-30 19:09:49', '2020-03-30 19:09:49'),
(55, 18, 7, '2020-03-30 19:09:50', '2020-03-30 19:09:50'),
(56, 19, 7, '2020-03-30 19:09:51', '2020-03-30 19:09:51'),
(57, 20, 7, '2020-03-30 19:09:52', '2020-03-30 19:09:52'),
(58, 21, 7, '2020-03-30 19:29:15', '2020-03-30 19:29:15'),
(59, 22, 7, '2020-03-30 19:29:16', '2020-03-30 19:29:16'),
(60, 23, 7, '2020-03-30 19:29:17', '2020-03-30 19:29:17'),
(61, 24, 7, '2020-03-30 19:29:18', '2020-03-30 19:29:18'),
(62, 25, 7, '2020-03-30 19:29:18', '2020-03-30 19:29:18'),
(63, 8, 7, '2020-04-03 15:41:50', '2020-04-03 15:41:50'),
(64, 32, 7, '2020-04-03 18:48:31', '2020-04-03 18:48:31'),
(65, 15, 4, '2020-04-03 22:24:59', '2020-04-03 22:24:59'),
(66, 16, 4, '2020-04-03 22:24:59', '2020-04-03 22:24:59'),
(67, 17, 4, '2020-04-03 22:25:00', '2020-04-03 22:25:00'),
(68, 18, 4, '2020-04-03 22:25:00', '2020-04-03 22:25:00'),
(69, 19, 4, '2020-04-03 22:25:01', '2020-04-03 22:25:01'),
(70, 20, 4, '2020-04-03 22:25:01', '2020-04-03 22:25:01'),
(71, 21, 4, '2020-04-03 22:25:02', '2020-04-03 22:25:02'),
(72, 22, 4, '2020-04-03 22:25:02', '2020-04-03 22:25:02'),
(73, 23, 4, '2020-04-03 22:25:07', '2020-04-03 22:25:07'),
(74, 24, 4, '2020-04-03 22:25:07', '2020-04-03 22:25:07'),
(75, 25, 4, '2020-04-03 22:25:08', '2020-04-03 22:25:08'),
(76, 26, 4, '2020-04-03 22:25:08', '2020-04-03 22:25:08'),
(77, 27, 4, '2020-04-03 22:25:09', '2020-04-03 22:25:09'),
(78, 28, 4, '2020-04-03 22:25:09', '2020-04-03 22:25:09'),
(79, 29, 4, '2020-04-03 22:25:10', '2020-04-03 22:25:10'),
(80, 30, 4, '2020-04-03 22:25:11', '2020-04-03 22:25:11'),
(81, 31, 4, '2020-04-03 22:25:14', '2020-04-03 22:25:14'),
(82, 32, 4, '2020-04-03 22:25:15', '2020-04-03 22:25:15'),
(83, 26, 7, '2020-04-03 22:25:36', '2020-04-03 22:25:36'),
(84, 27, 7, '2020-04-03 22:25:40', '2020-04-03 22:25:40'),
(85, 28, 7, '2020-04-03 22:25:40', '2020-04-03 22:25:40'),
(86, 29, 7, '2020-04-03 22:25:41', '2020-04-03 22:25:41'),
(87, 30, 7, '2020-04-03 22:25:42', '2020-04-03 22:25:42'),
(88, 31, 7, '2020-04-03 22:25:42', '2020-04-03 22:25:42'),
(89, 2, 8, '2020-04-05 18:14:01', '2020-04-05 18:14:01'),
(90, 3, 8, '2020-04-05 18:14:02', '2020-04-05 18:14:02'),
(92, 7, 8, '2020-04-05 18:14:08', '2020-04-05 18:14:08'),
(93, 8, 8, '2020-04-05 18:14:08', '2020-04-05 18:14:08'),
(94, 15, 8, '2020-04-05 18:14:17', '2020-04-05 18:14:17'),
(96, 17, 8, '2020-04-05 18:14:24', '2020-04-05 18:14:24'),
(97, 18, 8, '2020-04-05 18:14:25', '2020-04-05 18:14:25'),
(98, 19, 8, '2020-04-05 18:14:25', '2020-04-05 18:14:25'),
(99, 20, 8, '2020-04-05 18:14:26', '2020-04-05 18:14:26'),
(100, 22, 8, '2020-04-05 18:14:31', '2020-04-05 18:14:31'),
(101, 23, 8, '2020-04-05 18:14:33', '2020-04-05 18:14:33'),
(102, 24, 8, '2020-04-05 18:14:33', '2020-04-05 18:14:33'),
(103, 25, 8, '2020-04-05 18:14:34', '2020-04-05 18:14:34'),
(104, 26, 8, '2020-04-05 18:14:35', '2020-04-05 18:14:35'),
(105, 27, 8, '2020-04-05 18:14:40', '2020-04-05 18:14:40'),
(106, 28, 8, '2020-04-05 18:14:42', '2020-04-05 18:14:42'),
(110, 32, 8, '2020-04-05 18:14:59', '2020-04-05 18:14:59'),
(111, 21, 8, '2020-04-05 18:15:04', '2020-04-05 18:15:04'),
(112, 9, 8, '2020-04-05 18:15:16', '2020-04-05 18:15:16'),
(113, 5, 8, '2020-04-05 18:15:19', '2020-04-05 18:15:19'),
(114, 14, 8, '2020-04-05 18:19:11', '2020-04-05 18:19:11'),
(115, 13, 8, '2020-04-05 18:19:11', '2020-04-05 18:19:11'),
(116, 12, 8, '2020-04-05 18:19:11', '2020-04-05 18:19:11'),
(117, 11, 8, '2020-04-05 18:19:12', '2020-04-05 18:19:12'),
(118, 10, 8, '2020-04-05 18:19:16', '2020-04-05 18:19:16'),
(119, 6, 8, '2020-04-05 18:19:17', '2020-04-05 18:19:17'),
(121, 7, 5, '2020-04-08 18:58:47', '2020-04-08 18:58:47'),
(122, 8, 5, '2020-04-08 18:58:47', '2020-04-08 18:58:47'),
(123, 20, 5, '2020-04-08 18:59:00', '2020-04-08 18:59:00'),
(125, 23, 5, '2020-04-08 18:59:07', '2020-04-08 18:59:07'),
(126, 24, 5, '2020-04-08 18:59:08', '2020-04-08 18:59:08'),
(127, 25, 5, '2020-04-08 18:59:08', '2020-04-08 18:59:08'),
(128, 32, 5, '2020-04-08 18:59:20', '2020-04-08 18:59:20'),
(129, 1, 8, '2020-04-18 14:07:35', '2020-04-18 14:07:35'),
(130, 34, 4, '2020-04-18 14:13:54', '2020-04-18 14:13:54'),
(131, 1, 7, '2020-04-18 14:25:45', '2020-04-18 14:25:45'),
(133, 34, 5, '2020-04-20 11:59:03', '2020-04-20 11:59:03'),
(134, 33, 7, '2020-04-20 12:27:43', '2020-04-20 12:27:43'),
(135, 34, 7, '2020-04-20 12:27:43', '2020-04-20 12:27:43'),
(136, 1, 5, '2020-04-20 12:28:20', '2020-04-20 12:28:20'),
(137, 34, 8, '2020-04-20 14:07:02', '2020-04-20 14:07:02'),
(138, 35, 7, '2020-04-24 15:25:49', '2020-04-24 15:25:49'),
(140, 36, 7, '2020-04-26 21:03:52', '2020-04-26 21:03:52');

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `procurements`
--

CREATE TABLE `procurements` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `type` enum('internal','external','any') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `description` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RFPID` int(10) UNSIGNED DEFAULT NULL,
  `ContractID` int(10) UNSIGNED DEFAULT NULL,
  `specifications` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `approver_name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsable_id` int(10) UNSIGNED NOT NULL,
  `due_date` date NOT NULL,
  `cost` double(18,2) NOT NULL,
  `cost_currency_id` int(10) UNSIGNED NOT NULL,
  `quality_required` tinyint(4) NOT NULL,
  `contract_status` enum('starting','running','standby','finished','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` int(10) UNSIGNED NOT NULL,
  `provider_feedback` tinyint(4) NOT NULL,
  `delivery` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quality` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overallscore` tinyint(4) NOT NULL,
  `requirement_status` enum('starting','running','waiting','standby','finished','closed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivered_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `procurement_offers`
--

CREATE TABLE `procurement_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specifications` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_max_days_offered` tinyint(4) NOT NULL,
  `delivery_responsable` int(10) UNSIGNED NOT NULL,
  `cost` double(18,2) NOT NULL,
  `quality` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` int(10) UNSIGNED NOT NULL,
  `comment` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `procurement_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` date NOT NULL,
  `finish` date NOT NULL,
  `project_manager_id` int(10) UNSIGNED NOT NULL,
  `technical_director_id` int(10) UNSIGNED NOT NULL,
  `delivery_manager_id` int(10) UNSIGNED NOT NULL,
  `sow_number` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identificator` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Initiating','Planning','Executing','Closing','Waiting') COLLATE utf8mb4_unicode_ci NOT NULL,
  `presales_responsable` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `technical_estimator` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estimated_revenue` double(18,2) NOT NULL,
  `estimated_cost` double(18,2) NOT NULL,
  `estimated_margin` double(18,2) NOT NULL,
  `estimated_department_margin` double(8,2) DEFAULT NULL,
  `target_margin` double(18,2) NOT NULL,
  `financial_deviation_threshold` int(11) NOT NULL,
  `time_deviation_threshold` int(11) NOT NULL,
  `department_id` int(10) UNSIGNED DEFAULT NULL,
  `engagement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hours_by_day` int(10) UNSIGNED DEFAULT NULL,
  `holy_days` text COLLATE utf8mb4_unicode_ci,
  `name_convention` tinytext CHARACTER SET utf8 NOT NULL COMMENT 'Name Conventions for the Repository Documents',
  `audit_log` binary(1) NOT NULL COMMENT '0= No Log Generation 1= Log Generation',
  `create_task_from_email` bit(1) NOT NULL COMMENT '0= Not create 1= Create',
  `digital_signature_enabled` bit(1) NOT NULL COMMENT '0=Not Enabled 1= Enabled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `created_at`, `updated_at`, `name`, `customer_id`, `customer_name`, `start`, `finish`, `project_manager_id`, `technical_director_id`, `delivery_manager_id`, `sow_number`, `identificator`, `status`, `presales_responsable`, `technical_estimator`, `estimated_revenue`, `estimated_cost`, `estimated_margin`, `estimated_department_margin`, `target_margin`, `financial_deviation_threshold`, `time_deviation_threshold`, `department_id`, `engagement`, `hours_by_day`, `holy_days`, `name_convention`, `audit_log`, `create_task_from_email`, `digital_signature_enabled`) VALUES
(7, '2020-03-26 18:16:31', '2020-09-12 19:19:51', 'ALLDEV', 2, 'FlexDevice', '2020-03-21', '2020-06-21', 554, 561, 557, '0900-2020', 'ALLDEV-SOW-0900-2020', 'Executing', 'Carlos Garcia', 'Martin Plunkel', 104000.00, 50000.00, 50.00, 50.00, 50.00, 2, 10, 1, 'Time & Material', 7, '["0","6"]', '', 0x00, b'0', b'0'),
(8, '2020-09-10 21:14:34', '2020-09-10 21:27:45', 'TASKCONTROL FINALIZATION', 3, 'Roberto F.  Giangreco', '2020-09-24', '2020-10-30', 554, 561, 557, 'TaskControl #1-10-8-2020', 'TSKCTL-01-00-2020', 'Executing', 'Carlos Garcia', 'Roberto F. Giangreco', 2000.00, 2000.00, 50.00, 50.00, 50.00, 10, 5, 7, 'Fixed Price', 7, '["0","6"]', '', 0x00, b'0', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `project_expenses`
--

CREATE TABLE `project_expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(18,2) NOT NULL,
  `amount` double(18,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `expense_id` int(10) UNSIGNED DEFAULT NULL,
  `reimbursable` tinyint(1) NOT NULL,
  `frequency` enum('monthly','weekly') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_expenses`
--

INSERT INTO `project_expenses` (`id`, `created_at`, `updated_at`, `project_id`, `detail`, `cost`, `amount`, `currency_id`, `expense_id`, `reimbursable`, `frequency`) VALUES
(1, '2020-04-06 17:31:45', '2020-04-08 19:45:49', 7, 'Travel and others USA', 300.00, 300.00, 2, 6, 1, 'monthly');

-- --------------------------------------------------------

--
-- Table structure for table `project_kpi_alerts`
--

CREATE TABLE `project_kpi_alerts` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kpi_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `red_alert` double(18,2) NOT NULL,
  `yellow_alert` double(18,2) NOT NULL,
  `green_alert` double(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_materials`
--

CREATE TABLE `project_materials` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(18,2) NOT NULL,
  `amount` double(18,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `material_id` int(10) UNSIGNED DEFAULT NULL,
  `reimbursable` tinyint(1) NOT NULL,
  `frequency` enum('monthly','weekly') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_materials`
--

INSERT INTO `project_materials` (`id`, `created_at`, `updated_at`, `project_id`, `detail`, `cost`, `amount`, `currency_id`, `material_id`, `reimbursable`, `frequency`) VALUES
(1, '2020-04-06 17:31:45', '2020-04-06 17:31:45', 7, 'Digital Displays, Cables & Plastic Boxes', 1500.00, 1500.00, 2, 3, 1, 'monthly');

-- --------------------------------------------------------

--
-- Table structure for table `project_resources`
--

CREATE TABLE `project_resources` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `project_role_id` int(10) UNSIGNED NOT NULL,
  `seniority_id` int(10) UNSIGNED NOT NULL,
  `rate_id` int(10) UNSIGNED DEFAULT NULL,
  `rate` double(18,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `load` tinyint(4) NOT NULL,
  `workplace` enum('onsite','offshore') COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `office_id` int(10) UNSIGNED DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('ordinary','additional') COLLATE utf8mb4_unicode_ci DEFAULT 'ordinary'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_resources`
--

INSERT INTO `project_resources` (`id`, `created_at`, `updated_at`, `project_id`, `user_id`, `project_role_id`, `seniority_id`, `rate_id`, `rate`, `currency_id`, `load`, `workplace`, `comments`, `office_id`, `country_id`, `city_id`, `type`) VALUES
(1, '2020-04-06 17:31:45', '2020-04-26 18:58:02', 7, 554, 2, 3, 1, 25.00, 2, 50, 'offshore', 'test1', 1, 1, 2, 'ordinary'),
(2, '2020-04-06 17:31:45', '2020-04-10 22:47:59', 7, 553, 7, 3, 5, 28.12, 2, 50, 'offshore', 'First Billing Period Mar-2020', 4, 3, 9, 'ordinary'),
(3, '2020-04-06 17:31:45', '2020-04-10 22:48:32', 7, 547, 1, 2, 14, 18.75, 2, 100, 'offshore', 'First Billing Period Mar-2020', 5, 5, 8, 'ordinary'),
(4, '2020-04-06 17:31:45', '2020-04-10 22:48:45', 7, 551, 1, 2, 14, 18.75, 2, 100, 'offshore', 'First Billing Period Mar-2020', 5, 5, 8, 'ordinary'),
(5, '2020-04-06 17:31:45', '2020-04-10 22:50:55', 7, 552, 4, 3, 6, 15.62, 2, 100, 'offshore', 'First Billing Period Mar-2020', 3, 4, 5, 'ordinary'),
(6, '2020-04-06 17:31:45', '2020-04-10 22:51:12', 7, 556, 6, 3, 2, 18.75, 2, 50, 'offshore', 'First Billing Period Mar-2020', 2, 1, 6, 'ordinary'),
(7, '2020-04-06 17:31:45', '2020-04-10 22:50:38', 7, 555, 3, 2, 10, 15.62, 2, 100, 'offshore', 'First Billing Period Mar-2020', 2, 1, 6, 'ordinary'),
(8, '2020-04-06 17:31:45', '2020-04-10 22:51:42', 7, 557, 5, 3, 4, 31.25, 2, 25, 'offshore', 'First Billing Period Mar-2020', 1, 1, 2, 'ordinary'),
(9, '2020-04-13 18:36:26', '2020-04-26 17:26:53', 7, 553, 7, 3, 5, 28.12, 2, 0, 'offshore', 'First Billing Period Mar-2020', 4, 3, 9, 'ordinary'),
(10, '2020-04-13 18:36:26', '2020-04-26 17:26:26', 7, 547, 2, 3, 1, 25.00, 2, 0, 'offshore', 'First Billing Period Mar-2020', 1, 1, 2, 'ordinary'),
(11, '2020-04-13 18:36:26', '2020-04-26 17:27:28', 7, 551, 1, 2, 14, 18.75, 2, 0, 'offshore', 'First Billing Period Mar-2020', 5, 5, 8, 'ordinary'),
(138, '2020-09-12 19:23:39', '2020-09-12 19:23:39', 7, 553, 7, 3, 5, 28.12, 2, 0, 'offshore', '', 4, 3, 9, 'additional'),
(139, '2020-09-12 19:23:40', '2020-09-12 19:23:40', 7, 547, 1, 2, 14, 18.75, 2, 0, 'offshore', '', 5, 5, 8, 'additional'),
(140, '2020-09-12 19:23:40', '2020-09-12 19:23:40', 7, 551, 1, 2, 14, 18.75, 2, 0, 'offshore', '', 5, 5, 8, 'additional');

-- --------------------------------------------------------

--
-- Table structure for table `project_roles`
--

CREATE TABLE `project_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_roles`
--

INSERT INTO `project_roles` (`id`, `created_at`, `updated_at`, `company_id`, `title`) VALUES
(1, '2020-03-14 20:48:16', '2020-04-17 18:03:16', 1, 'PHP Developer'),
(2, '2020-03-14 20:48:25', '2020-03-14 20:48:25', 1, 'Project Manager'),
(3, '2020-03-14 20:48:55', '2020-03-14 20:50:40', 1, 'QA Analyst'),
(4, '2020-03-14 20:49:13', '2020-03-14 20:49:13', 1, 'Web Developer'),
(5, '2020-03-14 20:49:28', '2020-03-14 20:49:28', 1, 'Delivery Manager'),
(6, '2020-03-14 20:49:42', '2020-03-14 20:49:42', 1, 'UX Designer'),
(7, '2020-03-14 20:49:59', '2020-03-14 20:49:59', 1, 'Technical Leader'),
(28, '2020-03-20 19:49:24', '2020-03-20 19:49:24', 1, 'Technical Director'),
(29, '2020-04-17 18:03:30', '2020-04-17 18:03:30', 1, 'Python Developer');

-- --------------------------------------------------------

--
-- Table structure for table `project_role_templates`
--

CREATE TABLE `project_role_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_role_templates`
--

INSERT INTO `project_role_templates` (`id`, `created_at`, `updated_at`, `title`) VALUES
(1, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Project Manager'),
(2, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Program Manager'),
(3, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Delivery Manager'),
(4, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Technical Leader'),
(5, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Functional Analyst');

-- --------------------------------------------------------

--
-- Table structure for table `project_services`
--

CREATE TABLE `project_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(18,2) NOT NULL,
  `amount` double(18,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED DEFAULT NULL,
  `reimbursable` tinyint(1) NOT NULL,
  `frequency` enum('monthly','weekly') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_services`
--

INSERT INTO `project_services` (`id`, `created_at`, `updated_at`, `project_id`, `detail`, `cost`, `amount`, `currency_id`, `service_id`, `reimbursable`, `frequency`) VALUES
(1, '2020-04-06 17:31:45', '2020-04-08 19:45:26', 7, 'Hosting & Devices compatibilities DB Services', 250.00, 250.00, 2, 4, 1, 'monthly');

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `email_1` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_2` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_3` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_1` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_2` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_3` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `swiftcode` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aba` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `industry_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `created_at`, `updated_at`, `name`, `address`, `city_id`, `email_1`, `email_2`, `email_3`, `phone_1`, `phone_2`, `phone_3`, `billing_name`, `billing_address`, `tax_number`, `bank_name`, `account_number`, `swiftcode`, `aba`, `currency_id`, `industry_id`, `company_id`) VALUES
(1, '2020-03-14 21:30:00', '2020-10-09 12:03:45', 'MicroChips Inc.', 'Sunset Boulevard 2342', 7, 'contact@microchips.com', '', '', '9998878 INT 232', '', '', 'MicroChips Inc.', 'Sunset Boulevard 2342', '', 'Bank of America', '87929-23', 'BOA23456786', '192837465', 2, 23, 1),
(3, '2020-03-14 21:45:52', '2020-03-20 16:24:01', 'Internationals Displays Inc.', 'Ocean Streen 2090 - Florida, USA', 7, 'contact@internationalsdisplays.com', 'contact2@internationaldisplays.com', '', '2342-234234', '', '', 'Internationals Displays Inc.', 'Ocean Streen 2090 - Florida, USA', '', 'HSBC', '88876', 'HSB8076287', '987654321', 2, 23, 1),
(4, '2020-09-10 21:31:25', '2020-09-10 21:31:25', 'Workana', 'San Martin 2342', 2, 'support@workana.com.ar', '', '', '123123123', '', '', 'Workana LLC', 'San Martin 2323', '213123123', 'City Bank', '123123213', '123123', '123123', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `number` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `concept` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `due_date` date DEFAULT NULL,
  `total` double(8,2) NOT NULL,
  `bill_to` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remit_to` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emited` tinyint(1) NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `created_at`, `updated_at`, `project_id`, `customer_id`, `number`, `concept`, `from`, `to`, `contact_id`, `currency_id`, `due_date`, `total`, `bill_to`, `remit_to`, `emited`, `comments`) VALUES
(1, '2020-04-24 17:42:51', '2020-04-24 17:43:13', 7, 2, '212312', 'asdasd', '2020-03-21', '2020-06-21', 13, 2, '2020-04-19', 6510.00, 'FlexDevice', 'GoitGlobal', 1, 'sd'),
(2, '2020-04-24 17:49:51', '2020-04-24 17:49:51', 7, 2, '31233', 'asdasd', '2020-03-21', '2020-06-21', 13, 2, '2020-04-26', 0.00, 'FlexDevice', 'GoitGlobal', 0, ''),
(3, '2020-04-24 17:53:34', '2020-04-24 17:53:34', 7, 2, '2234234', 'sdfsdf', '2020-03-21', '2020-06-21', 13, 2, '2020-04-18', 0.00, 'FlexDevice', 'GoitGlobal', 0, 'sdf'),
(5, '2020-04-24 21:07:22', '2020-04-24 21:10:05', 7, 2, 'Quotation # 1', 'Test Quotation', '2020-03-21', '2020-06-21', 12, 2, '2020-04-30', 6510.00, 'FlexDevice', 'GoitGlobal', 1, 'This prices valid up to April 30th, 2020.-'),
(6, '2020-04-26 18:49:41', '2020-04-26 18:49:53', 7, 2, 'Number 1', 'Quotation for ALLDEV project', '2020-03-21', '2020-06-21', 12, 2, '2020-04-30', 6510.00, 'FlexDevice', 'GoitGlobal', 1, 'Just the first Quotation for the whole Project'),
(7, '2020-04-27 15:20:33', '2020-04-27 15:20:49', 7, 2, '24234', 'dasd', '2020-03-21', '2020-06-21', 13, 2, '2020-05-03', 6510.00, 'FlexDevice', 'GoitGlobal', 1, ''),
(8, '2020-04-27 19:36:48', '2020-04-27 19:43:05', 7, 2, '312312', 'adasdas', '2020-03-21', '2020-06-21', 13, 2, '2020-04-25', 6510.00, 'FlexDevice', 'GoitGlobal', 1, ''),
(9, '2020-04-27 19:43:52', '2020-04-27 19:43:55', 7, 2, '312312', 'sasdasd', '2020-03-21', '2020-06-21', 13, 3, '2020-04-12', 6510.00, 'FlexDevice', 'GoitGlobal', 1, 'asd'),
(10, '2020-04-30 18:32:25', '2020-04-30 18:32:45', 7, 2, 'QUOTATION-30-4-2020', 'ALLDEV PROJECT', '2020-03-21', '2020-06-21', 12, 2, '2020-04-30', 7995.75, 'FlexDevice', 'GoitGlobal', 1, 'First Quotation for the AllDev Project from 21-3-2020 thru 21-6-2020');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_expenses`
--

CREATE TABLE `quotation_expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quotation_id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(18,2) NOT NULL,
  `cost` double(18,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_lines`
--

CREATE TABLE `quotation_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quotation_id` int(10) UNSIGNED NOT NULL,
  `role` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `workplace` enum('onsite','offshore') COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phase` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `load` tinyint(4) NOT NULL,
  `workinghours` double(3,2) NOT NULL,
  `comments` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_materials`
--

CREATE TABLE `quotation_materials` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quotation_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(18,2) NOT NULL,
  `amount` double(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotation_materials`
--

INSERT INTO `quotation_materials` (`id`, `created_at`, `updated_at`, `quotation_id`, `currency_id`, `detail`, `cost`, `amount`) VALUES
(1, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 2, 'Cables & Plugs', 40.00, 100.00),
(2, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 2, 'Plastic Boxes', 80.00, 100.00),
(3, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 2, 'Digital Displays', 50.00, 100.00),
(4, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 2, 'Special Envelope for the Device', 450.00, 450.00),
(9, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 2, 'Cables & Plugs', 40.00, 100.00),
(10, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 2, 'Plastic Boxes', 80.00, 100.00),
(11, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 2, 'Digital Displays', 50.00, 100.00),
(12, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 2, 'Special Envelope for the Device', 450.00, 450.00),
(13, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 2, 'Cables & Plugs', 40.00, 100.00),
(14, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 2, 'Plastic Boxes', 80.00, 100.00),
(15, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 2, 'Digital Displays', 50.00, 100.00),
(16, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 2, 'Special Envelope for the Device', 450.00, 450.00),
(17, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 2, 'Cables & Plugs', 40.00, 100.00),
(18, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 2, 'Plastic Boxes', 80.00, 100.00),
(19, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 2, 'Digital Displays', 50.00, 100.00),
(20, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 2, 'Special Envelope for the Device', 450.00, 450.00),
(21, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 2, 'Cables & Plugs', 40.00, 100.00),
(22, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 2, 'Plastic Boxes', 80.00, 100.00),
(23, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 2, 'Digital Displays', 50.00, 100.00),
(24, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 2, 'Special Envelope for the Device', 450.00, 450.00),
(25, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 3, 'Cables & Plugs', 40.00, 100.00),
(26, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 3, 'Plastic Boxes', 80.00, 100.00),
(27, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 3, 'Digital Displays', 50.00, 100.00),
(28, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 3, 'Special Envelope for the Device', 450.00, 450.00),
(29, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 2, 'Cables & Plugs', 40.00, 100.00),
(30, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 2, 'Plastic Boxes', 80.00, 100.00),
(31, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 2, 'Digital Displays', 50.00, 100.00),
(32, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 2, 'Special Envelope for the Device', 450.00, 450.00);

-- --------------------------------------------------------

--
-- Table structure for table `quotation_resources`
--

CREATE TABLE `quotation_resources` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quotation_id` int(10) UNSIGNED NOT NULL,
  `project_role_id` int(10) UNSIGNED NOT NULL,
  `seniority_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `load` tinyint(4) NOT NULL,
  `workplace` enum('onsite','offshore') COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(18,2) NOT NULL,
  `rate_id` int(10) UNSIGNED DEFAULT NULL,
  `hours` int(11) NOT NULL,
  `type` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `office_id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotation_resources`
--

INSERT INTO `quotation_resources` (`id`, `created_at`, `updated_at`, `quotation_id`, `project_role_id`, `seniority_id`, `currency_id`, `load`, `workplace`, `rate`, `rate_id`, `hours`, `type`, `user_id`, `comments`, `office_id`, `country_id`, `city_id`, `task_id`) VALUES
(1, '2020-04-24 17:42:52', '2020-04-24 17:42:52', 1, 7, 3, 2, 100, 'offshore', 0.00, NULL, 296, '', 553, NULL, 4, 3, 9, NULL),
(2, '2020-04-24 17:42:52', '2020-04-24 17:42:52', 1, 3, 3, 2, 100, 'offshore', 0.00, NULL, 196, '', 556, NULL, 2, 1, 6, NULL),
(3, '2020-04-24 17:42:53', '2020-04-24 17:42:53', 1, 1, 2, 2, 100, 'offshore', 0.00, NULL, 605, '', 551, NULL, 5, 5, 8, NULL),
(4, '2020-04-24 17:42:53', '2020-04-24 17:42:53', 1, 28, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 561, NULL, 1, 1, 2, NULL),
(5, '2020-04-24 17:42:54', '2020-04-24 17:42:54', 1, 7, 3, 2, 100, 'offshore', 0.00, NULL, 296, '', 553, NULL, 4, 3, 9, NULL),
(6, '2020-04-24 17:42:54', '2020-04-24 17:42:54', 1, 2, 3, 2, 100, 'offshore', 0.00, NULL, 591, '', 554, NULL, 1, 1, 2, NULL),
(7, '2020-04-24 17:42:55', '2020-04-24 17:42:55', 1, 7, 3, 2, 100, 'offshore', 0.00, NULL, 296, '', 553, NULL, 4, 3, 9, NULL),
(8, '2020-04-24 17:42:55', '2020-04-24 17:42:55', 1, 7, 3, 2, 100, 'offshore', 0.00, NULL, 296, '', 553, NULL, 4, 3, 9, NULL),
(9, '2020-04-24 17:42:56', '2020-04-24 17:42:56', 1, 3, 3, 2, 100, 'offshore', 0.00, NULL, 196, '', 556, NULL, 2, 1, 6, NULL),
(10, '2020-04-24 17:42:56', '2020-04-24 17:42:56', 1, 7, 3, 2, 100, 'offshore', 0.00, NULL, 296, '', 553, NULL, 4, 3, 9, NULL),
(11, '2020-04-24 17:42:57', '2020-04-24 17:42:57', 1, 7, 3, 2, 100, 'offshore', 0.00, NULL, 296, '', 553, NULL, 4, 3, 9, NULL),
(12, '2020-04-24 17:42:57', '2020-04-24 17:42:57', 1, 3, 3, 2, 100, 'offshore', 0.00, NULL, 196, '', 556, NULL, 2, 1, 6, NULL),
(13, '2020-04-24 17:42:58', '2020-04-24 17:42:58', 1, 1, 2, 2, 100, 'offshore', 0.00, NULL, 612, '', 547, NULL, 5, 5, 8, NULL),
(14, '2020-04-24 17:42:58', '2020-04-24 17:42:58', 1, 3, 3, 2, 100, 'offshore', 0.00, NULL, 196, '', 556, NULL, 2, 1, 6, NULL),
(15, '2020-04-24 17:42:59', '2020-04-24 17:42:59', 1, 2, 3, 2, 100, 'offshore', 0.00, NULL, 591, '', 554, NULL, 1, 1, 2, NULL),
(16, '2020-04-24 17:42:59', '2020-04-24 17:42:59', 1, 5, 3, 2, 100, 'offshore', 0.00, NULL, 146, '', 557, NULL, 1, 1, 2, NULL),
(17, '2020-04-24 17:43:00', '2020-04-24 17:43:00', 1, 28, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 561, NULL, 1, 1, 2, NULL),
(18, '2020-04-24 17:43:00', '2020-04-24 17:43:00', 1, 2, 3, 2, 100, 'offshore', 0.00, NULL, 591, '', 554, NULL, 1, 1, 2, NULL),
(19, '2020-04-24 17:43:01', '2020-04-24 17:43:01', 1, 5, 3, 2, 100, 'offshore', 0.00, NULL, 146, '', 557, NULL, 1, 1, 2, NULL),
(20, '2020-04-24 17:43:01', '2020-04-24 17:43:01', 1, 3, 3, 2, 100, 'offshore', 0.00, NULL, 196, '', 556, NULL, 2, 1, 6, NULL),
(21, '2020-04-24 17:43:02', '2020-04-24 17:43:02', 1, 2, 3, 2, 100, 'offshore', 0.00, NULL, 591, '', 554, NULL, 1, 1, 2, NULL),
(22, '2020-04-24 17:43:02', '2020-04-24 17:43:02', 1, 1, 2, 2, 100, 'offshore', 0.00, NULL, 612, '', 547, NULL, 5, 5, 8, NULL),
(23, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 2, 3, 2, 100, 'offshore', 0.00, NULL, 196, '', 556, NULL, 2, 1, 6, NULL),
(47, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 7, 3, 2, 100, 'offshore', 13.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(48, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 3, 3, 2, 100, 'offshore', 30.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(49, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 1, 2, 2, 100, 'offshore', 18.00, NULL, 0, '', 551, NULL, 5, 5, 8, NULL),
(50, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 28, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 561, NULL, 1, 1, 2, NULL),
(51, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(52, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(53, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(54, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(55, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(56, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 7, 3, 2, 100, 'offshore', 17.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(57, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(58, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(59, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 1, 2, 2, 100, 'offshore', 0.00, NULL, 0, '', 547, NULL, 5, 5, 8, NULL),
(60, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(61, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(62, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 5, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 557, NULL, 1, 1, 2, NULL),
(63, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 28, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 561, NULL, 1, 1, 2, NULL),
(64, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(65, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 5, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 557, NULL, 1, 1, 2, NULL),
(66, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(67, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(68, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 1, 2, 2, 100, 'offshore', 18.75, NULL, 0, '', 547, NULL, 5, 5, 8, NULL),
(69, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 2, 3, 2, 100, 'offshore', 25.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(70, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 7, 3, 2, 100, 'offshore', 13.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(71, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 3, 3, 2, 100, 'offshore', 30.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(72, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 1, 2, 2, 100, 'offshore', 18.00, NULL, 0, '', 551, NULL, 5, 5, 8, NULL),
(73, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 28, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 561, NULL, 1, 1, 2, NULL),
(74, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(75, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(76, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(77, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(78, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(79, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 7, 3, 2, 100, 'offshore', 17.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(80, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(81, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(82, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 1, 2, 2, 100, 'offshore', 0.00, NULL, 0, '', 547, NULL, 5, 5, 8, NULL),
(83, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(84, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(85, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 5, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 557, NULL, 1, 1, 2, NULL),
(86, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 28, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 561, NULL, 1, 1, 2, NULL),
(87, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(88, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 5, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 557, NULL, 1, 1, 2, NULL),
(89, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(90, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(91, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 1, 2, 2, 100, 'offshore', 18.75, NULL, 0, '', 547, NULL, 5, 5, 8, NULL),
(92, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 2, 3, 2, 100, 'offshore', 25.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(93, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 7, 3, 2, 100, 'offshore', 13.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(94, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 3, 3, 2, 100, 'offshore', 30.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(95, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 1, 2, 2, 100, 'offshore', 18.00, NULL, 0, '', 551, NULL, 5, 5, 8, NULL),
(96, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 28, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 561, NULL, 1, 1, 2, NULL),
(97, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(98, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(99, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(100, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(101, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(102, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 7, 3, 2, 100, 'offshore', 17.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(103, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(104, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(105, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 1, 2, 2, 100, 'offshore', 0.00, NULL, 0, '', 547, NULL, 5, 5, 8, NULL),
(106, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(107, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(108, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 5, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 557, NULL, 1, 1, 2, NULL),
(109, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 28, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 561, NULL, 1, 1, 2, NULL),
(110, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(111, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 5, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 557, NULL, 1, 1, 2, NULL),
(112, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(113, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(114, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 1, 2, 2, 100, 'offshore', 18.75, NULL, 0, '', 547, NULL, 5, 5, 8, NULL),
(115, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 2, 3, 2, 100, 'offshore', 25.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(116, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 7, 3, 2, 100, 'offshore', 13.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(117, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 3, 3, 2, 100, 'offshore', 30.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(118, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 1, 2, 2, 100, 'offshore', 18.00, NULL, 0, '', 551, NULL, 5, 5, 8, NULL),
(119, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 28, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 561, NULL, 1, 1, 2, NULL),
(120, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(121, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(122, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(123, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(124, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(125, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 7, 3, 2, 100, 'offshore', 17.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(126, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(127, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(128, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 1, 2, 2, 100, 'offshore', 0.00, NULL, 0, '', 547, NULL, 5, 5, 8, NULL),
(129, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(130, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(131, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 5, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 557, NULL, 1, 1, 2, NULL),
(132, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 28, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 561, NULL, 1, 1, 2, NULL),
(133, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(134, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 5, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 557, NULL, 1, 1, 2, NULL),
(135, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(136, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(137, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 1, 2, 2, 100, 'offshore', 18.75, NULL, 0, '', 547, NULL, 5, 5, 8, NULL),
(138, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 2, 3, 2, 100, 'offshore', 25.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(139, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 7, 3, 3, 100, 'offshore', 13.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(140, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 3, 3, 3, 100, 'offshore', 30.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(141, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 1, 2, 3, 100, 'offshore', 18.00, NULL, 0, '', 551, NULL, 5, 5, 8, NULL),
(142, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 28, 3, 3, 100, 'offshore', 0.00, NULL, 0, '', 561, NULL, 1, 1, 2, NULL),
(143, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 7, 3, 3, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(144, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 2, 3, 3, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(145, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 7, 3, 3, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(146, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 7, 3, 3, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(147, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 3, 3, 3, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(148, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 7, 3, 3, 100, 'offshore', 17.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(149, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 7, 3, 3, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, NULL),
(150, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 3, 3, 3, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(151, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 1, 2, 3, 100, 'offshore', 0.00, NULL, 0, '', 547, NULL, 5, 5, 8, NULL),
(152, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 3, 3, 3, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(153, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 2, 3, 3, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(154, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 5, 3, 3, 100, 'offshore', 0.00, NULL, 0, '', 557, NULL, 1, 1, 2, NULL),
(155, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 28, 3, 3, 100, 'offshore', 0.00, NULL, 0, '', 561, NULL, 1, 1, 2, NULL),
(156, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 2, 3, 3, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(157, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 5, 3, 3, 100, 'offshore', 0.00, NULL, 0, '', 557, NULL, 1, 1, 2, NULL),
(158, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 3, 3, 3, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(159, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 2, 3, 3, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, NULL),
(160, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 1, 2, 3, 100, 'offshore', 18.75, NULL, 0, '', 547, NULL, 5, 5, 8, NULL),
(161, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 2, 3, 3, 100, 'offshore', 25.00, NULL, 0, '', 556, NULL, 2, 1, 6, NULL),
(162, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 7, 3, 2, 100, 'offshore', 13.00, NULL, 13, '', 553, NULL, 4, 3, 9, 363),
(163, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 3, 3, 2, 100, 'offshore', 30.00, NULL, 13, '', 556, NULL, 2, 1, 6, 363),
(164, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 1, 2, 2, 100, 'offshore', 18.00, NULL, 23, '', 551, NULL, 5, 5, 8, 363),
(165, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 28, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 561, NULL, 1, 1, 2, 385),
(166, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, 385),
(167, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, 386),
(168, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, 386),
(169, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, 389),
(170, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, 374),
(171, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 7, 3, 2, 100, 'offshore', 17.00, NULL, 7, '', 553, NULL, 4, 3, 9, 375),
(172, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 7, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 553, NULL, 4, 3, 9, 380),
(173, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, 381),
(174, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 1, 2, 2, 100, 'offshore', 0.00, NULL, 1, '', 547, NULL, 5, 5, 8, 382),
(175, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, 385),
(176, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, 385),
(177, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 5, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 557, NULL, 1, 1, 2, 385),
(178, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 28, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 561, NULL, 1, 1, 2, 386),
(179, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, 387),
(180, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 5, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 557, NULL, 1, 1, 2, 389),
(181, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 3, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 556, NULL, 2, 1, 6, 389),
(182, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 2, 3, 2, 100, 'offshore', 0.00, NULL, 0, '', 554, NULL, 1, 1, 2, 395),
(183, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 1, 2, 2, 100, 'offshore', 18.75, NULL, 5, '', 547, NULL, 5, 5, 8, 363),
(184, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 2, 3, 2, 100, 'offshore', 25.00, NULL, 12, '', 556, NULL, 2, 1, 6, 363);

-- --------------------------------------------------------

--
-- Table structure for table `quotation_services`
--

CREATE TABLE `quotation_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quotation_id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(18,2) NOT NULL,
  `cost` double(18,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotation_services`
--

INSERT INTO `quotation_services` (`id`, `created_at`, `updated_at`, `quotation_id`, `detail`, `amount`, `cost`, `currency_id`) VALUES
(1, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'All Devices DB', 500.00, 200.00, 2),
(2, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'TestMyDevice Service', 180.00, 150.00, 2),
(3, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'TestMyDevice Service', 180.00, 150.00, 2),
(4, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'Hosting BlueHost', 250.00, 100.00, 2),
(5, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'TestMyDevice Service', 180.00, 180.00, 2),
(6, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'TestMyDevice Service', 180.00, 180.00, 2),
(7, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'TestMyDevice Service', 180.00, 180.00, 2),
(8, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'Hosting BlueHost', 250.00, 100.00, 2),
(9, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'Hosting BlueHost', 250.00, 100.00, 2),
(10, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'TestMyDevice Service', 150.00, 180.00, 2),
(11, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'Hosting BlueHost', 250.00, 100.00, 2),
(12, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'All Devices DB', 200.00, 200.00, 2),
(13, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'Hosting BlueHost', 250.00, 100.00, 2),
(14, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'TestMyDevice Service', 180.00, 150.00, 2),
(15, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'Hosting BlueHost', 250.00, 100.00, 2),
(16, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'TestMyDevice Service', 180.00, 140.00, 2),
(17, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'Hosting BlueHost', 250.00, 100.00, 2),
(18, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'All Devices DB', 200.00, 150.00, 2),
(19, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'Hosting BlueHost', 250.00, 100.00, 2),
(20, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'International Shipment (to USA)', 450.00, 450.00, 2),
(21, '2020-04-24 17:43:03', '2020-04-24 17:43:03', 1, 'Visa, Tickets to USA, Travel Perdiem', 1000.00, 1000.00, 2),
(43, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'All Devices DB', 500.00, 200.00, 2),
(44, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'TestMyDevice Service', 180.00, 150.00, 2),
(45, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'TestMyDevice Service', 180.00, 150.00, 2),
(46, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'Hosting BlueHost', 250.00, 100.00, 2),
(47, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'TestMyDevice Service', 180.00, 180.00, 2),
(48, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'TestMyDevice Service', 180.00, 180.00, 2),
(49, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'TestMyDevice Service', 180.00, 180.00, 2),
(50, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'Hosting BlueHost', 250.00, 100.00, 2),
(51, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'Hosting BlueHost', 250.00, 100.00, 2),
(52, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'TestMyDevice Service', 150.00, 180.00, 2),
(53, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'Hosting BlueHost', 250.00, 100.00, 2),
(54, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'All Devices DB', 200.00, 200.00, 2),
(55, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'Hosting BlueHost', 250.00, 100.00, 2),
(56, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'TestMyDevice Service', 180.00, 150.00, 2),
(57, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'Hosting BlueHost', 250.00, 100.00, 2),
(58, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'TestMyDevice Service', 180.00, 140.00, 2),
(59, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'Hosting BlueHost', 250.00, 100.00, 2),
(60, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'All Devices DB', 200.00, 150.00, 2),
(61, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'Hosting BlueHost', 250.00, 100.00, 2),
(62, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'International Shipment (to USA)', 450.00, 450.00, 2),
(63, '2020-04-24 21:07:23', '2020-04-24 21:07:23', 5, 'Visa, Tickets to USA, Travel Perdiem', 1000.00, 1000.00, 2),
(64, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'All Devices DB', 500.00, 200.00, 2),
(65, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'TestMyDevice Service', 180.00, 150.00, 2),
(66, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'TestMyDevice Service', 180.00, 150.00, 2),
(67, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'Hosting BlueHost', 250.00, 100.00, 2),
(68, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'TestMyDevice Service', 180.00, 180.00, 2),
(69, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'TestMyDevice Service', 180.00, 180.00, 2),
(70, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'TestMyDevice Service', 180.00, 180.00, 2),
(71, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'Hosting BlueHost', 250.00, 100.00, 2),
(72, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'Hosting BlueHost', 250.00, 100.00, 2),
(73, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'TestMyDevice Service', 150.00, 180.00, 2),
(74, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'Hosting BlueHost', 250.00, 100.00, 2),
(75, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'All Devices DB', 200.00, 200.00, 2),
(76, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'Hosting BlueHost', 250.00, 100.00, 2),
(77, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'TestMyDevice Service', 180.00, 150.00, 2),
(78, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'Hosting BlueHost', 250.00, 100.00, 2),
(79, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'TestMyDevice Service', 180.00, 140.00, 2),
(80, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'Hosting BlueHost', 250.00, 100.00, 2),
(81, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'All Devices DB', 200.00, 150.00, 2),
(82, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'Hosting BlueHost', 250.00, 100.00, 2),
(83, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'International Shipment (to USA)', 450.00, 450.00, 2),
(84, '2020-04-26 18:49:41', '2020-04-26 18:49:41', 6, 'Visa, Tickets to USA, Travel Perdiem', 1000.00, 1000.00, 2),
(85, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'All Devices DB', 500.00, 200.00, 2),
(86, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'TestMyDevice Service', 180.00, 150.00, 2),
(87, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'TestMyDevice Service', 180.00, 150.00, 2),
(88, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'Hosting BlueHost', 250.00, 100.00, 2),
(89, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'TestMyDevice Service', 180.00, 180.00, 2),
(90, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'TestMyDevice Service', 180.00, 180.00, 2),
(91, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'TestMyDevice Service', 180.00, 180.00, 2),
(92, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'Hosting BlueHost', 250.00, 100.00, 2),
(93, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'Hosting BlueHost', 250.00, 100.00, 2),
(94, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'TestMyDevice Service', 150.00, 180.00, 2),
(95, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'Hosting BlueHost', 250.00, 100.00, 2),
(96, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'All Devices DB', 200.00, 200.00, 2),
(97, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'Hosting BlueHost', 250.00, 100.00, 2),
(98, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'TestMyDevice Service', 180.00, 150.00, 2),
(99, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'Hosting BlueHost', 250.00, 100.00, 2),
(100, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'TestMyDevice Service', 180.00, 140.00, 2),
(101, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'Hosting BlueHost', 250.00, 100.00, 2),
(102, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'All Devices DB', 200.00, 150.00, 2),
(103, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'Hosting BlueHost', 250.00, 100.00, 2),
(104, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'International Shipment (to USA)', 450.00, 450.00, 2),
(105, '2020-04-27 15:20:33', '2020-04-27 15:20:33', 7, 'Visa, Tickets to USA, Travel Perdiem', 1000.00, 1000.00, 2),
(106, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'All Devices DB', 500.00, 200.00, 2),
(107, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'TestMyDevice Service', 180.00, 150.00, 2),
(108, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'TestMyDevice Service', 180.00, 150.00, 2),
(109, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'Hosting BlueHost', 250.00, 100.00, 2),
(110, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'TestMyDevice Service', 180.00, 180.00, 2),
(111, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'TestMyDevice Service', 180.00, 180.00, 2),
(112, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'TestMyDevice Service', 180.00, 180.00, 2),
(113, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'Hosting BlueHost', 250.00, 100.00, 2),
(114, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'Hosting BlueHost', 250.00, 100.00, 2),
(115, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'TestMyDevice Service', 150.00, 180.00, 2),
(116, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'Hosting BlueHost', 250.00, 100.00, 2),
(117, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'All Devices DB', 200.00, 200.00, 2),
(118, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'Hosting BlueHost', 250.00, 100.00, 2),
(119, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'TestMyDevice Service', 180.00, 150.00, 2),
(120, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'Hosting BlueHost', 250.00, 100.00, 2),
(121, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'TestMyDevice Service', 180.00, 140.00, 2),
(122, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'Hosting BlueHost', 250.00, 100.00, 2),
(123, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'All Devices DB', 200.00, 150.00, 2),
(124, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'Hosting BlueHost', 250.00, 100.00, 2),
(125, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'International Shipment (to USA)', 450.00, 450.00, 2),
(126, '2020-04-27 19:36:48', '2020-04-27 19:36:48', 8, 'Visa, Tickets to USA, Travel Perdiem', 1000.00, 1000.00, 2),
(127, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'All Devices DB', 500.00, 200.00, 3),
(128, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'TestMyDevice Service', 180.00, 150.00, 3),
(129, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'TestMyDevice Service', 180.00, 150.00, 3),
(130, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'Hosting BlueHost', 250.00, 100.00, 3),
(131, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'TestMyDevice Service', 180.00, 180.00, 3),
(132, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'TestMyDevice Service', 180.00, 180.00, 3),
(133, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'TestMyDevice Service', 180.00, 180.00, 3),
(134, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'Hosting BlueHost', 250.00, 100.00, 3),
(135, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'Hosting BlueHost', 250.00, 100.00, 3),
(136, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'TestMyDevice Service', 150.00, 180.00, 3),
(137, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'Hosting BlueHost', 250.00, 100.00, 3),
(138, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'All Devices DB', 200.00, 200.00, 3),
(139, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'Hosting BlueHost', 250.00, 100.00, 3),
(140, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'TestMyDevice Service', 180.00, 150.00, 3),
(141, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'Hosting BlueHost', 250.00, 100.00, 3),
(142, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'TestMyDevice Service', 180.00, 140.00, 3),
(143, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'Hosting BlueHost', 250.00, 100.00, 3),
(144, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'All Devices DB', 200.00, 150.00, 3),
(145, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'Hosting BlueHost', 250.00, 100.00, 3),
(146, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'International Shipment (to USA)', 450.00, 450.00, 3),
(147, '2020-04-27 19:43:52', '2020-04-27 19:43:52', 9, 'Visa, Tickets to USA, Travel Perdiem', 1000.00, 1000.00, 3),
(148, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'All Devices DB', 500.00, 200.00, 2),
(150, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'TestMyDevice Service', 180.00, 150.00, 2),
(151, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'Hosting BlueHost', 250.00, 100.00, 2),
(152, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'TestMyDevice Service', 180.00, 180.00, 2),
(153, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'TestMyDevice Service', 180.00, 180.00, 2),
(154, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'TestMyDevice Service', 180.00, 180.00, 2),
(155, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'Hosting BlueHost', 250.00, 100.00, 2),
(156, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'Hosting BlueHost', 250.00, 100.00, 2),
(157, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'TestMyDevice Service', 150.00, 180.00, 2),
(158, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'Hosting BlueHost', 250.00, 100.00, 2),
(159, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'All Devices DB', 200.00, 200.00, 2),
(160, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'Hosting BlueHost', 250.00, 100.00, 2),
(161, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'TestMyDevice Service', 180.00, 150.00, 2),
(162, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'Hosting BlueHost', 250.00, 100.00, 2),
(163, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'TestMyDevice Service', 180.00, 140.00, 2),
(164, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'Hosting BlueHost', 250.00, 100.00, 2),
(165, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'All Devices DB', 200.00, 150.00, 2),
(166, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'Hosting BlueHost', 250.00, 100.00, 2),
(167, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'International Shipment (to USA)', 450.00, 450.00, 2),
(168, '2020-04-30 18:32:25', '2020-04-30 18:32:25', 10, 'Visa, Tickets to USA, Travel Perdiem', 1000.00, 1000.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `project_role_id` int(10) UNSIGNED NOT NULL,
  `seniority_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double(18,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `workplace` enum('onsite','offshore') COLLATE utf8mb4_unicode_ci NOT NULL,
  `office_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `created_at`, `updated_at`, `company_id`, `country_id`, `city_id`, `project_role_id`, `seniority_id`, `title`, `value`, `currency_id`, `workplace`, `office_id`) VALUES
(1, '2020-03-14 21:07:29', '2020-04-04 13:38:54', 1, 1, 2, 2, 3, 'Project Manager', 25.00, 2, 'offshore', 1),
(2, '2020-03-14 21:08:17', '2020-03-19 14:52:07', 1, 1, 6, 6, 3, 'UX Designer', 18.75, 2, 'offshore', 2),
(3, '2020-03-14 21:09:15', '2020-03-20 16:16:32', 1, 4, 5, 3, 2, 'QA Analyst', 15.62, 2, 'offshore', 3),
(4, '2020-03-14 21:10:19', '2020-04-04 13:41:52', 1, 1, 2, 5, 3, 'Delivery Manager', 31.25, 2, 'offshore', 1),
(5, '2020-03-14 21:11:08', '2020-03-14 21:11:08', 1, 3, 9, 7, 3, 'Technical Leader', 28.12, 2, 'offshore', 4),
(6, '2020-03-14 21:14:20', '2020-04-04 13:37:48', 1, 4, 5, 4, 3, 'Web Developer', 15.62, 2, 'offshore', 3),
(7, '2020-03-19 12:51:20', '2020-03-20 16:18:08', 1, 1, 6, 2, 3, 'Project Manager', 60.00, 2, 'onsite', 2),
(9, '2020-03-19 12:52:12', '2020-03-19 15:07:27', 1, 2, 7, 6, 3, 'UX-Designer On-Site', 30.00, 2, 'onsite', 7),
(10, '2020-03-19 12:52:57', '2020-04-05 19:06:12', 1, 1, 6, 3, 2, 'QA Analyst OffShore', 15.62, 2, 'offshore', 2),
(11, '2020-03-19 12:54:06', '2020-03-20 16:18:23', 1, 5, 8, 5, 3, 'Delivery Manager', 60.00, 2, 'onsite', 5),
(12, '2020-03-19 12:55:03', '2020-03-19 14:51:43', 1, 3, 9, 7, 3, 'Technical Leader On-Site', 60.00, 2, 'onsite', 4),
(13, '2020-03-19 12:56:13', '2020-03-19 12:56:13', 1, 4, 5, 4, 3, 'Web Developer On-Site', 40.00, 2, 'onsite', 3),
(14, '2020-03-20 16:14:31', '2020-04-04 13:36:47', 1, 5, 8, 1, 2, 'Semi-Senior Developer', 18.75, 2, 'offshore', 5);

-- --------------------------------------------------------

--
-- Table structure for table `replacements`
--

CREATE TABLE `replacements` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `absence_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `ticket` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `replacements`
--

INSERT INTO `replacements` (`id`, `created_at`, `updated_at`, `absence_id`, `user_id`, `from`, `to`, `ticket`, `comment`) VALUES
(1, '2020-04-04 15:52:39', '2020-04-04 15:52:39', 3, 562, '2020-06-04', '2020-06-08', '', 'Replacement for Paulo\'s Marriage License'),
(4, '2020-04-20 12:20:50', '2020-04-20 12:20:50', 3, 554, '2020-06-04', '2020-06-08', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `requirements`
--

CREATE TABLE `requirements` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('project','product') COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_date` date NOT NULL,
  `status_comment` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` date NOT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `requester_name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requester_email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requester_type` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approval_date` date NOT NULL,
  `approver_name` date NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_value` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requirements`
--

INSERT INTO `requirements` (`id`, `created_at`, `updated_at`, `project_id`, `description`, `type`, `request_date`, `status_comment`, `due_date`, `owner_id`, `priority`, `requester_name`, `requester_email`, `requester_type`, `approval_date`, `approver_name`, `comment`, `business_value`) VALUES
(4, '2020-03-26 18:25:58', '2020-04-26 19:31:02', 7, 'Total Amount for this Project', 'product', '2020-03-26', 'Registerd Requirement', '2020-06-21', 554, 3, 'CCuenca', 'ccuenca@goitglobal.taskcontrol.co', 'INTERNAL', '2020-03-26', '0000-00-00', 'Total Amount for this Project should <= USD 104000', 3),
(5, '2020-03-26 18:28:58', '2020-04-20 17:57:58', 7, 'App Web Browser Compatibility', 'product', '2020-03-26', 'Registering Requirement', '2020-06-21', 553, 3, 'otilio Fernandez', 'ofernandez@goitglobal.taskcontrol.co', 'Internal', '2020-03-26', '0000-00-00', 'Supported web browsers:  IE8, FF 3.6+, Chrome 12+, Safari 5+', 3),
(6, '2020-03-26 18:30:45', '2020-03-26 18:30:45', 7, 'App Web Browser Compatibility', 'product', '2020-03-26', 'Registering', '2020-06-21', 553, 3, 'Otilio Fernandez', 'ofernandez@goitglobal.taskcontrol.co', 'internal', '2020-03-26', '0000-00-00', 'Supported mobile OS: iOS 5+, Android 2.3+', 3),
(7, '2020-03-26 18:59:48', '2020-03-26 18:59:48', 7, 'Hardware Compatibility', 'product', '2020-03-21', 'Hardware Compatibility', '2020-06-21', 553, 3, 'Otilio', 'ofernandez@goitglobal.taskcontrol.co', 'internal', '2020-03-26', '0000-00-00', 'Hardware Compatibility', 3),
(8, '2020-03-26 19:01:11', '2020-03-26 19:01:11', 7, 'Software Device Compatibility', 'project', '0000-00-00', 'Software Device Compatibility', '2020-05-24', 553, 3, 'Otilio Fernandez', 'ofernandez@goitglobal.com', 'internal', '2020-03-26', '0000-00-00', 'Software Device Compatibility', 3),
(9, '2020-04-05 19:22:40', '2020-04-05 19:22:40', 7, 'Addional hours must be <= 50 total.', 'project', '2020-04-05', 'No more than 50 total additional hours.', '2020-06-21', 554, 2, 'Cuenca', 'ccuenca@goitglobal.taskcontrol.co', 'internal', '2020-04-05', '0000-00-00', 'No more than 50 total additional hours .', 3);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_role_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `level`, `created_at`, `updated_at`, `company_role_id`) VALUES
(1, 'Admin', 'admin', 'Admin Role', 5, '2020-03-14 15:55:36', '2020-03-14 15:55:36', NULL),
(2, 'User', 'user', 'User Role', 1, '2020-03-14 15:55:36', '2020-03-14 15:55:36', NULL),
(3, 'Unverified', 'unverified', 'Unverified Role', 0, '2020-03-14 15:55:36', '2020-03-14 15:55:36', NULL),
(4, 'Admin', '1', NULL, 1, '2020-03-15 19:49:53', '2020-03-15 19:49:53', 1),
(5, 'User', '2', NULL, 1, '2020-03-15 19:50:00', '2020-03-15 19:50:00', 2),
(6, 'Delivery Manager', '3', NULL, 1, '2020-03-15 19:53:08', '2020-03-15 19:53:08', 3),
(7, 'Project Manager', '4', NULL, 1, '2020-03-15 19:53:21', '2020-03-15 19:53:21', 4),
(8, 'Technical Leader', '5', NULL, 1, '2020-03-15 20:19:03', '2020-03-15 20:19:03', 5);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-03-14 15:55:36', '2020-03-14 15:55:36'),
(2, 2, 2, '2020-03-14 15:55:36', '2020-03-16 11:54:35'),
(6, 8, 561, '2020-03-20 20:13:29', '2020-03-20 20:13:29'),
(7, 5, 547, '2020-03-30 20:03:26', '2020-03-30 20:03:26'),
(8, 5, 551, '2020-03-30 20:03:31', '2020-03-30 20:03:31'),
(9, 5, 555, '2020-03-30 20:03:36', '2020-03-30 20:03:36'),
(10, 5, 552, '2020-03-30 20:03:41', '2020-03-30 20:03:41'),
(11, 7, 554, '2020-03-30 20:04:02', '2020-03-30 20:04:02'),
(12, 5, 556, '2020-03-30 20:04:09', '2020-03-30 20:04:09'),
(13, 6, 557, '2020-03-30 20:04:15', '2020-03-30 20:04:15'),
(14, 5, 553, '2020-04-03 16:08:54', '2020-04-03 16:08:54'),
(15, 5, 562, '2020-04-04 15:48:46', '2020-04-04 15:48:46'),
(16, 7, 563, '2020-09-10 21:25:58', '2020-09-10 21:25:58');

-- --------------------------------------------------------

--
-- Table structure for table `seniorities`
--

CREATE TABLE `seniorities` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seniorities`
--

INSERT INTO `seniorities` (`id`, `created_at`, `updated_at`, `company_id`, `title`) VALUES
(1, '2020-03-14 20:51:27', '2020-03-14 20:51:27', 1, 'Junior'),
(2, '2020-03-14 20:51:39', '2020-03-14 20:51:39', 1, 'Semi-Senior'),
(3, '2020-03-14 20:51:45', '2020-03-14 20:51:45', 1, 'Senior'),
(4, '2020-03-14 20:51:52', '2020-03-14 20:51:52', 1, 'Guru');

-- --------------------------------------------------------

--
-- Table structure for table `seniority_templates`
--

CREATE TABLE `seniority_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seniority_templates`
--

INSERT INTO `seniority_templates` (`id`, `created_at`, `updated_at`, `title`) VALUES
(1, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Junior'),
(2, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Junior'),
(3, '2020-03-14 15:55:36', '2020-03-14 15:55:36', 'Senior');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reimbursable` tinyint(4) NOT NULL,
  `detail` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(18,2) NOT NULL,
  `cost` double(18,2) DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `cost_currency_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `created_at`, `updated_at`, `reimbursable`, `detail`, `amount`, `cost`, `company_id`, `cost_currency_id`, `currency_id`) VALUES
(1, '2020-03-14 21:48:50', '2020-03-14 21:48:50', 1, 'Hosting BlueHost', 250.00, 100.00, 1, 2, 2),
(2, '2020-03-14 21:50:11', '2020-03-14 21:50:11', 1, 'TestMyDevice Service', 180.00, 1400.00, 1, 3, 2),
(3, '2020-03-14 21:52:42', '2020-03-14 21:52:42', 1, 'All Devices DB', 200.00, 500.00, 1, 1, 2),
(4, '2020-04-03 13:40:46', '2020-04-03 13:40:46', 1, 'General Service', 100.00, 100.00, 1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stakeholders`
--

CREATE TABLE `stakeholders` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `influence` enum('high','medium','low') COLLATE utf8mb4_unicode_ci NOT NULL,
  `impacted` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `impact` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expectations` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stakeholders`
--

INSERT INTO `stakeholders` (`id`, `created_at`, `updated_at`, `influence`, `impacted`, `impact`, `expectations`, `contact_id`) VALUES
(3, '2020-03-26 18:36:29', '2020-10-09 12:00:09', 'high', 'Not Yet', 'High', 'His Main Target: "Finish this Project on Time" and also with the scope agreed within  the budget  already defined in the  starting of the project  (contract)', 12);

-- --------------------------------------------------------

--
-- Table structure for table `su_settings`
--

CREATE TABLE `su_settings` (
  `plugins_enabled` int(1) NOT NULL COMMENT '0= No 1=Yes',
  `workflows_enabled` int(1) NOT NULL COMMENT '0= No 1=Yes',
  `payments_enabled` int(1) NOT NULL COMMENT '0= No 1=Yes',
  `wiki_enabled` int(1) NOT NULL COMMENT '0= No 1=Yes',
  `mail_server_protocol` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'smtp (default)',
  `mail_server_encryption` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ssl (default)',
  `mail_server_hosts` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'mail servers ips separted with ;',
  `mail_server_port` int(4) NOT NULL COMMENT '25 default smtp port',
  `mail_server_user` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mail_server_pass` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mail_server_from_email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'mail from'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `requirement_id` int(10) UNSIGNED DEFAULT NULL,
  `description` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `due_date` date NOT NULL,
  `start_is_milestone` tinyint(4) NOT NULL,
  `end_is_milestone` tinyint(4) NOT NULL,
  `progress` tinyint(4) NOT NULL,
  `depends` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `estimated_hours` float NOT NULL,
  `burned_hours` float NOT NULL,
  `business_value` tinyint(4) NOT NULL,
  `phase` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `release` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint(4) NOT NULL,
  `duration` smallint(6) NOT NULL,
  `index` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `created_at`, `updated_at`, `project_id`, `requirement_id`, `description`, `start_date`, `due_date`, `start_is_milestone`, `end_is_milestone`, `progress`, `depends`, `status`, `priority`, `estimated_hours`, `burned_hours`, `business_value`, `phase`, `version`, `release`, `label`, `comments`, `attachment`, `level`, `duration`, `index`) VALUES
(359, '2020-03-26 18:42:11', '2020-03-31 16:51:23', 7, NULL, 'ALLDEV PROJECT (FlexDev Inc)', '2020-03-21', '2020-06-22', 0, 0, 0, '', 'STATUS_ACTIVE', 0, 567, 0, 0, 'default', '', '', '', '', '', 0, 81, 0),
(360, '2020-03-26 18:42:11', '2020-04-05 21:00:21', 7, NULL, 'Milestone 1', '2020-03-21', '2020-05-11', 0, 1, 0, '', 'STATUS_ACTIVE', 0, 315, 0, 0, 'Milestone 1', '', '', '', '', '', 1, 45, 1),
(361, '2020-03-26 18:42:12', '2020-04-05 20:44:36', 7, 7, 'Analysis', '2020-03-21', '2020-04-04', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 91, 0, 3, 'Milestone 1', '1', '1', 'Q1', '', '', 2, 13, 2),
(362, '2020-03-26 18:42:12', '2020-04-08 19:09:44', 7, 7, 'Features', '2020-03-21', '2020-03-23', 0, 0, 100, '', 'STATUS_ACTIVE', 3, 21, 21, 3, 'Milestone 1', '', '', 'Q1', 'Finished at 8-Apr-2020 by Rakesh Dara', '', 3, 3, 3),
(363, '2020-03-26 18:42:12', '2020-09-04 20:11:19', 7, 7, 'Compatibilty', '2020-03-24', '2020-03-26', 0, 0, 100, '', 'STATUS_ACTIVE', 3, 14, 14, 3, 'Milestone 1', '', '', 'Q1-2020', 'Changin as a not owner ...', '', 3, 2, 4),
(364, '2020-03-26 18:42:13', '2020-09-04 20:11:19', 7, 7, 'Hardware', '2020-03-27', '2020-03-30', 0, 0, 100, '', 'STATUS_ACTIVE', 3, 28, 28, 3, 'Milestone 1', '', '', 'Q1-Q2-2020', 'No Comments', '', 3, 4, 5),
(365, '2020-03-26 18:42:13', '2020-09-04 20:11:19', 7, 8, 'Software', '2020-03-31', '2020-04-04', 0, 0, 100, '', 'STATUS_ACTIVE', 3, 28, 28, 3, 'Milestone 1', '', 'V. 1.00', 'Q1-Q2-2020', 'No comments', '', 3, 4, 6),
(366, '2020-03-26 18:45:05', '2020-09-04 20:11:19', 7, 8, 'Development', '2020-04-05', '2020-05-11', 0, 0, 0, '', 'STATUS_ACTIVE', 0, 224, 0, 0, 'Milestone 1', '', '', '', '', '', 2, 32, 7),
(367, '2020-03-26 18:45:06', '2020-09-04 20:11:19', 7, NULL, 'Device', '2020-04-05', '2020-04-19', 0, 0, 0, '', 'STATUS_ACTIVE', 0, 91, 0, 0, 'Milestone 1', '', '', '', '', '', 3, 13, 8),
(368, '2020-03-26 18:45:06', '2020-09-04 20:11:19', 7, NULL, 'HardWare Protocol', '2020-04-05', '2020-04-12', 0, 0, 0, '', 'STATUS_ACTIVE', 0, 49, 0, 0, 'Milestone 1', '', '', '', '', '', 4, 7, 9),
(369, '2020-03-26 18:45:06', '2020-09-04 20:11:19', 7, 8, 'Protocol Test', '2020-04-05', '2020-04-12', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 49, 0, 3, 'Milestone 1', 'V P 1.0', '', 'Q2-2020', 'No comments', '', 5, 7, 10),
(370, '2020-03-26 18:45:07', '2020-09-04 20:32:04', 7, NULL, 'Service Libraries', '2020-04-14', '2020-04-19', 0, 0, 0, '', 'STATUS_ACTIVE', 0, 35, 0, 0, 'Milestone 1', '', '', '', '', '', 4, 5, 11),
(371, '2020-03-26 18:45:07', '2020-09-04 20:32:04', 7, 7, 'Use Cases', '2020-04-14', '2020-04-19', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 35, 0, 3, 'Milestone 1', 'V 1.0', '', 'Q2-2020', 'No Comments', '', 5, 5, 12),
(372, '2020-03-26 18:45:07', '2020-09-04 20:32:04', 7, NULL, 'WebSite', '2020-04-20', '2020-05-11', 0, 0, 0, '', 'STATUS_ACTIVE', 0, 133, 0, 0, 'Milestone 1', '', '', '', '', '', 3, 19, 13),
(373, '2020-03-26 18:45:07', '2020-09-04 20:32:04', 7, 8, 'Basic Design', '2020-04-20', '2020-04-23', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 21, 0, 3, 'Milestone 1', 'V 1.0', '1', 'Q2-2020', 'This is the Web Basic  Design ', '', 4, 3, 14),
(374, '2020-03-26 18:45:08', '2020-09-04 20:32:04', 7, 8, 'UI layer', '2020-04-24', '2020-04-30', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 42, 0, 3, 'Milestone 1', 'V 1.0', '', 'Q2-2020', 'No Comments Yet', '', 4, 6, 15),
(375, '2020-03-26 18:45:08', '2020-09-04 20:32:04', 7, 8, 'API Development', '2020-05-02', '2020-05-11', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 63, 0, 3, 'Milestone 1', 'V 1.0', '', 'Q2-2020', '', '', 4, 9, 16),
(376, '2020-03-26 18:52:57', '2020-09-04 20:32:04', 7, NULL, 'Milestone 2', '2020-05-12', '2020-06-13', 0, 1, 0, '', 'STATUS_ACTIVE', 0, 196, 0, 0, 'Milestone 2', '', '', '', '', '', 1, 28, 17),
(377, '2020-03-26 18:52:57', '2020-09-04 20:32:04', 7, NULL, 'Testing (Device & Website)', '2020-05-12', '2020-06-04', 0, 0, 0, '', 'STATUS_ACTIVE', 0, 140, 0, 0, 'Milestone 2', '', '', '', '', '', 2, 20, 18),
(378, '2020-03-26 18:52:58', '2020-09-04 20:32:04', 7, 7, 'compatibility ', '2020-05-12', '2020-05-15', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 21, 0, 3, 'Milestone 2', '', '', 'Q2-2020', '', '', 3, 3, 19),
(379, '2020-03-26 18:52:58', '2020-09-04 20:41:01', 7, 7, 'Hardware', '2020-05-16', '2020-05-18', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 21, 0, 3, 'Milestone 2', '', '', 'Q2-2020', '', '', 3, 3, 20),
(380, '2020-03-26 18:52:58', '2020-09-04 20:32:04', 7, 8, 'software', '2020-05-16', '2020-05-22', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 42, 0, 3, 'Milestone 2', '', '', 'Q2-2020', '', '', 3, 6, 21),
(381, '2020-03-26 18:52:59', '2020-09-04 20:32:04', 7, 7, 'fuzzy test', '2020-05-23', '2020-05-28', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 35, 0, 3, 'Milestone 2', '', '', '', '', '', 3, 5, 22),
(382, '2020-03-26 18:52:59', '2020-09-04 20:32:04', 7, 8, 'Security Test', '2020-05-29', '2020-05-30', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 14, 0, 3, 'Milestone 2', '', '', '', '', '', 3, 2, 23),
(383, '2020-03-26 18:52:59', '2020-09-04 20:32:04', 7, 8, 'Functional Demo', '2020-05-31', '2020-06-04', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 28, 0, 3, 'Milestone 2', '', '', '', '', '', 3, 4, 24),
(384, '2020-03-26 18:52:59', '2020-09-04 20:32:04', 7, NULL, 'Implementation (Local GO-LIVE)', '2020-06-05', '2020-06-13', 0, 0, 0, '', 'STATUS_ACTIVE', 1, 56, 0, 1, 'Milestone 2', '', '', '', '', '', 2, 8, 25),
(385, '2020-03-26 18:53:00', '2020-09-04 20:32:04', 7, 8, 'Deploy to PROD', '2020-06-05', '2020-06-06', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 14, 0, 3, 'Milestone 2', '', '', '', '', '', 3, 2, 26),
(386, '2020-03-26 18:53:00', '2020-09-04 20:47:25', 7, NULL, 'Smoke Test', '2020-06-06', '2020-06-07', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 14, 0, 3, 'Milestone 2', '', '', '', '', '', 3, 2, 27),
(387, '2020-03-26 18:53:00', '2020-09-04 20:47:25', 7, 8, 'QC-Sign Off', '2020-06-08', '2020-06-09', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 14, 0, 3, 'Milestone 2', '', '', '', '', '', 3, 2, 28),
(388, '2020-03-26 18:53:00', '2020-09-04 20:47:25', 7, 7, 'UAT', '2020-06-11', '2020-06-12', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 14, 0, 3, 'Milestone 2', '', '', '', '', '', 3, 2, 29),
(389, '2020-03-26 18:53:01', '2020-09-04 20:32:04', 7, 7, 'Final Revision', '2020-06-13', '2020-06-13', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 7, 0, 3, 'Milestone 2', '', '', '', '', '', 3, 1, 30),
(390, '2020-03-26 18:54:59', '2020-09-04 20:32:04', 7, NULL, 'Milestone 3', '2020-06-14', '2020-06-22', 0, 1, 0, '', 'STATUS_ACTIVE', 0, 56, 0, 0, 'Milestone 3', '', '', '', '', '', 1, 8, 31),
(391, '2020-03-26 18:54:59', '2020-09-04 20:32:04', 7, NULL, 'USA Device Testing', '2020-06-14', '2020-06-22', 0, 0, 0, '', 'STATUS_ACTIVE', 0, 56, 0, 0, 'Milestone 3', '', '', '', '', '', 2, 8, 32),
(392, '2020-03-26 18:54:59', '2020-09-04 20:32:04', 7, 7, 'Prerequisites', '2020-06-14', '2020-06-15', 0, 0, 0, '', 'STATUS_ACTIVE', 3, 14, 0, 3, 'Milestone 3', 'V 1.0', '', '', 'Prereq to Shipping to USA', '', 3, 2, 33),
(393, '2020-03-26 18:54:59', '2020-09-04 21:04:26', 7, NULL, 'Shipment Conditions', '2020-06-16', '2020-06-16', 0, 0, 0, '34', 'STATUS_WAITING', 3, 7, 0, 3, 'Milestone 3', '', '', 'Q3-2020', '', '', 3, 1, 34),
(394, '2020-03-26 18:55:00', '2020-09-04 21:04:27', 7, 8, 'Test Environment', '2020-06-18', '2020-06-19', 0, 0, 0, '35', 'STATUS_WAITING', 3, 14, 0, 2, 'Milestone 3', '', '', 'Q2-2020', '', '', 3, 2, 35),
(395, '2020-03-26 18:55:00', '2020-09-04 21:04:27', 7, 8, 'UAT', '2020-06-20', '2020-06-21', 0, 0, 0, '34,35,36', 'STATUS_WAITING', 3, 14, 0, 3, 'Milestone 3', '', '', 'Q2', '', '', 3, 2, 36),
(396, '2020-03-26 18:55:00', '2020-09-04 20:32:04', 7, 8, 'Knowledge Transfer', '2020-06-21', '2020-06-22', 0, 0, 0, '', 'STATUS_ACTIVE', 2, 14, 0, 3, 'Milestone 3', '', '', 'Q2', 'Training for FlexDev Crew', '', 3, 2, 37);

-- --------------------------------------------------------

--
-- Table structure for table `task_expenses`
--

CREATE TABLE `task_expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(18,2) NOT NULL,
  `amount` double(18,2) NOT NULL,
  `reimbursable` tinyint(1) NOT NULL,
  `quantity` int(11) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_expenses`
--

INSERT INTO `task_expenses` (`id`, `created_at`, `updated_at`, `task_id`, `detail`, `cost`, `amount`, `reimbursable`, `quantity`, `currency_id`) VALUES
(1, '2020-09-12 19:23:05', '2020-09-12 19:23:05', 379, 'Hotel', 450.00, 450.00, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `task_materials`
--

CREATE TABLE `task_materials` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(18,2) DEFAULT NULL,
  `amount` double(18,2) DEFAULT NULL,
  `reimbursable` tinyint(1) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_materials`
--

INSERT INTO `task_materials` (`id`, `created_at`, `updated_at`, `task_id`, `detail`, `cost`, `amount`, `reimbursable`, `quantity`, `currency_id`) VALUES
(1, '2020-03-29 20:34:17', '2020-03-29 20:34:17', 365, 'Cables & Plugs', NULL, NULL, NULL, NULL, NULL),
(2, '2020-03-30 22:43:57', '2020-03-30 22:43:57', 364, 'Plastic Boxes', NULL, NULL, NULL, NULL, NULL),
(3, '2020-04-04 15:18:58', '2020-04-04 15:18:58', 379, 'Cables & Plugs', 40.00, 100.00, 1, 1, 2),
(4, '2020-04-04 15:19:13', '2020-04-04 15:19:13', 379, 'Plastic Boxes', 80.00, 100.00, 1, 1, 2),
(5, '2020-04-04 15:19:41', '2020-04-04 15:19:41', 379, 'Digital Displays', 50.00, 100.00, 1, 1, 2),
(7, '2020-04-04 15:32:05', '2020-04-04 15:32:05', 393, 'Special Envelope for the Device', 450.00, 450.00, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `task_resources`
--

CREATE TABLE `task_resources` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_role_id` int(10) UNSIGNED DEFAULT NULL,
  `rate` double(18,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `seniority_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_resources`
--

INSERT INTO `task_resources` (`id`, `created_at`, `updated_at`, `task_id`, `user_id`, `project_role_id`, `rate`, `quantity`, `currency_id`, `seniority_id`) VALUES
(2, '2020-03-27 12:53:13', '2020-03-27 12:53:13', 362, 553, NULL, NULL, NULL, NULL, NULL),
(3, '2020-03-27 12:53:35', '2020-03-27 12:53:35', 362, 547, NULL, NULL, NULL, NULL, NULL),
(4, '2020-03-27 12:53:48', '2020-03-27 12:53:48', 362, 551, NULL, NULL, NULL, NULL, NULL),
(5, '2020-03-27 13:02:34', '2020-03-27 13:02:34', 365, 547, NULL, NULL, NULL, NULL, NULL),
(6, '2020-03-27 13:02:45', '2020-03-27 13:02:45', 365, 552, NULL, NULL, NULL, NULL, NULL),
(7, '2020-03-27 13:04:48', '2020-03-27 13:04:48', 365, 553, NULL, NULL, NULL, NULL, NULL),
(8, '2020-03-27 13:05:44', '2020-03-27 13:05:44', 364, 547, NULL, NULL, NULL, NULL, NULL),
(9, '2020-03-27 13:05:50', '2020-03-27 13:05:50', 364, 551, NULL, NULL, NULL, NULL, NULL),
(10, '2020-03-27 13:06:01', '2020-03-27 13:06:01', 364, 553, NULL, NULL, NULL, NULL, NULL),
(11, '2020-03-27 13:06:26', '2020-04-04 14:59:43', 363, 553, 7, 13.00, 13, 2, NULL),
(12, '2020-03-27 13:06:43', '2020-04-04 15:00:10', 363, 556, 3, 30.00, 13, 2, NULL),
(13, '2020-03-27 13:06:56', '2020-04-04 15:00:34', 363, 551, 1, 18.00, 23, 2, NULL),
(14, '2020-03-27 13:13:34', '2020-03-27 13:13:34', 375, 547, NULL, NULL, NULL, NULL, NULL),
(15, '2020-03-27 13:13:43', '2020-03-27 13:13:43', 375, 551, NULL, NULL, NULL, NULL, NULL),
(16, '2020-03-27 13:13:53', '2020-03-27 13:13:53', 375, 552, NULL, NULL, NULL, NULL, NULL),
(17, '2020-03-27 13:15:54', '2020-03-27 13:15:54', 374, 551, NULL, NULL, NULL, NULL, NULL),
(18, '2020-03-27 13:16:04', '2020-03-27 13:16:04', 374, 547, NULL, NULL, NULL, NULL, NULL),
(19, '2020-03-27 13:16:17', '2020-03-27 13:16:17', 374, 553, NULL, NULL, NULL, NULL, NULL),
(20, '2020-03-27 13:16:34', '2020-03-27 13:16:34', 373, 552, NULL, NULL, NULL, NULL, NULL),
(21, '2020-03-27 13:16:46', '2020-03-27 13:16:46', 373, 553, NULL, NULL, NULL, NULL, NULL),
(22, '2020-03-27 13:16:58', '2020-03-27 13:16:58', 373, 556, NULL, NULL, NULL, NULL, NULL),
(23, '2020-03-27 13:17:14', '2020-03-27 13:17:14', 371, 547, NULL, NULL, NULL, NULL, NULL),
(24, '2020-03-27 13:17:23', '2020-03-27 13:17:23', 371, 551, NULL, NULL, NULL, NULL, NULL),
(25, '2020-03-27 13:17:33', '2020-03-27 13:17:33', 371, 553, NULL, NULL, NULL, NULL, NULL),
(26, '2020-03-27 13:18:40', '2020-03-27 13:18:40', 369, 547, NULL, NULL, NULL, NULL, NULL),
(27, '2020-03-27 13:18:49', '2020-03-27 13:18:49', 369, 551, NULL, NULL, NULL, NULL, NULL),
(28, '2020-03-27 13:19:01', '2020-03-27 13:19:01', 369, 553, NULL, NULL, NULL, NULL, NULL),
(29, '2020-03-27 13:27:06', '2020-03-27 13:27:06', 378, 547, NULL, NULL, NULL, NULL, NULL),
(30, '2020-03-27 13:27:15', '2020-03-27 13:27:15', 378, 552, NULL, NULL, NULL, NULL, NULL),
(31, '2020-03-27 13:27:22', '2020-03-27 13:27:22', 378, 553, NULL, NULL, NULL, NULL, NULL),
(32, '2020-03-27 13:27:37', '2020-03-27 13:27:37', 379, 547, NULL, NULL, NULL, NULL, NULL),
(33, '2020-03-27 13:27:45', '2020-03-27 13:27:45', 379, 551, NULL, NULL, NULL, NULL, NULL),
(34, '2020-03-27 13:27:55', '2020-03-27 13:27:55', 379, 553, NULL, NULL, NULL, NULL, NULL),
(35, '2020-03-27 13:28:16', '2020-03-27 13:28:16', 380, 552, NULL, NULL, NULL, NULL, NULL),
(36, '2020-03-27 13:28:24', '2020-03-27 13:28:24', 380, 556, NULL, NULL, NULL, NULL, NULL),
(37, '2020-03-27 13:28:36', '2020-03-27 13:28:36', 380, 547, NULL, NULL, NULL, NULL, NULL),
(38, '2020-03-27 13:28:54', '2020-03-27 13:28:54', 381, 553, NULL, NULL, NULL, NULL, NULL),
(39, '2020-03-27 13:29:03', '2020-03-27 13:29:03', 381, 547, NULL, NULL, NULL, NULL, NULL),
(40, '2020-03-27 13:29:12', '2020-03-27 13:29:12', 381, 551, NULL, NULL, NULL, NULL, NULL),
(41, '2020-03-27 13:29:30', '2020-03-27 13:29:30', 382, 553, NULL, NULL, NULL, NULL, NULL),
(42, '2020-03-27 13:29:41', '2020-03-27 13:29:41', 382, 556, NULL, NULL, NULL, NULL, NULL),
(43, '2020-03-27 13:29:57', '2020-03-27 13:29:57', 383, 553, NULL, NULL, NULL, NULL, NULL),
(44, '2020-03-27 13:30:08', '2020-03-27 13:30:08', 383, 556, NULL, NULL, NULL, NULL, NULL),
(46, '2020-03-27 13:30:58', '2020-03-27 13:30:58', 383, 552, NULL, NULL, NULL, NULL, NULL),
(47, '2020-03-27 13:37:34', '2020-04-04 15:16:55', 385, 561, 28, NULL, NULL, 2, NULL),
(48, '2020-03-27 13:37:41', '2020-04-04 15:16:30', 385, 553, 7, NULL, NULL, 2, NULL),
(49, '2020-03-27 13:37:54', '2020-04-04 15:21:14', 386, 554, 2, NULL, NULL, 2, NULL),
(50, '2020-03-27 13:38:01', '2020-04-04 15:21:21', 386, 553, 7, NULL, NULL, 2, NULL),
(51, '2020-03-27 13:38:36', '2020-03-27 13:38:36', 387, 553, NULL, NULL, NULL, NULL, NULL),
(52, '2020-03-27 13:38:51', '2020-03-27 13:38:51', 387, 555, NULL, NULL, NULL, NULL, NULL),
(53, '2020-03-27 13:39:08', '2020-03-27 13:39:08', 388, 553, NULL, NULL, NULL, NULL, NULL),
(54, '2020-03-27 13:39:22', '2020-03-27 13:39:22', 388, 556, NULL, NULL, NULL, NULL, NULL),
(55, '2020-03-27 13:39:33', '2020-03-27 13:39:33', 388, 552, NULL, NULL, NULL, NULL, NULL),
(56, '2020-03-27 13:39:53', '2020-04-04 15:25:08', 389, 553, 7, NULL, NULL, 2, NULL),
(57, '2020-03-27 13:45:52', '2020-03-27 13:45:52', 392, 553, NULL, NULL, NULL, NULL, NULL),
(58, '2020-03-27 13:46:02', '2020-03-27 13:46:02', 392, 555, NULL, NULL, NULL, NULL, NULL),
(59, '2020-03-27 13:46:22', '2020-03-27 13:46:22', 393, 553, NULL, NULL, NULL, NULL, NULL),
(60, '2020-03-27 13:46:31', '2020-03-27 13:46:31', 393, 554, NULL, NULL, NULL, NULL, NULL),
(61, '2020-03-27 13:46:44', '2020-03-27 13:46:44', 394, 553, NULL, NULL, NULL, NULL, NULL),
(62, '2020-03-27 13:46:50', '2020-03-27 13:46:50', 394, 547, NULL, NULL, NULL, NULL, NULL),
(63, '2020-03-27 13:46:58', '2020-03-27 13:46:58', 394, 556, NULL, NULL, NULL, NULL, NULL),
(64, '2020-03-27 13:47:13', '2020-03-27 13:47:13', 395, 553, NULL, NULL, NULL, NULL, NULL),
(65, '2020-03-27 13:47:27', '2020-03-27 13:47:27', 395, 555, NULL, NULL, NULL, NULL, NULL),
(67, '2020-03-27 13:48:09', '2020-03-27 13:48:09', 396, 552, NULL, NULL, NULL, NULL, NULL),
(68, '2020-03-27 13:48:18', '2020-03-27 13:48:18', 396, 553, NULL, NULL, NULL, NULL, NULL),
(69, '2020-04-04 15:06:07', '2020-04-04 15:06:07', 374, 556, 3, NULL, NULL, 2, NULL),
(70, '2020-04-04 15:08:03', '2020-04-04 15:08:16', 375, 553, 7, 17.00, 7, 2, NULL),
(71, '2020-04-04 15:12:03', '2020-04-04 15:12:03', 380, 553, 7, NULL, NULL, 2, NULL),
(72, '2020-04-04 15:12:40', '2020-04-04 15:12:40', 381, 556, 3, NULL, NULL, 2, NULL),
(73, '2020-04-04 15:13:58', '2020-04-04 15:13:58', 382, 547, 1, NULL, 1, 2, NULL),
(74, '2020-04-04 15:15:45', '2020-04-04 15:15:45', 385, 556, 3, NULL, NULL, 2, NULL),
(75, '2020-04-04 15:16:06', '2020-04-04 15:16:06', 385, 554, 2, NULL, NULL, 2, NULL),
(76, '2020-04-04 15:17:27', '2020-04-04 15:17:27', 385, 557, 5, NULL, NULL, 2, NULL),
(77, '2020-04-04 15:20:47', '2020-04-04 15:20:47', 386, 561, 28, NULL, NULL, 2, NULL),
(78, '2020-04-04 15:22:00', '2020-04-04 15:22:00', 387, 554, 2, NULL, NULL, 2, NULL),
(79, '2020-04-04 15:23:57', '2020-04-04 15:23:57', 389, 557, 5, NULL, NULL, 2, NULL),
(80, '2020-04-04 15:24:25', '2020-04-04 15:24:25', 389, 556, 3, NULL, NULL, 2, NULL),
(81, '2020-04-04 15:32:56', '2020-04-04 15:32:56', 395, 554, 2, NULL, NULL, 2, NULL),
(82, '2020-04-04 21:10:33', '2020-04-04 21:10:33', 363, 547, 1, 18.75, 5, 2, 2),
(83, '2020-04-04 22:48:58', '2020-04-04 22:48:58', 363, 556, 2, 25.00, 12, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `task_services`
--

CREATE TABLE `task_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(18,2) DEFAULT NULL,
  `amount` double(18,2) DEFAULT NULL,
  `reimbursable` tinyint(1) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_services`
--

INSERT INTO `task_services` (`id`, `created_at`, `updated_at`, `task_id`, `detail`, `cost`, `amount`, `reimbursable`, `quantity`, `currency_id`) VALUES
(1, '2020-03-29 20:34:05', '2020-03-29 20:34:05', 365, 'TestMyDevice Service', NULL, NULL, NULL, NULL, NULL),
(2, '2020-03-29 20:34:32', '2020-03-29 20:34:32', 365, 'Hosting BlueHost', NULL, NULL, NULL, NULL, NULL),
(3, '2020-04-03 23:36:02', '2020-04-03 23:36:12', 362, 'All Devices DB', 200.00, 500.00, 1, 2, 2),
(4, '2020-04-04 15:01:43', '2020-04-04 15:01:43', 369, 'TestMyDevice Service', 150.00, 180.00, 1, 1, 2),
(5, '2020-04-04 15:02:35', '2020-04-04 15:02:35', 371, 'TestMyDevice Service', 150.00, 180.00, 1, 1, 2),
(6, '2020-04-04 15:08:37', '2020-04-04 15:08:37', 375, 'Hosting BlueHost', 100.00, 250.00, 1, 1, 2),
(7, '2020-04-04 15:09:01', '2020-04-04 15:09:01', 375, 'TestMyDevice Service', 180.00, 180.00, 1, 1, 2),
(8, '2020-04-04 15:10:22', '2020-04-04 15:10:22', 378, 'TestMyDevice Service', 180.00, 180.00, 1, 1, 2),
(9, '2020-04-04 15:10:55', '2020-04-04 15:10:55', 379, 'TestMyDevice Service', 180.00, 180.00, 1, 1, 2),
(10, '2020-04-04 15:11:32', '2020-04-04 15:11:32', 380, 'Hosting BlueHost', 100.00, 250.00, 1, 1, 2),
(11, '2020-04-04 15:13:04', '2020-04-04 15:13:04', 381, 'Hosting BlueHost', 100.00, 250.00, 1, 1, 2),
(12, '2020-04-04 15:13:28', '2020-04-04 15:13:28', 381, 'TestMyDevice Service', 180.00, 150.00, 1, 1, 2),
(13, '2020-04-04 15:14:49', '2020-04-04 15:14:49', 383, 'Hosting BlueHost', 100.00, 250.00, 1, 1, 2),
(14, '2020-04-04 15:15:07', '2020-04-04 15:15:07', 383, 'All Devices DB', 200.00, 200.00, 1, 1, 2),
(15, '2020-04-04 15:17:51', '2020-04-04 15:17:51', 385, 'Hosting BlueHost', 100.00, 250.00, 1, 1, 2),
(16, '2020-04-04 15:18:13', '2020-04-04 15:18:13', 385, 'TestMyDevice Service', 150.00, 180.00, 1, 1, 2),
(17, '2020-04-04 15:22:20', '2020-04-04 15:22:20', 387, 'Hosting BlueHost', 100.00, 250.00, 1, 1, 2),
(18, '2020-04-04 15:22:39', '2020-04-04 15:22:39', 387, 'TestMyDevice Service', 140.00, 180.00, 1, 1, 2),
(19, '2020-04-04 15:23:08', '2020-04-04 15:23:08', 388, 'Hosting BlueHost', 100.00, 250.00, 1, 1, 2),
(20, '2020-04-04 15:23:26', '2020-04-04 15:23:26', 388, 'All Devices DB', 150.00, 200.00, 1, 1, 2),
(21, '2020-04-04 15:26:03', '2020-04-04 15:26:03', 389, 'Hosting BlueHost', 100.00, 250.00, 1, 1, 2),
(22, '2020-04-04 15:30:54', '2020-04-04 15:30:54', 392, 'International Shipment (to USA)', 450.00, 450.00, 1, 1, 2),
(23, '2020-04-04 15:34:23', '2020-04-04 15:34:23', 396, 'Visa, Tickets to USA, Travel Perdiem', 1000.00, 1000.00, 1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `value` double(18,2) NOT NULL,
  `percentage` double(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `created_at`, `updated_at`, `company_id`, `detail`, `country_id`, `currency_id`, `value`, `percentage`) VALUES
(1, '2020-03-14 21:27:25', '2020-03-14 21:28:03', 1, 'Internal Tax', 2, 2, 0.00, 1.50),
(2, '2020-03-14 21:28:26', '2020-03-14 21:28:26', 1, 'I.V.A.', 1, 1, 0.00, 21.00),
(3, '2020-03-15 13:09:32', '2020-03-15 13:09:32', 1, 'County Task', 2, 2, 150.00, 0.00),
(4, '2020-03-19 13:07:39', '2020-03-19 13:09:04', 1, 'State Task', 2, 2, 0.00, 1.50),
(5, '2020-03-19 13:08:16', '2020-03-19 13:09:50', 1, 'Bogota State Tax', 3, 3, 0.00, 2.00);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_users`
--

CREATE TABLE `team_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `hours` int(10) UNSIGNED NOT NULL,
  `load` int(10) UNSIGNED NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `office_id` int(10) UNSIGNED DEFAULT NULL,
  `workplace` enum('onsite','offshore') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_role_id` int(10) UNSIGNED DEFAULT NULL,
  `seniority_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team_users`
--

INSERT INTO `team_users` (`id`, `created_at`, `updated_at`, `project_id`, `user_id`, `hours`, `load`, `date_from`, `date_to`, `country_id`, `city_id`, `office_id`, `workplace`, `project_role_id`, `seniority_id`) VALUES
(2, '2020-03-26 18:17:36', '2020-08-30 18:26:52', 7, 554, 4, 50, '2020-03-20', '2020-06-21', 1, 2, 1, 'offshore', 2, 3),
(3, '2020-04-03 16:09:38', '2020-04-11 16:50:42', 7, 553, 4, 50, '2020-03-21', '2020-06-21', 3, 9, 4, 'offshore', 7, 3),
(4, '2020-04-04 13:02:32', '2020-04-11 16:50:48', 7, 547, 8, 100, '2020-03-21', '2020-06-21', 5, 8, 5, 'offshore', 1, 2),
(5, '2020-04-04 13:06:07', '2020-04-11 16:50:54', 7, 551, 8, 100, '2020-03-21', '2020-06-21', 5, 8, 5, 'offshore', 1, 2),
(6, '2020-04-04 13:06:56', '2020-04-11 16:50:59', 7, 552, 7, 100, '2020-04-03', '2020-06-21', 4, 5, 3, 'offshore', 4, 3),
(7, '2020-04-04 13:12:28', '2020-04-11 16:51:12', 7, 556, 4, 50, '2020-04-20', '2020-06-25', 1, 6, 2, 'offshore', 6, 3),
(8, '2020-04-04 13:15:13', '2020-04-11 16:51:18', 7, 555, 8, 100, '2020-05-10', '2020-06-21', 1, 6, 2, 'offshore', 3, 2),
(9, '2020-04-04 13:20:02', '2020-04-11 16:51:24', 7, 557, 2, 25, '2020-03-21', '2020-06-21', 1, 2, 1, 'offshore', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `assignee_id` int(10) UNSIGNED NOT NULL,
  `group` tinyint(4) NOT NULL,
  `sprint` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_updater_id` int(10) UNSIGNED DEFAULT NULL,
  `due_date` date NOT NULL,
  `requester_name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requester_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requester_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `severity` tinyint(4) NOT NULL,
  `probability` tinyint(4) NOT NULL,
  `impact` tinyint(4) NOT NULL,
  `version` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `release` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estimated_hours` smallint(6) NOT NULL,
  `burned_hours` smallint(6) NOT NULL,
  `story_points` smallint(6) NOT NULL,
  `approval_date` date NOT NULL,
  `approver_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acceptance_criteria` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testing_criteria` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `done_criteria` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `created_at`, `updated_at`, `task_id`, `description`, `type`, `status`, `assignee_id`, `group`, `sprint`, `last_updater_id`, `due_date`, `requester_name`, `requester_email`, `requester_type`, `priority`, `severity`, `probability`, `impact`, `version`, `release`, `estimated_hours`, `burned_hours`, `story_points`, `approval_date`, `approver_name`, `acceptance_criteria`, `testing_criteria`, `done_criteria`, `label`, `comment`, `owner_id`) VALUES
(1, '2020-03-31 16:34:40', '2020-04-20 20:41:46', 362, 'Start Features Required Analysis', 1, 6, 553, 1, '1', 547, '2020-03-23', 'Otilio Fernandez', '', 'team', 3, 4, 3, 1, '', '', 21, 21, 0, '0000-00-00', 'Michael Smith', 'This is the text for the Acceptance Criteria', '', 'This is the text for the Done Criteria', 'Label Text', 'Just a Comment on this Ticket', 547),
(2, '2020-03-31 16:42:40', '2020-04-08 19:09:26', 363, 'As a user I need to know the device compatibility', 1, 6, 551, 1, '1', 547, '2020-03-26', 'Rakesh Dara', '', 'team', 3, 3, 2, 1, '', '', 14, 14, 0, '0000-00-00', '', '', '', '', '', 'Finished at 30-3-2020. Tanya.', 551),
(3, '2020-03-31 16:46:50', '2020-04-10 11:45:38', 364, 'As a User a I need to know the Hardware Internals...', 1, 6, 551, 1, '1', 554, '2020-03-30', 'Otilio Fernandez', '', 'team', 2, 3, 2, 2, '', '', 28, 28, 0, '0000-00-00', '', '', '', '', '', 'Finished. Tanya.', 551),
(4, '2020-03-31 16:50:44', '2020-04-08 20:00:14', 365, 'Starting Software Designing', 1, 6, 551, 1, '1', 547, '2020-04-30', 'Otilio Fernandez', '', 'team', 1, 3, 2, 2, '', '', 28, 28, 0, '0000-00-00', 'Michael Smith', '', '', '', '', 'This is just a Comment for this Task.', 551),
(5, '2020-03-31 17:04:16', '2020-04-27 21:17:40', 369, 'Starting Protocol Testing', 1, 1, 552, 1, '2', 554, '2020-04-13', 'Otilio Fernandez', '', 'team', 2, 0, 2, 2, '', '', 49, 0, 0, '2020-03-31', '', '', '', '', '', '', 552),
(6, '2020-03-31 17:05:51', '2020-04-08 19:59:39', 371, 'Development of USE CASES', 1, 1, 547, 1, '2', 547, '2020-04-19', 'Otilio Fernandez', '', 'team', 2, 4, 3, 3, 'Version 1.0', '', 35, 0, 0, '0000-00-00', '', '', '', '', '', 'This is the comment for this ticket. We will write all the actions we are doing leading to finish the task for this ticket.', 547),
(7, '2020-03-31 17:11:11', '2020-03-31 17:11:11', 378, 'Starting Compatibily Test', 1, 1, 551, 1, '2', NULL, '2020-05-15', 'Otilio Fernandez', '', 'team', 2, 4, 3, 3, '', '', 21, 0, 0, '0000-00-00', '', '', '', '', '', '', 551),
(8, '2020-03-31 17:18:30', '2020-03-31 17:39:56', 392, 'Preparing th USA testing environment', 1, 1, 553, 1, '3', 554, '2020-06-15', 'Otilio Fernandez', '', 'team', 3, 4, 3, 3, '', '', 14, 0, 0, '0000-00-00', '', '', '', '', '', 'As I user I want to prepare the USA testing environment  prerequisites for the Device', 553),
(9, '2020-03-31 17:24:38', '2020-04-03 19:20:46', 393, 'Define the shipment conditions to USA', 1, 3, 554, 1, '3', 554, '2020-06-16', 'Otilio Fernandez', '', 'team', 1, 4, 2, 2, '', '', 7, 0, 0, '0000-00-00', '', '', '', '', '', '', 554),
(10, '2020-04-03 14:45:04', '2020-04-03 14:45:04', 379, 'Testing Harware', 1, 1, 553, 1, '2', NULL, '2020-05-18', 'Otilio Fernandez', '', 'team', 3, 3, 1, 1, '', '', 24, 0, 0, '2020-05-15', 'Alexander Boss', 'This is the text for the Acceptance Criteria', '', '', 'This is just a Label', 'This is Just a Comment about this task/ticket', 553),
(11, '2020-04-03 14:49:10', '2020-04-03 18:53:00', 394, 'Implementing  the Test Environment', 1, 1, 556, 1, '3', 554, '2020-06-18', 'Otilio Fernandez', '', 'team', 2, 4, 1, 1, '', '', 16, 0, 0, '2020-04-03', 'Michael Smith', '', '', '', '', '', 554),
(12, '2020-04-03 15:27:44', '2020-04-03 15:27:44', 380, 'Starting The Software Testing', 1, 1, 552, 1, '2', NULL, '2020-05-22', 'Otilio Fernandez', '', 'team', 3, 3, 2, 1, 'Version 1.0', 'Release 1.0', 48, 0, 0, '2020-04-03', 'Michael Smith', 'This is the text for the Acceptance Criteria', '', '', '', '', 552),
(13, '2020-04-30 14:56:03', '2020-04-30 14:56:03', 362, 'Second ticket for Features Task', 1, 1, 551, 2, '1', NULL, '2020-03-23', 'Otilio Fernandez', '', 'team', 3, 3, 1, 1, '', '', 21, 0, 0, '0000-00-00', '', '', '', '', '', '', 547);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_histories`
--

CREATE TABLE `ticket_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `internal_or_external` enum('internal','external') COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_histories`
--

INSERT INTO `ticket_histories` (`id`, `created_at`, `updated_at`, `ticket_id`, `date`, `internal_or_external`, `comment`, `owner_id`) VALUES
(1, '2020-03-31 16:34:40', '2020-03-31 16:34:40', 1, '2020-03-31', 'internal', 'Ticket created', 553),
(2, '2020-03-31 16:42:40', '2020-03-31 16:42:40', 2, '2020-03-31', 'internal', 'Ticket created', 547),
(3, '2020-03-31 16:46:50', '2020-03-31 16:46:50', 3, '2020-03-31', 'internal', 'Ticket created', 551),
(4, '2020-03-31 16:50:44', '2020-03-31 16:50:44', 4, '2020-03-31', 'internal', 'Ticket created', 551),
(5, '2020-03-31 16:55:57', '2020-03-31 16:55:57', 4, '2020-03-31', 'internal', 'Ticket updated', 551),
(6, '2020-03-31 16:57:21', '2020-03-31 16:57:21', 3, '2020-03-31', 'internal', 'Ticket updated', 551),
(7, '2020-03-31 16:57:32', '2020-03-31 16:57:32', 4, '2020-03-31', 'internal', 'Ticket updated', 551),
(8, '2020-03-31 17:04:16', '2020-03-31 17:04:16', 5, '2020-03-31', 'internal', 'Ticket created', 552),
(9, '2020-03-31 17:05:51', '2020-03-31 17:05:51', 6, '2020-03-31', 'internal', 'Ticket created', 547),
(10, '2020-03-31 17:08:24', '2020-03-31 17:08:24', 3, '2020-03-31', 'internal', 'Ticket updated', 551),
(11, '2020-03-31 17:11:11', '2020-03-31 17:11:11', 7, '2020-03-31', 'internal', 'Ticket created', 551),
(12, '2020-03-31 17:18:30', '2020-03-31 17:18:30', 8, '2020-03-31', 'internal', 'Ticket created', 553),
(13, '2020-03-31 17:20:01', '2020-03-31 17:20:01', 8, '2020-03-31', 'internal', 'Ticket updated', 553),
(14, '2020-03-31 17:24:38', '2020-03-31 17:24:38', 9, '2020-03-31', 'internal', 'Ticket created', 554),
(15, '2020-03-31 17:33:04', '2020-03-31 17:33:04', 4, '2020-03-31', 'internal', 'Ticket updated', 551),
(16, '2020-03-31 17:33:34', '2020-03-31 17:33:34', 4, '2020-03-31', 'internal', 'Ticket updated', 551),
(17, '2020-03-31 17:34:22', '2020-03-31 17:34:22', 2, '2020-03-31', 'internal', 'Ticket updated', 547),
(18, '2020-03-31 17:36:44', '2020-03-31 17:36:44', 8, '2020-03-31', 'internal', 'Ticket updated', 553),
(19, '2020-03-31 17:37:19', '2020-03-31 17:37:19', 8, '2020-03-31', 'internal', 'Ticket updated', 553),
(20, '2020-03-31 17:37:32', '2020-03-31 17:37:32', 8, '2020-03-31', 'internal', 'Ticket updated', 553),
(21, '2020-03-31 17:38:54', '2020-03-31 17:38:54', 8, '2020-03-31', 'internal', 'Ticket updated', 553),
(22, '2020-03-31 17:39:56', '2020-03-31 17:39:56', 8, '2020-03-31', 'internal', 'Ticket updated', 553),
(23, '2020-03-31 17:41:01', '2020-03-31 17:41:01', 4, '2020-03-31', 'internal', 'Ticket updated', 551),
(24, '2020-04-02 15:50:24', '2020-04-02 15:50:24', 1, '2020-04-02', 'internal', 'Ticket updated', 553),
(25, '2020-04-02 15:51:28', '2020-04-02 15:51:28', 3, '2020-04-02', 'internal', 'Defined task for this ticket with Tanya Musayev', 551),
(26, '2020-04-02 15:53:33', '2020-04-02 15:53:33', 1, '2020-04-02', 'internal', 'Otilio check the internals with Project PO today.', 553),
(27, '2020-04-03 12:43:01', '2020-04-03 12:43:01', 2, '2020-04-03', 'internal', 'Rakesh finish. Will assign to Tanya Musayev.', 551),
(31, '2020-04-03 13:11:42', '2020-04-03 13:11:42', 2, '2020-04-03', 'internal', 'Tanya request compatibily list to the device provider', 551),
(32, '2020-04-03 14:18:56', '2020-04-03 14:18:56', 1, '2020-04-03', 'internal', 'Ticket updated', 547),
(33, '2020-04-03 14:37:11', '2020-04-03 14:37:11', 5, '2020-04-03', 'internal', 'Ticket updated', 552),
(34, '2020-04-03 14:37:24', '2020-04-03 14:37:24', 6, '2020-04-03', 'internal', 'Ticket updated', 547),
(35, '2020-04-03 14:45:04', '2020-04-03 14:45:04', 10, '2020-04-03', 'internal', 'Ticket created', 553),
(36, '2020-04-03 14:49:10', '2020-04-03 14:49:10', 11, '2020-04-03', 'internal', 'Ticket created', 556),
(37, '2020-04-03 15:05:04', '2020-04-03 15:05:04', 1, '2020-04-03', 'internal', 'Ticket updated', 547),
(38, '2020-04-03 15:27:44', '2020-04-03 15:27:44', 12, '2020-04-03', 'internal', 'Ticket created', 552),
(39, '2020-04-03 18:46:36', '2020-04-03 18:46:36', 9, '2020-04-03', 'internal', 'Ticket updated', 554),
(40, '2020-04-03 18:53:00', '2020-04-03 18:53:00', 11, '2020-04-03', 'internal', 'Ticket updated', 554),
(41, '2020-04-03 19:20:46', '2020-04-03 19:20:46', 9, '2020-04-03', 'internal', 'Ticket updated', 554),
(42, '2020-04-03 22:34:52', '2020-04-03 22:34:52', 2, '2020-04-03', 'internal', 'Ticket updated', 551),
(43, '2020-04-03 22:35:38', '2020-04-03 22:35:38', 2, '2020-04-03', 'internal', 'Ticket updated', 551),
(44, '2020-04-03 22:48:22', '2020-04-03 22:48:22', 4, '2020-04-03', 'internal', 'Ticket updated', 551),
(45, '2020-04-04 14:57:29', '2020-04-04 14:57:58', 3, '2020-04-04', 'internal', 'Assigned to Tanya Musayev', 551),
(46, '2020-04-04 20:59:04', '2020-04-04 20:59:04', 4, '2020-04-04', 'internal', 'Ticket updated', 551),
(47, '2020-04-05 21:01:15', '2020-04-05 21:01:15', 1, '2020-04-05', 'internal', 'Ticket updated', 547),
(48, '2020-04-08 18:57:37', '2020-04-08 18:57:37', 1, '2020-04-08', 'internal', 'Ticket updated', 547),
(49, '2020-04-08 19:01:13', '2020-04-08 19:01:13', 1, '2020-04-08', 'internal', 'I have finished the work for this ticket.', 547),
(50, '2020-04-08 19:01:46', '2020-04-08 19:01:46', 1, '2020-04-08', 'internal', 'Ticket updated', 547),
(51, '2020-04-08 19:03:49', '2020-04-08 19:03:49', 1, '2020-04-08', 'internal', 'Ticket updated', 547),
(52, '2020-04-08 19:04:30', '2020-04-08 19:04:30', 1, '2020-04-08', 'internal', 'Ticket updated', 547),
(53, '2020-04-08 19:04:44', '2020-04-08 19:04:44', 1, '2020-04-08', 'internal', 'Ticket updated', 547),
(54, '2020-04-08 19:05:10', '2020-04-08 19:05:10', 1, '2020-04-08', 'internal', 'Ticket updated', 547),
(55, '2020-04-08 19:07:47', '2020-04-08 19:07:47', 2, '0000-00-00', 'internal', 'Just finish this ticket. Tanya.', 551),
(56, '2020-04-08 19:08:27', '2020-04-08 19:08:27', 1, '2020-04-08', 'internal', 'Ticket updated', 547),
(57, '2020-04-08 19:09:05', '2020-04-08 19:09:05', 2, '2020-04-08', 'internal', 'Ticket updated', 551),
(58, '2020-04-08 19:09:26', '2020-04-08 19:09:26', 2, '2020-04-08', 'internal', 'Ticket updated', 551),
(59, '2020-04-08 19:11:26', '2020-04-08 19:11:26', 3, '2020-04-03', 'internal', 'Just finish this ticket. Tanya.', 551),
(60, '2020-04-08 19:12:03', '2020-04-08 19:12:03', 3, '2020-04-08', 'internal', 'Ticket updated', 551),
(61, '2020-04-08 19:12:17', '2020-04-08 19:12:17', 3, '2020-04-08', 'internal', 'Ticket updated', 551),
(62, '2020-04-08 19:13:48', '2020-04-08 19:13:48', 4, '2020-04-08', 'internal', 'Ticket updated', 551),
(63, '2020-04-08 19:58:31', '2020-04-08 19:58:31', 5, '2020-04-08', 'internal', 'Ticket updated', 552),
(64, '2020-04-08 19:59:39', '2020-04-08 19:59:39', 6, '2020-04-08', 'internal', 'Ticket updated', 547),
(65, '2020-04-08 20:00:03', '2020-04-08 20:00:03', 4, '2020-04-08', 'internal', 'Ticket updated', 551),
(66, '2020-04-08 20:00:14', '2020-04-08 20:00:14', 4, '2020-04-08', 'internal', 'Ticket updated', 551),
(67, '2020-04-08 20:01:33', '2020-04-08 20:01:33', 3, '2020-04-08', 'internal', 'Ticket updated', 551),
(68, '2020-04-09 19:57:16', '2020-04-09 19:57:16', 4, '2020-04-09', 'internal', 'Ticket updated', 551),
(69, '2020-04-09 20:03:18', '2020-04-09 20:03:18', 4, '2020-04-09', 'internal', 'Ticket updated', 551),
(70, '2020-04-10 11:45:38', '2020-04-10 11:45:38', 3, '2020-04-10', 'internal', 'Finished. Tanya.', 551),
(71, '2020-04-20 20:41:22', '2020-04-20 20:41:22', 1, '2020-04-20', 'internal', 'Just a Comment on this Ticket', 547),
(72, '2020-04-20 20:41:46', '2020-04-20 20:41:46', 1, '2020-04-20', 'internal', 'Just a Comment on this Ticket', 547),
(73, '2020-04-27 21:17:40', '2020-04-27 21:17:40', 5, '2020-04-27', 'internal', '', 552),
(74, '2020-04-27 21:18:30', '2020-04-27 21:18:30', 5, '2020-04-27', 'internal', '', 552),
(75, '2020-04-27 21:25:49', '2020-04-27 21:25:49', 5, '2020-04-27', 'internal', '', 552),
(76, '2020-04-30 14:56:03', '2020-04-30 14:56:03', 13, '2020-04-30', 'internal', 'Ticket created', 551);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cell_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `company_role_id` int(10) UNSIGNED DEFAULT NULL,
  `project_role_id` int(10) UNSIGNED DEFAULT NULL,
  `seniority_id` int(10) UNSIGNED DEFAULT NULL,
  `office_id` int(10) UNSIGNED DEFAULT NULL,
  `workgroup_id` int(10) UNSIGNED DEFAULT NULL,
  `profile_image_path` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sidebar` enum('sidebar_mini','sidebar_main_open') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` enum('app_theme_a','app_theme_b','app_theme_c','app_theme_d','app_theme_e','app_theme_f','app_theme_g','app_theme_h','app_theme_i','app_theme_dark','app_theme_default') COLLATE utf8mb4_unicode_ci DEFAULT 'app_theme_default',
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `workplace` enum('offshore','onsite') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `name`, `email`, `password`, `address`, `office_phone`, `home_phone`, `cell_phone`, `city_id`, `company_role_id`, `project_role_id`, `seniority_id`, `office_id`, `workgroup_id`, `profile_image_path`, `sidebar`, `theme`, `remember_token`, `user_id`, `workplace`) VALUES
(1, '2020-03-14 15:55:36', '2020-03-19 17:33:44', 'TASKCONTROL SUPERUSER', 'superuser@taskcontrol.com', '$2y$10$NrtzE9/VFCEfykU8JKDaXeNIM9suk1dOw50xyp.vEsRfnTEPmuCX.', 'Juramento 4630 PB Dept 2, Capital Federal, Buenos Aires, Argentina', '291-419-5040', '', '291-419-5040', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sidebar_mini', 'app_theme_d', 'xmYBts8l8tzYgBr2gJurbAS9rjGVW4pOBOxzD2SXz9RUZ3r1k51fADK2H7rl', NULL, 'offshore'),
(2, '2020-03-14 15:55:36', '2020-04-03 15:31:48', 'Admin', 'admin@goitglobal.taskcontrol.com', '$2y$10$9OpG5sGnbr7GmRMw4Dp4N.lTXZq82myD5BB9rmcAE6TNrkmulUDcm', 'Juramento 4630 PB Dept. "2"', '2345678', '419-5040', '419-5040', 2, NULL, NULL, 3, 1, 1, 'Koala.jpg', 'sidebar_mini', 'app_theme_e', 'LFeBZUE9KujqbxyRSuUI2kZiU5kiu958zxyRsNhizF2l6QC95tlypfKtnuiy', NULL, 'offshore'),
(547, '2020-03-15 01:31:23', '2020-08-30 18:23:38', 'Rakesh Dara', 'rdara@goitglobal.taskcontrol.co', '$2y$10$hzxf6QIFXrPbo3Gtx8NF3Ob8ri7XBf64nZS56HpvKn4sw7difRkim', 'Whitefield Road Block # 45', '+91 80 4232 8851', '+91 80 4232 8851', '+91 80 4232 8851', 8, 2, 1, 2, 5, 3, NULL, NULL, 'app_theme_default', 'T4KsYWFIMg3vu3CkGvGMZcb3N4FswPyxYYausD8xbFslOxe75fHs7dsLBBSj', 2, 'offshore'),
(551, '2020-03-15 12:35:11', '2020-04-17 18:09:35', 'Tanya Musayev', 'tmusayev@goitglobal.taskcontrol.co', '$2y$10$soGL1Q7GTmWUXNDaZU0cg.BNSzpAmzLASkTDrh.61CKgUHZ5lPMm.', 'Plot#78,Sec-B,Indrapuri,Raisen Rd', '+91 788 6574839 - 07', '+91 788 6574839 - 07', '+91 788 6574839 - 07', 8, 2, 29, 2, 5, 1, NULL, NULL, 'app_theme_default', 'QkO3pxWH7NkIc41NQQJvPVRE0Y7GbJey6RlgFMoAOTwKBCmB8UadRIgIiA0d', 2, 'offshore'),
(552, '2020-03-15 12:39:53', '2020-03-20 15:56:25', 'Paulo Moura', 'pmoura@goitglobal.taskcontrol.co', '$2y$10$7WSqhK.Wo4t73I6k3Cnrv.v3t.yrO5KVAwKTb7xvw3mpk8epqlFai', 'Rua das Palmeiras 786 - Blk 76', '+55 11 88804-5100', '+55 11 88804-5100', '+55 11 88804-5100', 5, 2, 4, 3, 3, 1, NULL, NULL, 'app_theme_default', NULL, 2, 'offshore'),
(553, '2020-03-15 12:45:25', '2020-04-03 16:12:52', 'Otilio Fernandez', 'ofernandez@goitglobal.taskcontrol.co', '$2y$10$FLroOm/0l3QeuWK42P2NUuZsGYXmjND/Zvi3eSTluXO/hHZxLAB1O', 'Calle 75 # Carrera 63', '+57 (1) 760 0200', '+57 (1) 760 0200', '+57 (1) 760 0200', 9, 2, 7, 3, 4, 1, NULL, NULL, 'app_theme_default', '0G0bLbHttb5i7cXnJhXz4pzsyEjR3As5rw14LdA5QBYA6fZxDc1hjwFo1hC2', 2, 'offshore'),
(554, '2020-03-15 12:48:04', '2020-04-03 16:13:05', 'Christian Cuenca', 'ccuenca@goitglobal.taskcontrol.co', '$2y$10$uQ1fnhwjivJE4WHIeXCjkuXGAnu8bCdOigUFYNG7e2mcyzgeBGtku', 'Av. Directorio 4100, Piso 4 Dto "2"', '54-11-4578686', '54-11-4578686', '54-11-4578686', 2, 4, 2, 3, 1, 4, '', 'sidebar_mini', 'app_theme_dark', 'MDJ4Rw7GnHMWA8EbalojBh21jTPSMrTbFCoyOJijJRxr7tIsjs714tsIvJTM', 2, 'offshore'),
(555, '2020-03-15 12:51:21', '2020-03-20 15:58:30', 'Sergio Gonzalez', 'sgonzalez@goitglobal.taskcontrol.co', '$2y$10$fD9DMhXIHeUQiDj9xiXbWuZjKRZaJLFc3uczwM0nq2GzkZsTXG6wq', 'Av. San Martin 232 - Piso 5to', '54-11-904-0909', '54-11-904-0909', '54-11-904-0909', 6, 2, 3, 2, 2, 1, NULL, NULL, 'app_theme_default', NULL, 2, 'offshore'),
(556, '2020-03-15 12:54:15', '2020-03-20 15:58:58', 'Marcelo Garcia', 'mgarcia@goitglobal.taskcontrol.co', '$2y$10$mCEOTyjaLiZV7/iT81vLCejYCOW5nZtWOaPLd/Ia9k1OGthv.ohxG', '9 de Julio 423', '54-11-2342-998', '54-11-2342-998', '54-11-2342-998', 6, 2, 6, 3, 2, 1, NULL, NULL, 'app_theme_default', NULL, 2, 'offshore'),
(557, '2020-03-15 12:57:09', '2020-03-20 15:57:39', 'Hugo Mangiatto', 'hmangiatto@goitglobal.taskcontrol.co', '$2y$10$rZx8o572YtuaXwpHyPco9etHZAqcISPHs6BTJ8GJ6.gBsVKcVDch2', 'Paseo Colon 1560 P 8 Dto 5', '54-11-2342-2342', '54-11-2342-2342', '54-11-2342-2342', 2, 3, 5, 3, 1, 1, NULL, NULL, 'app_theme_default', NULL, 2, 'offshore'),
(561, '2020-03-20 20:13:29', '2020-03-20 20:13:29', 'Carlos Arrieta', 'carrieta@goitglobal.taskcontrol.co', '$2y$10$ATCaa4aEZe4sxjcj8RvJ/uerQdrysmrJf7WNzeFw538kLzq8An2Rq', 'Azcuenaga 1965 3 "E"', '011-445-7885', '011-476-7865', '011-476-7865', 2, 5, 28, 3, 1, 1, NULL, NULL, 'app_theme_default', NULL, 2, 'offshore'),
(562, '2020-04-04 15:48:46', '2020-04-04 15:49:09', 'Edgardo Martinez', 'emartinez@goitglobal.taskcontrol.co', '$2y$10$SNI7lazC4ikk2NYbjwTo/.e1vBBkz3HU1vAn6.tJUSaaWztbAHMia', 'Guatemala 5630 8 "F"', '11-3456-232', '11-3456-232', '11-3456-232', 2, 2, 4, 3, 1, 1, NULL, NULL, 'app_theme_default', NULL, 2, 'offshore'),
(563, '2020-09-10 21:25:58', '2020-09-10 21:25:58', 'Roberto F. Giangreco', 'rgiangreco@goitglobal.taskcontrol.co', '$2y$10$Mrqr8bTmE8Aem1Pq0U3SwuQUxbAtKl09TfQ9utQPp/PIL7.RBFFdm', 'Juramento 4630 PB 2', '123123', '123123', '123123', 2, 4, 2, 3, 1, 1, NULL, NULL, 'app_theme_default', NULL, 2, 'offshore');

-- --------------------------------------------------------

--
-- Table structure for table `user_social_networks`
--

CREATE TABLE `user_social_networks` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `social_network` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflows`
--

CREATE TABLE `workflows` (
  `customer_id` int(10) NOT NULL COMMENT 'customer code',
  `project_id` int(10) NOT NULL COMMENT 'project code',
  `workflow_id` varchar(15) NOT NULL COMMENT 'workflow hierarchy id (ie 001.000.000.000)',
  `group_name` varchar(30) NOT NULL COMMENT 'ie. Approvals, Quality, Legal, etc',
  `workflow_name` varchar(30) NOT NULL COMMENT 'ie. Billing Approvals',
  `start_date` date NOT NULL COMMENT 'starting date for this workflow (if any)',
  `due_date` date NOT NULL COMMENT 'due date for this workflow (if any)',
  `created_by` int(10) NOT NULL COMMENT 'Creator of this workflow',
  `last_run` date NOT NULL COMMENT 'date & time of last run or checking for this workflow',
  `minutes_run_frequency` decimal(10,0) NOT NULL COMMENT 'Minutes Run Frequency (ie. will run each  60 minutes)',
  `framework` enum('Fixed  Price','Staff Augmentation','Maintenance','SLA','Consultancy','Agile') NOT NULL,
  `owner` int(10) NOT NULL COMMENT 'user id (owner of this workflow now)',
  `destiny` int(10) NOT NULL COMMENT 'confirmar data type, porque puede ser enviado a uno o varios  usuario, a uno o varios workgroups id',
  `notify_owner` tinyint(1) NOT NULL COMMENT 'notify owner yes or no',
  `note` varchar(80) NOT NULL COMMENT 'ie."worflow for billing approval"',
  `action` enum('FullFill Form','Send Email','FullFill Form & Send by Email','Schedule a Meeting Schedule') NOT NULL COMMENT 'a reference to other workflow id or process menu',
  `status` enum('Not Started Yet','Executing','Waiting Input','Overdue','Finished','Canceled') NOT NULL,
  `condition_name` varchar(40) NOT NULL COMMENT 'ie Was this expense report approved by the delivery manager?',
  `success_unsuccess` tinyint(1) NOT NULL COMMENT 'if conditional is sucess or unsuccess (1= sucess, 0=unsuccess)',
  `ifsuccessgoto` varchar(12) NOT NULL COMMENT 'if conditional is t true go to specific workflow _id',
  `ifunsuccessgoto` varchar(12) NOT NULL COMMENT 'if conditional not true goto specific worfklow id',
  `owner_alerted` tinyint(1) NOT NULL COMMENT 'owner already alerted yes or no',
  `attachment` varchar(180) NOT NULL COMMENT 'forms to be fullfilled or to be send'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workgroups`
--

CREATE TABLE `workgroups` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workgroups`
--

INSERT INTO `workgroups` (`id`, `created_at`, `updated_at`, `company_id`, `title`) VALUES
(1, '2020-03-14 16:54:12', '2020-03-20 16:04:23', 1, 'ALL PERSONNEL'),
(3, '2020-03-20 12:17:55', '2020-03-20 12:18:16', 1, 'FRONTEND'),
(4, '2020-03-20 12:18:05', '2020-03-20 12:18:05', 1, 'BACKEND'),
(5, '2020-08-30 17:44:43', '2020-08-30 17:44:43', 1, 'TESTING');

-- --------------------------------------------------------

--
-- Table structure for table `working_hours`
--

CREATE TABLE `working_hours` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `hours` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `working_hours`
--

INSERT INTO `working_hours` (`id`, `created_at`, `updated_at`, `project_id`, `user_id`, `date`, `hours`) VALUES
(5139, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-03-20', 4),
(5140, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-03-21', 4),
(5141, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-03-22', 4),
(5142, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-03-23', 4),
(5143, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-03-26', 4),
(5144, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-03-27', 4),
(5145, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-03-28', 4),
(5146, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-03-29', 4),
(5147, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-03-30', 4),
(5148, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-04-02', 4),
(5149, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-04-03', 4),
(5150, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-04-04', 4),
(5151, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-04-05', 4),
(5152, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-04-06', 4),
(5153, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-04-09', 4),
(5154, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-04-10', 4),
(5155, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-04-11', 4),
(5156, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-04-12', 4),
(5157, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-04-13', 4),
(5158, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-04-16', 4),
(5159, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-04-17', 4),
(5160, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-04-18', 4),
(5161, '2020-09-12 19:19:51', '2020-09-12 19:19:51', 7, 554, '2020-04-19', 4),
(5162, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-04-20', 4),
(5163, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-04-23', 4),
(5164, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-04-24', 4),
(5165, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-04-25', 4),
(5166, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-04-26', 4),
(5167, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-04-27', 4),
(5168, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-04-30', 4),
(5169, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-01', 4),
(5170, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-02', 4),
(5171, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-03', 4),
(5172, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-04', 4),
(5173, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-07', 4),
(5174, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-08', 4),
(5175, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-09', 4),
(5176, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-10', 4),
(5177, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-11', 4),
(5178, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-14', 4),
(5179, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-15', 4),
(5180, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-16', 4),
(5181, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-17', 4),
(5182, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-18', 4),
(5183, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-21', 4),
(5184, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-22', 4),
(5185, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-23', 4),
(5186, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-24', 4),
(5187, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-25', 4),
(5188, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-28', 4),
(5189, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-29', 4),
(5190, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-30', 4),
(5191, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-05-31', 4),
(5192, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-06-01', 4),
(5193, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-06-04', 4),
(5194, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-06-05', 4),
(5195, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-06-06', 4),
(5196, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-06-07', 4),
(5197, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-06-08', 4),
(5198, '2020-09-12 19:19:52', '2020-09-12 19:19:52', 7, 554, '2020-06-11', 4),
(5199, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 554, '2020-06-12', 4),
(5200, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 554, '2020-06-13', 4),
(5201, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 554, '2020-06-14', 4),
(5202, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 554, '2020-06-15', 4),
(5203, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 554, '2020-06-18', 4),
(5204, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 554, '2020-06-19', 4),
(5205, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 554, '2020-06-20', 4),
(5206, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 554, '2020-06-21', 4),
(5207, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-03-21', 4),
(5208, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-03-22', 4),
(5209, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-03-23', 4),
(5210, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-03-26', 4),
(5211, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-03-27', 4),
(5212, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-03-28', 4),
(5213, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-03-29', 4),
(5214, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-03-30', 4),
(5215, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-02', 4),
(5216, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-03', 4),
(5217, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-04', 4),
(5218, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-05', 4),
(5219, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-06', 4),
(5220, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-09', 4),
(5221, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-10', 4),
(5222, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-11', 4),
(5223, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-12', 4),
(5224, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-13', 4),
(5225, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-16', 4),
(5226, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-17', 4),
(5227, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-18', 4),
(5228, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-19', 4),
(5229, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-20', 4),
(5230, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-23', 4),
(5231, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-24', 4),
(5232, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-25', 4),
(5233, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-26', 4),
(5234, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-27', 4),
(5235, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-04-30', 4),
(5236, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-05-01', 4),
(5237, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-05-02', 4),
(5238, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-05-03', 4),
(5239, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-05-04', 4),
(5240, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-05-07', 4),
(5241, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-05-08', 4),
(5242, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-05-09', 4),
(5243, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-05-10', 4),
(5244, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-05-11', 4),
(5245, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-05-14', 4),
(5246, '2020-09-12 19:19:53', '2020-09-12 19:19:53', 7, 553, '2020-05-15', 4),
(5247, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-05-16', 4),
(5248, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-05-17', 4),
(5249, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-05-18', 4),
(5250, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-05-21', 4),
(5251, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-05-22', 4),
(5252, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-05-23', 4),
(5253, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-05-24', 4),
(5254, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-05-25', 4),
(5255, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-05-28', 4),
(5256, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-05-29', 4),
(5257, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-05-30', 4),
(5258, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-05-31', 4),
(5259, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-06-01', 4),
(5260, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-06-04', 4),
(5261, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-06-05', 4),
(5262, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-06-06', 4),
(5263, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-06-07', 4),
(5264, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-06-08', 4),
(5265, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-06-11', 4),
(5266, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-06-12', 4),
(5267, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-06-13', 4),
(5268, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-06-14', 4),
(5269, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-06-15', 4),
(5270, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-06-18', 4),
(5271, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-06-19', 4),
(5272, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-06-20', 4),
(5273, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 553, '2020-06-21', 4),
(5274, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-03-21', 8),
(5275, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-03-22', 8),
(5276, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-03-23', 8),
(5277, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-03-26', 8),
(5278, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-03-27', 8),
(5279, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-03-28', 8),
(5280, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-03-29', 8),
(5281, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-03-30', 8),
(5282, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-02', 8),
(5283, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-03', 8),
(5284, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-04', 8),
(5285, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-05', 8),
(5286, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-06', 8),
(5287, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-09', 8),
(5288, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-10', 8),
(5289, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-11', 8),
(5290, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-12', 8),
(5291, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-13', 8),
(5292, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-16', 8),
(5293, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-17', 8),
(5294, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-18', 8),
(5295, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-19', 8),
(5296, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-20', 8),
(5297, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-23', 8),
(5298, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-24', 8),
(5299, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-25', 8),
(5300, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-26', 8),
(5301, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-27', 8),
(5302, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-04-30', 8),
(5303, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-05-01', 8),
(5304, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-05-02', 8),
(5305, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-05-03', 8),
(5306, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-05-04', 8),
(5307, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-05-07', 8),
(5308, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-05-08', 8),
(5309, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-05-09', 8),
(5310, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-05-10', 8),
(5311, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-05-11', 8),
(5312, '2020-09-12 19:19:54', '2020-09-12 19:19:54', 7, 547, '2020-05-14', 8),
(5313, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-05-15', 8),
(5314, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-05-16', 8),
(5315, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-05-17', 8),
(5316, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-05-18', 8),
(5317, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-05-21', 8),
(5318, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-05-22', 8),
(5319, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-05-23', 8),
(5320, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-05-24', 8),
(5321, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-05-25', 8),
(5322, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-05-28', 8),
(5323, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-05-29', 8),
(5324, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-05-30', 8),
(5325, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-05-31', 8),
(5326, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-06-01', 8),
(5327, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-06-04', 8),
(5328, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-06-05', 8),
(5329, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-06-06', 8),
(5330, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-06-07', 8),
(5331, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-06-08', 8),
(5332, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-06-11', 8),
(5333, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-06-12', 8),
(5334, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-06-13', 8),
(5335, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-06-14', 8),
(5336, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-06-15', 8),
(5337, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-06-18', 8),
(5338, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-06-19', 8),
(5339, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-06-20', 8),
(5340, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 547, '2020-06-21', 8),
(5341, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 551, '2020-03-21', 8),
(5342, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 551, '2020-03-22', 8),
(5343, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 551, '2020-03-23', 8),
(5344, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 551, '2020-03-26', 8),
(5345, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 551, '2020-03-27', 8),
(5346, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 551, '2020-03-28', 8),
(5347, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 551, '2020-03-29', 8),
(5348, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 551, '2020-03-30', 8),
(5349, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 551, '2020-04-02', 8),
(5350, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 551, '2020-04-03', 8),
(5351, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 551, '2020-04-04', 8),
(5352, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 551, '2020-04-05', 8),
(5353, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 551, '2020-04-06', 8),
(5354, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 551, '2020-04-09', 8),
(5355, '2020-09-12 19:19:55', '2020-09-12 19:19:55', 7, 551, '2020-04-10', 8),
(5356, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-04-11', 8),
(5357, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-04-12', 8),
(5358, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-04-13', 8),
(5359, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-04-16', 8),
(5360, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-04-17', 8),
(5361, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-04-18', 8),
(5362, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-04-19', 8),
(5363, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-04-20', 8),
(5364, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-04-23', 8),
(5365, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-04-24', 8),
(5366, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-04-25', 8),
(5367, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-04-26', 8),
(5368, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-04-27', 8),
(5369, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-04-30', 8),
(5370, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-01', 8),
(5371, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-02', 8),
(5372, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-03', 8),
(5373, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-04', 8),
(5374, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-07', 8),
(5375, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-08', 8),
(5376, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-09', 8),
(5377, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-10', 8),
(5378, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-11', 8),
(5379, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-14', 8),
(5380, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-15', 8),
(5381, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-16', 8),
(5382, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-17', 8),
(5383, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-18', 8),
(5384, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-21', 8),
(5385, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-22', 8),
(5386, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-23', 8),
(5387, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-24', 8),
(5388, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-25', 8),
(5389, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-28', 8),
(5390, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-29', 8),
(5391, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-30', 8),
(5392, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-05-31', 8),
(5393, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-06-01', 8),
(5394, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-06-04', 8),
(5395, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-06-05', 8),
(5396, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-06-06', 8),
(5397, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-06-07', 8),
(5398, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-06-08', 8),
(5399, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-06-11', 8),
(5400, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-06-12', 8),
(5401, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-06-13', 8),
(5402, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-06-14', 8),
(5403, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-06-15', 8),
(5404, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-06-18', 8),
(5405, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-06-19', 8),
(5406, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-06-20', 8),
(5407, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 551, '2020-06-21', 8),
(5408, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 552, '2020-04-03', 7),
(5409, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 552, '2020-04-04', 7),
(5410, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 552, '2020-04-05', 7),
(5411, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 552, '2020-04-06', 7),
(5412, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 552, '2020-04-09', 7),
(5413, '2020-09-12 19:19:56', '2020-09-12 19:19:56', 7, 552, '2020-04-10', 7),
(5414, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-04-11', 7),
(5415, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-04-12', 7),
(5416, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-04-13', 7),
(5417, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-04-16', 7),
(5418, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-04-17', 7),
(5419, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-04-18', 7),
(5420, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-04-19', 7),
(5421, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-04-20', 7),
(5422, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-04-23', 7),
(5423, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-04-24', 7),
(5424, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-04-25', 7),
(5425, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-04-26', 7),
(5426, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-04-27', 7),
(5427, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-04-30', 7),
(5428, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-01', 7),
(5429, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-02', 7),
(5430, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-03', 7),
(5431, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-04', 7),
(5432, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-07', 7),
(5433, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-08', 7),
(5434, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-09', 7),
(5435, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-10', 7),
(5436, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-11', 7),
(5437, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-14', 7),
(5438, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-15', 7),
(5439, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-16', 7),
(5440, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-17', 7),
(5441, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-18', 7),
(5442, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-21', 7),
(5443, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-22', 7),
(5444, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-23', 7),
(5445, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-24', 7),
(5446, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-25', 7),
(5447, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-28', 7),
(5448, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-29', 7),
(5449, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-30', 7),
(5450, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-05-31', 7),
(5451, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-06-01', 7),
(5452, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-06-04', 7),
(5453, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-06-05', 7),
(5454, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-06-06', 7),
(5455, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-06-07', 7),
(5456, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-06-08', 7),
(5457, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-06-11', 7),
(5458, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-06-12', 7),
(5459, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-06-13', 7),
(5460, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-06-14', 7),
(5461, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-06-15', 7),
(5462, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-06-18', 7),
(5463, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-06-19', 7),
(5464, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-06-20', 7),
(5465, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 552, '2020-06-21', 7),
(5466, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-04-20', 4),
(5467, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-04-23', 4),
(5468, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-04-24', 4),
(5469, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-04-25', 4),
(5470, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-04-26', 4),
(5471, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-04-27', 4),
(5472, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-04-30', 4),
(5473, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-05-01', 4),
(5474, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-05-02', 4),
(5475, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-05-03', 4),
(5476, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-05-04', 4),
(5477, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-05-07', 4),
(5478, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-05-08', 4),
(5479, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-05-09', 4),
(5480, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-05-10', 4),
(5481, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-05-11', 4),
(5482, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-05-14', 4),
(5483, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-05-15', 4),
(5484, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-05-16', 4),
(5485, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-05-17', 4),
(5486, '2020-09-12 19:19:57', '2020-09-12 19:19:57', 7, 556, '2020-05-18', 4),
(5487, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-05-21', 4),
(5488, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-05-22', 4),
(5489, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-05-23', 4),
(5490, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-05-24', 4),
(5491, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-05-25', 4),
(5492, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-05-28', 4),
(5493, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-05-29', 4),
(5494, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-05-30', 4),
(5495, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-05-31', 4),
(5496, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-06-01', 4),
(5497, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-06-04', 4),
(5498, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-06-05', 4),
(5499, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-06-06', 4),
(5500, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-06-07', 4),
(5501, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-06-08', 4),
(5502, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-06-11', 4),
(5503, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-06-12', 4),
(5504, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-06-13', 4),
(5505, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-06-14', 4),
(5506, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-06-15', 4),
(5507, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-06-18', 4),
(5508, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-06-19', 4),
(5509, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-06-20', 4),
(5510, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-06-21', 4),
(5511, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-06-22', 4),
(5512, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 556, '2020-06-25', 4),
(5513, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-05-10', 8),
(5514, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-05-11', 8),
(5515, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-05-14', 8),
(5516, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-05-15', 8),
(5517, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-05-16', 8),
(5518, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-05-17', 8),
(5519, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-05-18', 8),
(5520, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-05-21', 8),
(5521, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-05-22', 8),
(5522, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-05-23', 8),
(5523, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-05-24', 8),
(5524, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-05-25', 8),
(5525, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-05-28', 8),
(5526, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-05-29', 8),
(5527, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-05-30', 8),
(5528, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-05-31', 8),
(5529, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-06-01', 8),
(5530, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-06-04', 8),
(5531, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-06-05', 8),
(5532, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-06-06', 8),
(5533, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-06-07', 8),
(5534, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-06-08', 8),
(5535, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-06-11', 8),
(5536, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-06-12', 8),
(5537, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-06-13', 8),
(5538, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-06-14', 8),
(5539, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-06-15', 8),
(5540, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-06-18', 8),
(5541, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-06-19', 8),
(5542, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-06-20', 8),
(5543, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 555, '2020-06-21', 8),
(5544, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 557, '2020-03-21', 2),
(5545, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 557, '2020-03-22', 2),
(5546, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 557, '2020-03-23', 2),
(5547, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 557, '2020-03-26', 2),
(5548, '2020-09-12 19:19:58', '2020-09-12 19:19:58', 7, 557, '2020-03-27', 2),
(5549, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-03-28', 2),
(5550, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-03-29', 2),
(5551, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-03-30', 2),
(5552, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-02', 2),
(5553, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-03', 2),
(5554, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-04', 2),
(5555, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-05', 2),
(5556, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-06', 2),
(5557, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-09', 2),
(5558, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-10', 2),
(5559, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-11', 2),
(5560, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-12', 2),
(5561, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-13', 2),
(5562, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-16', 2),
(5563, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-17', 2),
(5564, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-18', 2),
(5565, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-19', 2),
(5566, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-20', 2),
(5567, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-23', 2),
(5568, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-24', 2),
(5569, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-25', 2),
(5570, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-26', 2),
(5571, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-27', 2),
(5572, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-04-30', 2),
(5573, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-01', 2),
(5574, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-02', 2),
(5575, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-03', 2),
(5576, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-04', 2),
(5577, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-07', 2),
(5578, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-08', 2),
(5579, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-09', 2),
(5580, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-10', 2),
(5581, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-11', 2),
(5582, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-14', 2),
(5583, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-15', 2),
(5584, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-16', 2),
(5585, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-17', 2),
(5586, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-18', 2),
(5587, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-21', 2),
(5588, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-22', 2),
(5589, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-23', 2),
(5590, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-24', 2),
(5591, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-25', 2),
(5592, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-28', 2),
(5593, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-29', 2),
(5594, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-30', 2),
(5595, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-05-31', 2),
(5596, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-06-01', 2),
(5597, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-06-04', 2),
(5598, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-06-05', 2),
(5599, '2020-09-12 19:19:59', '2020-09-12 19:19:59', 7, 557, '2020-06-06', 2),
(5600, '2020-09-12 19:20:00', '2020-09-12 19:20:00', 7, 557, '2020-06-07', 2),
(5601, '2020-09-12 19:20:00', '2020-09-12 19:20:00', 7, 557, '2020-06-08', 2),
(5602, '2020-09-12 19:20:00', '2020-09-12 19:20:00', 7, 557, '2020-06-11', 2),
(5603, '2020-09-12 19:20:00', '2020-09-12 19:20:00', 7, 557, '2020-06-12', 2),
(5604, '2020-09-12 19:20:00', '2020-09-12 19:20:00', 7, 557, '2020-06-13', 2),
(5605, '2020-09-12 19:20:00', '2020-09-12 19:20:00', 7, 557, '2020-06-14', 2),
(5606, '2020-09-12 19:20:00', '2020-09-12 19:20:00', 7, 557, '2020-06-15', 2),
(5607, '2020-09-12 19:20:00', '2020-09-12 19:20:00', 7, 557, '2020-06-18', 2),
(5608, '2020-09-12 19:20:00', '2020-09-12 19:20:00', 7, 557, '2020-06-19', 2),
(5609, '2020-09-12 19:20:00', '2020-09-12 19:20:00', 7, 557, '2020-06-20', 2),
(5610, '2020-09-12 19:20:00', '2020-09-12 19:20:00', 7, 557, '2020-06-21', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absences`
--
ALTER TABLE `absences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `absences_absence_type_id_foreign` (`absence_type_id`),
  ADD KEY `absences_project_id_foreign` (`project_id`),
  ADD KEY `absences_user_id_foreign` (`user_id`);

--
-- Indexes for table `absence_types`
--
ALTER TABLE `absence_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `absence_types_country_id_foreign` (`country_id`),
  ADD KEY `absence_types_city_id_foreign` (`city_id`),
  ADD KEY `absence_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `absence_types_template`
--
ALTER TABLE `absence_types_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `absence_types_template_country_id_foreign` (`country_id`),
  ADD KEY `absence_types_template_city_id_foreign` (`city_id`);

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activities_history`
--
ALTER TABLE `activities_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activities_history_agenda_id_foreign` (`agenda_id`),
  ADD KEY `activities_history_follower_id_foreign` (`follower_id`);

--
-- Indexes for table `additional_hours`
--
ALTER TABLE `additional_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `additional_hours_project_id_foreign` (`project_id`),
  ADD KEY `additional_hours_user_id_foreign` (`user_id`),
  ADD KEY `additional_hours_rate_id_foreign` (`rate_id`),
  ADD KEY `project_role_id` (`project_role_id`),
  ADD KEY `seniority_id` (`seniority_id`),
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `office_id` (`office_id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agenda_company_id_foreign` (`company_id`),
  ADD KEY `agenda_project_id_foreign` (`project_id`),
  ADD KEY `agenda_creator_id_foreign` (`creator_id`),
  ADD KEY `agenda_owner_id_foreign` (`owner_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_country_id_foreign` (`country_id`),
  ADD KEY `cities_company_id_foreign` (`company_id`);

--
-- Indexes for table `cities_template`
--
ALTER TABLE `cities_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_template_country_id_foreign` (`country_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_city_id_foreign` (`city_id`),
  ADD KEY `companies_currency_id_foreign` (`currency_id`),
  ADD KEY `companies_industry_id_foreign` (`industry_id`),
  ADD KEY `companies_user_id_foreign` (`user_id`);

--
-- Indexes for table `company_roles`
--
ALTER TABLE `company_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_roles_company_id_foreign` (`company_id`);

--
-- Indexes for table `company_role_templates`
--
ALTER TABLE `company_role_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_users`
--
ALTER TABLE `company_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_users_company_id_foreign` (`company_id`),
  ADD KEY `company_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_company_id_foreign` (`company_id`),
  ADD KEY `contacts_project_id_foreign` (`project_id`),
  ADD KEY `contacts_country_id_foreign` (`country_id`),
  ADD KEY `contacts_city_id_foreign` (`city_id`),
  ADD KEY `contacts_industry_id_foreign` (`industry_id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contracts_customer_id_foreign` (`customer_id`),
  ADD KEY `contracts_project_id_foreign` (`project_id`),
  ADD KEY `contracts_engagement_id_foreign` (`engagement_id`),
  ADD KEY `contracts_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `contract_expenses`
--
ALTER TABLE `contract_expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_expenses_expense_id_foreign` (`expense_id`),
  ADD KEY `contract_expenses_currency_id_foreign` (`currency_id`),
  ADD KEY `contract_expenses_contract_id_foreign` (`contract_id`);

--
-- Indexes for table `contract_materials`
--
ALTER TABLE `contract_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_materials_material_id_foreign` (`material_id`),
  ADD KEY `contract_materials_currency_id_foreign` (`currency_id`),
  ADD KEY `contract_materials_contract_id_foreign` (`contract_id`);

--
-- Indexes for table `contract_resources`
--
ALTER TABLE `contract_resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_resources_project_role_id_foreign` (`project_role_id`),
  ADD KEY `contract_resources_seniority_id_foreign` (`seniority_id`),
  ADD KEY `contract_resources_rate_id_foreign` (`rate_id`),
  ADD KEY `contract_resources_currency_id_foreign` (`currency_id`),
  ADD KEY `contract_resources_contract_id_foreign` (`contract_id`),
  ADD KEY `office_id` (`office_id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `contract_services`
--
ALTER TABLE `contract_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_services_service_id_foreign` (`service_id`),
  ADD KEY `contract_services_currency_id_foreign` (`currency_id`),
  ADD KEY `contract_services_contract_id_foreign` (`contract_id`);

--
-- Indexes for table `costs`
--
ALTER TABLE `costs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `costs_company_id_foreign` (`company_id`),
  ADD KEY `costs_country_id_foreign` (`country_id`),
  ADD KEY `costs_city_id_foreign` (`city_id`),
  ADD KEY `costs_seniority_id_foreign` (`seniority_id`),
  ADD KEY `costs_project_role_id_foreign` (`project_role_id`),
  ADD KEY `costs_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countries_language_id_foreign` (`language_id`),
  ADD KEY `countries_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_city_id_foreign` (`city_id`),
  ADD KEY `customers_currency_id_foreign` (`currency_id`),
  ADD KEY `customers_company_id_foreign` (`company_id`),
  ADD KEY `customers_industry_id_foreign` (`industry_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departments_office_id_foreign` (`office_id`);

--
-- Indexes for table `directories`
--
ALTER TABLE `directories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `directory_role`
--
ALTER TABLE `directory_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directory_role_directory_id_foreign` (`directory_id`),
  ADD KEY `directory_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_company_id_foreign` (`company_id`),
  ADD KEY `discounts_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `doctypes`
--
ALTER TABLE `doctypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_directory_id_foreign` (`directory_id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emails_email_category_id_foreign` (`email_category_id`);

--
-- Indexes for table `email_categories`
--
ALTER TABLE `email_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_categories_company_id_foreign` (`company_id`);

--
-- Indexes for table `email_category_templates`
--
ALTER TABLE `email_category_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_templates_email_category_template_id_foreign` (`email_category_template_id`);

--
-- Indexes for table `engagements`
--
ALTER TABLE `engagements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exchange_rates`
--
ALTER TABLE `exchange_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exchange_rates_currency_id_foreign` (`currency_id`),
  ADD KEY `exchange_rates_company_id_foreign` (`company_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_company_id_foreign` (`company_id`),
  ADD KEY `expenses_cost_currency_id_foreign` (`cost_currency_id`),
  ADD KEY `expenses_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_user_id_foreign` (`user_id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `holidays_country_id_foreign` (`country_id`),
  ADD KEY `holidays_company_id_foreign` (`company_id`);

--
-- Indexes for table `holidays_templates`
--
ALTER TABLE `holidays_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `holidays_templates_country_id_foreign` (`country_id`);

--
-- Indexes for table `industries`
--
ALTER TABLE `industries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_project_id_foreign` (`project_id`),
  ADD KEY `invoices_contact_id_foreign` (`contact_id`),
  ADD KEY `invoices_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `invoice_discounts`
--
ALTER TABLE `invoice_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_discounts_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_discounts_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `invoice_disc_codifier`
--
ALTER TABLE `invoice_disc_codifier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_disc_codifier_discount_id_foreign` (`discount_id`),
  ADD KEY `invoice_disc_codifier_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `invoice_expenses`
--
ALTER TABLE `invoice_expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_expenses_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_expenses_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `invoice_materials`
--
ALTER TABLE `invoice_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_materials_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_materials_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `invoice_resources`
--
ALTER TABLE `invoice_resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_resources_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_resources_project_role_id_foreign` (`project_role_id`),
  ADD KEY `invoice_resources_seniority_id_foreign` (`seniority_id`),
  ADD KEY `invoice_resources_currency_id_foreign` (`currency_id`),
  ADD KEY `invoice_resources_rate_id_foreign` (`rate_id`),
  ADD KEY `invoice_resources_user_id_foreign` (`user_id`),
  ADD KEY `office_id` (`office_id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `invoice_services`
--
ALTER TABLE `invoice_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_services_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_services_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `invoice_taxes`
--
ALTER TABLE `invoice_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_taxes_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_taxes_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `invoice_tax_codifier`
--
ALTER TABLE `invoice_tax_codifier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_tax_codifier_tax_id_foreign` (`tax_id`),
  ADD KEY `invoice_tax_codifier_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `kpis`
--
ALTER TABLE `kpis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kpis_company_id_foreign` (`company_id`),
  ADD KEY `kpis_category_foreign` (`category`);

--
-- Indexes for table `kpis_category`
--
ALTER TABLE `kpis_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kpis_category_company_id_foreign` (`company_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materials_company_id_foreign` (`company_id`),
  ADD KEY `materials_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `metadocu`
--
ALTER TABLE `metadocu`
  ADD PRIMARY KEY (`language`,`activity`,`document_type`,`code`,`version`),
  ADD KEY `metadocu_activity_foreign` (`activity`),
  ADD KEY `metadocu_document_type_foreign` (`document_type`),
  ADD KEY `metadocu_document_id_foreign` (`document_id`);

--
-- Indexes for table `metagrid`
--
ALTER TABLE `metagrid`
  ADD PRIMARY KEY (`language`,`activity`,`document_type`,`code`,`version`,`variable_code`,`row_number`,`column_number`),
  ADD KEY `metagrid_activity_foreign` (`activity`),
  ADD KEY `metagrid_document_type_foreign` (`document_type`);

--
-- Indexes for table `metavariable`
--
ALTER TABLE `metavariable`
  ADD PRIMARY KEY (`language`,`activity`,`document_type`,`code`,`version`,`variable_code`),
  ADD KEY `metavariable_activity_foreign` (`activity`),
  ADD KEY `metavariable_document_type_foreign` (`document_type`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_project_id_foreign` (`project_id`);

--
-- Indexes for table `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offices_company_id_foreign` (`company_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_user_permission_id_index` (`permission_id`),
  ADD KEY `permission_user_user_id_index` (`user_id`);

--
-- Indexes for table `procurements`
--
ALTER TABLE `procurements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `procurements_project_id_foreign` (`project_id`),
  ADD KEY `procurements_cost_currency_id_foreign` (`cost_currency_id`),
  ADD KEY `procurements_provider_id_foreign` (`provider_id`),
  ADD KEY `procurements_responsable_id_foreign` (`responsable_id`);

--
-- Indexes for table `procurement_offers`
--
ALTER TABLE `procurement_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `procurement_offers_delivery_responsable_foreign` (`delivery_responsable`),
  ADD KEY `procurement_offers_procurement_id_foreign` (`procurement_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_customer_id_foreign` (`customer_id`),
  ADD KEY `projects_project_manager_id_foreign` (`project_manager_id`),
  ADD KEY `projects_technical_director_id_foreign` (`technical_director_id`),
  ADD KEY `projects_delivery_manager_id_foreign` (`delivery_manager_id`),
  ADD KEY `projects_department_id_foreign` (`department_id`);

--
-- Indexes for table `project_expenses`
--
ALTER TABLE `project_expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_expenses_project_id_foreign` (`project_id`),
  ADD KEY `project_expenses_currency_id_foreign` (`currency_id`),
  ADD KEY `project_expenses_expense_id_foreign` (`expense_id`);

--
-- Indexes for table `project_kpi_alerts`
--
ALTER TABLE `project_kpi_alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_kpi_alerts_kpi_id_foreign` (`kpi_id`),
  ADD KEY `project_kpi_alerts_project_id_foreign` (`project_id`);

--
-- Indexes for table `project_materials`
--
ALTER TABLE `project_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_materials_project_id_foreign` (`project_id`),
  ADD KEY `project_materials_currency_id_foreign` (`currency_id`),
  ADD KEY `project_materials_material_id_foreign` (`material_id`);

--
-- Indexes for table `project_resources`
--
ALTER TABLE `project_resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_resources_project_id_foreign` (`project_id`),
  ADD KEY `project_resources_user_id_foreign` (`user_id`),
  ADD KEY `project_resources_project_role_id_foreign` (`project_role_id`),
  ADD KEY `project_resources_seniority_id_foreign` (`seniority_id`),
  ADD KEY `project_resources_rate_id_foreign` (`rate_id`),
  ADD KEY `project_resources_currency_id_foreign` (`currency_id`),
  ADD KEY `office_id` (`office_id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `project_roles`
--
ALTER TABLE `project_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_roles_company_id_foreign` (`company_id`);

--
-- Indexes for table `project_role_templates`
--
ALTER TABLE `project_role_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_services`
--
ALTER TABLE `project_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_services_project_id_foreign` (`project_id`),
  ADD KEY `project_services_currency_id_foreign` (`currency_id`),
  ADD KEY `project_services_service_id_foreign` (`service_id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `providers_city_id_foreign` (`city_id`),
  ADD KEY `providers_currency_id_foreign` (`currency_id`),
  ADD KEY `providers_industry_id_foreign` (`industry_id`),
  ADD KEY `providers_company_id_foreign` (`company_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotations_project_id_foreign` (`project_id`),
  ADD KEY `quotations_customer_id_foreign` (`customer_id`),
  ADD KEY `quotations_contact_id_foreign` (`contact_id`),
  ADD KEY `quotations_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `quotation_expenses`
--
ALTER TABLE `quotation_expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_expenses_quotation_id_foreign` (`quotation_id`),
  ADD KEY `quotation_expenses_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `quotation_lines`
--
ALTER TABLE `quotation_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_lines_quotation_id_foreign` (`quotation_id`);

--
-- Indexes for table `quotation_materials`
--
ALTER TABLE `quotation_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_materials_quotation_id_foreign` (`quotation_id`),
  ADD KEY `quotation_materials_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `quotation_resources`
--
ALTER TABLE `quotation_resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_resources_quotation_id_foreign` (`quotation_id`),
  ADD KEY `quotation_resources_project_role_id_foreign` (`project_role_id`),
  ADD KEY `quotation_resources_seniority_id_foreign` (`seniority_id`),
  ADD KEY `quotation_resources_currency_id_foreign` (`currency_id`),
  ADD KEY `quotation_resources_rate_id_foreign` (`rate_id`),
  ADD KEY `quotation_resources_user_id_foreign` (`user_id`),
  ADD KEY `quotation_resources_office_id_foreign` (`office_id`),
  ADD KEY `quotation_resources_country_id_foreign` (`country_id`),
  ADD KEY `quotation_resources_city_id_foreign` (`city_id`);

--
-- Indexes for table `quotation_services`
--
ALTER TABLE `quotation_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_services_quotation_id_foreign` (`quotation_id`),
  ADD KEY `quotation_services_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rates_country_id_foreign` (`country_id`),
  ADD KEY `rates_city_id_foreign` (`city_id`),
  ADD KEY `rates_project_role_id_foreign` (`project_role_id`),
  ADD KEY `rates_seniority_id_foreign` (`seniority_id`),
  ADD KEY `rates_currency_id_foreign` (`currency_id`),
  ADD KEY `rates_office_id_foreign` (`office_id`);

--
-- Indexes for table `replacements`
--
ALTER TABLE `replacements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `replacements_absence_id_foreign` (`absence_id`),
  ADD KEY `replacements_user_id_foreign` (`user_id`);

--
-- Indexes for table `requirements`
--
ALTER TABLE `requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `requirements_project_id_foreign` (`project_id`),
  ADD KEY `requirements_owner_id_foreign` (`owner_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_company_role_id_foreign` (`company_role_id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_index` (`role_id`),
  ADD KEY `role_user_user_id_index` (`user_id`);

--
-- Indexes for table `seniorities`
--
ALTER TABLE `seniorities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seniorities_company_id_foreign` (`company_id`);

--
-- Indexes for table `seniority_templates`
--
ALTER TABLE `seniority_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_company_id_foreign` (`company_id`),
  ADD KEY `services_currency_id_foreign` (`currency_id`),
  ADD KEY `services_cost_currency_id_foreign` (`cost_currency_id`);

--
-- Indexes for table `stakeholders`
--
ALTER TABLE `stakeholders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stakeholders_contact_id_foreign` (`contact_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_project_id_foreign` (`project_id`),
  ADD KEY `tasks_requirement_id_foreign` (`requirement_id`);

--
-- Indexes for table `task_expenses`
--
ALTER TABLE `task_expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_expenses_task_id_foreign` (`task_id`),
  ADD KEY `task_expenses_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `task_materials`
--
ALTER TABLE `task_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_materials_task_id_foreign` (`task_id`),
  ADD KEY `task_materials_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `task_resources`
--
ALTER TABLE `task_resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_resources_task_id_foreign` (`task_id`),
  ADD KEY `task_resources_user_id_foreign` (`user_id`),
  ADD KEY `task_resources_project_role_id_foreign` (`project_role_id`),
  ADD KEY `task_resources_currency_id_foreign` (`currency_id`),
  ADD KEY `task_resources_seniority_id_foreign` (`seniority_id`);

--
-- Indexes for table `task_services`
--
ALTER TABLE `task_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_services_task_id_foreign` (`task_id`),
  ADD KEY `task_services_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taxes_company_id_foreign` (`company_id`),
  ADD KEY `taxes_country_id_foreign` (`country_id`),
  ADD KEY `taxes_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_project_id_foreign` (`project_id`);

--
-- Indexes for table `team_users`
--
ALTER TABLE `team_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_users_project_id_foreign` (`project_id`),
  ADD KEY `team_users_user_id_foreign` (`user_id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `office_id` (`office_id`),
  ADD KEY `project_role_id` (`project_role_id`),
  ADD KEY `seniority_id` (`seniority_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_task_id_foreign` (`task_id`),
  ADD KEY `tickets_assignee_id_foreign` (`assignee_id`),
  ADD KEY `tickets_last_updater_id_foreign` (`last_updater_id`),
  ADD KEY `tickets_owner_id_foreign` (`owner_id`);

--
-- Indexes for table `ticket_histories`
--
ALTER TABLE `ticket_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_histories_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_histories_owner_id_foreign` (`owner_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_user_id_foreign` (`user_id`),
  ADD KEY `users_city_id_foreign` (`city_id`),
  ADD KEY `users_company_role_id_foreign` (`company_role_id`),
  ADD KEY `users_project_role_id_foreign` (`project_role_id`),
  ADD KEY `users_seniority_id_foreign` (`seniority_id`),
  ADD KEY `users_office_id_foreign` (`office_id`),
  ADD KEY `users_workgroup_id_foreign` (`workgroup_id`);

--
-- Indexes for table `user_social_networks`
--
ALTER TABLE `user_social_networks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_social_networks_user_id_foreign` (`user_id`);

--
-- Indexes for table `workgroups`
--
ALTER TABLE `workgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workgroups_company_id_foreign` (`company_id`);

--
-- Indexes for table `working_hours`
--
ALTER TABLE `working_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `working_hours_project_id_foreign` (`project_id`),
  ADD KEY `working_hours_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absences`
--
ALTER TABLE `absences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `absence_types`
--
ALTER TABLE `absence_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT for table `absence_types_template`
--
ALTER TABLE `absence_types_template`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `activities_history`
--
ALTER TABLE `activities_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `additional_hours`
--
ALTER TABLE `additional_hours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `cities_template`
--
ALTER TABLE `cities_template`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `company_roles`
--
ALTER TABLE `company_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `company_role_templates`
--
ALTER TABLE `company_role_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `company_users`
--
ALTER TABLE `company_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=561;
--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `contract_expenses`
--
ALTER TABLE `contract_expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `contract_materials`
--
ALTER TABLE `contract_materials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `contract_resources`
--
ALTER TABLE `contract_resources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `contract_services`
--
ALTER TABLE `contract_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `costs`
--
ALTER TABLE `costs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1150;
--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `directories`
--
ALTER TABLE `directories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT for table `directory_role`
--
ALTER TABLE `directory_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `doctypes`
--
ALTER TABLE `doctypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `email_categories`
--
ALTER TABLE `email_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `email_category_templates`
--
ALTER TABLE `email_category_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `engagements`
--
ALTER TABLE `engagements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `exchange_rates`
--
ALTER TABLE `exchange_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=373;
--
-- AUTO_INCREMENT for table `holidays_templates`
--
ALTER TABLE `holidays_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `industries`
--
ALTER TABLE `industries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `invoice_discounts`
--
ALTER TABLE `invoice_discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice_disc_codifier`
--
ALTER TABLE `invoice_disc_codifier`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice_expenses`
--
ALTER TABLE `invoice_expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `invoice_materials`
--
ALTER TABLE `invoice_materials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `invoice_resources`
--
ALTER TABLE `invoice_resources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;
--
-- AUTO_INCREMENT for table `invoice_services`
--
ALTER TABLE `invoice_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `invoice_taxes`
--
ALTER TABLE `invoice_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice_tax_codifier`
--
ALTER TABLE `invoice_tax_codifier`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kpis`
--
ALTER TABLE `kpis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `kpis_category`
--
ALTER TABLE `kpis_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;
--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `offices`
--
ALTER TABLE `offices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT for table `permission_user`
--
ALTER TABLE `permission_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `procurements`
--
ALTER TABLE `procurements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `procurement_offers`
--
ALTER TABLE `procurement_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `project_expenses`
--
ALTER TABLE `project_expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `project_kpi_alerts`
--
ALTER TABLE `project_kpi_alerts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_materials`
--
ALTER TABLE `project_materials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `project_resources`
--
ALTER TABLE `project_resources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT for table `project_roles`
--
ALTER TABLE `project_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `project_role_templates`
--
ALTER TABLE `project_role_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `project_services`
--
ALTER TABLE `project_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `quotation_expenses`
--
ALTER TABLE `quotation_expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `quotation_lines`
--
ALTER TABLE `quotation_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `quotation_materials`
--
ALTER TABLE `quotation_materials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `quotation_resources`
--
ALTER TABLE `quotation_resources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;
--
-- AUTO_INCREMENT for table `quotation_services`
--
ALTER TABLE `quotation_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;
--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `replacements`
--
ALTER TABLE `replacements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `requirements`
--
ALTER TABLE `requirements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `seniorities`
--
ALTER TABLE `seniorities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `seniority_templates`
--
ALTER TABLE `seniority_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `stakeholders`
--
ALTER TABLE `stakeholders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=397;
--
-- AUTO_INCREMENT for table `task_expenses`
--
ALTER TABLE `task_expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `task_materials`
--
ALTER TABLE `task_materials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `task_resources`
--
ALTER TABLE `task_resources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT for table `task_services`
--
ALTER TABLE `task_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `team_users`
--
ALTER TABLE `team_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `ticket_histories`
--
ALTER TABLE `ticket_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=564;
--
-- AUTO_INCREMENT for table `user_social_networks`
--
ALTER TABLE `user_social_networks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `workgroups`
--
ALTER TABLE `workgroups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `working_hours`
--
ALTER TABLE `working_hours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5611;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `absences`
--
ALTER TABLE `absences`
  ADD CONSTRAINT `absences_absence_type_id_foreign` FOREIGN KEY (`absence_type_id`) REFERENCES `absence_types` (`id`),
  ADD CONSTRAINT `absences_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `absences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `absence_types`
--
ALTER TABLE `absence_types`
  ADD CONSTRAINT `absence_types_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `absence_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `absence_types_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `absence_types_template`
--
ALTER TABLE `absence_types_template`
  ADD CONSTRAINT `absence_types_template_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `absence_types_template_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `activities_history`
--
ALTER TABLE `activities_history`
  ADD CONSTRAINT `activities_history_agenda_id_foreign` FOREIGN KEY (`agenda_id`) REFERENCES `agenda` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `activities_history_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `additional_hours`
--
ALTER TABLE `additional_hours`
  ADD CONSTRAINT `additional_hours_ibfk_1` FOREIGN KEY (`project_role_id`) REFERENCES `project_roles` (`id`),
  ADD CONSTRAINT `additional_hours_ibfk_2` FOREIGN KEY (`seniority_id`) REFERENCES `seniorities` (`id`),
  ADD CONSTRAINT `additional_hours_ibfk_3` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `additional_hours_ibfk_4` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`),
  ADD CONSTRAINT `additional_hours_ibfk_5` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `additional_hours_ibfk_6` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `additional_hours_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `additional_hours_rate_id_foreign` FOREIGN KEY (`rate_id`) REFERENCES `rates` (`id`),
  ADD CONSTRAINT `additional_hours_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `agenda_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `agenda_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `agenda_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `cities_template`
--
ALTER TABLE `cities_template`
  ADD CONSTRAINT `cities_template_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `companies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `companies_industry_id_foreign` FOREIGN KEY (`industry_id`) REFERENCES `industries` (`id`),
  ADD CONSTRAINT `companies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `company_roles`
--
ALTER TABLE `company_roles`
  ADD CONSTRAINT `company_roles_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company_users`
--
ALTER TABLE `company_users`
  ADD CONSTRAINT `company_users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `company_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_industry_id_foreign` FOREIGN KEY (`industry_id`) REFERENCES `industries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contracts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contracts_engagement_id_foreign` FOREIGN KEY (`engagement_id`) REFERENCES `engagements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contracts_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contract_expenses`
--
ALTER TABLE `contract_expenses`
  ADD CONSTRAINT `contract_expenses_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`),
  ADD CONSTRAINT `contract_expenses_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `contract_expenses_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`);

--
-- Constraints for table `contract_materials`
--
ALTER TABLE `contract_materials`
  ADD CONSTRAINT `contract_materials_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`),
  ADD CONSTRAINT `contract_materials_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `contract_materials_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`);

--
-- Constraints for table `contract_resources`
--
ALTER TABLE `contract_resources`
  ADD CONSTRAINT `contract_resources_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`),
  ADD CONSTRAINT `contract_resources_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contract_resources_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`),
  ADD CONSTRAINT `contract_resources_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `contract_resources_ibfk_3` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `contract_resources_project_role_id_foreign` FOREIGN KEY (`project_role_id`) REFERENCES `project_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contract_resources_rate_id_foreign` FOREIGN KEY (`rate_id`) REFERENCES `rates` (`id`),
  ADD CONSTRAINT `contract_resources_seniority_id_foreign` FOREIGN KEY (`seniority_id`) REFERENCES `seniorities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contract_services`
--
ALTER TABLE `contract_services`
  ADD CONSTRAINT `contract_services_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`),
  ADD CONSTRAINT `contract_services_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `contract_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `costs`
--
ALTER TABLE `costs`
  ADD CONSTRAINT `costs_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `costs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `costs_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `costs_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `costs_project_role_id_foreign` FOREIGN KEY (`project_role_id`) REFERENCES `project_roles` (`id`),
  ADD CONSTRAINT `costs_seniority_id_foreign` FOREIGN KEY (`seniority_id`) REFERENCES `seniorities` (`id`);

--
-- Constraints for table `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `countries_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `countries_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `customers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `customers_industry_id_foreign` FOREIGN KEY (`industry_id`) REFERENCES `industries` (`id`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_office_id_foreign` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `directory_role`
--
ALTER TABLE `directory_role`
  ADD CONSTRAINT `directory_role_directory_id_foreign` FOREIGN KEY (`directory_id`) REFERENCES `directories` (`id`),
  ADD CONSTRAINT `directory_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `discounts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discounts_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_directory_id_foreign` FOREIGN KEY (`directory_id`) REFERENCES `directories` (`id`);

--
-- Constraints for table `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_email_category_id_foreign` FOREIGN KEY (`email_category_id`) REFERENCES `email_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `email_categories`
--
ALTER TABLE `email_categories`
  ADD CONSTRAINT `email_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD CONSTRAINT `email_templates_email_category_template_id_foreign` FOREIGN KEY (`email_category_template_id`) REFERENCES `email_category_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exchange_rates`
--
ALTER TABLE `exchange_rates`
  ADD CONSTRAINT `exchange_rates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exchange_rates_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_cost_currency_id_foreign` FOREIGN KEY (`cost_currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `holidays_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `holidays_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `holidays_templates`
--
ALTER TABLE `holidays_templates`
  ADD CONSTRAINT `holidays_templates_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `invoices_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_discounts`
--
ALTER TABLE `invoice_discounts`
  ADD CONSTRAINT `invoice_discounts_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `invoice_discounts_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `invoice_disc_codifier`
--
ALTER TABLE `invoice_disc_codifier`
  ADD CONSTRAINT `invoice_disc_codifier_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `invoice_disc_codifier_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`);

--
-- Constraints for table `invoice_expenses`
--
ALTER TABLE `invoice_expenses`
  ADD CONSTRAINT `invoice_expenses_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `invoice_expenses_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `invoice_materials`
--
ALTER TABLE `invoice_materials`
  ADD CONSTRAINT `invoice_materials_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `invoice_materials_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `invoice_resources`
--
ALTER TABLE `invoice_resources`
  ADD CONSTRAINT `invoice_resources_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `invoice_resources_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`),
  ADD CONSTRAINT `invoice_resources_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `invoice_resources_ibfk_3` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `invoice_resources_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `invoice_resources_project_role_id_foreign` FOREIGN KEY (`project_role_id`) REFERENCES `project_roles` (`id`),
  ADD CONSTRAINT `invoice_resources_rate_id_foreign` FOREIGN KEY (`rate_id`) REFERENCES `rates` (`id`),
  ADD CONSTRAINT `invoice_resources_seniority_id_foreign` FOREIGN KEY (`seniority_id`) REFERENCES `seniorities` (`id`),
  ADD CONSTRAINT `invoice_resources_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `invoice_services`
--
ALTER TABLE `invoice_services`
  ADD CONSTRAINT `invoice_services_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `invoice_services_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `invoice_taxes`
--
ALTER TABLE `invoice_taxes`
  ADD CONSTRAINT `invoice_taxes_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `invoice_taxes_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `invoice_tax_codifier`
--
ALTER TABLE `invoice_tax_codifier`
  ADD CONSTRAINT `invoice_tax_codifier_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `invoice_tax_codifier_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`);

--
-- Constraints for table `kpis`
--
ALTER TABLE `kpis`
  ADD CONSTRAINT `kpis_category_foreign` FOREIGN KEY (`category`) REFERENCES `kpis_category` (`id`),
  ADD CONSTRAINT `kpis_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kpis_category`
--
ALTER TABLE `kpis_category`
  ADD CONSTRAINT `kpis_category_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `materials_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `materials_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`);

--
-- Constraints for table `metadocu`
--
ALTER TABLE `metadocu`
  ADD CONSTRAINT `metadocu_activity_foreign` FOREIGN KEY (`activity`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `metadocu_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`),
  ADD CONSTRAINT `metadocu_document_type_foreign` FOREIGN KEY (`document_type`) REFERENCES `doctypes` (`id`),
  ADD CONSTRAINT `metadocu_language_foreign` FOREIGN KEY (`language`) REFERENCES `languages` (`id`);

--
-- Constraints for table `metagrid`
--
ALTER TABLE `metagrid`
  ADD CONSTRAINT `metagrid_activity_foreign` FOREIGN KEY (`activity`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `metagrid_document_type_foreign` FOREIGN KEY (`document_type`) REFERENCES `doctypes` (`id`),
  ADD CONSTRAINT `metagrid_language_foreign` FOREIGN KEY (`language`) REFERENCES `languages` (`id`);

--
-- Constraints for table `metavariable`
--
ALTER TABLE `metavariable`
  ADD CONSTRAINT `metavariable_activity_foreign` FOREIGN KEY (`activity`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `metavariable_document_type_foreign` FOREIGN KEY (`document_type`) REFERENCES `doctypes` (`id`),
  ADD CONSTRAINT `metavariable_language_foreign` FOREIGN KEY (`language`) REFERENCES `languages` (`id`);

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `offices`
--
ALTER TABLE `offices`
  ADD CONSTRAINT `offices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `procurements`
--
ALTER TABLE `procurements`
  ADD CONSTRAINT `procurements_cost_currency_id_foreign` FOREIGN KEY (`cost_currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `procurements_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `procurements_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`),
  ADD CONSTRAINT `procurements_responsable_id_foreign` FOREIGN KEY (`responsable_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `procurement_offers`
--
ALTER TABLE `procurement_offers`
  ADD CONSTRAINT `procurement_offers_delivery_responsable_foreign` FOREIGN KEY (`delivery_responsable`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `procurement_offers_procurement_id_foreign` FOREIGN KEY (`procurement_id`) REFERENCES `procurements` (`id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `projects_delivery_manager_id_foreign` FOREIGN KEY (`delivery_manager_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `projects_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `projects_project_manager_id_foreign` FOREIGN KEY (`project_manager_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `projects_technical_director_id_foreign` FOREIGN KEY (`technical_director_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_expenses`
--
ALTER TABLE `project_expenses`
  ADD CONSTRAINT `project_expenses_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `project_expenses_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`),
  ADD CONSTRAINT `project_expenses_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Constraints for table `project_kpi_alerts`
--
ALTER TABLE `project_kpi_alerts`
  ADD CONSTRAINT `project_kpi_alerts_kpi_id_foreign` FOREIGN KEY (`kpi_id`) REFERENCES `kpis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_kpi_alerts_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_materials`
--
ALTER TABLE `project_materials`
  ADD CONSTRAINT `project_materials_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `project_materials_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  ADD CONSTRAINT `project_materials_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Constraints for table `project_resources`
--
ALTER TABLE `project_resources`
  ADD CONSTRAINT `project_resources_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `project_resources_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`),
  ADD CONSTRAINT `project_resources_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `project_resources_ibfk_3` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `project_resources_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `project_resources_project_role_id_foreign` FOREIGN KEY (`project_role_id`) REFERENCES `project_roles` (`id`),
  ADD CONSTRAINT `project_resources_rate_id_foreign` FOREIGN KEY (`rate_id`) REFERENCES `rates` (`id`),
  ADD CONSTRAINT `project_resources_seniority_id_foreign` FOREIGN KEY (`seniority_id`) REFERENCES `seniorities` (`id`),
  ADD CONSTRAINT `project_resources_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `project_roles`
--
ALTER TABLE `project_roles`
  ADD CONSTRAINT `project_roles_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_services`
--
ALTER TABLE `project_services`
  ADD CONSTRAINT `project_services_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `project_services_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `project_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `providers`
--
ALTER TABLE `providers`
  ADD CONSTRAINT `providers_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `providers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `providers_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `providers_industry_id_foreign` FOREIGN KEY (`industry_id`) REFERENCES `industries` (`id`);

--
-- Constraints for table `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `quotations_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quotations_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `quotations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `quotations_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Constraints for table `quotation_expenses`
--
ALTER TABLE `quotation_expenses`
  ADD CONSTRAINT `quotation_expenses_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `quotation_expenses_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`);

--
-- Constraints for table `quotation_lines`
--
ALTER TABLE `quotation_lines`
  ADD CONSTRAINT `quotation_lines_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`);

--
-- Constraints for table `quotation_materials`
--
ALTER TABLE `quotation_materials`
  ADD CONSTRAINT `quotation_materials_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `quotation_materials_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`);

--
-- Constraints for table `quotation_resources`
--
ALTER TABLE `quotation_resources`
  ADD CONSTRAINT `quotation_resources_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `quotation_resources_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `quotation_resources_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `quotation_resources_office_id_foreign` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`),
  ADD CONSTRAINT `quotation_resources_project_role_id_foreign` FOREIGN KEY (`project_role_id`) REFERENCES `project_roles` (`id`),
  ADD CONSTRAINT `quotation_resources_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`),
  ADD CONSTRAINT `quotation_resources_rate_id_foreign` FOREIGN KEY (`rate_id`) REFERENCES `rates` (`id`),
  ADD CONSTRAINT `quotation_resources_seniority_id_foreign` FOREIGN KEY (`seniority_id`) REFERENCES `seniorities` (`id`),
  ADD CONSTRAINT `quotation_resources_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `quotation_services`
--
ALTER TABLE `quotation_services`
  ADD CONSTRAINT `quotation_services_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `quotation_services_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`);

--
-- Constraints for table `rates`
--
ALTER TABLE `rates`
  ADD CONSTRAINT `rates_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `rates_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `rates_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `rates_office_id_foreign` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`),
  ADD CONSTRAINT `rates_project_role_id_foreign` FOREIGN KEY (`project_role_id`) REFERENCES `project_roles` (`id`),
  ADD CONSTRAINT `rates_seniority_id_foreign` FOREIGN KEY (`seniority_id`) REFERENCES `seniorities` (`id`);

--
-- Constraints for table `replacements`
--
ALTER TABLE `replacements`
  ADD CONSTRAINT `replacements_absence_id_foreign` FOREIGN KEY (`absence_id`) REFERENCES `absences` (`id`),
  ADD CONSTRAINT `replacements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `requirements`
--
ALTER TABLE `requirements`
  ADD CONSTRAINT `requirements_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `requirements_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_company_role_id_foreign` FOREIGN KEY (`company_role_id`) REFERENCES `company_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seniorities`
--
ALTER TABLE `seniorities`
  ADD CONSTRAINT `seniorities_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `services_cost_currency_id_foreign` FOREIGN KEY (`cost_currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `services_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stakeholders`
--
ALTER TABLE `stakeholders`
  ADD CONSTRAINT `stakeholders_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `tasks_requirement_id_foreign` FOREIGN KEY (`requirement_id`) REFERENCES `requirements` (`id`);

--
-- Constraints for table `task_expenses`
--
ALTER TABLE `task_expenses`
  ADD CONSTRAINT `task_expenses_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `task_expenses_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`);

--
-- Constraints for table `task_materials`
--
ALTER TABLE `task_materials`
  ADD CONSTRAINT `task_materials_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `task_materials_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`);

--
-- Constraints for table `task_resources`
--
ALTER TABLE `task_resources`
  ADD CONSTRAINT `task_resources_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `task_resources_project_role_id_foreign` FOREIGN KEY (`project_role_id`) REFERENCES `project_roles` (`id`),
  ADD CONSTRAINT `task_resources_seniority_id_foreign` FOREIGN KEY (`seniority_id`) REFERENCES `seniorities` (`id`),
  ADD CONSTRAINT `task_resources_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  ADD CONSTRAINT `task_resources_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `task_services`
--
ALTER TABLE `task_services`
  ADD CONSTRAINT `task_services_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `task_services_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`);

--
-- Constraints for table `taxes`
--
ALTER TABLE `taxes`
  ADD CONSTRAINT `taxes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `taxes_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `taxes_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Constraints for table `team_users`
--
ALTER TABLE `team_users`
  ADD CONSTRAINT `team_users_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `team_users_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `team_users_ibfk_3` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`),
  ADD CONSTRAINT `team_users_ibfk_4` FOREIGN KEY (`project_role_id`) REFERENCES `project_roles` (`id`),
  ADD CONSTRAINT `team_users_ibfk_5` FOREIGN KEY (`seniority_id`) REFERENCES `seniorities` (`id`),
  ADD CONSTRAINT `team_users_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `team_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_assignee_id_foreign` FOREIGN KEY (`assignee_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tickets_last_updater_id_foreign` FOREIGN KEY (`last_updater_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tickets_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tickets_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`);

--
-- Constraints for table `ticket_histories`
--
ALTER TABLE `ticket_histories`
  ADD CONSTRAINT `ticket_histories_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ticket_histories_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `users_company_role_id_foreign` FOREIGN KEY (`company_role_id`) REFERENCES `company_roles` (`id`),
  ADD CONSTRAINT `users_office_id_foreign` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`),
  ADD CONSTRAINT `users_project_role_id_foreign` FOREIGN KEY (`project_role_id`) REFERENCES `project_roles` (`id`),
  ADD CONSTRAINT `users_seniority_id_foreign` FOREIGN KEY (`seniority_id`) REFERENCES `seniorities` (`id`),
  ADD CONSTRAINT `users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_workgroup_id_foreign` FOREIGN KEY (`workgroup_id`) REFERENCES `workgroups` (`id`);

--
-- Constraints for table `user_social_networks`
--
ALTER TABLE `user_social_networks`
  ADD CONSTRAINT `user_social_networks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `workgroups`
--
ALTER TABLE `workgroups`
  ADD CONSTRAINT `workgroups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `working_hours`
--
ALTER TABLE `working_hours`
  ADD CONSTRAINT `working_hours_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `working_hours_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
