-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2016 at 11:11 AM
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
-- Table structure for table `app_users`
--

CREATE TABLE IF NOT EXISTS `app_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `activationKey` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
(1, 1, '1929-05-04', '1993-01-20', '', '', 'audrey_hepburn', 3, 'Audrey Hepburn', 2),
(2, 2, '1929-01-15', '1968-04-04', '', '', 'martin_luther_king_jr', 39, 'Martin Luther King, Jr.', 1),
(3, 3, '1879-03-14', '1955-04-18', '', '', 'albert_einstein', 46, 'Albert Einstein', 1),
(4, 2, '1904-03-02', '1991-09-24', '', '', 'dr_seuss', 65, 'Dr. Seuss', 1),
(5, 4, '1869-10-02', '1948-01-30', '', '', 'mahatma_gandhi', 39, 'Mahatma Gandhi', 1),
(6, 5, '1564-04-23', '1616-04-23', '', '', 'william_shakespeare', 25, 'William Shakespeare', 2),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `authorshits`
--

INSERT INTO `authorshits` (`id`, `author_id`, `ip`, `create_at`) VALUES
(1, 2, '192.168.8.32', '2016-01-29 04:35:18'),
(2, 3, '192.168.8.32', '2016-01-29 04:35:25'),
(3, 4, '192.168.8.32', '2016-01-29 04:35:41'),
(4, 5, '192.168.8.32', '2016-01-29 04:35:45'),
(5, 6, '192.168.8.32', '2016-01-29 04:35:49'),
(6, 1, '192.168.8.32', '2016-01-29 06:15:47'),
(7, 1, '127.0.0.1', '2016-01-30 13:14:15'),
(8, 6, '127.0.0.1', '2016-01-31 07:29:25');

-- --------------------------------------------------------

--
-- Table structure for table `nationality`
--

CREATE TABLE IF NOT EXISTS `nationality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `hits` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=143 ;

--
-- Dumping data for table `nationality`
--

