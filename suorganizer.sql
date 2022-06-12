-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 11, 2022 at 04:50 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `suorganizer`
--
CREATE DATABASE IF NOT EXISTS `suorganizer` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `suorganizer`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add tag', 7, 'add_tag'),
(20, 'Can change tag', 7, 'change_tag'),
(21, 'Can delete tag', 7, 'delete_tag'),
(22, 'Can add startup', 8, 'add_startup'),
(23, 'Can change startup', 8, 'change_startup'),
(24, 'Can delete startup', 8, 'delete_startup'),
(25, 'Can add news link', 9, 'add_newslink'),
(26, 'Can change news link', 9, 'change_newslink'),
(27, 'Can delete news link', 9, 'delete_newslink'),
(28, 'Can add post', 10, 'add_post'),
(29, 'Can change post', 10, 'change_post'),
(30, 'Can delete post', 10, 'delete_post');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$20000$X9TIdeQKHrMj$INdfQgJxwAVjJ6+CPbFPAF1TarNw6g6l3XB7rAhUsoA=', '2022-06-08 05:19:26.488833', 1, 'ouma', '', '', 'oumabaros@gmail.com', 1, 1, '2022-06-08 05:19:00.703038');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
CREATE TABLE IF NOT EXISTS `blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(63) NOT NULL,
  `slug` varchar(63) NOT NULL,
  `text` longtext NOT NULL,
  `pub_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_2dbcba41` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_post`
--

