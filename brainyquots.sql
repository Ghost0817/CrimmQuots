-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2016 at 11:14 AM
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
  `born` varchar(15) NOT NULL,
  `died` varchar(15) NOT NULL,
  `description` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `profession` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hits` bigint(20) NOT NULL COMMENT 'Дарагдсан тоо',
  PRIMARY KEY (`id`),
  KEY `nationality` (`nationality`),
  KEY `profession` (`profession`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `nationality`, `born`, `died`, `description`, `body`, `slug`, `profession`, `name`, `hits`) VALUES
(1, 1, '1929-05-04', '1993-01-20', '', '', 'audrey_hepburn', 3, 'Audrey Hepburn', 1),
(2, 2, '1929-01-15', '1968-04-04', '', '', 'martin_luther_king_jr', 39, 'Martin Luther King, Jr.', 1),
(3, 3, '1879-03-14', '1955-04-18', '', '', 'albert_einstein', 46, 'Albert Einstein', 1),
(4, 2, '1904-03-02', '1991-09-24', '', '', 'dr_seuss', 65, 'Dr. Seuss', 1),
(5, 4, '1869-10-02', '1948-01-30', '', '', 'mahatma_gandhi', 39, 'Mahatma Gandhi', 1),
(6, 5, '1564-04-23', '1616-04-23', '', '', 'william_shakespeare', 25, 'William Shakespeare', 1),
(7, 2, '1835-11-30', '1910-04-21', '', '', 'mark_twain', 8, 'Mark Twain', 0);

-- --------------------------------------------------------

--
-- Table structure for table `authorshits`
--

CREATE TABLE IF NOT EXISTS `authorshits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `authorshits`
--

