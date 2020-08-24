-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 24, 2020 at 03:17 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `LibraryAppSchool`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id_author` int(14) NOT NULL,
  `name_author` varchar(30) NOT NULL,
  `profile_author` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id_author`, `name_author`, `profile_author`, `created_at`, `updated_at`) VALUES
(1, 'M Ismoyo Setyonowidagdo', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2020-06-09 13:48:20', '2020-06-09 13:48:20'),
(2, 'Mashasi Kisimoto', 'Welcome to the Harry Potter At Home hub where you’ll find all the latest magical treats to keep you occupied - including special contributions from Bloomsbury and Scholastic, nifty magical craft videos (teach your friends how to draw a Niffler!), fun articles, quizzes, puzzles and plenty more for first-time readers, as well as those already familiar with the wizarding world. We’re casting a Banishing Charm on boredom!', '2020-06-10 00:19:32', '2020-06-10 00:19:32'),
(4, 'Jesicca Milla', 'One of the problems we outlined in the Motivation for Hooks is that class lifecycle methods often contain unrelated logic, but related logic gets broken up into several methods. Here is a component that combines the counter and the friend status indicator logic from the previous examples:', '2020-07-05 10:59:01', '2020-07-05 10:59:01'),
(13, 'Raditiya dika', 'Welcome to the Harry Potter At Home hub where you’ll find all the latest magical treats to keep you occupied - including special contributions from Bloomsbury and Scholastic, nifty magical craft videos (teach your friends how to draw a Niffler!), fun articles, quizzes, puzzles and plenty more for first-time readers, as well as those already familiar with the wizarding world. We’re casting a Banishing Charm on boredom!', '2020-07-08 05:04:04', '2020-07-08 05:04:04'),
(15, 'setya', 'setya', '2020-07-09 08:25:12', '2020-07-09 08:25:12'),
(16, 'Ismoyo Setya', 'coba author', '2020-07-28 04:44:28', '2020-07-28 04:44:28');

-- --------------------------------------------------------

--
-- Table structure for table `book_detail`
--

CREATE TABLE `book_detail` (
  `id` int(15) NOT NULL,
  `title` varchar(100) NOT NULL,
  `rak` int(14) NOT NULL,
  `discription` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `stok` int(15) NOT NULL,
  `id_genre` int(130) NOT NULL,
  `id_author` int(130) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_detail`
--

INSERT INTO `book_detail` (`id`, `title`, `rak`, `discription`, `image`, `stok`, `id_genre`, `id_author`, `created_at`, `updated_at`) VALUES
(64, 'Kimia', 0, 'One of the problems we outlined in the Motivation for Hooks is that class lifecycle methods often contain unrelated logic, but related logic gets broken up into several methods. Here is a component that combines the counter and the friend status indicator logic from the previous examples:', 'src/upload/kartun kimia.jpg', 120, 11, 2, '2020-07-05 10:44:17', '2020-07-05 10:44:17'),
(66, 'Bone Sakar', 0, 'One of the problems we outlined in the Motivation for Hooks is that class lifecycle methods often contain unrelated logic, but related logic gets broken up into several methods. Here is a component that combines the counter and the friend status indicator logic from the previous examples:', 'src/upload/Bonesheker', 120, 4, 2, '2020-07-05 10:52:16', '2020-07-05 10:52:16'),
(69, 'Kimetsuno Yaiba', 0, 'One of the problems we outlined in the Motivation for Hooks is that class lifecycle methods often contain unrelated logic, but related logic gets broken up into several methods. Here is a component that combines the counter and the friend status indicator logic from the previous examples:', 'src/upload/kimetsuno yaiba.jpg', 87, 6, 5, '2020-07-05 11:00:23', '2020-07-05 11:00:23'),
(70, 'Komi Suit', 0, 'One of the problems we outlined in the Motivation for Hooks is that class lifecycle methods often contain unrelated logic, but related logic gets broken up into several methods. Here is a component that combines the counter and the friend status indicator logic from the previous examples:', 'src/upload/komi sulit komunikasi.jpg', 21, 2, 6, '2020-07-05 11:01:39', '2020-07-05 11:01:39'),
(79, 'The Power', 0, 'Description is the pattern of narrative development that aims to make vivid a place, object, character, or group. Description is one of four rhetorical modes, along with exposition, argumentation, and narration. In practice it would be difficult to write literature that drew on just one of the four basic modes.', 'src/upload/the power.jpg', 100, 9, 2, '2020-07-10 05:46:55', '2020-07-10 05:46:55'),
(80, 'Kimia Cartoon', 0, 'Description is the pattern of narrative development that aims to make vivid a place, object, character, or group. Description is one of four rhetorical modes, along with exposition, argumentation, and narration. In practice it would be difficult to write literature that drew on just one of the four basic modes.', 'src/upload/kartun kimia.jpg', 120, 2, 13, '2020-07-10 05:47:21', '2020-07-10 05:47:21'),
(81, 'INESTABLE', 0, 'Description is the pattern of narrative development that aims to make vivid a place, object, character, or group. Description is one of four rhetorical modes, along with exposition, argumentation, and narration. In practice it would be difficult to write literature that drew on just one of the four basic modes.', 'src/upload/inestable.jpg', 99, 10, 2, '2020-07-10 05:48:08', '2020-07-10 05:48:08'),
(82, 'Boneshaker', 0, 'Description is the pattern of narrative development that aims to make vivid a place, object, character, or group. Description is one of four rhetorical modes, along with exposition, argumentation, and narration. In practice it would be difficult to write literature that drew on just one of the four basic modes.', 'src/upload/Bonesheker', 88, 8, 1, '2020-07-10 05:48:36', '2020-07-10 05:48:36'),
(84, 'Kmetsuno Yaiba', 0, 'Description is the pattern of narrative development that aims to make vivid a place, object, character, or group. Description is one of four rhetorical modes, along with exposition, argumentation, and narration. In practice it would be difficult to write literature that drew on just one of the four basic modes.', 'src/upload/kimetsuno yaiba.jpg', 12, 6, 4, '2020-07-10 05:50:25', '2020-07-10 05:50:25'),
(85, 'Kidancy', 0, 'Description is the pattern of narrative development that aims to make vivid a place, object, character, or group. Description is one of four rhetorical modes, along with exposition, argumentation, and narration. In practice it would be difficult to write literature that drew on just one of the four basic modes.', 'src/upload/Kinaci.jpg', 99, 9, 13, '2020-07-10 05:51:18', '2020-07-10 05:51:18'),
(86, 'The Royal', 0, 'Description is the pattern of narrative development that aims to make vivid a place, object, character, or group. Description is one of four rhetorical modes, along with exposition, argumentation, and narration. In practice it would be difficult to write literature that drew on just one of the four basic modes.', 'src/upload/The Royal .jpg', 100, 2, 1, '2020-07-10 05:56:59', '2020-07-10 05:56:59'),
(87, 'Paint', 0, 'Description is the pattern of narrative development that aims to make vivid a place, object, character, or group. Description is one of four rhetorical modes, along with exposition, argumentation, and narration. In practice it would be difficult to write literature that drew on just one of the four basic modes.', 'src/upload/Paint.jpg', 123, 10, 4, '2020-07-10 05:59:26', '2020-07-10 05:59:26'),
(88, 'Kotak Hitam', 0, 'Description is the pattern of narrative development that aims to make vivid a place, object, character, or group. Description is one of four rhetorical modes, along with exposition, argumentation, and narration. In practice it would be difficult to write literature that drew on just one of the four basic modes.', 'src/upload/Kotak Hitam.jpg', 19, 6, 4, '2020-07-10 06:02:17', '2020-07-10 06:02:17'),
(89, 'Flawed', 0, 'Description is the pattern of narrative development that aims to make vivid a place, object, character, or group. Description is one of four rhetorical modes, along with exposition, argumentation, and narration. In practice it would be difficult to write literature that drew on just one of the four basic modes.', 'src/upload/Flawed.jpg', 129, 2, 1, '2020-07-10 06:05:21', '2020-07-10 06:05:21'),
(90, 'Perfect', 0, 'Description is the pattern of narrative development that aims to make vivid a place, object, character, or group. Description is one of four rhetorical modes, along with exposition, argumentation, and narration. In practice it would be difficult to write literature that drew on just one of the four basic modes.', 'src/upload/Perfect.jpg', 100, 8, 1, '2020-07-10 06:06:16', '2020-07-10 06:06:16'),
(91, 'Komi Suit', 0, 'Description is the pattern of narrative development that aims to make vivid a place, object, character, or group. Description is one of four rhetorical modes, along with exposition, argumentation, and narration. In practice it would be difficult to write literature that drew on just one of the four basic modes.', 'src/upload/komi sulit komunikasi.jpg', 100, 6, 4, '2020-07-10 06:09:20', '2020-07-10 06:09:20');

-- --------------------------------------------------------

--
-- Table structure for table `borrower`
--

CREATE TABLE `borrower` (
  `id_borrower` int(11) NOT NULL,
  `id_book` int(20) NOT NULL,
  `id_user` int(13) NOT NULL,
  `count` int(15) NOT NULL,
  `status` varchar(14) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `borrower`
--
DELIMITER $$
CREATE TRIGGER `book_stok_delete` AFTER DELETE ON `borrower` FOR EACH ROW BEGIN
 UPDATE book_detail
 SET stok = stok + OLD.count
 WHERE
 id = OLD.id_book;
 END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `book_stok_update` AFTER UPDATE ON `borrower` FOR EACH ROW BEGIN
	UPDATE book_detail SET stok = 	stok+NEW.count WHERE id=new.id_book;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `books_stok_insert` AFTER INSERT ON `borrower` FOR EACH ROW BEGIN
	UPDATE book_detail SET stok = 	stok-NEW.count WHERE id=new.id_book;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id_genre` int(15) NOT NULL,
  `name_genre` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id_genre`, `name_genre`, `created_at`, `updated_at`) VALUES
(2, 'Romance', '2020-06-09 13:19:43', '2020-06-09 13:19:43'),
(6, 'Horror', '2020-06-11 07:24:13', '2020-06-11 07:24:13'),
(8, 'Comedy', '2020-07-05 08:50:35', '2020-07-05 08:50:35'),
(9, 'Crime & Gangsters', '2020-07-05 08:50:35', '2020-07-05 08:50:35'),
(10, 'Crisis', '2020-07-05 08:50:35', '2020-07-05 08:50:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(50) NOT NULL,
  `nik` int(80) NOT NULL,
  `name_user` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(70) NOT NULL,
  `address` varchar(40) NOT NULL,
  `role` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nik`, `name_user`, `email`, `password`, `address`, `role`, `created_at`, `updated_at`) VALUES
(4, 123443, 'M Ismoyo Setyonowidagdo', 'ismoyorplb@gmail.com', 'sha1$98bc66f4$1$175decc146d3d04c8223df4239522c976ba5c841', 'soho', 1, '2020-06-12 06:12:37', '2020-06-12 06:12:37'),
(5, 0, 'ismoyo user', 'ismoyorplb@gmail.com', 'sha1$cefc9575$1$e40b4fd4c311ef63ca06bb3dc2e451762abb6112', 'soho', 0, '2020-06-14 04:46:38', '2020-06-14 04:46:38'),
(24, 0, 'user', 'user@gmail.com', 'sha1$1d11fb18$1$084df8020f4cc4883715656aee903f6eed4965be', 'user', 0, '2020-07-12 05:00:47', '2020-07-12 05:00:47'),
(30, 0, 'ahmad', 'admad@gmail.com', 'sha1$0795f6b6$1$adef09218a3de06e65433e81afe83ea6988132a9', 'Soho', 0, '2020-07-23 06:40:04', '2020-07-23 06:40:04'),
(34, 0, 'user', 'user1@gmail.com', 'sha1$a479da62$1$254909dd3e93e355152ae3544c2d19b0d3c18553', 'linux', 0, '2020-08-12 10:11:20', '2020-08-12 10:11:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id_author`);

--
-- Indexes for table `book_detail`
--
ALTER TABLE `book_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_genre` (`id_genre`),
  ADD KEY `id_author` (`id_author`);

--
-- Indexes for table `borrower`
--
ALTER TABLE `borrower`
  ADD PRIMARY KEY (`id_borrower`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id_genre`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id_author` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `book_detail`
--
ALTER TABLE `book_detail`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `borrower`
--
ALTER TABLE `borrower`
  MODIFY `id_borrower` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id_genre` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
