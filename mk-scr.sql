-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 03:08 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mk-scr`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `number`, `name`, `avatar`, `username`, `password`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'DEVELOPMENT', 'no-avatar.jpg', 'admin', 'admin', NULL, '2023-04-16 13:03:39', '2023-02-19 07:36:32', '2023-04-16 13:04:32');

-- --------------------------------------------------------

--
-- Table structure for table `arrangements`
--

CREATE TABLE `arrangements` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `competition_id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `competition_id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'preliminary-screening', 'Preliminary Screening', '2023-04-06 13:25:10', '2023-04-15 02:30:43');

-- --------------------------------------------------------

--
-- Table structure for table `competitions`
--

CREATE TABLE `competitions` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `competitions`
--

INSERT INTO `competitions` (`id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 'mk-2023', 'Miss Kaogma 2023', '2023-04-06 13:24:04', '2023-04-15 02:40:12');

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `percentage` float UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`id`, `event_id`, `title`, `percentage`, `created_at`, `updated_at`) VALUES
(1, 1, 'Beauty of the Face', 50, '2023-04-15 03:46:35', '2023-04-15 03:46:35'),
(2, 1, 'Figure', 30, '2023-04-15 03:46:54', '2023-04-15 03:46:54'),
(3, 1, 'Personality and Intelligence', 20, '2023-04-15 03:47:02', '2023-04-15 03:47:02'),
(4, 2, 'Beauty of the Face', 50, '2023-04-15 03:47:15', '2023-04-15 03:47:15'),
(5, 2, 'Figure', 30, '2023-04-15 03:47:22', '2023-04-15 03:47:22'),
(6, 2, 'Personality and Intelligence', 20, '2023-04-15 03:47:29', '2023-04-15 03:47:29');

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `technical_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eliminations`
--