INSERT INTO `authorshits` (`id`, `author_id`, `ip`, `create_at`) VALUES
(1, 2, '192.168.8.32', '2016-01-29 04:35:18'),
(2, 3, '192.168.8.32', '2016-01-29 04:35:25'),
(3, 4, '192.168.8.32', '2016-01-29 04:35:41'),
(4, 5, '192.168.8.32', '2016-01-29 04:35:45'),
(5, 6, '192.168.8.32', '2016-01-29 04:35:49'),
(6, 1, '192.168.8.32', '2016-01-29 06:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `nationality`
--

CREATE TABLE IF NOT EXISTS `nationality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `nationality`
--

INSERT INTO `nationality` (`id`, `name`) VALUES
(1, 'Belgian'),
(2, 'American'),
(3, 'German'),
(4, 'Indian'),
(5, 'English');

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
-- Table structure for table `quotes`
--

CREATE TABLE IF NOT EXISTS `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `quote`, `image`, `author_id`) VALUES
(1, 'The most important thing is to enjoy your life - to be happy - it''s all that matters.', 'audreyhepburn413489.jpg', 1),
(2, 'Nothing is impossible, the word itself says ''I''m possible''!', 'audreyhepburn413479.jpg', 1),
(3, 'The best thing to hold onto in life is each other.', 'audreyhepburn378280.jpg', 1),
(4, 'The beauty of a woman must be seen from in her eyes, because that is the doorway to her heart, the place where love resides.', '', 1),
(7, 'For beautiful eyes, look for the good in others; for beautiful lips, speak only words of kindness; and for poise, walk with the knowledge that you are never alone.', '', 1),
(8, 'I was born with an enormous need for affection, and a terrible need to give it.', 'audreyhepburn126741.jpg', 1),
(9, 'The beauty of a woman is not in a facial mode but the true beauty in a woman is reflected in her soul. It is the caring that she lovingly gives the passion that she shows. The beauty of a woman grows with the passing years.', '', 1),
(10, 'I believe in pink. I believe that laughing is the best calorie burner. I believe in kissing, kissing a lot. I believe in being strong when everything seems to be going wrong. I believe that happy girls are the prettiest girls. I believe that tomorrow is a', '', 1),
(11, 'Let''s face it, a nice creamy chocolate cake does a lot for a lot of people; it does for me.', '', 1),
(12, 'The beauty of a woman is not in the clothes she wears, the figure that she carries or the way she combs her hair.', '', 1),
(13, 'I love people who make me laugh. I honestly think it''s the thing I like most, to laugh. It cures a multitude of ills. It''s probably the most important thing in a person.', '', 1),
(14, 'As you grow older, you will discover that you have two hands, one for helping yourself, the other for helping others.', '', 1),
(15, 'Remember, if you ever need a helping hand, it''s at the end of your arm, as you get older, remember you have another hand: The first is to help yourself, the second is to help others.', '', 1),
(16, 'You can tell more about a person by what he says about others than you can by what others say about him.', '', 1),
(17, 'I believe in manicures. I believe in overdressing. I believe in primping at leisure and wearing lipstick. I believe in pink. I believe happy girls are the prettiest girls. I believe that tomorrow is another day, and... I believe in miracles.', '', 1),
(18, 'Pick the day. Enjoy it - to the hilt. The day as it comes. People as they come... The past, I think, has helped me appreciate the present - and I don''t want to spoil any of it by fretting about the future.', '', 1),
(19, 'People, even more than things, have to be restored, renewed, revived, reclaimed, and redeemed; never throw out anyone.', '', 1),
(20, 'Water is life, and clean water means health.', '', 1),
(21, 'Living is like tearing through a museum. Not until later do you really start absorbing what you saw, thinking about it, looking it up in a book, and remembering - because you can''t take it in all at once.', '', 1),
(22, 'I''m an introvert... I love being by myself, love being outdoors, love taking a long walk with my dogs and looking at the trees, flowers, the sky.', '', 1),
(25, 'There are certain shades of limelight that can wreck a girl''s complexion.', '', 1),
(26, 'I decided, very early on, just to accept life unconditionally; I never expected it to do anything special for me, yet I seemed to accomplish far more than I had ever hoped. Most of the time it just happened to me without my ever seeking it.', '', 1),
(27, 'Success is like reaching an important birthday and finding you''re exactly the same.', '', 1),
(28, 'I don''t want to be alone, I want to be left alone.', '', 1),
(29, 'I''m half-Irish, half-Dutch, and I was born in Belgium. If I was a dog, I''d be in a hell of a mess!', '', 1),
(30, 'The ''Third World'' is a term I don''t like very much because we''re all one world. I want people to know that the largest part of humanity is suffering.', '', 1),
(31, 'If my world were to cave in tomorrow, I would look back on all the pleasures, excitements and worthwhilenesses I have been lucky enough to have had. Not the sadness, not my miscarriages or my father leaving home, but the joy of everything else. It will ha', '', 1),
(32, 'Paris is always a good idea.', 'audreyhepburn413495.jpg', 1),
(33, 'I had to make a choice at one point in my life, of missing films or missing my children. It was a very easy decision to make because I missed my children so very much.', '', 1),
(34, 'I was asked to act when I couldn''t act. I was asked to sing ''Funny Face'' when I couldn''t sing, and dance with Fred Astaire when I couldn''t dance - and do all kinds of things I wasn''t prepared for. Then I tried like mad to cope with it.', '', 1),
(35, 'I never think of myself as an icon. What is in other people''s minds is not in my mind. I just do my thing.', '', 1),
(36, 'When you have nobody you can make a cup of tea for, when nobody needs you, that''s when I think life is over.', '', 1),
(37, 'I''ve been lucky. Opportunities don''t often come along. So, when they do, you have to grab them.', '', 1),
(38, 'If I get married, I want to be very married.', '', 1),
(39, 'I probably hold the distinction of being one movie star who, by all laws of logic, should never have made it. At each stage of my career, I lacked the experience.', '', 1),
(40, 'Since the world has existed, there has been injustice. But it is one world, the more so as it becomes smaller, more accessible. There is just no question that there is more obligation that those who have should give to those who have nothing.', '', 1),
(41, 'It''s that wonderful old-fashioned idea that others come first and you come second. This was the whole ethic by which I was brought up. Others matter more than you do, so ''don''t fuss, dear; get on with it.''', '', 1),
(42, 'I have to be alone very often. I''d be quite happy if I spent from Saturday night until Monday morning alone in my apartment. That''s how I refuel.', '', 1),
(43, 'Everything I learned I learned from the movies.', '', 1),
(44, 'Taking care of children has nothing to do with politics. I think perhaps with time, instead of there being a politicization of humanitarian aid, there will be a humanization of politics.', '', 1),
(45, 'If I''m honest I have to tell you I still read fairy-tales and I like them best of all.', '', 1),
(46, 'There is more to sex appeal than just measurements. I don''t need a bedroom to prove my womanliness. I can convey just as much sex appeal, picking apples off a tree or standing in the rain.', '', 1),
(47, 'There is a moral obligation that those who have should give to those who don''t.', '', 1),
(48, 'I heard a definition once: Happiness is health and a short memory! I wish I''d invented it, because it is very true.', '', 1),
(49, 'I never thought I''d land in pictures with a face like mine.', '', 1),
(50, 'My first big mission for UNICEF in Ethiopia was just to attract attention, before it was too late, to conditions which threatened the whole country. My role was to inform the world, to make sure that the people of Ethiopia were not forgotten.', '', 1),
(51, 'People in Ethiopia, the Sudan, etc., don''t know Audrey Hepburn, but they recognize the name UNICEF. When they see UNICEF, their faces light up, because they know that something is happening. In the Sudan, for example, they call a water pump ''UNICEF.''', '', 1),
(52, 'I don''t believe in collective guilt, but I do believe in collective responsibility.', '', 1),
(53, 'I can testify to what UNICEF means to children because I was among those who received food and medical relief right after World War II.', '', 1),
(54, 'Actually, you have to be a little bit in love with your leading man and vice versa. If you''re going to portray love, you have to feel it. You can''t do it any other way. But you don''t carry it beyond the set.', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `quotesandtopics`
--

CREATE TABLE IF NOT EXISTS `quotesandtopics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quote_id` (`quote_id`,`topic_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE IF NOT EXISTS `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `hits` bigint(20) NOT NULL COMMENT 'Дарагдсан тоо',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this is topics. Just like as category.' AUTO_INCREMENT=243 ;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `slug`, `hits`) VALUES
(122, 'Age', 'age', 1),
(123, 'Alone', 'alone', 0),
(124, 'Amazing', 'amazing', 0),
(125, 'Anger', 'anger', 0),
(126, 'Anniversary', 'anniversary', 0),
(127, 'Architecture', 'architecture', 0),
(128, 'Art', 'art', 0),
(129, 'Attitude', 'attitude', 0),
(130, 'Beauty', 'beauty', 0),
(131, 'Best', 'best', 0),
(132, 'Birthday', 'birthday', 0),
(133, 'Brainy', 'brainy', 0),
(134, 'Business', 'business', 0),
(135, 'Car', 'car', 0),
(136, 'Chance', 'chance', 0),
(137, 'Change', 'change', 0),
(138, 'Christmas', 'christmas', 0),
(139, 'Communication', 'communication', 0),
(140, 'Computers', 'computers', 0),
(141, 'Cool', 'cool', 0),
(142, 'Courage', 'courage', 0),
(143, 'Dad', 'dad', 0),
(144, 'Dating', 'dating', 0),
(145, 'Death', 'death', 0),
(146, 'Design', 'design', 0),
(147, 'Diet', 'diet', 0),
(148, 'Dreams', 'dreams', 0),
(149, 'Easter', 'easter', 0),
(150, 'Education', 'education', 0),
(151, 'Environmental', 'environmental', 0),
(152, 'Equality', 'equality', 0),
(153, 'Experience', 'experience', 0),
(154, 'Failure', 'failure', 0),
(155, 'Faith', 'faith', 0),
(156, 'Family', 'family', 0),
(157, 'Famous', 'famous', 0),
(158, 'Father''s Day', 'fathers_day', 0),
(159, 'Fear', 'fear', 0),
(160, 'Finance', 'finance', 0),
(161, 'Fitness', 'fitness', 0),
(162, 'Food', 'food', 0),
(163, 'Forgiveness', 'forgiveness', 0),
(164, 'Freedom', 'freedom', 0),
(165, 'Friendship', 'friendship', 0),
(166, 'Funny', 'funny', 0),
(167, 'Future', 'future', 0),
(168, 'Gardening', 'gardening', 0),
(169, 'God', 'god', 0),
(170, 'Good', 'good', 0),
(171, 'Government', 'government', 0),
(172, 'Graduation', 'graduation', 0),
(173, 'Great', 'great', 0),
(174, 'Happiness', 'happiness', 0),
(175, 'Health', 'health', 0),
(176, 'History', 'history', 0),
(177, 'Home', 'home', 0),
(178, 'Hope', 'hope', 0),
(179, 'Humor', 'humor', 0),
(180, 'Imagination', 'imagination', 0),
(181, 'Independence', 'independence', 0),
(182, 'Inspirational', 'inspirational', 0),
(183, 'Intelligence', 'intelligence', 0),
(184, 'Jealousy', 'jealousy', 0),
(185, 'Knowledge', 'knowledge', 0),
(186, 'Leadership', 'leadership', 0),
(187, 'Learning', 'learning', 0),
(188, 'Legal', 'legal', 0),
(189, 'Life', 'life', 1),
(190, 'Love', 'love', 0),
(191, 'Marriage', 'marriage', 0),
(192, 'Medical', 'medical', 0),
(193, 'Memorial Day', 'memorial_day', 0),
(194, 'Men', 'men', 0),
(195, 'Mom', 'mom', 0),
(196, 'Money', 'money', 0),
(197, 'Morning', 'morning', 0),
(198, 'Mother''s Day', 'mothers_day', 0),
(199, 'Motivational', 'motivational', 0),
(200, 'Movies', 'movies', 0),
(201, 'Moving On', 'moving_on', 0),
(202, 'Music', 'music', 0),
(203, 'Nature', 'nature', 0),
(204, 'New Year''s', 'new_years', 0),
(205, 'Parenting', 'parenting', 0),
(206, 'Patience', 'patience', 0),
(207, 'Patriotism', 'patriotism', 0),
(208, 'Peace', 'peace', 0),
(209, 'Pet', 'pet', 0),
(210, 'Poetry', 'poetry', 0),
(211, 'Politics', 'politics', 0),
(212, 'Positive', 'positive', 0),
(213, 'Power', 'power', 0),
(214, 'Relationship', 'relationship', 0),
(215, 'Religion', 'religion', 0),
(216, 'Respect', 'respect', 0),
(217, 'Romantic', 'romantic', 0),
(218, 'Sad', 'sad', 0),
(219, 'Saint Patrick''s Day', 'saint_patricks_day', 0),
(220, 'Science', 'science', 0),
(221, 'Smile', 'smile', 0),
(222, 'Society', 'society', 0),
(223, 'Sports', 'sports', 0),
(224, 'Strength', 'strength', 0),
(225, 'Success', 'success', 0),
(226, 'Sympathy', 'sympathy', 0),
(227, 'Teacher', 'teacher', 0),
(228, 'Technology', 'technology', 0),
(229, 'Teen', 'teen', 0),
(230, 'Thankful', 'thankful', 0),
(231, 'Thanksgiving', 'thanksgiving', 0),
(232, 'Time', 'time', 0),
(233, 'Travel', 'travel', 0),
(234, 'Trust', 'trust', 0),
(235, 'Truth', 'truth', 0),
(236, 'Valentine''s Day', 'valentines_day', 0),
(237, 'Veterans Day', 'veterans_day', 0),
(238, 'War', 'war', 0),
(239, 'Wedding', 'wedding', 0),
(240, 'Wisdom', 'wisdom', 0),
(241, 'Women', 'women', 0),
(242, 'Work', 'work', 0);

-- --------------------------------------------------------

--
-- Table structure for table `topicshits`
--

CREATE TABLE IF NOT EXISTS `topicshits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quote_id` (`topic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `topicshits`
--

INSERT INTO `topicshits` (`id`, `topic_id`, `ip`, `create_at`) VALUES
(1, 122, '192.168.8.32', '2016-01-29 04:20:12'),
(2, 189, '192.168.8.32', '2016-01-29 05:49:20');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authors`
--
ALTER TABLE `authors`
  ADD CONSTRAINT `authors_ibfk_1` FOREIGN KEY (`nationality`) REFERENCES `nationality` (`id`),
  ADD CONSTRAINT `authors_ibfk_3` FOREIGN KEY (`profession`) REFERENCES `profession` (`id`);

--
-- Constraints for table `authorshits`
--
ALTER TABLE `authorshits`
  ADD CONSTRAINT `authorshits_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`);

--
-- Constraints for table `quotes`
--
ALTER TABLE `quotes`
  ADD CONSTRAINT `quotes_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`);

--
-- Constraints for table `quotesandtopics`
--
ALTER TABLE `quotesandtopics`
  ADD CONSTRAINT `quotesandtopics_ibfk_1` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`),
  ADD CONSTRAINT `quotesandtopics_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`);

--
-- Constraints for table `topicshits`
--
ALTER TABLE `topicshits`
  ADD CONSTRAINT `topicshits_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
