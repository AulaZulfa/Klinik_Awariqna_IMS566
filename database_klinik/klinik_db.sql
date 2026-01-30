-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 29, 2026 at 09:05 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klinik_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `patient_id`, `doctor_id`, `date`, `start_time`, `end_time`, `purpose`, `status`, `created`, `modified`) VALUES
(17, 8, 4, '2026-02-18', '09:30:00', '22:00:07', 'Flu', 1, '2026-01-27 20:34:26', '2026-01-27 20:34:26'),
(18, 9, 6, '2026-02-20', '10:00:00', '11:00:00', 'Prescription refill', 1, '2026-01-28 13:14:06', '2026-01-28 13:14:06'),
(21, 8, 6, '2026-03-20', '15:00:00', '15:25:00', 'Prescription refill', 1, '2026-01-28 18:26:42', '2026-01-28 18:26:42'),
(22, 8, 5, '2026-03-20', '10:00:00', '10:15:00', 'Medical consultation', 1, '2026-01-28 18:28:42', '2026-01-28 18:28:42'),
(23, 7, 7, '2026-02-26', '09:00:00', '09:50:00', 'Medical consultation', 1, '2026-01-28 18:57:19', '2026-01-28 18:57:19'),
(24, 7, 4, '2026-03-11', '11:30:00', '12:00:00', 'Allergy treatment', 1, '2026-01-28 20:23:30', '2026-01-28 20:23:30');

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int UNSIGNED NOT NULL,
  `transaction` char(36) NOT NULL,
  `type` varchar(7) NOT NULL,
  `primary_key` int UNSIGNED DEFAULT NULL,
  `source` varchar(255) NOT NULL,
  `parent_source` varchar(255) DEFAULT NULL,
  `original` mediumtext,
  `changed` mediumtext,
  `meta` mediumtext,
  `status` int NOT NULL DEFAULT '1',
  `slug` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `transaction`, `type`, `primary_key`, `source`, `parent_source`, `original`, `changed`, `meta`, `status`, `slug`, `created`) VALUES
