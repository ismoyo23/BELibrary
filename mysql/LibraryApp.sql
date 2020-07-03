-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 03, 2020 at 03:40 PM
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
-- Database: `LibraryApp`
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
(2, 'Mashasi Kisimoto', 'Naruto story writer', '2020-06-10 00:19:32', '2020-06-10 00:19:32');

-- --------------------------------------------------------

--
-- Table structure for table `book_detail`
--

CREATE TABLE `book_detail` (
  `id` int(15) NOT NULL,
  `title` varchar(100) NOT NULL,
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

INSERT INTO `book_detail` (`id`, `title`, `discription`, `image`, `stok`, `id_genre`, `id_author`, `created_at`, `updated_at`) VALUES
(56, 'title', 'ismoyo', 'src/upload/Screenshot from 2020-07-02 08-49-21.png', 100, 4, 2, '2020-07-02 12:55:57', '2020-07-02 12:55:57');

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
-- Dumping data for table `borrower`
--

INSERT INTO `borrower` (`id_borrower`, `id_book`, `id_user`, `count`, `status`, `create_at`, `updated_at`) VALUES
(26, 41, 20, 3, 'borrower', '2020-07-02 09:38:33', '2020-07-02 09:38:33');

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
(4, 'Horor', '2020-06-11 07:08:38', '2020-06-11 07:08:38'),
(6, 'romance', '2020-06-11 07:24:13', '2020-06-11 07:24:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(50) NOT NULL,
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

INSERT INTO `users` (`id_user`, `name_user`, `email`, `password`, `address`, `role`, `created_at`, `updated_at`) VALUES
(4, 'M Ismoyo Setyonowidagdo', 'ismoyorplb@gmail.com', 'sha1$98bc66f4$1$175decc146d3d04c8223df4239522c976ba5c841', 'soho', 1, '2020-06-12 06:12:37', '2020-06-12 06:12:37'),
(5, 'ismoyo user', 'ismoyorplb@gmail.com', 'sha1$cefc9575$1$e40b4fd4c311ef63ca06bb3dc2e451762abb6112', 'soho', 0, '2020-06-14 04:46:38', '2020-06-14 04:46:38'),
(6, 'petugas', 'petugas@gmail.com', 'sha1$0ba1a5bc$1$d519c4f957f51ca42b827cbce1e323a6b3add6f6', 'soho', 1, '2020-06-18 06:33:52', '2020-06-18 06:33:52'),
(18, 'user', 'user@gmail.com', 'sha1$bf9a9b42$1$8b1a2a7adb95dba7d188462e8979c4bacdc66fab', 'user', 0, '2020-07-01 14:34:35', '2020-07-01 14:34:35'),
(20, 'ismoyo', 'ismoyo@gmail.com', 'sha1$89a4c4e8$1$2295ef1de8f412ce1faf80b7966c78b48f33d089', 'soho', 0, '2020-07-02 03:59:05', '2020-07-02 03:59:05'),
(21, 'user2', 'user@gmail.com', 'sha1$8b7d75c6$1$da3599f5b65b90988ab07cb32f63be49dca40574', 'user', 0, '2020-07-02 09:39:43', '2020-07-02 09:39:43');

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
  MODIFY `id_author` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `book_detail`
--
ALTER TABLE `book_detail`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `borrower`
--
ALTER TABLE `borrower`
  MODIFY `id_borrower` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id_genre` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
