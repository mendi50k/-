-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: מרץ 01, 2025 בזמן 09:12 PM
-- גרסת שרת: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dog_tracking`
--

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'worker'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- הוצאת מידע עבור טבלה `employees`
--

INSERT INTO `employees` (`id`, `username`, `password`, `role`) VALUES
(1, 'worker1', '$2a$10$exampleHashedPasswordHere', 'admin'),
(3, 'worker3', '$2a$10$nGlDKOh2/0SgfqYv4ty.H.ei6xjouej3UQEkIOR/TJ6FLFOEFn57y', 'worker'),
(4, 'worker2', '$2a$10$nGlDKOh2/0SgfqYv4ty.H.ei6xjouej3UQEkIOR/TJ6FLFOEFn57y', 'worker');

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image` longblob DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `status` enum('לא טופל','בטיפול','טופל') DEFAULT 'לא טופל'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- הוצאת מידע עבור טבלה `reports`
--

INSERT INTO `reports` (`id`, `user_id`, `image`, `description`, `location`, `status`) VALUES
(51, NULL, 0x696d6167652d313734303835393834323830382e706e67, 'כלב נראה מסוכן', 'באזור אדר חיפה', 'לא טופל'),
(52, NULL, NULL, 'לא הצלחתי לצלם הכלב נראה לא מסוכן והיה לו קולר', 'באזור התעשיה בקריית אתא ', 'לא טופל');

--
-- Indexes for dumped tables
--

--
-- אינדקסים לטבלה `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- אינדקסים לטבלה `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- הגבלות לטבלאות שהוצאו
--

--
-- הגבלות לטבלה `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