INSERT INTO `nationality` (`id`, `name`, `slug`, `hits`) VALUES
(1, 'Belgian', 'belgian', 0),
(2, 'American', 'american', 0),
(3, 'German', 'german', 0),
(4, 'Indian', 'indian', 0),
(5, 'English', 'english', 0),
(6, 'Bahamian', 'bahamian', 0),
(7, 'Bangladeshi', 'bangladeshi', 0),
(8, 'Barbadian', 'barbadian', 0),
(9, 'Belarusian', 'belarusian', 0),
(10, 'Bolivian', 'bolivian', 0),
(11, 'Bosniak', 'bosniak', 0),
(12, 'Brazilian', 'brazilian', 0),
(13, 'British', 'british', 0),
(14, 'Bulgarian', 'bulgarian', 0),
(15, 'Burmese', 'burmese', 0),
(16, 'Cambodian', 'cambodian', 0),
(17, 'Cameroonian', 'cameroonian', 0),
(18, 'Canadian', 'canadian', 0),
(19, 'Chechen', 'chechen', 0),
(20, 'Cherokee', 'cherokee', 0),
(21, 'Chilean', 'chilean', 0),
(22, 'Chinese', 'chinese', 0),
(23, 'Colombian', 'colombian', 0),
(24, 'Congolese', 'congolese', 0),
(25, 'Costa Rican', 'costarican', 0),
(26, 'Croatian', 'croatian', 0),
(27, 'Cuban', 'cuban', 0),
(28, 'Cypriot', 'cypriot', 0),
(29, 'Czechoslovakian', 'czechoslovakian', 0),
(30, 'Danish', 'danish', 0),
(31, 'Dominican', 'dominican', 0),
(32, 'Drukpas', 'drukpas', 0),
(33, 'Dutch', 'dutch', 0),
(34, 'Egyptian', 'egyptian', 0),
(35, 'Emiratis', 'emiratis', 0),
(36, 'Estonian', 'estonian', 0),
(37, 'Ethiopian', 'ethiopian', 0),
(38, 'Fijian', 'fijian', 0),
(39, 'Filipino', 'filipino', 0),
(40, 'Finnish', 'finnish', 0),
(41, 'French', 'french', 0),
(42, 'Gabonese', 'gabonese', 0),
(43, 'Georgian', 'georgian', 0),
(44, 'Ghanaian', 'ghanaian', 0),
(45, 'Greek', 'greek', 0),
(46, 'Greenlandic', 'greenlandic', 0),
(47, 'Guatemalan', 'guatemalan', 0),
(48, 'Guyanese', 'guyanese', 0),
(49, 'Haitian', 'haitian', 0),
(50, 'Hungarian', 'hungarian', 0),
(51, 'Icelandic', 'icelandic', 0),
(52, 'Indonesian', 'indonesian', 0),
(53, 'Iranian', 'iranian', 0),
(54, 'Iraqi', 'iraqi', 0),
(55, 'Irish', 'irish', 0),
(56, 'Israeli', 'israeli', 0),
(57, 'Italian', 'italian', 0),
(58, 'Ivorian', 'ivorian', 0),
(59, 'Jamaican', 'jamaican', 0),
(60, 'Japanese', 'japanese', 0),
(61, 'Jordanian', 'jordanian', 0),
(62, 'Kenyan', 'kenyan', 0),
(63, 'Korean', 'korean', 0),
(64, 'Latvian', 'latvian', 0),
(65, 'Lebanese', 'lebanese', 0),
(66, 'Liberian', 'liberian', 0),
(67, 'Libyan', 'libyan', 0),
(68, 'Liechtensteinian', 'liechtensteinian', 0),
(69, 'Lithuanian', 'lithuanian', 0),
(70, 'Luxembourger', 'luxembourger', 0),
(71, 'Malagasy', 'malagasy', 0),
(72, 'Malawian', 'malawian', 0),
(73, 'Malaysian', 'malaysian', 0),
(74, 'Malian', 'malian', 0),
(75, 'Mexican', 'mexican', 0),
(76, 'Monacans', 'monacans', 0),
(77, 'Mongolian', 'mongolian', 0),
(78, 'Moroccan', 'moroccan', 0),
(79, 'Nepalese', 'nepalese', 0),
(80, 'New Zealander', 'newzealander', 0),
(81, 'Nicaraguan', 'nicaraguan', 0),
(82, 'Nigerian', 'nigerian', 0),
(83, 'North Korean', 'northkorean', 0),
(84, 'Norwegian', 'norwegian', 0),
(85, 'Pakistani', 'pakistani', 0),
(86, 'Palestinian', 'palestinian', 0),
(87, 'Panamanian', 'panamanian', 0),
(88, 'Paraguayan', 'paraguayan', 0),
(89, 'Peruvian', 'peruvian', 0),
(90, 'Polish', 'polish', 0),
(91, 'Portuguese', 'portuguese', 0),
(92, 'Puerto Rican', 'puertorican', 0),
(93, 'Qataris', 'qataris', 0),
(94, 'Roman', 'roman', 0),
(95, 'Romanian', 'romanian', 0),
(96, 'Russian', 'russian', 0),
(97, 'Rwandan', 'rwandan', 0),
(98, 'Saudi Arabian', 'saudiarabian', 0),
(99, 'Scottish', 'scottish', 0),
(100, 'Senegalese', 'senegalese', 0),
(101, 'Serbian', 'serbian', 0),
(102, 'Sierra Leonean', 'sierraleonean', 0),
(103, 'Singaporean', 'singaporean', 0),
(104, 'Sioux', 'sioux', 0),
(105, 'Slovak', 'slovak', 0),
(106, 'Slovenian', 'slovenian', 0),
(107, 'Somali', 'somali', 0),
(108, 'South African', 'southafrican', 0),
(109, 'South Korean', 'southkorean', 0),
(110, 'South Sudanese', 'southsudanese', 0),
(111, 'Spanish', 'spanish', 0),
(112, 'Sri Lankan', 'srilankan', 0),
(113, 'St. Kittsian', 'st.kittsian', 0),
(114, 'Sudanese', 'sudanese', 0),
(115, 'Swedish', 'swedish', 0),
(116, 'Swiss', 'swiss', 0),
(117, 'Syrian', 'syrian', 0),
(118, 'Taiwanese', 'taiwanese', 0),
(119, 'Tanzanian', 'tanzanian', 0),
(120, 'Thai', 'thai', 0),
(121, 'Tibetan', 'tibetan', 0),
(122, 'Trinidadian', 'trinidadian', 0),
(123, 'Tunisian', 'tunisian', 0),
(124, 'Turkish', 'turkish', 0),
(125, 'Ugandan', 'ugandan', 0),
(126, 'Ukrainian', 'ukrainian', 0),
(127, 'Uruguayan', 'uruguayan', 0),
(128, 'Venezuelan', 'venezuelan', 0),
(129, 'Vietnamese', 'vietnamese', 0),
(130, 'Welsh', 'welsh', 0),
(131, 'Yemeni', 'yemeni', 0),
(132, 'Yugoslavian', 'yugoslavian', 0),
(133, 'Zambian', 'zambian', 0),
(134, 'Zimbabwean', 'zimbabwean', 0),
(135, 'Afghani', 'afghani', 0),
(136, 'Albanian', 'albanian', 0),
(137, 'Algerian', 'algerian', 0),
(138, 'Angolan', 'angolan', 0),
(139, 'Argentinian', 'argentinian', 0),
(140, 'Armenian', 'armenian', 0),
(141, 'Australian', 'australian', 0),
(142, 'Austrian', 'austrian', 0);