INSERT INTO `blog_post` (`id`, `title`, `slug`, `text`, `pub_date`) VALUES
(1, 'Django Training', 'django-training', 'Learn Django in a classroom setting with Jambon Software.', '2022-05-07'),
(2, 'Django 1.0 Release', 'django-10-released', 'THE Web Framework.', '2008-09-03'),
(3, 'Django 1.0 Release', 'django-10-released', 'THE Web Framework.', '2008-09-03'),
(4, 'Django 1.0 Release', 'django-10-released', 'THE Web Framework.', '2008-09-03'),
(5, 'Django 1.0 Release', 'django-10-released', 'THE Web Framework.', '2008-09-03'),
(6, 'Django 1.0 Release', 'django-10-released', 'THE Web Framework.', '2008-09-03'),
(7, 'Django 1.0 Release', 'django-10-released', 'THE Web Framework.', '2008-09-03'),
(8, 'Simple Robots for Sale', 'simple-robots-for-sale', 'If only they would make spider bots.', '2011-02-21'),
(9, 'Django 1.0 Release', 'django-10-released', 'THE Web Framework.', '2008-09-03'),
(10, 'Simple Robots for Sale', 'simple-robots-for-sale', 'If only they would make spider bots.', '2011-02-21'),
(11, 'Django 1.0 Release', 'django-10-released', 'THE Web Framework.', '2008-09-03'),
(12, 'Simple Robots for Sale', 'simple-robots-for-sale', 'If only they would make spider bots.', '2011-02-21'),
(13, 'Django 1.0 Release', 'django-10-released', 'THE Web Framework.', '2008-09-03'),
(14, 'Simple Robots for Sale', 'simple-robots-for-sale', 'If only they would make spider bots.', '2011-02-21'),
(15, 'Django 1.0 Release', 'django-10-released', 'THE Web Framework.', '2008-09-03'),
(16, 'Simple Robots for Sale', 'simple-robots-for-sale', 'If only they would make spider bots.', '2011-02-21'),
(17, 'Django 1.0 Release', 'django-10-released', 'THE Web Framework.', '2008-09-03'),
(18, 'Simple Robots for Sale', 'simple-robots-for-sale', 'If only they would make spider bots.', '2011-02-21');

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_startups`
--

DROP TABLE IF EXISTS `blog_post_startups`;
CREATE TABLE IF NOT EXISTS `blog_post_startups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `startup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_id` (`post_id`,`startup_id`),
  KEY `blog_post_startups_f3aa1999` (`post_id`),
  KEY `blog_post_startups_99f77c8c` (`startup_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_post_startups`
--

INSERT INTO `blog_post_startups` (`id`, `post_id`, `startup_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_tags`
--

DROP TABLE IF EXISTS `blog_post_tags`;
CREATE TABLE IF NOT EXISTS `blog_post_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_id` (`post_id`,`tag_id`),
  KEY `blog_post_tags_f3aa1999` (`post_id`),
  KEY `blog_post_tags_76f094bc` (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_post_tags`
--

INSERT INTO `blog_post_tags` (`id`, `post_id`, `tag_id`) VALUES
(1, 1, 4),
(2, 2, 4),
(3, 3, 4),
(4, 4, 4),
(5, 5, 4),
(6, 6, 4),
(7, 7, 4),
(8, 7, 16),
(9, 7, 6),
(10, 8, 9),
(11, 8, 16),
(12, 9, 4),
(13, 9, 16),
(14, 9, 6),
(15, 10, 9),
(16, 10, 16),
(17, 11, 4),
(18, 11, 16),
(19, 11, 6),
(20, 12, 9),
(21, 12, 16),
(22, 13, 4),
(23, 13, 16),
(24, 13, 6),
(25, 14, 9),
(26, 14, 16),
(27, 15, 4),
(28, 15, 16),
(29, 15, 6),
(30, 16, 9),
(31, 16, 16),
(32, 17, 4),
(33, 17, 16),
(34, 17, 6),
(35, 18, 9),
(36, 18, 16);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_6c700f0debe77c14_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'organizer', 'tag'),
(8, 'organizer', 'startup'),
(9, 'organizer', 'newslink'),
(10, 'blog', 'post');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-06 13:39:51.114575'),
(2, 'auth', '0001_initial', '2022-05-06 13:39:52.936530'),
(3, 'admin', '0001_initial', '2022-05-06 13:39:53.327948'),
(4, 'contenttypes', '0002_remove_content_type_name', '2022-05-06 13:39:53.613139'),
(5, 'auth', '0002_alter_permission_name_max_length', '2022-05-06 13:39:53.750054'),
(6, 'auth', '0003_alter_user_email_max_length', '2022-05-06 13:39:53.899374'),
(7, 'auth', '0004_alter_user_username_opts', '2022-05-06 13:39:53.937349'),
(8, 'auth', '0005_alter_user_last_login_null', '2022-05-06 13:39:54.047281'),
(9, 'auth', '0006_require_contenttypes_0002', '2022-05-06 13:39:54.054278'),
(10, 'sessions', '0001_initial', '2022-05-06 13:39:54.263966'),
(11, 'organizer', '0001_initial', '2022-05-06 17:32:51.258941'),
(12, 'blog', '0001_initial', '2022-05-06 17:32:52.365099'),
(13, 'organizer', '0002_tag_data', '2022-06-05 06:38:42.905148'),
(16, 'organizer', '0003_startup_data', '2022-06-06 01:47:15.844500');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('83jjmuqhmovjfrxai8be4pumz0nib8qa', 'YmJlZTYwMDYxMWEzMWRkYmRlZTIzZGVkZTFjN2EyODRiMjkzYWFhMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZDc1OTFiN2Q4ZDRiYWQ4NTY5YzE2MDk2ZjdhNTk4ZGJmN2ZhM2I2In0=', '2022-06-22 05:19:26.495831');

-- --------------------------------------------------------

--
-- Table structure for table `organizer_newslink`
--

DROP TABLE IF EXISTS `organizer_newslink`;
CREATE TABLE IF NOT EXISTS `organizer_newslink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(63) NOT NULL,
  `pub_date` date NOT NULL,
  `link` varchar(255) NOT NULL,
  `startup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organizer_newslink_99f77c8c` (`startup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organizer_startup`
--

DROP TABLE IF EXISTS `organizer_startup`;
CREATE TABLE IF NOT EXISTS `organizer_startup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL,
  `slug` varchar(31) NOT NULL,
  `description` longtext NOT NULL,
  `founded_date` date NOT NULL,
  `contact` varchar(254) NOT NULL,
  `website` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `organizer_startup_b068931c` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organizer_startup`
--

INSERT INTO `organizer_startup` (`id`, `name`, `slug`, `description`, `founded_date`, `contact`, `website`) VALUES
(1, 'Jambon Software', 'jambon-software', 'Web and Mobile Consulting.\n\n Django Tutoring.\n', '2013-01-18', 'django@jambonsw.com', 'https://jambonsw.com/'),
(4, 'Arachnobots', 'arachnobots', 'Remote-controlled internet-enabled Spider Robots.', '2014-10-31', 'contact@arachnobots.com', 'http://frightenyourroommate.com/');

-- --------------------------------------------------------

--
-- Table structure for table `organizer_startup_tags`
--

DROP TABLE IF EXISTS `organizer_startup_tags`;
CREATE TABLE IF NOT EXISTS `organizer_startup_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startup_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `startup_id` (`startup_id`,`tag_id`),
  KEY `organizer_startup_tags_99f77c8c` (`startup_id`),
  KEY `organizer_startup_tags_76f094bc` (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organizer_startup_tags`
--

INSERT INTO `organizer_startup_tags` (`id`, `startup_id`, `tag_id`) VALUES
(1, 1, 4),
(6, 4, 5),
(7, 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `organizer_tag`
--

DROP TABLE IF EXISTS `organizer_tag`;
CREATE TABLE IF NOT EXISTS `organizer_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL,
  `slug` varchar(31) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organizer_tag`
--

INSERT INTO `organizer_tag` (`id`, `name`, `slug`) VALUES
(3, 'education', 'education'),
(4, 'django', 'django'),
(5, 'mobile', 'mobile'),
(6, 'web', 'web'),
(7, 'video games', 'video-games'),
(9, 'augmented reality', 'augmented-reality'),
(10, 'big data', 'big-data'),
(11, 'ipython', 'ipython'),
(12, 'javascript', 'javascript'),
(13, 'jupyter', 'jupyter'),
(14, 'node.js', 'node-js'),
(15, 'php', 'php'),
(16, 'python', 'python'),
(17, 'ruby on rails', 'ruby-on-rails'),
(18, 'ruby', 'ruby'),
(19, 'zend', 'zend');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
