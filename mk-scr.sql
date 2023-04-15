-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2023 at 07:10 AM
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
(1, 1, 'DEVELOPMENT', 'no-avatar.jpg', 'admin', 'admin', NULL, '2023-04-15 04:52:02', '2023-02-19 07:36:32', '2023-04-15 04:52:02');

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
(1, 1, 21, '2023-04-15 03:10:14', '2023-04-15 03:10:14'),
(2, 1, 22, '2023-04-15 03:10:54', '2023-04-15 03:10:54'),
(3, 1, 23, '2023-04-15 03:10:56', '2023-04-15 03:10:56'),
(4, 1, 24, '2023-04-15 03:10:57', '2023-04-15 03:10:57'),
(5, 1, 25, '2023-04-15 03:10:58', '2023-04-15 03:10:58'),
(6, 1, 26, '2023-04-15 03:11:00', '2023-04-15 03:11:00'),
(7, 1, 27, '2023-04-15 03:11:01', '2023-04-15 03:11:01'),
(8, 1, 28, '2023-04-15 03:11:02', '2023-04-15 03:11:02'),
(9, 1, 29, '2023-04-15 03:11:04', '2023-04-15 03:11:04'),
(10, 1, 30, '2023-04-15 03:11:05', '2023-04-15 03:11:05'),
(11, 1, 31, '2023-04-15 03:11:07', '2023-04-15 03:11:07'),
(12, 1, 32, '2023-04-15 03:11:09', '2023-04-15 03:11:09'),
(13, 1, 33, '2023-04-15 03:11:11', '2023-04-15 03:11:11'),
(14, 1, 34, '2023-04-15 03:11:49', '2023-04-15 03:11:49'),
(15, 1, 35, '2023-04-15 03:11:50', '2023-04-15 03:11:50'),
(16, 1, 36, '2023-04-15 03:11:51', '2023-04-15 03:11:51'),
(17, 1, 37, '2023-04-15 03:11:53', '2023-04-15 03:11:53'),
(18, 1, 38, '2023-04-15 03:11:54', '2023-04-15 03:11:54'),
(19, 1, 39, '2023-04-15 03:11:55', '2023-04-15 03:11:55'),
(20, 1, 40, '2023-04-15 03:11:56', '2023-04-15 03:11:56'),
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
(40, 2, 20, '2023-04-15 03:12:20', '2023-04-15 03:12:20');

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
(1, 1, 'Scr1 - Judge 01', 'no-avatar.jpg', 'judge101', 'judge101', NULL, NULL, '2023-04-06 13:58:11', '2023-04-15 03:59:07'),
(2, 2, 'Scr1 - Judge 02', 'no-avatar.jpg', 'judge102', 'judge102', NULL, NULL, '2023-04-06 13:58:28', '2023-04-15 04:39:05'),
(3, 3, 'Scr1 - Judge 03', 'no-avatar.jpg', 'judge103', 'judge103', NULL, NULL, '2023-04-06 13:58:42', '2023-04-15 04:40:07'),
(4, 4, 'Scr1 - Judge 04', 'no-avatar.jpg', 'judge104', 'judge104', NULL, NULL, '2023-04-06 13:59:26', '2023-04-15 04:41:17'),
(5, 5, 'Scr1 - Judge 05', 'no-avatar.jpg', 'judge105', 'judge105', NULL, '2023-04-15 04:59:46', '2023-04-06 14:00:00', '2023-04-15 04:59:46'),
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
  `location` varchar(32) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `number`, `name`, `location`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 1, 'Scr1 - Candidate 01', 'Location 01', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(2, 2, 'Scr1 - Candidate 02', 'Location 02', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(3, 3, 'Scr1 - Candidate 03', 'Location 03', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(4, 4, 'Scr1 - Candidate 04', 'Location 04', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(5, 5, 'Scr1 - Candidate 05', 'Location 05', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(6, 6, 'Scr1 - Candidate 06', 'Location 06', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(7, 7, 'Scr1 - Candidate 07', 'Location 07', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(8, 8, 'Scr1 - Candidate 08', 'Location 08', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(9, 9, 'Scr1 - Candidate 09', 'Location 09', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(10, 10, 'Scr1 - Candidate 10', 'Location 10', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(11, 11, 'Scr1 - Candidate 11', 'Location 11', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(12, 12, 'Scr1 - Candidate 12', 'Location 12', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(13, 13, 'Scr1 - Candidate 13', 'Location 13', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(14, 14, 'Scr1 - Candidate 14', 'Location 14', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(15, 15, 'Scr1 - Candidate 15', 'Location 15', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(16, 16, 'Scr1 - Candidate 16', 'Location 16', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(17, 17, 'Scr1 - Candidate 17', 'Location 17', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(18, 18, 'Scr1 - Candidate 18', 'Location 18', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(19, 19, 'Scr1 - Candidate 19', 'Location 19', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(20, 20, 'Scr1 - Candidate 20', 'Location 20', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(21, 1, 'Scr2 - Candidate 01', 'Location 01', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(22, 2, 'Scr2 - Candidate 02', 'Location 02', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(23, 3, 'Scr2 - Candidate 03', 'Location 03', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(24, 4, 'Scr2 - Candidate 04', 'Location 04', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(25, 5, 'Scr2 - Candidate 05', 'Location 05', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(26, 6, 'Scr2 - Candidate 06', 'Location 06', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(27, 7, 'Scr2 - Candidate 07', 'Location 07', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(28, 8, 'Scr2 - Candidate 08', 'Location 08', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(29, 9, 'Scr2 - Candidate 09', 'Location 09', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(30, 10, 'Scr2 - Candidate 10', 'Location 10', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(31, 11, 'Scr2 - Candidate 11', 'Location 11', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(32, 12, 'Scr2 - Candidate 12', 'Location 12', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(33, 13, 'Scr2 - Candidate 13', 'Location 13', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(34, 14, 'Scr2 - Candidate 14', 'Location 14', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(35, 15, 'Scr2 - Candidate 15', 'Location 15', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(36, 16, 'Scr2 - Candidate 16', 'Location 16', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(37, 17, 'Scr2 - Candidate 17', 'Location 17', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(38, 18, 'Scr2 - Candidate 18', 'Location 18', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(39, 19, 'Scr2 - Candidate 19', 'Location 19', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20'),
(40, 20, 'Scr2 - Candidate 20', 'Location 20', 'candidate.png', '2023-04-15 03:09:20', '2023-04-15 03:09:20');

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
(16, 1, 16, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(17, 1, 17, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(18, 1, 18, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(19, 1, 19, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(20, 1, 20, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(21, 1, 21, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(22, 1, 22, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(23, 1, 23, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(24, 1, 24, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(25, 1, 25, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(26, 1, 26, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(27, 1, 27, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(28, 1, 28, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(29, 1, 29, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(30, 1, 30, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(31, 1, 31, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(32, 1, 32, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(33, 1, 33, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(34, 1, 34, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(35, 1, 35, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(36, 1, 36, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(37, 1, 37, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(38, 1, 38, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(39, 1, 39, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(40, 1, 40, '', '2023-04-15 03:19:48', '2023-04-15 03:19:48'),
(41, 2, 1, 'Top 01', '2023-04-15 03:19:58', '2023-04-15 03:53:15'),
(42, 2, 2, 'Top 02', '2023-04-15 03:19:58', '2023-04-15 03:53:21'),
(43, 2, 3, 'Top 03', '2023-04-15 03:19:58', '2023-04-15 03:53:47'),
(44, 2, 4, 'Top 04', '2023-04-15 03:19:58', '2023-04-15 03:54:00'),
(45, 2, 5, 'Top 05', '2023-04-15 03:19:58', '2023-04-15 03:54:04'),
(46, 2, 6, 'Top 06', '2023-04-15 03:19:58', '2023-04-15 03:54:07'),
(47, 2, 7, 'Top 07', '2023-04-15 03:19:58', '2023-04-15 03:54:11'),
(48, 2, 8, 'Top 08', '2023-04-15 03:19:58', '2023-04-15 03:54:14'),
(49, 2, 9, 'Top 09', '2023-04-15 03:19:58', '2023-04-15 03:54:17'),
(50, 2, 10, 'Top 10', '2023-04-15 03:19:58', '2023-04-15 03:22:29'),
(51, 2, 11, 'Top 11', '2023-04-15 03:19:58', '2023-04-15 03:22:32'),
(52, 2, 12, 'Top 12', '2023-04-15 03:19:58', '2023-04-15 03:22:35'),
(53, 2, 13, 'Top 13', '2023-04-15 03:19:58', '2023-04-15 03:22:38'),
(54, 2, 14, 'Top 14', '2023-04-15 03:19:58', '2023-04-15 03:22:40'),
(55, 2, 15, 'Top 15', '2023-04-15 03:19:58', '2023-04-15 03:22:59'),
(56, 2, 16, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(57, 2, 17, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(58, 2, 18, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(59, 2, 19, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(60, 2, 20, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(61, 2, 21, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(62, 2, 22, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(63, 2, 23, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(64, 2, 24, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(65, 2, 25, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(66, 2, 26, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(67, 2, 27, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(68, 2, 28, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(69, 2, 29, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(70, 2, 30, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(71, 2, 31, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(72, 2, 32, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(73, 2, 33, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(74, 2, 34, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(75, 2, 35, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(76, 2, 36, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(77, 2, 37, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(78, 2, 38, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(79, 2, 39, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58'),
(80, 2, 40, '', '2023-04-15 03:19:58', '2023-04-15 03:19:58');

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
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

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