-- --------------------------------------------------------

--
-- Table structure for table `nationalityhits`
--

CREATE TABLE IF NOT EXISTS `nationalityhits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nationality_id` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nationality_id` (`nationality_id`)
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
(33, 'First Lady', 'firstlady'),
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
(53, 'Public Servant', 'publicservant'),
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
(64, 'Vice President', 'vicepresident'),
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
  `keywords` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quote` (`quote`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=164 ;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `quote`, `image`, `author_id`, `keywords`) VALUES
(1, 'The most important thing is to enjoy your life - to be happy - it''s all that matters.', 'audreyhepburn413489.jpg', 1, 'Life, Happy, Enjoy'),
(2, 'Nothing is impossible, the word itself says ''I''m possible''!', 'audreyhepburn413479.jpg', 1, 'Inspirational, Says'),
(3, 'The best thing to hold onto in life is each other.', 'audreyhepburn378280.jpg', 1, 'Love, Life, Best'),
(4, 'The beauty of a woman must be seen from in her eyes, because that is the doorway to her heart, the place where love resides.', '', 1, 'Beauty, Love, Eyes'),
(7, 'For beautiful eyes, look for the good in others; for beautiful lips, speak only words of kindness; and for poise, walk with the knowledge that you are never alone.', '', 1, 'Wisdom, Good, Alone'),
(8, 'I was born with an enormous need for affection, and a terrible need to give it.', 'audreyhepburn126741.jpg', 1, 'Love, Born, Terrible'),
(9, 'The beauty of a woman is not in a facial mode but the true beauty in a woman is reflected in her soul. It is the caring that she lovingly gives the passion that she shows. The beauty of a woman grows with the passing years.', '', 1, 'Beauty, Woman, True'),
(10, 'I believe in pink. I believe that laughing is the best calorie burner. I believe in kissing, kissing a lot. I believe in being strong when everything seems to be going wrong. I believe that happy girls are the prettiest girls. I believe that tomorrow is a', '', 1, 'Inspirational, Best, Kissing'),
(11, 'Let''s face it, a nice creamy chocolate cake does a lot for a lot of people; it does for me.', '', 1, 'Food, Chocolate, Nice'),
(12, 'The beauty of a woman is not in the clothes she wears, the figure that she carries or the way she combs her hair.', '', 1, 'Beauty, Clothes, Woman'),
(13, 'I love people who make me laugh. I honestly think it''s the thing I like most, to laugh. It cures a multitude of ills. It''s probably the most important thing in a person.', '', 1, 'Humor, Love, Honestly'),
(14, 'As you grow older, you will discover that you have two hands, one for helping yourself, the other for helping others.', '', 1, 'Discover, Grow, Hands'),
(15, 'Remember, if you ever need a helping hand, it''s at the end of your arm, as you get older, remember you have another hand: The first is to help yourself, the second is to help others.', '', 1, 'Help, Others, Remember'),
(16, 'You can tell more about a person by what he says about others than you can by what others say about him.', '', 1, 'Others, Says'),
(17, 'I believe in manicures. I believe in overdressing. I believe in primping at leisure and wearing lipstick. I believe in pink. I believe happy girls are the prettiest girls. I believe that tomorrow is another day, and... I believe in miracles.', '', 1, 'Pink, Happy, Girl'),
(18, 'Pick the day. Enjoy it - to the hilt. The day as it comes. People as they come... The past, I think, has helped me appreciate the present - and I don''t want to spoil any of it by fretting about the future.', '', 1, 'Fear, Future, Past'),
(19, 'People, even more than things, have to be restored, renewed, revived, reclaimed, and redeemed; never throw out anyone.', '', 1, 'Renewed, Anyone, Throw'),
(20, 'Water is life, and clean water means health.', '', 1, 'Life, Health, Means'),
(21, 'Living is like tearing through a museum. Not until later do you really start absorbing what you saw, thinking about it, looking it up in a book, and remembering - because you can''t take it in all at once.', '', 1, 'Living, Book, Until'),
(22, 'I''m an introvert... I love being by myself, love being outdoors, love taking a long walk with my dogs and looking at the trees, flowers, the sky.', '', 1, 'Love, Dogs, Looking'),
(25, 'There are certain shades of limelight that can wreck a girl''s complexion.', '', 1, 'Girl, Certain, Wreck'),
(26, 'I decided, very early on, just to accept life unconditionally; I never expected it to do anything special for me, yet I seemed to accomplish far more than I had ever hoped. Most of the time it just happened to me without my ever seeking it.', '', 1, 'Life, Time, Accept'),
(27, 'Success is like reaching an important birthday and finding you''re exactly the same.', '', 1, 'Success, Birthday, Exactly'),
(28, 'I don''t want to be alone, I want to be left alone.', '', 1, 'Alone, Left'),
(29, 'I''m half-Irish, half-Dutch, and I was born in Belgium. If I was a dog, I''d be in a hell of a mess!', '', 1, 'Born, Hell, Dog'),
(30, 'The ''Third World'' is a term I don''t like very much because we''re all one world. I want people to know that the largest part of humanity is suffering.', '', 1, 'Humanity, Suffering, Third'),
(31, 'If my world were to cave in tomorrow, I would look back on all the pleasures, excitements and worthwhilenesses I have been lucky enough to have had. Not the sadness, not my miscarriages or my father leaving home, but the joy of everything else. It will ha', '', 1, 'Sad, Home, Tomorrow'),
(32, 'Paris is always a good idea.', 'audreyhepburn413495.jpg', 1, 'Travel, Good, Paris'),
(33, 'I had to make a choice at one point in my life, of missing films or missing my children. It was a very easy decision to make because I missed my children so very much.', '', 1, 'Life, Point, Easy'),
(34, 'I was asked to act when I couldn''t act. I was asked to sing ''Funny Face'' when I couldn''t sing, and dance with Fred Astaire when I couldn''t dance - and do all kinds of things I wasn''t prepared for. Then I tried like mad to cope with it.', '', 1, 'Funny, Face, Act'),
(35, 'I never think of myself as an icon. What is in other people''s minds is not in my mind. I just do my thing.', '', 1, 'Minds, Icon'),
(36, 'When you have nobody you can make a cup of tea for, when nobody needs you, that''s when I think life is over.', '', 1, 'Life, Nobody, Needs'),
(37, 'I''ve been lucky. Opportunities don''t often come along. So, when they do, you have to grab them.', '', 1, 'Along, Lucky, Grab'),
(38, 'If I get married, I want to be very married.', '', 1, 'Marriage, Married'),
(39, 'I probably hold the distinction of being one movie star who, by all laws of logic, should never have made it. At each stage of my career, I lacked the experience.', '', 1, 'Experience, Career, Stage'),
(40, 'Since the world has existed, there has been injustice. But it is one world, the more so as it becomes smaller, more accessible. There is just no question that there is more obligation that those who have should give to those who have nothing.', '', 1, 'Since, Question, Becomes'),
(41, 'It''s that wonderful old-fashioned idea that others come first and you come second. This was the whole ethic by which I was brought up. Others matter more than you do, so ''don''t fuss, dear; get on with it.''', '', 1, 'Others, Matter, Second'),
(42, 'I have to be alone very often. I''d be quite happy if I spent from Saturday night until Monday morning alone in my apartment. That''s how I refuel.', '', 1, 'Alone, Morning, Apartment'),
(43, 'Everything I learned I learned from the movies.', '', 1, 'Learning, Movies, Learned'),
(44, 'Taking care of children has nothing to do with politics. I think perhaps with time, instead of there being a politicization of humanitarian aid, there will be a humanization of politics.', '', 1, 'Time, Politics, Care'),
(45, 'If I''m honest I have to tell you I still read fairy-tales and I like them best of all.', '', 1, 'Best, Honest'),
(46, 'There is more to sex appeal than just measurements. I don''t need a bedroom to prove my womanliness. I can convey just as much sex appeal, picking apples off a tree or standing in the rain.', '', 1, 'Rain, Sex, Tree'),
(47, 'There is a moral obligation that those who have should give to those who don''t.', '', 1, 'Moral, Obligation'),
(48, 'I heard a definition once: Happiness is health and a short memory! I wish I''d invented it, because it is very true.', '', 1, 'Happiness, Health, True'),
(49, 'I never thought I''d land in pictures with a face like mine.', '', 1, 'Movies, Face, Land'),
(50, 'My first big mission for UNICEF in Ethiopia was just to attract attention, before it was too late, to conditions which threatened the whole country. My role was to inform the world, to make sure that the people of Ethiopia were not forgotten.', '', 1, 'Sure, Attention, Role'),
(51, 'People in Ethiopia, the Sudan, etc., don''t know Audrey Hepburn, but they recognize the name UNICEF. When they see UNICEF, their faces light up, because they know that something is happening. In the Sudan, for example, they call a water pump ''UNICEF.''', '', 1, 'Call, Light, Name'),
(52, 'I don''t believe in collective guilt, but I do believe in collective responsibility.', '', 1, 'Guilt, Collective'),
(53, 'I can testify to what UNICEF means to children because I was among those who received food and medical relief right after World War II.', '', 1, 'War, Food, Medical'),
(54, 'Actually, you have to be a little bit in love with your leading man and vice versa. If you''re going to portray love, you have to feel it. You can''t do it any other way. But you don''t carry it beyond the set.', '', 1, 'Love, Bit, Beyond'),
(55, 'We know what we are, but know not what we may be.', 'williamshakespeare164317.jpg', 6, 'Inspirational'),
(56, 'Love all, trust a few, do wrong to none.', 'williamshakespeare106076.jpg', 6, 'Life, Idiot, Shadow'),
(57, 'God has given you one face, and you make yourself another.', '', 6, 'God, Face, Given'),
(58, 'No legacy is so rich as honesty.', '', 6, 'Honesty, Legacy, Rich'),
(59, 'There is nothing either good or bad but thinking makes it so.', '', 6, 'Good, Thinking, Either'),
(60, 'To thine own self be true, and it must follow, as the night the day, thou canst not then be false to any man.', '', 6, 'Thine, True, Night'),
(61, 'Cowards die many times before their deaths; the valiant never taste of death but once.', '', 6, 'Death, Valiant, Die'),
(62, 'False face must hide what the false heart doth know.', '', 6, 'Hide, Heart, Face'),
(63, 'Better a witty fool than a foolish wit.', 'williamshakespeare100137.jpg', 6, 'Fool, Foolish, Wit'),
(64, 'This life, which had been the tomb of his virtue and of his honour, is but a walking shadow; a poor player, that struts and frets his hour upon the stage, and then is heard no more: it is a tale told by an idiot, full of sound and fury, signifying nothing', '', 6, 'Life, Idiot, Shadow'),
(65, 'Better three hours too soon than a minute too late.', 'williamshakespeare139153.jpg', 6, 'Time, Late, Three'),
(66, 'A fool thinks himself to be wise, but a wise man knows himself to be a fool.', '', 6, 'Fool, Wise, Himself'),
(67, 'If music be the food of love, play on.', 'williamshakespeare109521.jpg', 6, 'Music, Love, Food'),
(68, 'If you prick us do we not bleed? If you tickle us do we not laugh? If you poison us do we not die? And if you wrong us shall we not revenge?', '', 6, 'Revenge, Wrong, Bleed'),
(69, 'Hell is empty and all the devils are here.', '', 6, 'Hell, Devils, Here'),
(70, 'All the world''s a stage, and all the men and women merely players: they have their exits and their entrances; and one man in his time plays many parts, his acts being seven ages.', '', 6, 'Time, Women, Men'),
(71, 'What''s in a name? That which we call a rose by any other name would smell as sweet.', '', 6, 'Name, Rose, Call'),
(72, 'When a father gives to his son, both laugh; when a son gives to his father, both cry.', 'williamshakespeare118143.jpg', 6, 'Father''s Day, Father'),
(73, 'It is not in the stars to hold our destiny but in ourselves.', '', 6, 'Future, Destiny, Stars'),
(74, 'Good night, good night! Parting is such sweet sorrow, that I shall say good night till it be morrow.', '', 6, 'Dating, Good, Parting'),
(75, 'Ignorance is the curse of God; knowledge is the wing wherewith we fly to heaven.', '', 6, 'Knowledge, God, Ignorance'),
(76, 'Some are born great, some achieve greatness, and some have greatness thrust upon them.', '', 6, 'Great, Born, Achieve'),
(77, 'The course of true love never did run smooth.', '', 6, 'Love, True, Run'),
(78, 'Doubt thou the stars are fire, Doubt that the sun doth move. Doubt truth to be a liar, But never doubt I love.', '', 6, 'Valentine''s Day, Love, Truth'),
(79, 'Brevity is the soul of wit.', 'williamshakespeare109518.jpg', 6, 'Communication, Soul'),
(80, 'Give thy thoughts no tongue.', '', 6, 'Thoughts, Tongue, Thy'),
(81, 'Let me embrace thee, sour adversity, for wise men say it is the wisest course.', '', 6, 'Men, Adversity, Wise'),
(82, 'Now is the winter of our discontent.', '', 6, 'Discontent, Winter'),
(83, 'Love looks not with the eyes, but with the mind, And therefore is winged Cupid painted blind.', '', 6, 'Love, Blind, Eyes'),
(84, 'There is no darkness but ignorance.', '', 6, 'Ignorance, Darkness'),
(115, 'The most peaceable way for you, if you do take a thief, is, to let him show himself what he is and steal out of your company.', '', 6, 'Himself, Company, Steal'),
(116, 'To be, or not to be, that is the question.', '', 6, 'Question'),
(117, 'My crown is called content, a crown that seldom kings enjoy.', '', 6, 'Kings, Enjoy, Content'),
(118, 'How far that little candle throws its beams! So shines a good deed in a naughty world.', '', 6, 'Good, Far, Naughty'),
(119, 'Listen to many, speak to a few.', '', 6, 'Listen, Speak, Few'),
(120, 'The very substance of the ambitious is merely the shadow of a dream.', '', 6, 'Ambitious, Dream, Merely'),
(121, 'Now, God be praised, that to believing souls gives light in darkness, comfort in despair.', '', 6, 'Faith, God, Light'),
(122, 'Let every eye negotiate for itself and trust no agent.', '', 6, 'Trust, Itself, Eye'),
(123, 'Farewell, fair cruelty.', '', 6, 'Farewell, Fair, Cruelty'),
(124, 'Life is as tedious as twice-told tale, vexing the dull ear of a drowsy man.', '', 6, 'Life, Ear, Dull'),
(125, 'Wisely, and slow. They stumble that run fast.', '', 6, 'Run, Fast, Slow'),
(126, 'Love sought is good, but given unsought, is better.', '', 6, 'Relationship, Love, Good'),
(127, 'Come, gentlemen, I hope we shall drink down all unkindness.', 'williamshakespeare394960.jpg', 6, 'New Year''s, Hope'),
(128, 'Who could refrain that had a heart to love and in that heart courage to make love known?', '', 6, 'Courage, Love, Heart'),
(129, 'Like as the waves make towards the pebbl''d shore, so do our minutes, hasten to their end.', '', 6, 'Time, Minutes, Towards'),
(130, 'The wheel is come full circle.', 'williamshakespeare126065.jpg', 6, 'Circle, Full, Wheel'),
(131, 'Suspicion always haunts the guilty mind.', '', 6, 'Guilty, Suspicion, Haunts'),
(132, 'When we are born we cry that we are come to this great stage of fools.', '', 6, 'Great, Born, Stage'),
(133, 'As flies to wanton boys, are we to the gods; they kill us for their sport.', '', 6, 'Sports, Boy, Gods'),
(134, 'There is a tide in the affairs of men, Which taken at the flood, leads on to fortune. Omitted, all the voyage of their life is bound in shallows and in miseries. On such a full sea are we now afloat. And we must take the current when it serves, or lose ou', '', 6, 'Life, Men, Affairs'),
(135, 'But men are men; the best sometimes forget.', '', 6, 'Best, Men, Forget'),
(136, 'It is a wise father that knows his own child.', '', 6, 'Father''s Day, Father, Wise'),
(137, 'We cannot conceive of matter being formed of nothing, since things require a seed to start from... Therefore there is not anything which returns to nothing, but all things return dissolved into their elements.', '', 6, 'Cannot, Matter, Since'),
(138, 'To do a great right do a little wrong.', '', 6, 'Great, Wrong'),
(142, 'Boldness be my friend.', '', 6, 'Courage, Boldness, Friend'),
(143, 'Faith, there hath been many great men that have flattered the people who ne''er loved them.', '', 6, 'Great, Faith, Men'),
(144, 'Modest doubt is called the beacon of the wise.', '', 6, 'Wise, Doubt, Modest'),
(145, 'I wasted time, and now doth time waste me.', '', 6, 'Time, Waste, Wasted'),
(146, 'The man that hath no music in himself, Nor is not moved with concord of sweet sounds, is fit for treasons, stratagems and spoils.', '', 6, 'Music, Himself, Nor'),
(147, 'The robbed that smiles, steals something from the thief.', '', 6, 'Thief, Smiles, Robbed'),
(148, 'If you can look into the seeds of time, and say which grain will grow and which will not, speak then unto me.', '', 6, 'Time, Speak, Grow'),
(149, 'And why not death rather than living torment? To die is to be banish''d from myself; And Silvia is myself: banish''d from her Is self from self: a deadly banishment!', '', 6, 'Death, Living, Rather'),
(150, 'Reputation is an idle and most false imposition; oft got without merit, and lost without deserving.', '', 6, 'Lost, Reputation, False'),
(154, 'It is the stars, The stars above us, govern our conditions.', '', 6, 'Stars, Above, Conditions'),
(155, 'When sorrows come, they come not single spies, but in battalions.', '', 6, 'Sympathy, Battalions, Single'),
(156, 'O thou invisible spirit of wine, if thou hast no name to be known by, let us call thee devil.', '', 6, 'Call, Name, Known'),
(157, 'Alas, I am a woman friendless, hopeless!', '', 6, 'Woman, Hopeless, Alas'),
(158, 'Many a good hanging prevents a bad marriage.', '', 6, 'Good, Marriage, Hanging'),
(159, 'God hath given you one face, and you make yourselves another.', '', 6, 'God, Face, Given'),
(160, 'Teach not thy lip such scorn, for it was made For kissing, lady, not for such contempt.', '', 6, 'Teach, Lady, Kissing'),
(161, 'How sharper than a serpent''s tooth it is to have a thankless child!', '', 6, 'Child, Tooth, Thankless'),
(162, 'No, I will be the pattern of all patience; I will say nothing.', '', 6, 'Patience, Pattern'),
(163, 'In a false quarrel there is no true valor.', '', 6, 'True, False, Quarrel');

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
(132, 'Birthday', 'birthday', 1),
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
(150, 'Education', 'education', 1),
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
(165, 'Friendship', 'friendship', 1),
(166, 'Funny', 'funny', 1),
(167, 'Future', 'future', 0),
(168, 'Gardening', 'gardening', 0),
(169, 'God', 'god', 0),
(170, 'Good', 'good', 0),
(171, 'Government', 'government', 0),
(172, 'Graduation', 'graduation', 0),
(173, 'Great', 'great', 0),
(174, 'Happiness', 'happiness', 1),
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
(186, 'Leadership', 'leadership', 1),
(187, 'Learning', 'learning', 0),
(188, 'Legal', 'legal', 0),
(189, 'Life', 'life', 1),
(190, 'Love', 'love', 1),
(191, 'Marriage', 'marriage', 0),
(192, 'Medical', 'medical', 0),
(193, 'Memorial Day', 'memorial_day', 0),
(194, 'Men', 'men', 0),
(195, 'Mom', 'mom', 0),
(196, 'Money', 'money', 0),
(197, 'Morning', 'morning', 0),
(198, 'Mother''s Day', 'mothers_day', 0),
(199, 'Motivational', 'motivational', 1),
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
(212, 'Positive', 'positive', 1),
(213, 'Power', 'power', 0),
(214, 'Relationship', 'relationship', 0),
(215, 'Religion', 'religion', 0),
(216, 'Respect', 'respect', 0),
(217, 'Romantic', 'romantic', 0),
(218, 'Sad', 'sad', 0),
(219, 'Saint Patrick''s Day', 'saint_patricks_day', 0),
(220, 'Science', 'science', 0),
(221, 'Smile', 'smile', 1),
(222, 'Society', 'society', 0),
(223, 'Sports', 'sports', 0),
(224, 'Strength', 'strength', 0),
(225, 'Success', 'success', 1),
(226, 'Sympathy', 'sympathy', 0),
(227, 'Teacher', 'teacher', 1),
(228, 'Technology', 'technology', 0),
(229, 'Teen', 'teen', 0),
(230, 'Thankful', 'thankful', 0),
(231, 'Thanksgiving', 'thanksgiving', 0),
(232, 'Time', 'time', 0),
(233, 'Travel', 'travel', 0),
(234, 'Trust', 'trust', 0),
(235, 'Truth', 'truth', 0),
(236, 'Valentine''s Day', 'valentines_day', 1),
(237, 'Veterans Day', 'veterans_day', 0),
(238, 'War', 'war', 0),
(239, 'Wedding', 'wedding', 0),
(240, 'Wisdom', 'wisdom', 1),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `topicshits`
--