CREATE TABLE `eliminations` (
  `id` mediumint(9) NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eliminations`
--

INSERT INTO `eliminations` (`id`, `event_id`, `team_id`, `created_at`, `updated_at`) VALUES
(1, 1, 23, '2023-04-15 03:10:14', '2023-04-15 03:10:14'),
(2, 1, 24, '2023-04-15 03:10:54', '2023-04-15 03:10:54'),
(3, 1, 25, '2023-04-15 03:10:56', '2023-04-15 03:10:56'),
(4, 1, 26, '2023-04-15 03:10:57', '2023-04-15 03:10:57'),
(5, 1, 27, '2023-04-15 03:10:58', '2023-04-15 03:10:58'),
(6, 1, 28, '2023-04-15 03:11:00', '2023-04-15 03:11:00'),
(7, 1, 29, '2023-04-15 03:11:01', '2023-04-15 03:11:01'),
(8, 1, 30, '2023-04-15 03:11:02', '2023-04-15 03:11:02'),
(9, 1, 31, '2023-04-15 03:11:04', '2023-04-15 03:11:04'),
(10, 1, 32, '2023-04-15 03:11:05', '2023-04-15 03:11:05'),
(11, 1, 33, '2023-04-15 03:11:07', '2023-04-15 03:11:07'),
(12, 1, 34, '2023-04-15 03:11:09', '2023-04-15 03:11:09'),
(13, 1, 35, '2023-04-15 03:11:11', '2023-04-15 03:11:11'),
(14, 1, 36, '2023-04-15 03:11:49', '2023-04-15 03:11:49'),
(15, 1, 37, '2023-04-15 03:11:50', '2023-04-15 03:11:50'),
(16, 1, 38, '2023-04-15 03:11:51', '2023-04-15 03:11:51'),
(17, 1, 39, '2023-04-15 03:11:53', '2023-04-15 03:11:53'),
(18, 1, 40, '2023-04-15 03:11:54', '2023-04-15 03:11:54'),
(19, 1, 41, '2023-04-15 03:11:55', '2023-04-15 03:11:55'),
(20, 1, 42, '2023-04-15 03:11:56', '2023-04-15 03:11:56'),
(21, 2, 1, '2023-04-15 03:11:59', '2023-04-15 03:11:59'),
(22, 2, 2, '2023-04-15 03:12:00', '2023-04-15 03:12:00'),
(23, 2, 3, '2023-04-15 03:12:01', '2023-04-15 03:12:01'),
(24, 2, 4, '2023-04-15 03:12:03', '2023-04-15 03:12:03'),
(25, 2, 5, '2023-04-15 03:12:04', '2023-04-15 03:12:04'),
(26, 2, 6, '2023-04-15 03:12:05', '2023-04-15 03:12:05'),
(27, 2, 7, '2023-04-15 03:12:06', '2023-04-15 03:12:06'),
(28, 2, 8, '2023-04-15 03:12:07', '2023-04-15 03:12:07'),
(29, 2, 9, '2023-04-15 03:12:08', '2023-04-15 03:12:08'),
(30, 2, 10, '2023-04-15 03:12:09', '2023-04-15 03:12:09'),
(31, 2, 11, '2023-04-15 03:12:10', '2023-04-15 03:12:10'),
(32, 2, 12, '2023-04-15 03:12:11', '2023-04-15 03:12:11'),
(33, 2, 13, '2023-04-15 03:12:12', '2023-04-15 03:12:12'),
(34, 2, 14, '2023-04-15 03:12:13', '2023-04-15 03:12:13'),
(35, 2, 15, '2023-04-15 03:12:14', '2023-04-15 03:12:14'),
(36, 2, 16, '2023-04-15 03:12:15', '2023-04-15 03:12:15'),
(37, 2, 17, '2023-04-15 03:12:16', '2023-04-15 03:12:16'),
(38, 2, 18, '2023-04-15 03:12:18', '2023-04-15 03:12:18'),
(39, 2, 19, '2023-04-15 03:12:19', '2023-04-15 03:12:19'),
(40, 2, 20, '2023-04-15 03:12:20', '2023-04-15 03:12:20'),
(41, 2, 21, '2023-04-16 07:08:43', '2023-04-16 07:08:43'),
(42, 2, 22, '2023-04-16 07:49:29', '2023-04-16 07:49:29');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `category_id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `category_id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'screening-1', 'Screening 1', '2023-04-15 02:42:24', '2023-04-15 02:56:51'),
(2, 1, 'screening-2', 'Screening 2', '2023-04-15 02:43:07', '2023-04-15 02:56:53');

-- --------------------------------------------------------

--
-- Table structure for table `judges`
--

CREATE TABLE `judges` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `judges`
--

INSERT INTO `judges` (`id`, `number`, `name`, `avatar`, `username`, `password`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Scr1 - Judge 01', 'no-avatar.jpg', 'judge101', 'judge101', NULL, NULL, '2023-04-06 13:58:11', '2023-04-16 13:02:42'),
(2, 2, 'Scr1 - Judge 02', 'no-avatar.jpg', 'judge102', 'judge102', NULL, NULL, '2023-04-06 13:58:28', '2023-04-16 13:02:45'),
(3, 3, 'Scr1 - Judge 03', 'no-avatar.jpg', 'judge103', 'judge103', NULL, NULL, '2023-04-06 13:58:42', '2023-04-16 13:02:48'),
(4, 4, 'Scr1 - Judge 04', 'no-avatar.jpg', 'judge104', 'judge104', NULL, NULL, '2023-04-06 13:59:26', '2023-04-16 13:02:50'),
(5, 5, 'Scr5 - Judge 05', 'no-avatar.jpg', 'judge105', 'judge105', NULL, NULL, '2023-04-06 14:00:00', '2023-04-16 13:02:52'),
(6, 1, 'Scr2 - Judge 01', 'no-avatar.jpg', 'judge201', 'judge201', NULL, NULL, '2023-04-15 02:49:55', '2023-04-15 02:51:33'),
(7, 2, 'Scr2 - Judge 02', 'no-avatar.jpg', 'judge202', 'judge202', NULL, NULL, '2023-04-15 02:49:55', '2023-04-15 02:51:36'),
(8, 3, 'Scr2 - Judge 03', 'no-avatar.jpg', 'judge203', 'judge203', NULL, NULL, '2023-04-15 02:49:55', '2023-04-15 02:51:39'),
(9, 4, 'Scr2 - Judge 04', 'no-avatar.jpg', 'judge204', 'judge204', NULL, NULL, '2023-04-15 02:49:55', '2023-04-15 02:51:42'),
(10, 5, 'Scr2 - Judge 05', 'no-avatar.jpg', 'judge205', 'judge205', NULL, NULL, '2023-04-15 02:49:55', '2023-04-15 02:51:44');

-- --------------------------------------------------------

--
-- Table structure for table `judge_event`
--

CREATE TABLE `judge_event` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `judge_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `is_chairman` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `judge_event`
--

INSERT INTO `judge_event` (`id`, `judge_id`, `event_id`, `is_chairman`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, '2023-04-15 02:54:24', '2023-04-15 02:58:05'),
(2, 2, 1, 0, '2023-04-15 02:54:31', '2023-04-15 02:58:08'),
(3, 3, 1, 0, '2023-04-15 02:54:35', '2023-04-15 02:58:11'),
(4, 4, 1, 0, '2023-04-15 02:54:41', '2023-04-15 02:58:14'),
(5, 5, 1, 0, '2023-04-15 02:54:46', '2023-04-15 02:58:16'),
(6, 6, 2, 0, '2023-04-15 02:55:55', '2023-04-15 02:58:19'),
(7, 7, 2, 0, '2023-04-15 02:56:03', '2023-04-15 02:58:22'),
(8, 8, 2, 0, '2023-04-15 02:56:07', '2023-04-15 02:58:29'),
(9, 9, 2, 0, '2023-04-15 02:56:12', '2023-04-15 02:58:33'),
(10, 10, 2, 0, '2023-04-15 02:56:17', '2023-04-15 02:58:36');

-- --------------------------------------------------------

--
-- Table structure for table `noshows`
--

CREATE TABLE `noshows` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `number` smallint(5) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `judge_id` tinyint(3) UNSIGNED NOT NULL,
  `criteria_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `location` varchar(64) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `number`, `name`, `location`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 1, 'EMMYLOU BONIT', '25 yrs. old (5\'5 | 36 - 29 - 36)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 07:27:54'),
(2, 2, 'ANTONETTE SUNGA', '22 yrs. old (5\'2 | 34 - 28 - 36)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 07:29:45'),
(3, 3, 'IRIS ORESCA', '21 yrs. old (5\'5 | 33.5 - 26.5 - 36.5)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 07:29:22'),
(4, 4, 'KAYE PAULINE SERVIDAD', '21 yrs. old (5\'4 | 33.5 - 26 - 35)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 07:30:07'),
(5, 5, 'MARY JOY DARILAY', '22 yrs. old (5\'7 | 35.5 - 26.5 - 36)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 07:30:16'),
(6, 6, 'KEINSTER KHRIZETTE RANARA\n', '24 yrs. old (5\'8 | 33 - 25 - 34)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 07:30:23'),
(7, 7, 'CHRISTINE OVILLA', '20 yrs. old (5\'3 | 32 - 26 - 34)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 07:30:31'),
(8, 8, 'CHRISTINE ARNEDO', '25 yrs. old (5\'6 | 34 - 26.5 - 36)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 07:30:40'),
(9, 9, 'HANNAH MAE PANIBE', '25 yrs. old (5\'4 | 33 - 26 - 36)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 07:31:06'),
(10, 10, 'NEOLI KRYSS ABARIENTOS', '18 yrs. old (5\'4 | 36 - 26 - 37)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 09:50:05'),
(11, 11, 'MIKKI ANGELA BARCELA', '21 yrs. old (5\'6 | 33 - 26 - 35)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 08:19:50'),
(12, 12, 'THIARA MARIE SAN PABLO', '21 yrs. old (5\'6 | 33 - 27 - 36)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 08:20:06'),
(13, 13, 'JODELYN MENDOZA', '20 yrs. old (5\'2 | 31.5 - 25 - 35)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 08:20:34'),
(14, 14, 'MARGA JOYCE SAYSON', '23 yrs. old (5\'4 | 32 - 25.5 - 35.5)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 08:28:08'),
(15, 15, 'YZANDRA FELINE GOROBAT', '21 yrs. old (5\'3 | 30 - 25 - 36)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 08:30:56'),
(16, 16, 'KASSANDRA AVENA', '17 yrs. old (5\'3 | 36 - 28 - 37)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 08:28:58'),
(17, 17, 'CHARLENE BOHOLANO', '21 yrs. old (5\'6 | 30 - 26 - 34)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 08:29:16'),
(18, 18, 'MARIA YSABELLE SAPIENZA', '19 yrs. old (5\'4 | 34 - 30 - 38)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 08:29:40'),
(19, 19, 'AYSSA MILORED VILLARINA', '22 yrs. old (5\'5 | 31 - 26.5 - 35)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 08:30:02'),
(20, 20, 'SANDIP KAUR KALER', '23 yrs. old (5\'7 | 33 - 28 - 36)', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 08:30:15'),
(21, 21, 'KATRINA CLAUDIA JAMIN', '22 yrs. old (5\'5 | 31 - 27 - 35)', 'candidate.png', '2023-04-16 07:07:51', '2023-04-16 12:58:23'),
(22, 22, 'TRISHIA BARNEDO', '19 yrs. old (5\'4 | 32 - 27 - 36)', 'candidate.png', '2023-04-16 07:49:21', '2023-04-16 12:58:26'),
(23, 1, 'Scr2 - Candidate 01', 'Location 01', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:58:54'),
(24, 2, 'Scr2 - Candidate 02', 'Location 02', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:58:56'),
(25, 3, 'Scr2 - Candidate 03', 'Location 03', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:58:59'),
(26, 4, 'Scr2 - Candidate 04', 'Location 04', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:59:01'),
(27, 5, 'Scr2 - Candidate 05', 'Location 05', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:59:04'),
(28, 6, 'Scr2 - Candidate 06', 'Location 06', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:59:07'),
(29, 7, 'Scr2 - Candidate 07', 'Location 07', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:59:10'),
(30, 8, 'Scr2 - Candidate 08', 'Location 08', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:59:14'),
(31, 9, 'Scr2 - Candidate 09', 'Location 09', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:59:16'),
(32, 10, 'Scr2 - Candidate 10', 'Location 10', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:59:19'),
(33, 11, 'Scr2 - Candidate 11', 'Location 11', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:59:21'),
(34, 12, 'Scr2 - Candidate 12', 'Location 12', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:59:24'),
(35, 13, 'Scr2 - Candidate 13', 'Location 13', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:59:26'),
(36, 14, 'Scr2 - Candidate 14', 'Location 14', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:59:29'),
(37, 15, 'Scr2 - Candidate 15', 'Location 15', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:59:31'),
(38, 16, 'Scr2 - Candidate 16', 'Location 16', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:59:34'),
(39, 17, 'Scr2 - Candidate 17', 'Location 17', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:59:37'),
(40, 18, 'Scr2 - Candidate 18', 'Location 18', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:59:39'),
(41, 19, 'Scr2 - Candidate 19', 'Location 19', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:59:42'),
(42, 20, 'Scr2 - Candidate 20', 'Location 20', 'candidate.png', '2023-04-15 03:09:20', '2023-04-16 12:59:45');

-- --------------------------------------------------------

--
-- Table structure for table `technicals`
--

CREATE TABLE `technicals` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `technicals`
--

INSERT INTO `technicals` (`id`, `number`, `name`, `avatar`, `username`, `password`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Technical 01', 'no-avatar.jpg', 'technical01', 'technical01', NULL, NULL, '2023-02-19 08:58:58', '2023-04-06 14:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `technical_event`
--

CREATE TABLE `technical_event` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `technical_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`id`, `event_id`, `rank`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Top 01', '2023-04-15 03:19:48', '2023-04-15 03:52:38'),
(2, 1, 2, 'Top 02', '2023-04-15 03:19:48', '2023-04-15 03:52:42'),
(3, 1, 3, 'Top 03', '2023-04-15 03:19:48', '2023-04-15 03:52:45'),
(4, 1, 4, 'Top 04', '2023-04-15 03:19:48', '2023-04-15 03:52:48'),
(5, 1, 5, 'Top 05', '2023-04-15 03:19:48', '2023-04-15 03:52:52'),
(6, 1, 6, 'Top 06', '2023-04-15 03:19:48', '2023-04-15 03:52:55'),
(7, 1, 7, 'Top 07', '2023-04-15 03:19:48', '2023-04-15 03:52:58'),
(8, 1, 8, 'Top 08', '2023-04-15 03:19:48', '2023-04-15 03:53:01'),
(9, 1, 9, 'Top 09', '2023-04-15 03:19:48', '2023-04-15 03:53:05'),
(10, 1, 10, 'Top 10', '2023-04-15 03:19:48', '2023-04-15 03:21:41'),
(11, 1, 11, 'Top 11', '2023-04-15 03:19:48', '2023-04-15 03:21:44'),
(12, 1, 12, 'Top 12', '2023-04-15 03:19:48', '2023-04-15 03:21:46'),
(13, 1, 13, 'Top 13', '2023-04-15 03:19:48', '2023-04-15 03:21:49'),
(14, 1, 14, 'Top 14', '2023-04-15 03:19:48', '2023-04-15 03:21:52'),
(15, 1, 15, 'Top 15', '2023-04-15 03:19:48', '2023-04-15 03:21:54'),
(16, 2, 1, 'Top 01', '2023-04-15 03:19:58', '2023-04-16 13:07:38'),
(17, 2, 2, 'Top 02', '2023-04-15 03:19:58', '2023-04-16 13:07:41'),
(18, 2, 3, 'Top 03', '2023-04-15 03:19:58', '2023-04-16 13:07:43'),
(19, 2, 4, 'Top 04', '2023-04-15 03:19:58', '2023-04-16 13:07:46'),
(20, 2, 5, 'Top 05', '2023-04-15 03:19:58', '2023-04-16 13:07:48'),
(21, 2, 6, 'Top 06', '2023-04-15 03:19:58', '2023-04-16 13:07:51'),
(22, 2, 7, 'Top 07', '2023-04-15 03:19:58', '2023-04-16 13:07:53'),
(23, 2, 8, 'Top 08', '2023-04-15 03:19:58', '2023-04-16 13:07:55'),
(24, 2, 9, 'Top 09', '2023-04-15 03:19:58', '2023-04-16 13:08:01'),
(25, 2, 10, 'Top 10', '2023-04-15 03:19:58', '2023-04-16 13:08:03'),
(26, 2, 11, 'Top 11', '2023-04-15 03:19:58', '2023-04-16 13:08:05'),
(27, 2, 12, 'Top 12', '2023-04-15 03:19:58', '2023-04-16 13:08:07'),
(28, 2, 13, 'Top 13', '2023-04-15 03:19:58', '2023-04-16 13:08:11'),
(29, 2, 14, 'Top 14', '2023-04-15 03:19:58', '2023-04-16 13:08:13'),
(30, 2, 15, 'Top 15', '2023-04-15 03:19:58', '2023-04-16 13:08:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arrangements`
--
ALTER TABLE `arrangements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `competition_id` (`competition_id`);

--
-- Indexes for table `competitions`
--
ALTER TABLE `competitions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`technical_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `eliminations`
--
ALTER TABLE `eliminations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_id` (`category_id`);

--
-- Indexes for table `judges`
--
ALTER TABLE `judges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `judge_event`
--
ALTER TABLE `judge_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`judge_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `noshows`
--
ALTER TABLE `noshows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`judge_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `criteria_id` (`criteria_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technicals`
--
ALTER TABLE `technicals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technical_event`
--
ALTER TABLE `technical_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`technical_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `arrangements`
--
ALTER TABLE `arrangements`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `competitions`
--
ALTER TABLE `competitions`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eliminations`
--
ALTER TABLE `eliminations`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `judges`
--
ALTER TABLE `judges`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `judge_event`
--
ALTER TABLE `judge_event`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `noshows`
--
ALTER TABLE `noshows`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `technicals`
--
ALTER TABLE `technicals`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `technical_event`
--
ALTER TABLE `technical_event`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arrangements`
--
ALTER TABLE `arrangements`
  ADD CONSTRAINT `arrangements_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `arrangements_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `criteria`
--
ALTER TABLE `criteria`
  ADD CONSTRAINT `criteria_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `deductions`
--
ALTER TABLE `deductions`
  ADD CONSTRAINT `deductions_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deductions_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deductions_ibfk_3` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eliminations`
--
ALTER TABLE `eliminations`
  ADD CONSTRAINT `eliminations_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eliminations_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `judge_event`
--
ALTER TABLE `judge_event`
  ADD CONSTRAINT `judge_event_ibfk_1` FOREIGN KEY (`judge_id`) REFERENCES `judges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `judge_event_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `noshows`
--
ALTER TABLE `noshows`
  ADD CONSTRAINT `noshows_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `noshows_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participants_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `points`
--
ALTER TABLE `points`
  ADD CONSTRAINT `points_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`criteria_id`) REFERENCES `criteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`judge_id`) REFERENCES `judges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `technical_event`
--
ALTER TABLE `technical_event`
  ADD CONSTRAINT `technical_event_ibfk_2` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `technical_event_ibfk_3` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `titles`
--
ALTER TABLE `titles`
  ADD CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