(1, '7ccc8820-25e9-42bd-88ed-40cf7e7483bf', 'create', 0, 'doctors', NULL, '[]', '{\"id\":0,\"name\":\"Dr. Jamil bin Ahmad\",\"phone\":12645378,\"email\":\"jamil65@gmail.com\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/doctors\\/add\",\"slug\":1}', 1, NULL, '2026-01-07 19:25:07'),
(2, 'a1b5106a-7862-4a2b-bdb2-04ab4ea3991c', 'update', 0, 'doctors', NULL, '{\"phone\":\"12645378\"}', '{\"phone\":\"012645378\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/doctors\\/edit\\/0\",\"slug\":1}', 1, NULL, '2026-01-07 20:41:57'),
(3, 'da669dc4-50d1-4fb9-b8c8-f1dcc71d6c59', 'create', 1, 'slots', NULL, '[]', '{\"id\":1,\"doctors_id\":0,\"date\":\"2026-01-10\",\"time\":\"09:30:00\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/add\",\"slug\":1}', 1, NULL, '2026-01-07 21:52:08'),
(4, '5bdcb3a8-d716-42d1-ba7b-ca5f00505fcb', 'update', 1, 'slots', NULL, '{\"status\":1}', '{\"status\":0}', '{\"a_name\":\"Edit\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-07 22:20:04'),
(5, 'c035fa01-c98c-4a7b-a194-fdd472c98892', 'create', 1, 'patients', NULL, '[]', '{\"id\":1,\"name\":\"Aliyah binti Jamal\",\"ic\":970213146672,\"phone\":13872910,\"street_1\":\"No.209A, Jalan Kebun\",\"street_2\":\"Bukit Rendah\",\"postcode\":67200,\"city\":\"Cheras\",\"state\":\"Wilayah Persekutuan Kuala Lumpur\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Patients\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/patients\\/add\",\"slug\":1}', 1, NULL, '2026-01-07 22:48:44'),
(6, '12e9d219-58bd-42d0-a460-a0146696d94a', 'update', 1, 'patients', NULL, '{\"ic\":\"2147483647\",\"phone\":\"13872910\"}', '{\"ic\":\"970102146671\",\"phone\":\"013872910\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Patients\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/patients\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-07 22:50:55'),
(7, '58b2f0c4-1e88-4c3a-8ffc-85105d493e23', 'create', 1, 'appointments', NULL, '[]', '{\"id\":1,\"patients_id\":1,\"doctors_id\":0,\"slots_id\":1,\"status\":0}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-07 23:24:20'),
(8, 'cad6f929-7e5a-4be9-bf5b-bccc50c47e10', 'update', 1, 'slots', NULL, '{\"status\":0}', '{\"status\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-08 10:22:05'),
(9, '78fbdb3c-d9c6-4a45-9d9a-d62bff102712', 'update', 1, 'appointments', NULL, '{\"status\":0}', '{\"status\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-08 10:28:47'),
(10, 'fcbd05fb-30aa-4c8e-b6d9-f56a1ec35933', 'update', 1, 'appointments', NULL, '{\"status\":1}', '{\"status\":0}', '{\"a_name\":\"Edit\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/edit\\/1\",\"slug\":1}', 1, NULL, '2026-01-09 16:00:09'),
(11, '259bb3b9-b70d-4361-a331-b0a8bfad35fc', 'create', 1, 'doctors', NULL, '[]', '{\"id\":1,\"name\":\"Dr. Jamil bin Ahmad\",\"phone\":\"011672927\",\"email\":\"jamil65@gmail.com\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/doctors\\/add\",\"slug\":1}', 1, NULL, '2026-01-09 16:51:43'),
(12, '9fa7ad48-3d2d-423b-9f5e-d0e7243b1ec0', 'create', 2, 'doctors', NULL, '[]', '{\"id\":2,\"name\":\"Dr. Siti binti Ali\",\"phone\":\"0127382947\",\"email\":\"siti89@gmail.com\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/doctors\\/add\",\"slug\":1}', 1, NULL, '2026-01-09 16:52:04'),
(13, '662f5978-e001-4f4b-bb4b-ba504781baac', 'create', 2, 'slots', NULL, '[]', '{\"id\":2,\"doctors_id\":1,\"date\":\"2026-01-14\",\"time\":\"09:00:00\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/add\",\"slug\":1}', 1, NULL, '2026-01-09 16:58:00'),
(14, '85106af5-8d95-4a78-a2f6-55504ce2185c', 'create', 3, 'slots', NULL, '[]', '{\"id\":3,\"doctors_id\":2,\"date\":\"2026-01-24\",\"time\":\"10:00:00\",\"status\":0}', '{\"a_name\":\"Add\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/add\",\"slug\":1}', 1, NULL, '2026-01-09 16:59:34'),
(15, '7aba8bc1-9b14-4ac0-801f-71d7215aeb8e', 'create', 2, 'appointments', NULL, '[]', '{\"id\":2,\"patients_id\":1,\"doctors_id\":1,\"slots_id\":2,\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-09 17:00:14'),
(16, '81708723-e263-43af-a9d0-555a729ed4e0', 'create', 2, 'patients', NULL, '[]', '{\"id\":2,\"name\":\"Isaac Newton\",\"ic\":\"840913109981\",\"phone\":\"012837293\",\"street_1\":\"1\\/2, Jalan Law II\",\"street_2\":\"Bukit Jelutong\",\"postcode\":32400,\"city\":\"Shah Alam\",\"state\":\"Selangor\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Patients\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/patients\\/add\",\"slug\":1}', 1, NULL, '2026-01-09 17:10:44'),
(17, 'bb13ee1e-f9b9-4994-aff8-0c16117cd674', 'create', 5, 'appointments', NULL, '[]', '{\"id\":5,\"patients_id\":2,\"doctors_id\":2,\"slots_id\":3,\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-09 17:11:45'),
(18, '238f677e-93c1-4706-b761-0312e747ddaa', 'delete', 5, 'appointments', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/delete\\/5\",\"slug\":1}', 1, NULL, '2026-01-09 17:11:59'),
(19, '5ea7fe54-bdcd-4c34-bc71-edaf81756546', 'update', 3, 'slots', NULL, '{\"status\":0}', '{\"status\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/edit\\/3\",\"slug\":1}', 1, NULL, '2026-01-09 17:12:15'),
(20, '244ea1b8-e9e9-4ebc-b74e-40df0926d09b', 'delete', 3, 'slots', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/delete\\/3\",\"slug\":1}', 1, NULL, '2026-01-09 17:13:41'),
(21, 'b67fd078-9efa-4182-8fb7-3ad735aa59dc', 'update', 2, 'appointments', NULL, '{\"status\":1}', '{\"status\":2}', '{\"a_name\":\"Edit\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/edit\\/2\",\"slug\":1}', 1, NULL, '2026-01-09 17:14:03'),
(22, 'a84968b4-8bf3-477e-867c-8a571b107af8', 'create', 2, 'users', NULL, '[]', '{\"id\":2,\"fullname\":\"NUR AULA ZULFA BINTI ZAMRI\",\"password\":\"$2y$10$HYFsp2jdxcYzMaFv5DgiY.m4..TyitV0hXWbroy.JQsKBWOyLLHyW\",\"email\":\"aulazulfa2004@gmail.com\",\"avatar\":\"photo_6260259879167658885_y.jpg\",\"avatar_dir\":\"webroot\\\\files\\\\Users\\\\avatar\\\\NUR-AULA-ZULFA-BINTI-ZAMRI\",\"slug\":\"NUR-AULA-ZULFA-BINTI-ZAMRI\"}', '[]', 1, NULL, '2026-01-10 09:09:09'),
(23, 'df7e5a1a-c7f7-4816-acb3-28b39c7f8d1b', 'update', 2, 'users', NULL, '{\"avatar\":\"photo_6260259879167658885_y.jpg\",\"avatar_dir\":\"webroot\\\\files\\\\Users\\\\avatar\\\\NUR-AULA-ZULFA-BINTI-ZAMRI\"}', '{\"avatar\":\"\",\"avatar_dir\":\"\"}', '[]', 1, NULL, '2026-01-10 09:11:09'),
(24, 'd050d4b7-5c55-47f5-b758-891d2bc2f9c0', 'delete', 2, 'users', NULL, NULL, NULL, '[]', 1, NULL, '2026-01-10 09:36:03'),
(25, '96e5f04f-7ee2-4411-bab1-42808b074bed', 'create', 4, 'slots', NULL, '[]', '{\"id\":4,\"doctors_id\":2,\"date\":\"2026-01-29\",\"time\":\"09:45:29\",\"status\":0}', '{\"a_name\":\"Add\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/add\",\"slug\":1}', 1, NULL, '2026-01-10 09:45:34'),
(26, '155227d9-b0f1-45c0-9157-efe8e105d652', 'update', 2, 'appointments', NULL, '{\"slots_id\":2,\"status\":2}', '{\"slots_id\":4,\"status\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/edit\\/2\",\"slug\":1}', 1, NULL, '2026-01-10 09:46:09'),
(27, 'dec110b5-fe2c-40f1-a6fd-82732d7c4878', 'update', 2, 'appointments', NULL, '{\"slots_id\":4,\"status\":1}', '{\"slots_id\":2,\"status\":0}', '{\"a_name\":\"Edit\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/edit\\/2\",\"slug\":1}', 1, NULL, '2026-01-10 09:49:14'),
(28, '9b52414c-9222-477a-a567-40537ecfd15c', 'update', 2, 'appointments', NULL, '{\"status\":0}', '{\"status\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/edit\\/2\",\"slug\":1}', 1, NULL, '2026-01-10 09:51:39'),
(29, '799f09d5-dbef-4a34-b5f7-33b1c6a7d040', 'update', 4, 'slots', NULL, '{\"status\":0}', '{\"status\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/edit\\/4\",\"slug\":1}', 1, NULL, '2026-01-10 10:18:21'),
(30, 'df8778d3-2d72-4780-927f-628f2361aaf7', 'update', 4, 'slots', NULL, '{\"status\":1}', '{\"status\":0}', '{\"a_name\":\"Edit\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/edit\\/4\",\"slug\":1}', 1, NULL, '2026-01-10 10:18:34'),
(31, '332546eb-0eab-43c5-a49f-ec529ee07407', 'update', 4, 'slots', NULL, '{\"status\":0}', '{\"status\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/edit\\/4\",\"slug\":1}', 1, NULL, '2026-01-10 10:19:41'),
(32, 'a2ce6a4d-efef-4dc2-93c9-aaf78e614c8e', 'update', 4, 'slots', NULL, '{\"status\":1}', '{\"status\":0}', '{\"a_name\":\"Edit\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/edit\\/4\",\"slug\":1}', 1, NULL, '2026-01-10 10:22:22'),
(33, '046eeff9-f554-4138-8e64-3da90d33cb3d', 'update', 4, 'slots', NULL, '{\"status\":0}', '{\"status\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/edit\\/4\",\"slug\":1}', 1, NULL, '2026-01-10 10:33:21'),
(34, '16881e32-c794-4f07-96e0-15abb0765e26', 'create', 10, 'appointments', NULL, '[]', '{\"id\":10,\"patients_id\":2,\"doctors_id\":2,\"slots_id\":4,\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-10 10:35:53'),
(35, 'a4556c3b-fc11-497d-84bc-3d54fb7fd06b', 'update', 4, 'slots', NULL, '{\"status\":1}', '{\"status\":0}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-10 10:35:53'),
(36, 'd4c2aeaa-e754-433c-baf3-4c8deaa73d3e', 'update', 10, 'appointments', NULL, '{\"slots_id\":4}', '{\"slots_id\":2}', '{\"a_name\":\"Edit\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/edit\\/10\",\"slug\":1}', 1, NULL, '2026-01-10 10:36:22'),
(37, '1ed378ec-903f-4c5e-b555-98db09289c62', 'update', 4, 'slots', NULL, '{\"status\":0}', '{\"status\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/edit\\/4\",\"slug\":1}', 1, NULL, '2026-01-10 10:38:08'),
(38, 'd8ceec81-008c-4079-8fba-1ba1fcdb64e0', 'update', 10, 'appointments', NULL, '{\"slots_id\":2}', '{\"slots_id\":4}', '{\"a_name\":\"Edit\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/edit\\/10\",\"slug\":1}', 1, NULL, '2026-01-10 10:38:17'),
(39, 'acc6a209-6b7f-4d14-a1c5-3079f4383f5c', 'delete', 10, 'appointments', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/delete\\/10\",\"slug\":1}', 1, NULL, '2026-01-10 10:38:27'),
(40, 'cabe37c7-cacc-4569-8647-0dc000a9e78d', 'update', 4, 'slots', NULL, '{\"status\":1}', '{\"status\":0}', '{\"a_name\":\"Edit\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/edit\\/4\",\"slug\":1}', 1, NULL, '2026-01-10 10:38:39'),
(41, '5cb8d4cd-44a0-48ac-b5cc-e5716b5c75c6', 'update', 4, 'slots', NULL, '{\"status\":0}', '{\"status\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/edit\\/4\",\"slug\":1}', 1, NULL, '2026-01-10 11:17:35'),
(42, '70a47448-0ab3-4086-bf03-b458f6869d22', 'create', 14, 'appointments', NULL, '[]', '{\"id\":14,\"patients_id\":2,\"doctors_id\":2,\"slots_id\":4,\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-10 11:18:43'),
(43, 'a92cf42a-d1d0-42e5-a65e-b29fb6be832d', 'update', 4, 'slots', NULL, '{\"status\":1}', '{\"status\":0}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-10 11:18:43'),
(44, 'e0a1757b-8573-43fa-87eb-0d7bfb8f1d32', 'update', 14, 'appointments', NULL, '{\"slots_id\":4,\"status\":1}', '{\"slots_id\":2,\"status\":0}', '{\"a_name\":\"Edit\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/edit\\/14\",\"slug\":1}', 1, NULL, '2026-01-10 11:19:02'),
(45, '441593ab-084a-4126-88a8-0aa107e98d27', 'delete', 14, 'appointments', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/delete\\/14\",\"slug\":1}', 1, NULL, '2026-01-10 11:21:27'),
(46, 'b4d5449c-8632-46d2-ac58-8a2c42454084', 'update', 2, 'appointments', NULL, '{\"doctors_id\":1}', '{\"doctors_id\":2}', '{\"a_name\":\"Edit\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/edit\\/2\",\"slug\":1}', 1, NULL, '2026-01-10 11:24:20'),
(47, 'd5bbad7f-bc16-4d8d-8b6c-daa8ac657523', 'update', 2, 'appointments', NULL, '{\"doctors_id\":2}', '{\"doctors_id\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/edit\\/2\",\"slug\":1}', 1, NULL, '2026-01-10 11:24:28'),
(48, '781799f7-2dd1-447a-a2a3-0bdf40736bb5', 'update', 4, 'slots', NULL, '{\"status\":0}', '{\"status\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/edit\\/4\",\"slug\":1}', 1, NULL, '2026-01-10 11:26:46'),
(49, 'd7d77563-d32e-401b-b504-39f5ce1f4b5a', 'create', 15, 'appointments', NULL, '[]', '{\"id\":15,\"patients_id\":2,\"doctors_id\":2,\"slots_id\":4,\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-10 11:26:57'),
(50, '7fc7dd54-5c22-4d9b-9464-b351ff182541', 'update', 4, 'slots', NULL, '{\"status\":1}', '{\"status\":0}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-10 11:26:57'),
(51, '91b2aa2f-2d8f-4327-9751-253d9609e00a', 'update', 4, 'slots', NULL, '{\"status\":0}', '{\"status\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/edit\\/4\",\"slug\":1}', 1, NULL, '2026-01-10 11:29:43'),
(52, '68be823b-58da-4c99-99a9-87047938bc11', 'update', 4, 'slots', NULL, '{\"status\":1}', '{\"status\":0}', '{\"a_name\":\"Edit\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/edit\\/4\",\"slug\":1}', 1, NULL, '2026-01-10 11:31:20'),
(53, '0bce6113-6ce2-41c6-bba6-76cacb8bacd6', 'update', 4, 'slots', NULL, '{\"status\":0}', '{\"status\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/edit\\/4\",\"slug\":1}', 1, NULL, '2026-01-10 11:31:48'),
(54, 'b9c2639b-d9f0-4394-887a-7c5377a9b5b0', 'update', 15, 'appointments', NULL, '{\"status\":1}', '{\"status\":0}', '{\"a_name\":\"Edit\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/edit\\/15\",\"slug\":1}', 1, NULL, '2026-01-10 11:32:02'),
(55, '01d63c0c-4863-40c2-a0a0-8b658fe34815', 'update', 4, 'slots', NULL, '{\"status\":1}', '{\"status\":0}', '{\"a_name\":\"Edit\",\"c_name\":\"Slots\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/slots\\/edit\\/4\",\"slug\":1}', 1, NULL, '2026-01-10 11:32:11'),
(56, '2babe852-c40a-415d-ad57-db72c75ae09a', 'update', 2, 'doctors', NULL, '{\"status\":1}', '{\"status\":0}', '{\"a_name\":\"Edit\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/doctors\\/edit\\/2\",\"slug\":1}', 1, NULL, '2026-01-10 11:34:09'),
(57, 'f10a397d-3731-4ea9-8478-f2a4e9e2cb38', 'update', 2, 'doctors', NULL, '{\"status\":0}', '{\"status\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/doctors\\/edit\\/2\",\"slug\":1}', 1, NULL, '2026-01-10 11:34:26'),
(58, 'a7040557-079a-4924-8226-20ec1cfa1793', 'delete', 2, 'doctors', NULL, NULL, NULL, '{\"a_name\":\"Delete\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/doctors\\/delete\\/2\",\"slug\":1}', 1, NULL, '2026-01-11 12:18:06'),
(59, 'a0bb49ae-cafe-4809-a4dd-51d0ee45d2cf', 'create', 3, 'doctors', NULL, '[]', '{\"id\":3,\"name\":\"Dr. Siti binti Ali\",\"phone\":\"0127839231\",\"email\":\"siti89@gmail.com\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/doctors\\/add\",\"slug\":1}', 1, NULL, '2026-01-11 12:19:28'),
(60, '1e84a11c-56c8-46e6-91b7-be22da3c2a9c', 'create', 3, 'patients', NULL, '[]', '{\"id\":3,\"name\":\"Aliyah binti Jamal\",\"ic\":\"840913109981\",\"phone\":\"0127839231\",\"street_1\":\"No.209A, Jalan Kebun\",\"street_2\":\"Bukit Jelutong\",\"postcode\":64200,\"city\":\"Shah Alam\",\"state\":\"Selangor\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Patients\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/patients\\/add\",\"slug\":1}', 1, NULL, '2026-01-12 11:24:55'),
(61, '0133cf15-bb9a-455c-8c7d-082345d1795e', 'create', 6, 'patients', NULL, '[]', '{\"id\":6,\"name\":\"Aliyah binti Jamal\",\"ic\":\"000911058902\",\"phone\":\"0127839231\",\"street_1\":\"No.209A, Jalan Kebun\",\"street_2\":\"Bukit Jelutong\",\"postcode\":32000,\"city\":\"Shah Alam\",\"state\":\"Selangor\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Patients\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/patients\\/add\",\"slug\":1}', 1, NULL, '2026-01-12 11:30:37'),
(62, '36343bad-bbcc-44cb-a78a-df30f4603c64', 'update', 6, 'patients', NULL, '{\"email\":\"\"}', '{\"email\":\"aliyah72@gmail.com\"}', '{\"a_name\":\"Edit\",\"c_name\":\"Patients\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/patients\\/edit\\/6\",\"slug\":1}', 1, NULL, '2026-01-12 11:36:40'),
(63, '1027f86a-1fd2-410c-99bd-b4a8da82c1f9', 'create', 3, 'users', NULL, '{\"user_group_id\":2,\"fullname\":\"NUR AULA ZULFA BINTI ZAMRI\",\"email\":\"aulazulfa2004@gmail.com\",\"status\":\"1\"}', '{\"id\":3,\"user_group_id\":2,\"fullname\":\"NUR AULA ZULFA BINTI ZAMRI\",\"email\":\"aulazulfa2004@gmail.com\",\"status\":\"1\",\"slug\":\"NUR-AULA-ZULFA-BINTI-ZAMRI\"}', '[]', 1, NULL, '2026-01-12 11:50:56'),
(64, '3aa7c9b4-2150-4384-baea-b1fb020ce681', 'create', 16, 'appointments', NULL, '[]', '{\"id\":16,\"patients_id\":6,\"doctors_id\":1,\"slots_id\":2,\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-12 11:54:07'),
(65, '09584148-6bbd-4fd5-bc09-cd765f58d4a4', 'update', 2, 'slots', NULL, '{\"status\":1}', '{\"status\":0}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-12 11:54:07'),
(66, '0b770542-e7ea-413e-ab04-e438340d2a4a', 'create', 4, 'users', NULL, '{\"user_group_id\":2,\"fullname\":\"NUR AULA ZULFA ZAMRI\",\"email\":\"2025121345@student.uitm.edu.my\",\"status\":\"1\"}', '{\"id\":4,\"user_group_id\":2,\"fullname\":\"NUR AULA ZULFA ZAMRI\",\"email\":\"2025121345@student.uitm.edu.my\",\"status\":\"1\",\"slug\":\"NUR-AULA-ZULFA-ZAMRI\"}', '[]', 1, NULL, '2026-01-12 11:55:03'),
(67, '9bdee136-7b1e-4152-bfd0-84ddd6df42eb', 'delete', 3, 'users', NULL, NULL, NULL, '[]', 1, NULL, '2026-01-12 11:57:41'),
(68, 'fd84b36d-0dcb-4fcc-b328-911158968632', 'create', 5, 'users', NULL, '{\"user_group_id\":2,\"fullname\":\"NUR AULA ZULFA BINTI ZAMRI\",\"email\":\"aulazulfa2004@gmail.com\",\"status\":\"1\"}', '{\"id\":5,\"user_group_id\":2,\"fullname\":\"NUR AULA ZULFA BINTI ZAMRI\",\"email\":\"aulazulfa2004@gmail.com\",\"status\":\"1\",\"slug\":\"NUR-AULA-ZULFA-BINTI-ZAMRI\"}', '[]', 1, NULL, '2026-01-12 14:30:40'),
(69, '5e8da5e5-8681-4b03-bd11-a7bab1c1f2a6', 'create', 4, 'doctors', NULL, '[]', '{\"id\":4,\"name\":\"Dr. Ahmad Kassim\",\"phone\":\"0127382947\",\"email\":\"ahmad21@gmail.com\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/doctors\\/add\",\"slug\":1}', 1, NULL, '2026-01-27 12:47:16'),
(70, '1bb8df5e-e75c-4f22-b25a-059ea6f81d61', 'create', 7, 'patients', NULL, '[]', '{\"id\":7,\"name\":\"NUR AULA ZULFA BINTI ZAMRI\",\"email\":\"aulazulfa2004@gmail.com\",\"ic\":\"000911058902\",\"phone\":\"01160786716\",\"street_1\":\"LOT 3760B, JALAN ISKANDAR\",\"street_2\":\"KAMPUNG BUKIT KAPAR\",\"postcode\":42200,\"city\":\"KLANG\",\"state\":\"Selangor\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Patients\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/patients\\/add\",\"slug\":1}', 1, NULL, '2026-01-27 20:07:29'),
(71, '44a692a4-cbe8-4bd5-89d6-61a3dcba23d8', 'delete', 4, 'users', NULL, NULL, NULL, '[]', 1, NULL, '2026-01-27 20:27:11'),
(72, '83ea1f77-52cc-4b3e-9c43-e14b77a9759c', 'create', 6, 'users', NULL, '{\"user_group_id\":2,\"fullname\":\"NUR AULA ZULFA ZAMRI\",\"email\":\"2025121345@student.uitm.edu.my\",\"status\":\"1\"}', '{\"id\":6,\"user_group_id\":2,\"fullname\":\"NUR AULA ZULFA ZAMRI\",\"email\":\"2025121345@student.uitm.edu.my\",\"status\":\"1\",\"slug\":\"NUR-AULA-ZULFA-ZAMRI\"}', '[]', 1, NULL, '2026-01-27 20:27:21'),
(73, 'e4cb3c7f-291e-4535-af30-244ed55de092', 'create', 8, 'patients', NULL, '[]', '{\"id\":8,\"name\":\"Siti Nurhaliza Binti Ahmad\",\"email\":\"2025121345@student.uitm.edu.my\",\"ic\":\"991019180092\",\"phone\":\"01198323452\",\"street_1\":\"A-2-9, Pangsapuri Indah\",\"street_2\":\"Bandar Kenangan\",\"postcode\":38000,\"city\":\"Cheras\",\"state\":\"Wilayah Persekutuan Kuala Lumpur\",\"status\":1}', '[]', 1, NULL, '2026-01-27 20:32:30'),
(74, '5b66c557-0482-4863-aad6-32d7d56b9f1a', 'create', 17, 'appointments', NULL, '[]', '{\"id\":17,\"patient_id\":8,\"doctor_id\":4,\"date\":\"2026-02-18\",\"start_time\":\"09:30:00\",\"end_time\":\"22:00:07\",\"purpose\":\"Flu\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-27 20:34:26'),
(75, 'd0509e0d-9ffd-401a-ae07-c37ed696338d', 'create', 5, 'doctors', NULL, '[]', '{\"id\":5,\"name\":\"Dr. Ainul\",\"phone\":\"0193672893\",\"email\":\"ainul32@gmail.com\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/doctors\\/add\",\"slug\":1}', 1, NULL, '2026-01-28 12:48:02'),
(76, 'b02fdb8e-3040-4810-b54d-59bcc3d378c5', 'create', 7, 'users', NULL, '{\"user_group_id\":2,\"fullname\":\"hazrina zahari\",\"email\":\"wanhazrinawanzahari@gmail.com\",\"status\":\"1\"}', '{\"id\":7,\"user_group_id\":2,\"fullname\":\"hazrina zahari\",\"email\":\"wanhazrinawanzahari@gmail.com\",\"status\":\"1\",\"slug\":\"hazrina-zahari\"}', '[]', 1, NULL, '2026-01-28 12:56:14'),
(77, '269c95dd-b334-450b-9b2d-79ee59d41a15', 'create', 6, 'doctors', NULL, '[]', '{\"id\":6,\"name\":\"Dr. Ahmad Zulkifli\",\"phone\":\"0123456789\",\"email\":\"zulkifli@gmail.com\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/doctors\\/add\",\"slug\":1}', 1, NULL, '2026-01-28 13:08:04'),
(78, '20d2f126-6351-48b3-bc3d-155737cc5d65', 'create', 7, 'doctors', NULL, '[]', '{\"id\":7,\"name\":\"Dr. Daniel Lee Wei Han\",\"phone\":\"0145678901\",\"email\":\"daniel.lee@gmail.com\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/doctors\\/add\",\"slug\":1}', 1, NULL, '2026-01-28 13:10:54'),
(79, '50f2f5d6-dc56-4f2a-93ff-fb6934aa87f8', 'create', 8, 'doctors', NULL, '[]', '{\"id\":8,\"name\":\"Dr. Siti Amirah Rahman\",\"phone\":\"0116789012\",\"email\":\"siti.amirah@gmail.com\",\"status\":0}', '{\"a_name\":\"Add\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/doctors\\/add\",\"slug\":1}', 1, NULL, '2026-01-28 13:12:19'),
(80, 'f0ab8584-49ed-4a9c-ae8c-36dcb153fc39', 'create', 18, 'appointments', NULL, '[]', '{\"id\":18,\"patient_id\":9,\"doctor_id\":6,\"date\":\"2026-02-20\",\"start_time\":\"10:00:00\",\"end_time\":\"11:00:00\",\"purpose\":\"Prescription refill\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-28 13:14:06'),
(81, 'da500f57-3254-439c-834d-d814f71b5377', 'update', 8, 'doctors', NULL, '{\"status\":0}', '{\"status\":1}', '{\"a_name\":\"Edit\",\"c_name\":\"Doctors\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/doctors\\/edit\\/8\",\"slug\":1}', 1, NULL, '2026-01-28 17:57:46'),
(82, '28b073e8-63d5-4aad-9533-f00bd19a82fd', 'create', 21, 'appointments', NULL, '[]', '{\"id\":21,\"patient_id\":8,\"doctor_id\":6,\"date\":\"2026-03-20\",\"start_time\":\"15:00:00\",\"end_time\":\"15:25:00\",\"purpose\":\"Prescription refill\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-28 18:26:42'),
(83, '7a04aea4-296a-467d-be28-00312e0a5ba3', 'create', 22, 'appointments', NULL, '[]', '{\"id\":22,\"patient_id\":8,\"doctor_id\":5,\"date\":\"2026-03-20\",\"start_time\":\"10:00:00\",\"end_time\":\"10:15:00\",\"purpose\":\"Medical consultation\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-28 18:28:42'),
(84, '27e65a2c-ca44-4fec-86ee-c5f2f8c8e692', 'create', 23, 'appointments', NULL, '[]', '{\"id\":23,\"patient_id\":7,\"doctor_id\":7,\"date\":\"2026-02-26\",\"start_time\":\"09:00:00\",\"end_time\":\"09:50:00\",\"purpose\":\"Medical consultation\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/add\",\"slug\":5}', 1, NULL, '2026-01-28 18:57:19'),
(85, '928830c4-96b4-40d6-ba55-d50a9f4d0258', 'create', 24, 'appointments', NULL, '[]', '{\"id\":24,\"patient_id\":7,\"doctor_id\":4,\"date\":\"2026-03-11\",\"start_time\":\"11:30:00\",\"end_time\":\"12:00:00\",\"purpose\":\"Allergy treatment\",\"status\":1}', '{\"a_name\":\"Add\",\"c_name\":\"Appointments\",\"ip\":\"::1\",\"url\":\"http:\\/\\/localhost\\/klinik\\/appointments\\/add\",\"slug\":1}', 1, NULL, '2026-01-28 20:23:30');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `ticket` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `note_admin` text,
  `ip` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `is_replied` tinyint(1) NOT NULL,
  `respond_date_time` datetime DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `status` int DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `phone`, `email`, `status`, `created`, `modified`) VALUES
(4, 'Dr. Ahmad Kassim', '0127382947', 'ahmad21@gmail.com', 1, '2026-01-27 12:47:15', '2026-01-27 12:47:15'),
(5, 'Dr. Ainul', '0193672893', 'ainul32@gmail.com', 1, '2026-01-28 12:48:02', '2026-01-28 12:48:02'),
(6, 'Dr. Ahmad Zulkifli', '0123456789', 'zulkifli@gmail.com', 1, '2026-01-28 13:08:04', '2026-01-28 13:08:04'),
(7, 'Dr. Daniel Lee Wei Han', '0145678901', 'daniel.lee@gmail.com', 1, '2026-01-28 13:10:54', '2026-01-28 13:10:54'),
(8, 'Dr. Siti Amirah Rahman', '0116789012', 'siti.amirah@gmail.com', 1, '2026-01-28 13:12:19', '2026-01-28 17:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int NOT NULL,
  `category` varchar(100) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `category`, `question`, `answer`, `slug`, `status`, `created`, `modified`) VALUES
(1, 'General', 'General Questions 1', 'General Answer 1', 'General-Questions-1', 1, '2022-11-13 15:41:26', '2022-11-13 16:31:14'),
(2, 'Account', 'Account Questions 1', 'Account Answer 1', 'Account-Questions-1', 1, '2022-11-13 15:43:15', '2022-11-13 15:43:15'),
(3, 'Other', 'Other Questions 1', 'Other Answer 1', 'Other-Questions-1', 1, '2022-11-13 15:43:34', '2022-11-13 15:43:34'),
(6, 'General', 'General Questions 2', 'General Answer 2', 'General-Questions-2', 0, '2022-11-13 16:54:25', '2024-06-25 13:03:08');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int DEFAULT NULL,
  `lft` int DEFAULT NULL,
  `rght` int DEFAULT NULL,
  `level` int DEFAULT '0',
  `icon` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `auth` tinyint(1) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `divider_before` tinyint(1) DEFAULT '0',
  `parent_separator` tinyint(1) DEFAULT NULL,
  `division` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `lft`, `rght`, `level`, `icon`, `controller`, `action`, `target`, `name`, `url`, `prefix`, `auth`, `admin`, `active`, `disabled`, `divider_before`, `parent_separator`, `division`) VALUES
(1, NULL, 1, 2, 0, '<i class=\"fa-solid fa-code\"></i>', 'Dashboards', 'Index', NULL, 'Dashboard', '', '', 1, 0, 1, 0, 0, 0, 0),
(2, NULL, 3, 4, 0, '<i class=\"fa-regular fa-circle-question\"></i>', 'Faqs', '', NULL, 'FAQs', '', '', 0, 0, 1, 0, 0, NULL, 0),
(3, NULL, 5, 6, 0, '<i class=\"fa-regular fa-message\"></i>', 'Contacts', 'Add', NULL, 'Contact Us', '', '', 0, 0, 1, NULL, 0, NULL, 0),
(4, NULL, 7, 14, 0, '<i class=\"fa-solid fa-circle-info\"></i>', 'Pages', 'manual', NULL, 'Documentation', '', '', 0, 0, 1, 0, 0, 1, 0),
(5, NULL, 15, 16, 0, '', '', '', NULL, 'Administrator', '', NULL, 0, 1, 1, NULL, 0, NULL, 1),
(6, NULL, 17, 18, 0, '<i class=\"fa-solid fa-gear\"></i>', 'Settings', 'Update', 'recrud', 'System Configuration', '', 'Admin', 1, 1, 1, NULL, 0, 0, 0),
(7, NULL, 19, 20, 0, '<i class=\"fa-solid fa-users-viewfinder\"></i>', 'Users', 'Index', NULL, 'User Management', '', 'Admin', 1, 1, 1, NULL, 0, NULL, 0),
(8, NULL, 21, 22, 0, '<i class=\"fa-solid fa-bars\"></i>', 'Menus', 'Index', NULL, 'Menu Management', '', 'Admin', 1, 1, 1, NULL, 0, 0, 0),
(9, NULL, 23, 24, 0, '<i class=\"menu-icon fa-solid fa-list-check\"></i>', 'Todos', 'Index', NULL, 'Todo List', '', 'Admin', 1, 1, 1, NULL, 0, NULL, 0),
(10, NULL, 25, 26, 0, '<i class=\"fa-regular fa-message\"></i>', 'Contacts', 'Index', NULL, 'Contact', '', 'Admin', 1, 1, 1, NULL, 0, NULL, 0),
(11, NULL, 27, 28, 0, '<i class=\"menu-icon fa-solid fa-timeline\"></i>', 'AuditLogs', 'Index', NULL, 'Audit Trail', '', 'Admin', 1, 1, 1, NULL, 0, NULL, 0),
(12, NULL, 29, 30, 0, '<i class=\"menu-icon fa-regular fa-circle-question\"></i>', 'Faqs', 'Index', NULL, 'FAQs', '', 'Admin', 1, 1, 1, NULL, 0, 0, 0),
(13, 4, 10, 11, 1, '<i class=\"fa-solid fa-code\"></i>', '', '', NULL, 'Code The Pixel', 'https://codethepixel.com/', '', 0, 0, 1, NULL, 0, 0, 0),
(14, 4, 8, 9, 1, '<i class=\"fa-regular fa-file-code\"></i>', 'Pages', 'manual', NULL, 'User Manual', '', '', 0, 0, 1, NULL, 0, 0, 0),
(15, 4, 12, 13, 1, '<i class=\"fa-brands fa-github\"></i>', '', '', NULL, 'Re-CRUD Github', 'https://github.com/Asyraf-wa/recrud', '', 0, 0, 1, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ic` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `street_1` varchar(255) NOT NULL,
  `street_2` varchar(255) NOT NULL,
  `postcode` int NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `status` int DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `user_id`, `name`, `email`, `ic`, `phone`, `street_1`, `street_2`, `postcode`, `city`, `state`, `status`, `created`, `modified`) VALUES
(7, 5, 'NUR AULA ZULFA BINTI ZAMRI', 'aulazulfa2004@gmail.com', '000911058902', '01160786716', 'LOT 3760B, JALAN ISKANDAR', 'KAMPUNG BUKIT KAPAR', 42200, 'KLANG', 'Selangor', 1, '2026-01-27 20:07:29', '2026-01-28 14:17:44'),
(8, 6, 'Siti Nurhaliza Binti Ahmad', '2025121345@student.uitm.edu.my', '991019180092', '01198323452', 'A-2-9, Pangsapuri Indah', 'Bandar Kenangan', 38000, 'Cheras', 'Wilayah Persekutuan Kuala Lumpur', 1, '2026-01-27 20:32:30', '2026-01-27 20:32:30'),
(9, 7, 'Wan Hazrina Binti Wan Zahari', 'wanhazrinawanzahari@gmail.com', '040111101426', '01128145404', 'No.2, Rumah Biru', 'Jalan Buntal', 28000, 'Rawang', 'Selangor', 1, '2026-01-28 12:58:12', '2026-01-28 12:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `phinxlog`
--

CREATE TABLE `phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phinxlog`
--

INSERT INTO `phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20241029053753, 'Initial', '2026-01-05 08:17:17', '2026-01-05 08:17:17', 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` char(36) NOT NULL,
  `system_name` varchar(255) NOT NULL,
  `system_abbr` varchar(255) NOT NULL,
  `system_slogan` varchar(255) NOT NULL,
  `organization_name` varchar(255) NOT NULL,
  `domain_name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `notification_email` varchar(50) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_subject` varchar(255) NOT NULL,
  `meta_copyright` varchar(255) NOT NULL,
  `meta_desc` varchar(255) NOT NULL,
  `timezone` varchar(100) NOT NULL,
  `author` varchar(255) NOT NULL,
  `site_status` tinyint(1) NOT NULL,
  `user_reg` tinyint(1) NOT NULL,
  `config_2` tinyint(1) NOT NULL,
  `config_3` tinyint(1) NOT NULL,
  `version` varchar(255) NOT NULL,
  `private_key_from_recaptcha` varchar(255) DEFAULT NULL,
  `public_key_from_recaptcha` varchar(255) DEFAULT NULL,
  `banned_username` text,
  `telegram_bot_token` varchar(255) DEFAULT NULL,
  `telegram_chatid` varchar(255) DEFAULT NULL,
  `hcaptcha_sitekey` varchar(255) DEFAULT NULL,
  `hcaptcha_secretkey` varchar(255) DEFAULT NULL,
  `notification` text NOT NULL,
  `notification_status` tinyint(1) NOT NULL,
  `notification_date` date DEFAULT NULL,
  `ribbon_title` varchar(20) NOT NULL,
  `ribbon_link` varchar(255) NOT NULL,
  `ribbon_status` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `system_name`, `system_abbr`, `system_slogan`, `organization_name`, `domain_name`, `email`, `notification_email`, `meta_title`, `meta_keyword`, `meta_subject`, `meta_copyright`, `meta_desc`, `timezone`, `author`, `site_status`, `user_reg`, `config_2`, `config_3`, `version`, `private_key_from_recaptcha`, `public_key_from_recaptcha`, `banned_username`, `telegram_bot_token`, `telegram_chatid`, `hcaptcha_sitekey`, `hcaptcha_secretkey`, `notification`, `notification_status`, `notification_date`, `ribbon_title`, `ribbon_link`, `ribbon_status`, `created`, `modified`) VALUES
('recrud', 'Clinic Appointment', 'AWARIQNA', 'Kesihatan anda, tanggungjawab kami', 'MyClinic Sendirian', 'codethepixel.com', 'noreply@codethepixel.com', 'noreply@codethepixel.com', 'Clinic Awariqna Appointment Booking System ', 'clinic appointment, online booking, healthcare system', 'Clinic Awariqna Appointment Booking System ', 'Clinic Awariqna', 'An online clinic appointment booking system that allows patients to book appointments and administrators to manage doctors, schedules, and appointments efficiently.', 'Asia/Kuala_Lumpur', 'Re-CRUD', 0, 0, 0, 0, '1.1', '', '', NULL, '', '', '', '', '<p><strong>Server maintenance</strong> is scheduled to be executed on Jan 1, 2023, from 1.00 am to 4.00 am. An intermittent connection is expected during the server maintenance period.</p>', 0, '2022-11-07', 'Code The Pixel', 'https://codethepixel.com', 0, '2020-04-08 20:56:04', '2026-01-11 20:29:42');

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE `todos` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `urgency` varchar(255) NOT NULL COMMENT 'high, medium, low',
  `task` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `note` text NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending' COMMENT 'Pending, In Progress, Completed, Canceled',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`id`, `user_id`, `urgency`, `task`, `description`, `note`, `status`, `created`, `modified`) VALUES
('a02daac9-27e3-49ea-8090-927e60f9e255', '1', 'High', 'task 4 desc', '<p>task 4 desc</p>', '<p>task 4 desc</p>', 'In Progress', '2024-05-31 13:48:26', '2024-05-31 13:48:31'),
('a8618f9e-a3f7-4e7a-8a3f-05a5323cd5af', '1', 'High', 'task 1', '<p>task 1 desc</p>', '<p>task 1 desc</p>', 'Completed', '2024-05-31 13:45:22', '2024-05-31 13:45:40'),
('c892f026-c6f8-4353-82c2-75f49c0f5d6b', '1', 'Medium', 'Task 3 - Develop the To Do Task and render in Dashboard', '<p>task 3 desc</p>', '<p>task 3 desc</p>', 'Pending', '2024-05-31 13:48:06', '2024-05-31 13:48:06'),
('eda46e51-555a-4309-a28b-d0835bf4f4b2', '1', 'Low', 'task 2', '<p>task 2 desc</p>', '<p>task 2 desc</p>', 'Canceled', '2024-05-31 13:46:12', '2024-05-31 13:46:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `user_group_id` int DEFAULT '3',
  `fullname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `avatar_dir` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_created_at` datetime NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '0' COMMENT '	is_active',
  `is_email_verified` int NOT NULL DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `created_by` int DEFAULT NULL COMMENT 'user_id',
  `modified_by` int DEFAULT NULL COMMENT 'user_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_group_id`, `fullname`, `password`, `email`, `avatar`, `avatar_dir`, `token`, `token_created_at`, `status`, `is_email_verified`, `last_login`, `ip_address`, `slug`, `created`, `modified`, `created_by`, `modified_by`) VALUES
(1, 1, 'Administrator', '$2y$10$OrUKHzNQUic6dFqSuG9QBeDzMbbwPz1BQXKgBKPcQyMTNdv3Z22xe', 'admin@localhost.com', '', '', NULL, '2024-07-10 20:30:04', '1', 1, '2026-01-28 20:22:20', '::1', 'Administrator', '2022-10-26 02:54:19', '2024-07-08 21:08:15', NULL, NULL),
(5, 2, 'NUR AULA ZULFA BINTI ZAMRI', '', 'aulazulfa2004@gmail.com', NULL, NULL, NULL, '0000-00-00 00:00:00', '1', 0, '2026-01-12 16:59:23', '::1', 'NUR-AULA-ZULFA-BINTI-ZAMRI', '2026-01-12 14:30:40', '2026-01-12 14:30:40', NULL, NULL),
(6, 2, 'NUR AULA ZULFA ZAMRI', '', '2025121345@student.uitm.edu.my', NULL, NULL, NULL, '0000-00-00 00:00:00', '1', 0, NULL, NULL, 'NUR-AULA-ZULFA-ZAMRI', '2026-01-27 20:27:21', '2026-01-27 20:27:21', NULL, NULL),
(7, 2, 'hazrina zahari', '', 'wanhazrinawanzahari@gmail.com', NULL, NULL, NULL, '0000-00-00 00:00:00', '1', 0, NULL, NULL, 'hazrina-zahari', '2026-01-28 12:56:14', '2026-01-28 12:56:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `name`, `description`, `created`, `modified`) VALUES
(1, 'Admin', 'Admninistrator', '2021-01-23 13:21:29', '2021-01-23 13:21:29'),
(2, 'Mod', 'Moderator', '2021-01-23 13:21:29', '2021-01-23 13:21:29'),
(3, 'User', 'Normal User', '2021-01-23 13:21:29', '2021-01-23 13:21:29');

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `useragent` varchar(256) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_logs`
--

INSERT INTO `user_logs` (`id`, `user_id`, `action`, `useragent`, `os`, `ip`, `host`, `referrer`, `status`, `created`, `modified`) VALUES
(1, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-05 16:27:08', '2026-01-05 16:27:08'),
(2, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-06 13:59:19', '2026-01-06 13:59:19'),
(3, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-06 14:14:32', '2026-01-06 14:14:32'),
(4, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-07 17:19:37', '2026-01-07 17:19:37'),
(5, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/users/profile/Administrator', 1, '2026-01-07 17:57:29', '2026-01-07 17:57:29'),
(6, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-07 17:58:15', '2026-01-07 17:58:15'),
(7, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-08 10:13:52', '2026-01-08 10:13:52'),
(8, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/', 1, '2026-01-08 10:59:24', '2026-01-08 10:59:24'),
(9, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-08 13:26:43', '2026-01-08 13:26:43'),
(10, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-09 14:28:16', '2026-01-09 14:28:16'),
(11, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/users/profile/Administrator', 1, '2026-01-09 14:35:12', '2026-01-09 14:35:12'),
(12, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-09 15:31:40', '2026-01-09 15:31:40'),
(13, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-09 15:32:12', '2026-01-09 15:32:12'),
(14, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-09 15:33:17', '2026-01-09 15:33:17'),
(15, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-09 15:33:22', '2026-01-09 15:33:22'),
(16, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-09 15:33:33', '2026-01-09 15:33:33'),
(17, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-09 15:36:19', '2026-01-09 15:36:19'),
(18, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-09 16:50:58', '2026-01-09 16:50:58'),
(19, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-09 16:51:08', '2026-01-09 16:51:08'),
(20, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-09 17:15:59', '2026-01-09 17:15:59'),
(21, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/', 1, '2026-01-09 17:16:17', '2026-01-09 17:16:17'),
(22, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-09 17:17:17', '2026-01-09 17:17:17'),
(23, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-09 17:17:20', '2026-01-09 17:17:20'),
(24, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-09 17:17:22', '2026-01-09 17:17:22'),
(25, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-09 17:17:24', '2026-01-09 17:17:24'),
(26, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-09 17:17:28', '2026-01-09 17:17:28'),
(27, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-09 17:17:42', '2026-01-09 17:17:42'),
(28, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/appointments', 1, '2026-01-09 17:34:12', '2026-01-09 17:34:12'),
(29, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-09 17:36:03', '2026-01-09 17:36:03'),
(30, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-09 17:36:41', '2026-01-09 17:36:41'),
(31, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-10 08:23:40', '2026-01-10 08:23:40'),
(32, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-10 08:24:20', '2026-01-10 08:24:20'),
(33, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/slots', 1, '2026-01-10 08:41:04', '2026-01-10 08:41:04'),
(34, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-10 09:09:30', '2026-01-10 09:09:30'),
(35, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-10 09:09:43', '2026-01-10 09:09:43'),
(36, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-10 09:09:48', '2026-01-10 09:09:48'),
(37, 2, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-10 09:17:07', '2026-01-10 09:17:07'),
(38, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-10 09:24:12', '2026-01-10 09:24:12'),
(39, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-10 09:24:26', '2026-01-10 09:24:26'),
(40, 2, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-10 09:24:39', '2026-01-10 09:24:39'),
(41, 2, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/users/profile/NUR-AULA-ZULFA-BINTI-ZAMRI', 1, '2026-01-10 09:24:46', '2026-01-10 09:24:46'),
(42, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-10 09:25:00', '2026-01-10 09:25:00'),
(43, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/', 1, '2026-01-10 09:26:07', '2026-01-10 09:26:07'),
(44, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-10 09:28:13', '2026-01-10 09:28:13'),
(45, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-10 11:35:23', '2026-01-10 11:35:23'),
(46, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-10 11:39:16', '2026-01-10 11:39:16'),
(47, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/patients', 1, '2026-01-10 11:39:44', '2026-01-10 11:39:44'),
(48, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 12:17:40', '2026-01-11 12:17:40'),
(49, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 20:15:43', '2026-01-11 20:15:43'),
(50, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/slots', 1, '2026-01-11 20:34:39', '2026-01-11 20:34:39'),
(51, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 20:42:22', '2026-01-11 20:42:22'),
(52, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/admin/settings/update/recrud', 1, '2026-01-11 20:43:06', '2026-01-11 20:43:06'),
(53, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 20:47:35', '2026-01-11 20:47:35'),
(54, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-11 20:51:06', '2026-01-11 20:51:06'),
(55, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 21:22:43', '2026-01-11 21:22:43'),
(56, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 21:22:51', '2026-01-11 21:22:51'),
(57, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 21:22:53', '2026-01-11 21:22:53'),
(58, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-11 21:22:56', '2026-01-11 21:22:56'),
(59, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 22:14:09', '2026-01-11 22:14:09'),
(60, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:04:05', '2026-01-11 23:04:05'),
(61, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:04:18', '2026-01-11 23:04:18'),
(62, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:04:22', '2026-01-11 23:04:22'),
(63, NULL, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/doctors', 1, '2026-01-11 23:04:33', '2026-01-11 23:04:33'),
(64, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:07:39', '2026-01-11 23:07:39'),
(65, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:07:59', '2026-01-11 23:07:59'),
(66, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:08:00', '2026-01-11 23:08:00'),
(67, NULL, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/admin/settings/update/recrud', 1, '2026-01-11 23:08:05', '2026-01-11 23:08:05'),
(68, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:08:54', '2026-01-11 23:08:54'),
(69, NULL, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/admin/settings/update/recrud', 1, '2026-01-11 23:09:01', '2026-01-11 23:09:01'),
(70, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:11:21', '2026-01-11 23:11:21'),
(71, NULL, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/admin/settings/update/recrud', 1, '2026-01-11 23:11:25', '2026-01-11 23:11:25'),
(72, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:12:17', '2026-01-11 23:12:17'),
(73, NULL, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/admin/settings/update/recrud', 1, '2026-01-11 23:12:41', '2026-01-11 23:12:41'),
(74, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:33:31', '2026-01-11 23:33:31'),
(75, NULL, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/admin/settings/update/recrud', 1, '2026-01-11 23:33:34', '2026-01-11 23:33:34'),
(76, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:38:02', '2026-01-11 23:38:02'),
(77, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:38:07', '2026-01-11 23:38:07'),
(78, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:39:03', '2026-01-11 23:39:03'),
(79, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:42:30', '2026-01-11 23:42:30'),
(80, NULL, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/admin/settings/update/recrud', 1, '2026-01-11 23:42:34', '2026-01-11 23:42:34'),
(81, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:43:28', '2026-01-11 23:43:28'),
(82, NULL, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/admin/settings/update/recrud', 1, '2026-01-11 23:43:33', '2026-01-11 23:43:33'),
(83, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:43:46', '2026-01-11 23:43:46'),
(84, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-11 23:43:51', '2026-01-11 23:43:51'),
(85, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:43:57', '2026-01-11 23:43:57'),
(86, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:45:58', '2026-01-11 23:45:58'),
(87, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/', 1, '2026-01-11 23:46:03', '2026-01-11 23:46:03'),
(88, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:46:56', '2026-01-11 23:46:56'),
(89, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:47:05', '2026-01-11 23:47:05'),
(90, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:47:07', '2026-01-11 23:47:07'),
(91, NULL, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/doctors', 1, '2026-01-11 23:47:16', '2026-01-11 23:47:16'),
(92, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:47:25', '2026-01-11 23:47:25'),
(93, NULL, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/doctors', 1, '2026-01-11 23:47:30', '2026-01-11 23:47:30'),
(94, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-11 23:47:58', '2026-01-11 23:47:58'),
(95, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 11:18:44', '2026-01-12 11:18:44'),
(96, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 11:20:29', '2026-01-12 11:20:29'),
(97, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 11:20:52', '2026-01-12 11:20:52'),
(98, NULL, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/doctors', 1, '2026-01-12 11:21:24', '2026-01-12 11:21:24'),
(99, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 11:22:03', '2026-01-12 11:22:03'),
(100, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-12 11:22:18', '2026-01-12 11:22:18'),
(101, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 11:22:27', '2026-01-12 11:22:27'),
(102, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 11:22:29', '2026-01-12 11:22:29'),
(103, NULL, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/appointments', 1, '2026-01-12 11:22:34', '2026-01-12 11:22:34'),
(104, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 11:22:47', '2026-01-12 11:22:47'),
(105, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 11:23:20', '2026-01-12 11:23:20'),
(106, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 11:23:24', '2026-01-12 11:23:24'),
(107, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 11:23:28', '2026-01-12 11:23:28'),
(108, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/patients', 1, '2026-01-12 11:38:56', '2026-01-12 11:38:56'),
(109, NULL, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 11:39:05', '2026-01-12 11:39:05'),
(110, NULL, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/patients', 1, '2026-01-12 11:39:09', '2026-01-12 11:39:09'),
(111, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 11:39:20', '2026-01-12 11:39:20'),
(112, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-12 11:50:17', '2026-01-12 11:50:17'),
(113, 3, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-12 11:51:35', '2026-01-12 11:51:35'),
(114, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 11:52:03', '2026-01-12 11:52:03'),
(115, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-12 11:54:23', '2026-01-12 11:54:23'),
(116, 4, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-12 11:55:13', '2026-01-12 11:55:13'),
(117, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 11:55:29', '2026-01-12 11:55:29'),
(118, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 11:57:29', '2026-01-12 11:57:29'),
(119, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-12 11:58:05', '2026-01-12 11:58:05'),
(120, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 12:40:49', '2026-01-12 12:40:49'),
(121, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/', 1, '2026-01-12 12:46:27', '2026-01-12 12:46:27'),
(122, 4, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-12 12:47:26', '2026-01-12 12:47:26'),
(123, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 12:47:49', '2026-01-12 12:47:49'),
(124, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/admin/users', 1, '2026-01-12 12:48:00', '2026-01-12 12:48:00'),
(125, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 14:27:46', '2026-01-12 14:27:46'),
(126, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-12 14:30:28', '2026-01-12 14:30:28'),
(127, 5, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-12 14:33:04', '2026-01-12 14:33:04'),
(128, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 15:01:47', '2026-01-12 15:01:47'),
(129, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-12 15:04:03', '2026-01-12 15:04:03'),
(130, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 15:06:04', '2026-01-12 15:06:04'),
(131, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/users/profile/Administrator', 1, '2026-01-12 15:30:16', '2026-01-12 15:30:16'),
(132, 5, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-12 15:30:47', '2026-01-12 15:30:47'),
(133, 5, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/patients', 1, '2026-01-12 16:07:50', '2026-01-12 16:07:50'),
(134, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 16:08:03', '2026-01-12 16:08:03'),
(135, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-12 16:11:59', '2026-01-12 16:11:59'),
(136, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 16:12:15', '2026-01-12 16:12:15'),
(137, 1, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/patients', 1, '2026-01-12 16:50:36', '2026-01-12 16:50:36'),
(138, 5, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-12 16:50:58', '2026-01-12 16:50:58'),
(139, 5, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 16:59:23', '2026-01-12 16:59:23'),
(140, 5, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-12 16:59:30', '2026-01-12 16:59:30'),
(141, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-12 17:07:53', '2026-01-12 17:07:53'),
(142, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-21 10:54:46', '2026-01-21 10:54:46'),
(143, 5, 'Logout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', 'http://localhost/klinik/dashboard', 1, '2026-01-25 13:20:18', '2026-01-25 13:20:18'),
(144, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-25 13:24:41', '2026-01-25 13:24:41'),
(145, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-25 23:15:46', '2026-01-25 23:15:46'),
(146, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-26 11:49:17', '2026-01-26 11:49:17'),
(147, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-26 13:00:34', '2026-01-26 13:00:34'),
(148, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-27 12:18:14', '2026-01-27 12:18:14'),
(149, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-27 19:31:12', '2026-01-27 19:31:12'),
(150, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-27 19:51:48', '2026-01-27 19:51:48'),
(151, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-27 19:52:25', '2026-01-27 19:52:25'),
(152, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-27 20:06:51', '2026-01-27 20:06:51'),
(153, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-27 20:10:08', '2026-01-27 20:10:08'),
(154, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-27 20:27:00', '2026-01-27 20:27:00'),
(155, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-28 12:26:22', '2026-01-28 12:26:22'),
(156, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-28 13:00:03', '2026-01-28 13:00:03'),
(157, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-28 20:21:21', '2026-01-28 20:21:21'),
(158, 1, 'Login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'build 19045 (Windows 10)', '::1', 'DESKTOP-4O24AAB', NULL, 1, '2026-01-28 20:22:20', '2026-01-28 20:22:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction` (`transaction`),
  ADD KEY `type` (`type`),
  ADD KEY `primary_key` (`primary_key`),
  ADD KEY `source` (`source`),
  ADD KEY `parent_source` (`parent_source`),
  ADD KEY `created` (`created`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lft` (`lft`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `phinxlog`
--
ALTER TABLE `phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