INSERT INTO `topicshits` (`id`, `topic_id`, `ip`, `create_at`) VALUES
(1, 122, '192.168.8.32', '2016-01-29 04:20:12'),
(2, 189, '192.168.8.32', '2016-01-29 05:49:20'),
(3, 190, '192.168.8.32', '2016-02-01 08:13:24'),
(4, 225, '192.168.8.32', '2016-02-02 04:24:31'),
(5, 166, '192.168.8.32', '2016-02-02 04:24:34'),
(6, 165, '192.168.8.32', '2016-02-02 04:24:35'),
(7, 212, '192.168.8.32', '2016-02-02 04:24:40'),
(8, 199, '192.168.8.32', '2016-02-03 02:43:29'),
(9, 150, '192.168.8.32', '2016-02-03 02:43:44'),
(10, 174, '192.168.8.32', '2016-02-03 02:43:54'),
(11, 221, '192.168.8.32', '2016-02-03 02:44:08'),
(12, 227, '192.168.8.32', '2016-02-03 02:44:14'),
(13, 240, '192.168.8.32', '2016-02-03 02:44:25'),
(14, 186, '192.168.8.32', '2016-02-03 02:44:35'),
(15, 236, '192.168.8.32', '2016-02-03 02:45:26'),
(16, 132, '192.168.8.32', '2016-02-03 02:46:52');

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
