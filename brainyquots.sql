-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2016 at 11:27 AM
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
  `nationality_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `born` date NOT NULL,
  `died` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nationality` (`nationality_id`,`type_id`),
  KEY `type` (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `nationality_id`, `type_id`, `born`, `died`, `description`, `body`, `slug`, `firstname`, `lastname`) VALUES
(1, 4, 1, '1902-02-20', '1984-04-22', '', '', 'ansel_adams', 'Adams', 'Ansel'),
(2, 247, 2, '1952-03-11', '2001-05-11', '', '', 'douglas_adams', 'Adams', 'Douglas'),
(3, 4, 4, '1838-02-16', '1918-03-27', '', '', 'henry_adams', 'Adams', 'Henry'),
(4, 4, 3, '1735-10-30', '1826-07-04', '', '', 'john_adams', 'Adams', 'John');

-- --------------------------------------------------------

--
-- Table structure for table `nationality`
--

CREATE TABLE IF NOT EXISTS `nationality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=248 ;

--
-- Dumping data for table `nationality`
--

INSERT INTO `nationality` (`id`, `name`, `country_code`) VALUES
(1, 'Afghanistan', 'AF'),
(2, 'Albania', 'AL'),
(3, 'Algeria', 'DZ'),
(4, 'American Samoa', 'DS'),
(5, 'Andorra', 'AD'),
(6, 'Angola', 'AO'),
(7, 'Anguilla', 'AI'),
(8, 'Antarctica', 'AQ'),
(9, 'Antigua and Barbuda', 'AG'),
(10, 'Argentina', 'AR'),
(11, 'Armenia', 'AM'),
(12, 'Aruba', 'AW'),
(13, 'Australia', 'AU'),
(14, 'Austria', 'AT'),
(15, 'Azerbaijan', 'AZ'),
(16, 'Bahamas', 'BS'),
(17, 'Bahrain', 'BH'),
(18, 'Bangladesh', 'BD'),
(19, 'Barbados', 'BB'),
(20, 'Belarus', 'BY'),
(21, 'Belgium', 'BE'),
(22, 'Belize', 'BZ'),
(23, 'Benin', 'BJ'),
(24, 'Bermuda', 'BM'),
(25, 'Bhutan', 'BT'),
(26, 'Bolivia', 'BO'),
(27, 'Bosnia and Herzegovina', 'BA'),
(28, 'Botswana', 'BW'),
(29, 'Bouvet Island', 'BV'),
(30, 'Brazil', 'BR'),
(31, 'British Indian Ocean Territory', 'IO'),
(32, 'Brunei Darussalam', 'BN'),
(33, 'Bulgaria', 'BG'),
(34, 'Burkina Faso', 'BF'),
(35, 'Burundi', 'BI'),
(36, 'Cambodia', 'KH'),
(37, 'Cameroon', 'CM'),
(38, 'Canada', 'CA'),
(39, 'Cape Verde', 'CV'),
(40, 'Cayman Islands', 'KY'),
(41, 'Central African Republic', 'CF'),
(42, 'Chad', 'TD'),
(43, 'Chile', 'CL'),
(44, 'China', 'CN'),
(45, 'Christmas Island', 'CX'),
(46, 'Cocos (Keeling) Islands', 'CC'),
(47, 'Colombia', 'CO'),
(48, 'Comoros', 'KM'),
(49, 'Congo', 'CG'),
(50, 'Cook Islands', 'CK'),
(51, 'Costa Rica', 'CR'),
(52, 'Croatia (Hrvatska)', 'HR'),
(53, 'Cuba', 'CU'),
(54, 'Cyprus', 'CY'),
(55, 'Czech Republic', 'CZ'),
(56, 'Denmark', 'DK'),
(57, 'Djibouti', 'DJ'),
(58, 'Dominica', 'DM'),
(59, 'Dominican Republic', 'DO'),
(60, 'East Timor', 'TP'),
(61, 'Ecuador', 'EC'),
(62, 'Egypt', 'EG'),
(63, 'El Salvador', 'SV'),
(64, 'Equatorial Guinea', 'GQ'),
(65, 'Eritrea', 'ER'),
(66, 'Estonia', 'EE'),
(67, 'Ethiopia', 'ET'),
(68, 'Falkland Islands (Malvinas)', 'FK'),
(69, 'Faroe Islands', 'FO'),
(70, 'Fiji', 'FJ'),
(71, 'Finland', 'FI'),
(72, 'France', 'FR'),
(73, 'France, Metropolitan', 'FX'),
(74, 'French Guiana', 'GF'),
(75, 'French Polynesia', 'PF'),
(76, 'French Southern Territories', 'TF'),
(77, 'Gabon', 'GA'),
(78, 'Gambia', 'GM'),
(79, 'Georgia', 'GE'),
(80, 'Germany', 'DE'),
(81, 'Ghana', 'GH'),
(82, 'Gibraltar', 'GI'),
(83, 'Guernsey', 'GK'),
(84, 'Greece', 'GR'),
(85, 'Greenland', 'GL'),
(86, 'Grenada', 'GD'),
(87, 'Guadeloupe', 'GP'),
(88, 'Guam', 'GU'),
(89, 'Guatemala', 'GT'),
(90, 'Guinea', 'GN'),
(91, 'Guinea-Bissau', 'GW'),
(92, 'Guyana', 'GY'),
(93, 'Haiti', 'HT'),
(94, 'Heard and Mc Donald Islands', 'HM'),
(95, 'Honduras', 'HN'),
(96, 'Hong Kong', 'HK'),
(97, 'Hungary', 'HU'),
(98, 'Iceland', 'IS'),
(99, 'India', 'IN'),
(100, 'Isle of Man', 'IM'),
(101, 'Indonesia', 'ID'),
(102, 'Iran (Islamic Republic of)', 'IR'),
(103, 'Iraq', 'IQ'),
(104, 'Ireland', 'IE'),
(105, 'Israel', 'IL'),
(106, 'Italy', 'IT'),
(107, 'Ivory Coast', 'CI'),
(108, 'Jersey', 'JE'),
(109, 'Jamaica', 'JM'),
(110, 'Japan', 'JP'),
(111, 'Jordan', 'JO'),
(112, 'Kazakhstan', 'KZ'),
(113, 'Kenya', 'KE'),
(114, 'Kiribati', 'KI'),
(115, 'Korea, Democratic People''s Republic of', 'KP'),
(116, 'Korea, Republic of', 'KR'),
(117, 'Kosovo', 'XK'),
(118, 'Kuwait', 'KW'),
(119, 'Kyrgyzstan', 'KG'),
(120, 'Lao People''s Democratic Republic', 'LA'),
(121, 'Latvia', 'LV'),
(122, 'Lebanon', 'LB'),
(123, 'Lesotho', 'LS'),
(124, 'Liberia', 'LR'),
(125, 'Libyan Arab Jamahiriya', 'LY'),
(126, 'Liechtenstein', 'LI'),
(127, 'Lithuania', 'LT'),
(128, 'Luxembourg', 'LU'),
(129, 'Macau', 'MO'),
(130, 'Macedonia', 'MK'),
(131, 'Madagascar', 'MG'),
(132, 'Malawi', 'MW'),
(133, 'Malaysia', 'MY'),
(134, 'Maldives', 'MV'),
(135, 'Mali', 'ML'),
(136, 'Malta', 'MT'),
(137, 'Marshall Islands', 'MH'),
(138, 'Martinique', 'MQ'),
(139, 'Mauritania', 'MR'),
(140, 'Mauritius', 'MU'),
(141, 'Mayotte', 'TY'),
(142, 'Mexico', 'MX'),
(143, 'Micronesia, Federated States of', 'FM'),
(144, 'Moldova, Republic of', 'MD'),
(145, 'Monaco', 'MC'),
(146, 'Mongolia', 'MN'),
(147, 'Montenegro', 'ME'),
(148, 'Montserrat', 'MS'),
(149, 'Morocco', 'MA'),
(150, 'Mozambique', 'MZ'),
(151, 'Myanmar', 'MM'),
(152, 'Namibia', 'NA'),
(153, 'Nauru', 'NR'),
(154, 'Nepal', 'NP'),
(155, 'Netherlands', 'NL'),
(156, 'Netherlands Antilles', 'AN'),
(157, 'New Caledonia', 'NC'),
(158, 'New Zealand', 'NZ'),
(159, 'Nicaragua', 'NI'),
(160, 'Niger', 'NE'),
(161, 'Nigeria', 'NG'),
(162, 'Niue', 'NU'),
(163, 'Norfolk Island', 'NF'),
(164, 'Northern Mariana Islands', 'MP'),
(165, 'Norway', 'NO'),
(166, 'Oman', 'OM'),
(167, 'Pakistan', 'PK'),
(168, 'Palau', 'PW'),
(169, 'Palestine', 'PS'),
(170, 'Panama', 'PA'),
(171, 'Papua New Guinea', 'PG'),
(172, 'Paraguay', 'PY'),
(173, 'Peru', 'PE'),
(174, 'Philippines', 'PH'),
(175, 'Pitcairn', 'PN'),
(176, 'Poland', 'PL'),
(177, 'Portugal', 'PT'),
(178, 'Puerto Rico', 'PR'),
(179, 'Qatar', 'QA'),
(180, 'Reunion', 'RE'),
(181, 'Romania', 'RO'),
(182, 'Russian Federation', 'RU'),
(183, 'Rwanda', 'RW'),
(184, 'Saint Kitts and Nevis', 'KN'),
(185, 'Saint Lucia', 'LC'),
(186, 'Saint Vincent and the Grenadines', 'VC'),
(187, 'Samoa', 'WS'),
(188, 'San Marino', 'SM'),
(189, 'Sao Tome and Principe', 'ST'),
(190, 'Saudi Arabia', 'SA'),
(191, 'Senegal', 'SN'),
(192, 'Serbia', 'RS'),
(193, 'Seychelles', 'SC'),
(194, 'Sierra Leone', 'SL'),
(195, 'Singapore', 'SG'),
(196, 'Slovakia', 'SK'),
(197, 'Slovenia', 'SI'),
(198, 'Solomon Islands', 'SB'),
(199, 'Somalia', 'SO'),
(200, 'South Africa', 'ZA'),
(201, 'South Georgia South Sandwich Islands', 'GS'),
(202, 'Spain', 'ES'),
(203, 'Sri Lanka', 'LK'),
(204, 'St. Helena', 'SH'),
(205, 'St. Pierre and Miquelon', 'PM'),
(206, 'Sudan', 'SD'),
(207, 'Suriname', 'SR'),
(208, 'Svalbard and Jan Mayen Islands', 'SJ'),
(209, 'Swaziland', 'SZ'),
(210, 'Sweden', 'SE'),
(211, 'Switzerland', 'CH'),
(212, 'Syrian Arab Republic', 'SY'),
(213, 'Taiwan', 'TW'),
(214, 'Tajikistan', 'TJ'),
(215, 'Tanzania, United Republic of', 'TZ'),
(216, 'Thailand', 'TH'),
(217, 'Togo', 'TG'),
(218, 'Tokelau', 'TK'),
(219, 'Tonga', 'TO'),
(220, 'Trinidad and Tobago', 'TT'),
(221, 'Tunisia', 'TN'),
(222, 'Turkey', 'TR'),
(223, 'Turkmenistan', 'TM'),
(224, 'Turks and Caicos Islands', 'TC'),
(225, 'Tuvalu', 'TV'),
(226, 'Uganda', 'UG'),
(227, 'Ukraine', 'UA'),
(228, 'United Arab Emirates', 'AE'),
(229, 'United Kingdom', 'GB'),
(230, 'United States', 'US'),
(231, 'United States minor outlying islands', 'UM'),
(232, 'Uruguay', 'UY'),
(233, 'Uzbekistan', 'UZ'),
(234, 'Vanuatu', 'VU'),
(235, 'Vatican City State', 'VA'),
(236, 'Venezuela', 'VE'),
(237, 'Vietnam', 'VN'),
(238, 'Virgin Islands (British)', 'VG'),
(239, 'Virgin Islands (U.S.)', 'VI'),
(240, 'Wallis and Futuna Islands', 'WF'),
(241, 'Western Sahara', 'EH'),
(242, 'Yemen', 'YE'),
(243, 'Yugoslavia', 'YU'),
(244, 'Zaire', 'ZR'),
(245, 'Zambia', 'ZM'),
(246, 'Zimbabwe', 'ZW'),
(247, 'English', 'EN');

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

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `name`) VALUES
(1, 'Photographer'),
(2, 'Writer'),
(3, 'President'),
(4, 'Historian');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authors`
--
ALTER TABLE `authors`
  ADD CONSTRAINT `authors_ibfk_1` FOREIGN KEY (`nationality_id`) REFERENCES `nationality` (`id`),
  ADD CONSTRAINT `authors_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
