-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2016 at 01:22 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `brainyquots`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE IF NOT EXISTS `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nationality` int(11) NOT NULL,
  `born` date NOT NULL,
  `died` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `profession` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nationality` (`nationality`),
  KEY `profession` (`profession`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nationality`
--

CREATE TABLE IF NOT EXISTS `nationality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `profession`
--

CREATE TABLE IF NOT EXISTS `profession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `profession`
--

INSERT INTO `profession` (`id`, `name`, `slug`) VALUES
(1, 'Activist', 'activist'),
(2, 'Actor', 'actor'),
(3, 'Actress', 'actress'),
(4, 'Architect', 'architect'),
(5, 'Artist', 'artist'),
(6, 'Astronaut', 'astronaut'),
(7, 'Athlete', 'athlete'),
(8, 'Author', 'author'),
(9, 'Aviator', 'aviator'),
(10, 'Businessman', 'businessman'),
(11, 'Businesswoman', 'businesswoman'),
(12, 'Cartoonist', 'cartoonist'),
(13, 'Celebrity', 'celebrity'),
(14, 'Chef', 'chef'),
(15, 'Clergyman', 'clergyman'),
(16, 'Coach', 'coach'),
(17, 'Comedian', 'comedian'),
(18, 'Composer', 'composer'),
(19, 'Criminal', 'criminal'),
(20, 'Critic', 'critic'),
(21, 'Dancer', 'dancer'),
(22, 'Designer', 'designer'),
(23, 'Diplomat', 'diplomat'),
(24, 'Director', 'director'),
(25, 'Dramatist', 'dramatist'),
(26, 'Driver', 'driver'),
(27, 'Economist', 'economist'),
(28, 'Editor', 'editor'),
(29, 'Educator', 'educator'),
(30, 'Entertainer', 'entertainer'),
(31, 'Environmentalist', 'environmentalist'),
(32, 'Explorer', 'explorer'),
(33, 'First Lady', 'first_lady'),
(34, 'Historian', 'historian'),
(35, 'Inventor', 'inventor'),
(36, 'Journalist', 'journalist'),
(37, 'Judge', 'judge'),
(38, 'Lawyer', 'lawyer'),
(39, 'Leader', 'leader'),
(40, 'Mathematician', 'mathematician'),
(41, 'Model', 'model'),
(42, 'Musician', 'musician'),
(43, 'Novelist', 'novelist'),
(44, 'Philosopher', 'philosopher'),
(45, 'Photographer', 'photographer'),
(46, 'Physicist', 'physicist'),
(47, 'Playwright', 'playwright'),
(48, 'Poet', 'poet'),
(49, 'Politician', 'politician'),
(50, 'President', 'president'),
(51, 'Producer', 'producer'),
(52, 'Psychologist', 'psychologist'),
(53, 'Public Servant', 'public_servant'),
(54, 'Publisher', 'publisher'),
(55, 'Revolutionary', 'revolutionary'),
(56, 'Royalty', 'royalty'),
(57, 'Saint', 'saint'),
(58, 'Scientist', 'scientist'),
(59, 'Sculptor', 'sculptor'),
(60, 'Sociologist', 'sociologist'),
(61, 'Soldier', 'soldier'),
(62, 'Statesman', 'statesman'),
(63, 'Theologian', 'theologian'),
(64, 'Vice President', 'vice_president'),
(65, 'Writer', 'writer');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE IF NOT EXISTS `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this is topics. Just like as category.' AUTO_INCREMENT=243 ;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `slug`) VALUES
(122, 'Age', 'age'),
(123, 'Alone', 'alone'),
(124, 'Amazing', 'amazing'),
(125, 'Anger', 'anger'),
(126, 'Anniversary', 'anniversary'),
(127, 'Architecture', 'architecture'),
(128, 'Art', 'art'),
(129, 'Attitude', 'attitude'),
(130, 'Beauty', 'beauty'),
(131, 'Best', 'best'),
(132, 'Birthday', 'birthday'),
(133, 'Brainy', 'brainy'),
(134, 'Business', 'business'),
(135, 'Car', 'car'),
(136, 'Chance', 'chance'),
(137, 'Change', 'change'),
(138, 'Christmas', 'christmas'),
(139, 'Communication', 'communication'),
(140, 'Computers', 'computers'),
(141, 'Cool', 'cool'),
(142, 'Courage', 'courage'),
(143, 'Dad', 'dad'),
(144, 'Dating', 'dating'),
(145, 'Death', 'death'),
(146, 'Design', 'design'),
(147, 'Diet', 'diet'),
(148, 'Dreams', 'dreams'),
(149, 'Easter', 'easter'),
(150, 'Education', 'education'),
(151, 'Environmental', 'environmental'),
(152, 'Equality', 'equality'),
(153, 'Experience', 'experience'),
(154, 'Failure', 'failure'),
(155, 'Faith', 'faith'),
(156, 'Family', 'family'),
(157, 'Famous', 'famous'),
(158, 'Father''s Day', 'fathers_day'),
(159, 'Fear', 'fear'),
(160, 'Finance', 'finance'),
(161, 'Fitness', 'fitness'),
(162, 'Food', 'food'),
(163, 'Forgiveness', 'forgiveness'),
(164, 'Freedom', 'freedom'),
(165, 'Friendship', 'friendship'),
(166, 'Funny', 'funny'),
(167, 'Future', 'future'),
(168, 'Gardening', 'gardening'),
(169, 'God', 'god'),
(170, 'Good', 'good'),
(171, 'Government', 'government'),
(172, 'Graduation', 'graduation'),
(173, 'Great', 'great'),
(174, 'Happiness', 'happiness'),
(175, 'Health', 'health'),
(176, 'History', 'history'),
(177, 'Home', 'home'),
(178, 'Hope', 'hope'),
(179, 'Humor', 'humor'),
(180, 'Imagination', 'imagination'),
(181, 'Independence', 'independence'),
(182, 'Inspirational', 'inspirational'),
(183, 'Intelligence', 'intelligence'),
(184, 'Jealousy', 'jealousy'),
(185, 'Knowledge', 'knowledge'),
(186, 'Leadership', 'leadership'),
(187, 'Learning', 'learning'),
(188, 'Legal', 'legal'),
(189, 'Life', 'life'),
(190, 'Love', 'love'),
(191, 'Marriage', 'marriage'),
(192, 'Medical', 'medical'),
(193, 'Memorial Day', 'memorial_day'),
(194, 'Men', 'men'),
(195, 'Mom', 'mom'),
(196, 'Money', 'money'),
(197, 'Morning', 'morning'),
(198, 'Mother''s Day', 'mothers_day'),
(199, 'Motivational', 'motivational'),
(200, 'Movies', 'movies'),
(201, 'Moving On', 'moving_on'),
(202, 'Music', 'music'),
(203, 'Nature', 'nature'),
(204, 'New Year''s', 'new_years'),
(205, 'Parenting', 'parenting'),
(206, 'Patience', 'patience'),
(207, 'Patriotism', 'patriotism'),
(208, 'Peace', 'peace'),
(209, 'Pet', 'pet'),
(210, 'Poetry', 'poetry'),
(211, 'Politics', 'politics'),
(212, 'Positive', 'positive'),
(213, 'Power', 'power'),
(214, 'Relationship', 'relationship'),
(215, 'Religion', 'religion'),
(216, 'Respect', 'respect'),
(217, 'Romantic', 'romantic'),
(218, 'Sad', 'sad'),
(219, 'Saint Patrick''s Day', 'saint_patricks_day'),
(220, 'Science', 'science'),
(221, 'Smile', 'smile'),
(222, 'Society', 'society'),
(223, 'Sports', 'sports'),
(224, 'Strength', 'strength'),
(225, 'Success', 'success'),
(226, 'Sympathy', 'sympathy'),
(227, 'Teacher', 'teacher'),
(228, 'Technology', 'technology'),
(229, 'Teen', 'teen'),
(230, 'Thankful', 'thankful'),
(231, 'Thanksgiving', 'thanksgiving'),
(232, 'Time', 'time'),
(233, 'Travel', 'travel'),
(234, 'Trust', 'trust'),
(235, 'Truth', 'truth'),
(236, 'Valentine''s Day', 'valentines_day'),
(237, 'Veterans Day', 'veterans_day'),
(238, 'War', 'war'),
(239, 'Wedding', 'wedding'),
(240, 'Wisdom', 'wisdom'),
(241, 'Women', 'women'),
(242, 'Work', 'work');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authors`
--
ALTER TABLE `authors`
  ADD CONSTRAINT `authors_ibfk_1` FOREIGN KEY (`nationality`) REFERENCES `nationality` (`id`),
  ADD CONSTRAINT `authors_ibfk_3` FOREIGN KEY (`profession`) REFERENCES `profession` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
