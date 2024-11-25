-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2024 a las 08:24:45
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Education', 'Resources and discussions about learning.'),
(2, 'Development', 'Everything related to software development.'),
(3, 'Gaming', 'Topics about gaming and game creation.'),
(4, 'Technology', 'All about the latest tech innovations.'),
(5, 'General', 'General discussions.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subredditcategories`
--

CREATE TABLE `subredditcategories` (
  `id` int(11) NOT NULL,
  `subreddit_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subredditcategories`
--

INSERT INTO `subredditcategories` (`id`, `subreddit_id`, `category_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subreddits`
--

CREATE TABLE `subreddits` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `icon_img` varchar(255) DEFAULT NULL,
  `subscribers` int(11) DEFAULT NULL,
  `created_utc` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subreddits`
--

INSERT INTO `subreddits` (`id`, `name`, `title`, `description`, `url`, `icon_img`, `subscribers`, `created_utc`) VALUES
(1, 'learnprogramming', 'Learn Programming', 'A community for learning programming.', '/r/learnprogramming', 'https://example.com/icon1.png', 1500000, '2019-12-31 23:00:00'),
(2, 'webdev', 'Web Development', 'For all things web development.', '/r/webdev', 'https://example.com/icon2.png', 800000, '2018-06-15 10:30:00'),
(3, 'gamedev', 'Game Development', 'Discussions about game development.', '/r/gamedev', 'https://example.com/icon3.png', 400000, '2019-03-20 07:45:00'),
(4, 'technology', 'Technology', 'The latest in tech news and discussions.', '/r/technology', 'https://example.com/icon4.png', 2500000, '2015-11-10 13:00:00'),
(5, 'programming', 'Programming', 'Discussions about programming topics.', '/r/programming', 'https://example.com/icon5.png', 1800000, '2017-07-25 14:20:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `topics`
--

CREATE TABLE `topics` (
  `id` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `topics`
--

INSERT INTO `topics` (`id`, `title`, `display_name`, `url`) VALUES
('121h8r', 'PeterExplainsTheJoke', 'PeterExplainsTheJoke', '/r/PeterExplainsTheJoke/'),
('12967t', 'Baldur\'s Gate 3', 'BaldursGate3', '/r/BaldursGate3/'),
('2cneq', 'Politics', 'politics', '/r/politics/'),
('2qh03', 'r/gaming', 'gaming', '/r/gaming/'),
('2qh0u', 'Reddit Pics', 'pics', '/r/pics/'),
('2qh13', 'World News', 'worldnews', '/r/worldnews/'),
('2qh1i', 'Ask Reddit...', 'AskReddit', '/r/AskReddit/'),
('2qh33', 'funny', 'funny', '/r/funny/'),
('2qh3l', 'News', 'news', '/r/news/'),
('2qh3s', 'Movie News and Discussion', 'movies', '/r/movies/'),
('2qhsa', 'Interesting As Fuck', 'interestingasfuck', '/r/interestingasfuck/'),
('2qmox', 'Piracy: ꜱᴀɪʟ ᴛʜᴇ ʜɪɢʜ ꜱᴇᴀꜱ', 'Piracy', '/r/Piracy/'),
('2qs0k', 'Home', 'Home', '/r/Home/'),
('2r5rp', 'now double verified', 'facepalm', '/r/facepalm/'),
('2rfxx', 'Leaguein Park', 'leagueoflegends', '/r/leagueoflegends/'),
('2sgp1', 'PC Master Race - PCMR: A place where all enthusiasts of PC, PC gaming and PC technology are welcome!', 'pcmasterrace', '/r/pcmasterrace/'),
('2ubgg', 'jukmifgguggh', 'mildlyinfuriating', '/r/mildlyinfuriating/'),
('2w67q', 'Unexpected', 'Unexpected', '/r/Unexpected/'),
('2w844', 'No such thing as stupid questions', 'NoStupidQuestions', '/r/NoStupidQuestions/'),
('2xhvq', 'Am I the Asshole? ', 'AmItheAsshole', '/r/AmItheAsshole/'),
('2xxyj', 'Damn, that\'s interesting!', 'Damnthatsinteresting', '/r/Damnthatsinteresting/'),
('2ya0t', 'Helldivers', 'Helldivers', '/r/Helldivers/'),
('38jf0', 'r/LivestreamFail', 'LivestreamFail', '/r/LivestreamFail/'),
('446kys', 'AITAH', 'AITAH', '/r/AITAH/'),
('4jn9v4', 'Palworld', 'Palworld', '/r/Palworld/');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subredditcategories`
--
ALTER TABLE `subredditcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subreddit_id` (`subreddit_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `subreddits`
--
ALTER TABLE `subreddits`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `subredditcategories`
--
ALTER TABLE `subredditcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `subreddits`
--
ALTER TABLE `subreddits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `subredditcategories`
--
ALTER TABLE `subredditcategories`
  ADD CONSTRAINT `subredditcategories_ibfk_1` FOREIGN KEY (`subreddit_id`) REFERENCES `subreddits` (`id`),
  ADD CONSTRAINT `subredditcategories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
