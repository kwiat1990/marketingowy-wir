-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `about`;
CREATE TABLE `about` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `about` (`id`, `title`, `published_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'O mnie',	'2020-12-04 14:34:29',	1,	1,	'2020-12-04 14:34:26',	'2020-12-04 14:34:29');

DROP TABLE IF EXISTS `about_components`;
CREATE TABLE `about_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `component_id` int(11) NOT NULL,
  `about_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `about_id_fk` (`about_id`),
  CONSTRAINT `about_id_fk` FOREIGN KEY (`about_id`) REFERENCES `about` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `about_components` (`id`, `field`, `order`, `component_type`, `component_id`, `about_id`) VALUES
(1,	'content',	1,	'components_content_image_texts',	1,	1);

DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `lead` longtext COLLATE utf8mb4_unicode_ci,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `articles` (`id`, `title`, `slug`, `category`, `lead`, `published_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Lorem ipsum dolor sit amet 1',	'lorem-ipsum-dolor-sit-amet-1',	2,	'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.',	'2020-12-04 14:37:18',	1,	1,	'2020-12-04 14:37:06',	'2020-12-05 15:46:55'),
(2,	'Lorem ipsum dolor sit amet 2',	'lorem-ipsum-dolor-sit-amet-2',	1,	'At vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi',	'2020-12-04 14:38:28',	1,	1,	'2020-12-04 14:38:13',	'2020-12-05 16:56:27'),
(3,	'Lorem ipsum dolor sit amet 3',	'lorem-ipsum-dolor-sit-amet-3',	3,	'Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua',	'2020-12-04 14:39:46',	1,	1,	'2020-12-04 14:39:39',	'2020-12-04 14:39:46'),
(4,	'Lorem ipsum dolor sit amet 4',	'lorem-ipsum-dolor-sit-amet-4',	1,	'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',	'2020-12-04 14:40:24',	1,	1,	'2020-12-04 14:40:21',	'2020-12-04 14:40:24'),
(5,	'Lorem ipsum dolor sit amet 5',	'lorem-ipsum-dolor-sit-amet-5',	4,	'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.',	'2020-12-04 14:41:06',	1,	1,	'2020-12-04 14:41:03',	'2020-12-04 14:41:06'),
(6,	'Lorem ipsum dolor sit amet 6',	'lorem-ipsum-dolor-sit-amet-6',	4,	'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',	'2020-12-04 14:41:58',	1,	1,	'2020-12-04 14:41:55',	'2020-12-04 14:41:58');

DROP TABLE IF EXISTS `articles_components`;
CREATE TABLE `articles_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `component_id` int(11) NOT NULL,
  `article_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id_fk` (`article_id`),
  CONSTRAINT `article_id_fk` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `articles_components` (`id`, `field`, `order`, `component_type`, `component_id`, `article_id`) VALUES
(1,	'content',	1,	'components_content_image_texts',	2,	1),
(2,	'content',	2,	'components_content_image_texts',	3,	1),
(3,	'content',	1,	'components_content_image_texts',	4,	2),
(4,	'content',	1,	'components_content_image_texts',	5,	3),
(5,	'content',	2,	'components_content_image_texts',	6,	3),
(6,	'content',	1,	'components_content_image_texts',	7,	4),
(7,	'content',	1,	'components_content_image_texts',	8,	5),
(8,	'content',	1,	'components_content_image_texts',	9,	6),
(9,	'content',	2,	'components_content_image_texts',	10,	6);

DROP TABLE IF EXISTS `articles_tags__tags_articles`;
CREATE TABLE `articles_tags__tags_articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `articles_tags__tags_articles` (`id`, `tag_id`, `article_id`) VALUES
(1,	1,	1),
(2,	4,	1),
(3,	2,	2),
(4,	4,	2),
(5,	2,	3),
(6,	1,	3),
(7,	2,	4),
(8,	2,	5),
(9,	3,	6),
(10,	4,	6);

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `name`, `slug`, `published_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Business',	'business',	'2020-12-04 14:29:47',	1,	1,	'2020-12-04 14:29:45',	'2020-12-04 14:29:47'),
(2,	'Marketing',	'marketing',	'2020-12-04 14:30:04',	1,	1,	'2020-12-04 14:30:03',	'2020-12-04 14:30:04'),
(3,	'Conferences',	'conferences',	'2020-12-04 14:30:19',	1,	1,	'2020-12-04 14:30:17',	'2020-12-04 14:30:19'),
(4,	'Tips and tricks',	'tips-and-tricks',	'2020-12-04 14:30:35',	1,	1,	'2020-12-04 14:30:31',	'2020-12-04 14:30:35');

DROP TABLE IF EXISTS `components_content_image_texts`;
CREATE TABLE `components_content_image_texts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `components_content_image_texts` (`id`, `text`) VALUES
(1,	'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. \n\nDuis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. \n\nUt wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. '),
(2,	'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. [At vero eos et accusam et justo duo dolores et ea rebum](https://google.com). Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.* Lorem ipsum dolor sit amet*, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. **Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet**. \n\n> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. \n\n- Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. \n- Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis. \n- At vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. '),
(3,	'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. \n\nUt wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. '),
(4,	'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. [At vero eos et accusam et justo duo dolores et ea rebum](https://google.com). Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.* Lorem ipsum dolor sit amet*, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. **Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet**. \n\n> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. \n\n- Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. \n- Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis. \n- At vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. '),
(5,	'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. [At vero eos et accusam et justo duo dolores et ea rebum](https://google.com). Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.* Lorem ipsum dolor sit amet*, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. **Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet**. \n\n> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. \n\n- Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. \n- Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis. \n- At vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. '),
(6,	'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. [At vero eos et accusam et justo duo dolores et ea rebum](https://google.com). Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.* Lorem ipsum dolor sit amet*, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. **Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet**. \n\n> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. \n\n- Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. \n- Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis. \n- At vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. '),
(7,	'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. [At vero eos et accusam et justo duo dolores et ea rebum](https://google.com). Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.* Lorem ipsum dolor sit amet*, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. **Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet**. \n\n> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. \n\n- Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. \n- Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis. \n- At vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. '),
(8,	'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. [At vero eos et accusam et justo duo dolores et ea rebum](https://google.com). Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.* Lorem ipsum dolor sit amet*, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. **Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet**. \n\n> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. \n\n- Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. \n- Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis. \n- At vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. '),
(9,	'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. [At vero eos et accusam et justo duo dolores et ea rebum](https://google.com). Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.* Lorem ipsum dolor sit amet*, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. **Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet**. \n\n> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. \n\n- Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. \n- Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis. \n- At vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. '),
(10,	'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. [At vero eos et accusam et justo duo dolores et ea rebum](https://google.com). Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.* Lorem ipsum dolor sit amet*, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. **Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet**. \n\n> Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. \n\n- Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. \n- Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis. \n- At vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. ');

DROP TABLE IF EXISTS `components_link_page_links`;
CREATE TABLE `components_link_page_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isInternal` tinyint(1) DEFAULT NULL,
  `iconCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `components_link_page_links` (`id`, `label`, `title`, `url`, `isInternal`, `iconCode`) VALUES
(1,	'Polityka prywatności',	'Polityka prywatności',	'/privacy',	1,	NULL),
(2,	'Lorem',	'Lorem ipsum',	'/',	1,	NULL),
(3,	'Facebook',	'Facebook',	'/',	0,	'facebook'),
(4,	'Instagram',	'Instagram',	'/',	0,	'instagram');

DROP TABLE IF EXISTS `core_store`;
CREATE TABLE `core_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `environment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `core_store` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
(1,	'model_def_strapi::core-store',	'{\"uid\":\"strapi::core-store\",\"collectionName\":\"core_store\",\"info\":{\"name\":\"core_store\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"key\":{\"type\":\"string\"},\"value\":{\"type\":\"text\"},\"type\":{\"type\":\"string\"},\"environment\":{\"type\":\"string\"},\"tag\":{\"type\":\"string\"}}}',	'object',	NULL,	NULL),
(2,	'model_def_content.image-text',	'{\"uid\":\"content.image-text\",\"collectionName\":\"components_content_image_texts\",\"info\":{\"name\":\"Image-Text\",\"icon\":\"image\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"image\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"text\":{\"type\":\"richtext\"}}}',	'object',	NULL,	NULL),
(3,	'model_def_link.page-link',	'{\"uid\":\"link.page-link\",\"collectionName\":\"components_link_page_links\",\"info\":{\"name\":\"page-link\",\"icon\":\"link\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"label\":{\"type\":\"string\"},\"title\":{\"type\":\"string\"},\"url\":{\"type\":\"string\"},\"isInternal\":{\"type\":\"boolean\",\"default\":false},\"iconCode\":{\"type\":\"string\"}}}',	'object',	NULL,	NULL),
(4,	'model_def_application::about.about',	'{\"uid\":\"application::about.about\",\"collectionName\":\"about\",\"kind\":\"singleType\",\"info\":{\"name\":\"About\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"content\":{\"type\":\"dynamiczone\",\"components\":[\"content.image-text\"]},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}',	'object',	NULL,	NULL),
(5,	'model_def_application::article.article',	'{\"uid\":\"application::article.article\",\"collectionName\":\"articles\",\"kind\":\"collectionType\",\"info\":{\"name\":\"article\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"slug\":{\"type\":\"string\"},\"cover\":{\"model\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"plugin\":\"upload\",\"required\":false},\"category\":{\"model\":\"category\",\"via\":\"articles\"},\"lead\":{\"type\":\"text\",\"maxLength\":350},\"tags\":{\"collection\":\"tag\",\"via\":\"articles\",\"attribute\":\"tag\",\"column\":\"id\",\"isVirtual\":true},\"content\":{\"type\":\"dynamiczone\",\"components\":[\"content.image-text\"]},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}',	'object',	NULL,	NULL),
(6,	'model_def_application::category.category',	'{\"uid\":\"application::category.category\",\"collectionName\":\"categories\",\"kind\":\"collectionType\",\"info\":{\"name\":\"category\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"articles\":{\"via\":\"category\",\"collection\":\"article\",\"isVirtual\":true},\"slug\":{\"type\":\"string\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}',	'object',	NULL,	NULL),
(7,	'model_def_application::footer.footer',	'{\"uid\":\"application::footer.footer\",\"collectionName\":\"footers\",\"kind\":\"singleType\",\"info\":{\"name\":\"Footer\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"copyright\":{\"type\":\"string\"},\"links\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"link.page-link\"},\"socialIcons\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"link.page-link\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}',	'object',	NULL,	NULL),
(8,	'model_def_application::tag.tag',	'{\"uid\":\"application::tag.tag\",\"collectionName\":\"tags\",\"kind\":\"collectionType\",\"info\":{\"name\":\"tag\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":true},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"articles\":{\"via\":\"tags\",\"collection\":\"article\",\"dominant\":true,\"attribute\":\"article\",\"column\":\"id\",\"isVirtual\":true},\"slug\":{\"type\":\"string\"},\"published_at\":{\"type\":\"datetime\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}',	'object',	NULL,	NULL),
(9,	'model_def_strapi::webhooks',	'{\"uid\":\"strapi::webhooks\",\"collectionName\":\"strapi_webhooks\",\"info\":{\"name\":\"Strapi webhooks\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"name\":{\"type\":\"string\"},\"url\":{\"type\":\"text\"},\"headers\":{\"type\":\"json\"},\"events\":{\"type\":\"json\"},\"enabled\":{\"type\":\"boolean\"}}}',	'object',	NULL,	NULL),
(10,	'model_def_strapi::permission',	'{\"uid\":\"strapi::permission\",\"collectionName\":\"strapi_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Permission\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"fields\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"model\":\"role\",\"plugin\":\"admin\"}}}',	'object',	NULL,	NULL),
(11,	'model_def_strapi::role',	'{\"uid\":\"strapi::role\",\"collectionName\":\"strapi_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Role\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"collection\":\"user\",\"via\":\"roles\",\"plugin\":\"admin\",\"attribute\":\"user\",\"column\":\"id\",\"isVirtual\":true},\"permissions\":{\"configurable\":false,\"plugin\":\"admin\",\"collection\":\"permission\",\"via\":\"role\",\"isVirtual\":true}}}',	'object',	NULL,	NULL),
(12,	'model_def_strapi::user',	'{\"uid\":\"strapi::user\",\"collectionName\":\"strapi_administrator\",\"kind\":\"collectionType\",\"info\":{\"name\":\"User\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"collection\":\"role\",\"collectionName\":\"strapi_users_roles\",\"via\":\"users\",\"dominant\":true,\"plugin\":\"admin\",\"configurable\":false,\"private\":true,\"attribute\":\"role\",\"column\":\"id\",\"isVirtual\":true},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true}}}',	'object',	NULL,	NULL),
(13,	'model_def_plugins::upload.file',	'{\"uid\":\"plugins::upload.file\",\"collectionName\":\"upload_file\",\"kind\":\"collectionType\",\"info\":{\"name\":\"file\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}',	'object',	NULL,	NULL),
(14,	'model_def_plugins::users-permissions.permission',	'{\"uid\":\"plugins::users-permissions.permission\",\"collectionName\":\"users-permissions_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"permission\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"type\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"controller\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"enabled\":{\"type\":\"boolean\",\"required\":true,\"configurable\":false},\"policy\":{\"type\":\"string\",\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"permissions\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}',	'object',	NULL,	NULL),
(15,	'model_def_plugins::users-permissions.role',	'{\"uid\":\"plugins::users-permissions.role\",\"collectionName\":\"users-permissions_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"role\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"collection\":\"permission\",\"via\":\"role\",\"plugin\":\"users-permissions\",\"configurable\":false,\"isVirtual\":true},\"users\":{\"collection\":\"user\",\"via\":\"role\",\"configurable\":false,\"plugin\":\"users-permissions\",\"isVirtual\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}',	'object',	NULL,	NULL),
(16,	'model_def_plugins::users-permissions.user',	'{\"uid\":\"plugins::users-permissions.user\",\"collectionName\":\"users-permissions_user\",\"kind\":\"collectionType\",\"info\":{\"name\":\"user\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"users\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"private\":true}}}',	'object',	NULL,	NULL),
(17,	'plugin_upload_settings',	'{\"sizeOptimization\":true,\"responsiveDimensions\":true}',	'object',	'development',	''),
(18,	'plugin_content_manager_configuration_content_types::application::article.article',	'{\"uid\":\"application::article.article\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"Slug\",\"description\":\"\",\"placeholder\":\"This value is generated automatically based on title\",\"visible\":true,\"editable\":false},\"list\":{\"label\":\"Slug\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}},\"cover\":{\"edit\":{\"label\":\"Cover\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Cover\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Title\",\"searchable\":true,\"sortable\":true}},\"tags\":{\"edit\":{\"label\":\"Tags\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Tags\",\"searchable\":false,\"sortable\":false}},\"content\":{\"edit\":{\"label\":\"Content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Content\",\"searchable\":false,\"sortable\":false}},\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"lead\":{\"edit\":{\"label\":\"Lead\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Lead\",\"searchable\":true,\"sortable\":true}},\"category\":{\"edit\":{\"label\":\"Category\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Category\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"title\",\"slug\",\"cover\"],\"editRelations\":[\"category\",\"tags\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"slug\",\"size\":6}],[{\"name\":\"cover\",\"size\":6},{\"name\":\"lead\",\"size\":6}],[{\"name\":\"content\",\"size\":12}]]}}',	'object',	'',	''),
(19,	'plugin_content_manager_configuration_content_types::application::about.about',	'{\"uid\":\"application::about.about\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Title\",\"searchable\":true,\"sortable\":true}},\"content\":{\"edit\":{\"label\":\"Content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Content\",\"searchable\":false,\"sortable\":false}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"published_at\",\"created_at\"],\"editRelations\":[],\"edit\":[[{\"name\":\"title\",\"size\":6}],[{\"name\":\"content\",\"size\":12}]]}}',	'object',	'',	''),
(20,	'plugin_content_manager_configuration_content_types::application::category.category',	'{\"uid\":\"application::category.category\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"articles\":{\"edit\":{\"label\":\"Articles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"Articles\",\"searchable\":false,\"sortable\":false}},\"slug\":{\"edit\":{\"label\":\"Slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Slug\",\"searchable\":true,\"sortable\":true}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"slug\",\"published_at\"],\"editRelations\":[\"articles\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"slug\",\"size\":6}]]}}',	'object',	'',	''),
(21,	'plugin_content_manager_configuration_content_types::application::footer.footer',	'{\"uid\":\"application::footer.footer\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"copyright\",\"defaultSortBy\":\"copyright\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"copyright\":{\"edit\":{\"label\":\"Copyright\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Copyright\",\"searchable\":true,\"sortable\":true}},\"links\":{\"edit\":{\"label\":\"Links\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Links\",\"searchable\":false,\"sortable\":false}},\"socialIcons\":{\"edit\":{\"label\":\"SocialIcons\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"SocialIcons\",\"searchable\":false,\"sortable\":false}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"copyright\",\"published_at\",\"created_at\"],\"editRelations\":[],\"edit\":[[{\"name\":\"copyright\",\"size\":6}],[{\"name\":\"links\",\"size\":12}],[{\"name\":\"socialIcons\",\"size\":12}]]}}',	'object',	'',	''),
(22,	'plugin_content_manager_configuration_content_types::application::tag.tag',	'{\"uid\":\"application::tag.tag\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"articles\":{\"edit\":{\"label\":\"Articles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"Articles\",\"searchable\":false,\"sortable\":false}},\"slug\":{\"edit\":{\"label\":\"Slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Slug\",\"searchable\":true,\"sortable\":true}},\"published_at\":{\"edit\":{\"label\":\"Published_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Published_at\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"slug\",\"published_at\"],\"editRelations\":[\"articles\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"slug\",\"size\":6}]]}}',	'object',	'',	''),
(23,	'plugin_content_manager_configuration_content_types::strapi::permission',	'{\"uid\":\"strapi::permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"subject\":{\"edit\":{\"label\":\"Subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Subject\",\"searchable\":true,\"sortable\":true}},\"fields\":{\"edit\":{\"label\":\"Fields\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Fields\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"Conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"created_at\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"subject\",\"size\":6}],[{\"name\":\"fields\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}]]}}',	'object',	'',	''),
(24,	'plugin_content_manager_configuration_content_types::strapi::role',	'{\"uid\":\"strapi::role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"Code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"editRelations\":[\"users\",\"permissions\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6}]]}}',	'object',	'',	''),
(25,	'plugin_users-permissions_grant',	'{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/instagram/callback\"},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"enabled\":false,\"icon\":\"linkedin\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"enabled\":false,\"icon\":\"aws\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]}}',	'object',	'',	''),
(26,	'plugin_content_manager_configuration_content_types::plugins::upload.file',	'{\"uid\":\"plugins::upload.file\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"AlternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"AlternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"Caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"Width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"Height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"Formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"Hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"Ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"Mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"Size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"Url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"PreviewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PreviewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"Provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider_metadata\",\"searchable\":false,\"sortable\":false}},\"related\":{\"edit\":{\"label\":\"Related\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"Related\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"editRelations\":[\"related\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}]]}}',	'object',	'',	''),
(27,	'plugin_content_manager_configuration_content_types::plugins::users-permissions.permission',	'{\"uid\":\"plugins::users-permissions.permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"type\",\"defaultSortBy\":\"type\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"controller\":{\"edit\":{\"label\":\"Controller\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Controller\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"enabled\":{\"edit\":{\"label\":\"Enabled\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Enabled\",\"searchable\":true,\"sortable\":true}},\"policy\":{\"edit\":{\"label\":\"Policy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Policy\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"type\",\"controller\",\"action\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"type\",\"size\":6},{\"name\":\"controller\",\"size\":6}],[{\"name\":\"action\",\"size\":6},{\"name\":\"enabled\",\"size\":4}],[{\"name\":\"policy\",\"size\":6}]]}}',	'object',	'',	''),
(28,	'plugin_content_manager_configuration_content_types::plugins::users-permissions.user',	'{\"uid\":\"plugins::users-permissions.user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"ConfirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ConfirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"Confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4}]]}}',	'object',	'',	''),
(29,	'plugin_content_manager_configuration_content_types::plugins::users-permissions.role',	'{\"uid\":\"plugins::users-permissions.role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"type\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"editRelations\":[\"permissions\",\"users\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6}]]}}',	'object',	'',	''),
(30,	'plugin_content_manager_configuration_content_types::strapi::user',	'{\"uid\":\"strapi::user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"Firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"Lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"RegistrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"RegistrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"IsActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"IsActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"Roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"editRelations\":[\"roles\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"resetPasswordToken\",\"size\":6}],[{\"name\":\"registrationToken\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4}]]}}',	'object',	'',	''),
(31,	'plugin_users-permissions_email',	'{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}',	'object',	'',	''),
(32,	'plugin_content_manager_configuration_components::content.image-text',	'{\"uid\":\"content.image-text\",\"isComponent\":true,\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":false,\"sortable\":false}},\"image\":{\"edit\":{\"label\":\"Image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Image\",\"searchable\":false,\"sortable\":false}},\"text\":{\"edit\":{\"label\":\"Text\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Text\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"image\"],\"edit\":[[{\"name\":\"image\",\"size\":6}],[{\"name\":\"text\",\"size\":12}]],\"editRelations\":[]}}',	'object',	'',	''),
(33,	'plugin_content_manager_configuration_components::link.page-link',	'{\"uid\":\"link.page-link\",\"isComponent\":true,\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"label\",\"defaultSortBy\":\"label\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":false,\"sortable\":false}},\"label\":{\"edit\":{\"label\":\"Label\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Label\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Title\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"Url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Url\",\"searchable\":true,\"sortable\":true}},\"isInternal\":{\"edit\":{\"label\":\"IsInternal\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"IsInternal\",\"searchable\":true,\"sortable\":true}},\"iconCode\":{\"edit\":{\"label\":\"IconCode\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"IconCode\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"label\",\"title\",\"url\"],\"edit\":[[{\"name\":\"label\",\"size\":6},{\"name\":\"title\",\"size\":6}],[{\"name\":\"url\",\"size\":6},{\"name\":\"isInternal\",\"size\":4}],[{\"name\":\"iconCode\",\"size\":6}]],\"editRelations\":[]}}',	'object',	'',	''),
(34,	'plugin_users-permissions_advanced',	'{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_reset_password\":null,\"email_confirmation_redirection\":null,\"default_role\":\"authenticated\"}',	'object',	'',	'');

DROP TABLE IF EXISTS `footers`;
CREATE TABLE `footers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `copyright` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `footers` (`id`, `copyright`, `published_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'Copyright © 2020 Marketingowy wir. Wszelkie prawa zastrzeżone.',	'2020-12-04 14:47:10',	1,	1,	'2020-12-04 14:32:41',	'2020-12-04 14:47:10');

DROP TABLE IF EXISTS `footers_components`;
CREATE TABLE `footers_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `component_id` int(11) NOT NULL,
  `footer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `footer_id_fk` (`footer_id`),
  CONSTRAINT `footer_id_fk` FOREIGN KEY (`footer_id`) REFERENCES `footers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `footers_components` (`id`, `field`, `order`, `component_type`, `component_id`, `footer_id`) VALUES
(1,	'links',	1,	'components_link_page_links',	1,	1),
(2,	'links',	2,	'components_link_page_links',	2,	1),
(3,	'socialIcons',	1,	'components_link_page_links',	3,	1),
(4,	'socialIcons',	2,	'components_link_page_links',	4,	1);

DROP TABLE IF EXISTS `strapi_administrator`;
CREATE TABLE `strapi_administrator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resetPasswordToken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registrationToken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_administrator_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `strapi_administrator` (`id`, `firstname`, `lastname`, `username`, `email`, `password`, `resetPasswordToken`, `registrationToken`, `isActive`, `blocked`) VALUES
(1,	'Mateusz',	'Kwiatkowski',	NULL,	'kwiat1990@gmail.com',	'$2a$10$N7soId8N5yj3JrqUb26KOuZLxfg/ZshcWvh4UXNYTwyyGHE2RrQ86',	NULL,	NULL,	1,	NULL);

DROP TABLE IF EXISTS `strapi_permission`;
CREATE TABLE `strapi_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fields` longtext COLLATE utf8mb4_unicode_ci,
  `conditions` longtext COLLATE utf8mb4_unicode_ci,
  `role` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `strapi_permission` (`id`, `action`, `subject`, `fields`, `conditions`, `role`, `created_at`, `updated_at`) VALUES
(1,	'plugins::content-manager.explorer.create',	'application::about.about',	'[\"title\",\"content\"]',	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(2,	'plugins::content-manager.explorer.create',	'application::article.article',	'[\"title\",\"slug\",\"cover\",\"category\",\"lead\",\"tags\",\"content\"]',	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(3,	'plugins::content-manager.explorer.create',	'application::category.category',	'[\"name\",\"articles\",\"slug\"]',	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(4,	'plugins::content-manager.explorer.create',	'application::footer.footer',	'[\"copyright\",\"links.label\",\"links.title\",\"links.url\",\"links.isInternal\",\"links.iconCode\",\"socialIcons.label\",\"socialIcons.title\",\"socialIcons.url\",\"socialIcons.isInternal\",\"socialIcons.iconCode\"]',	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(5,	'plugins::content-manager.explorer.create',	'application::tag.tag',	'[\"name\",\"articles\",\"slug\"]',	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(6,	'plugins::content-manager.explorer.read',	'application::category.category',	'[\"name\",\"articles\",\"slug\"]',	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(7,	'plugins::content-manager.explorer.read',	'application::footer.footer',	'[\"copyright\",\"links.label\",\"links.title\",\"links.url\",\"links.isInternal\",\"links.iconCode\",\"socialIcons.label\",\"socialIcons.title\",\"socialIcons.url\",\"socialIcons.isInternal\",\"socialIcons.iconCode\"]',	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(8,	'plugins::content-manager.explorer.read',	'application::article.article',	'[\"title\",\"slug\",\"cover\",\"category\",\"lead\",\"tags\",\"content\"]',	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(9,	'plugins::content-manager.explorer.read',	'application::about.about',	'[\"title\",\"content\"]',	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(10,	'plugins::content-manager.explorer.read',	'application::tag.tag',	'[\"name\",\"articles\",\"slug\"]',	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(11,	'plugins::content-manager.explorer.update',	'application::about.about',	'[\"title\",\"content\"]',	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(12,	'plugins::content-manager.explorer.update',	'application::article.article',	'[\"title\",\"slug\",\"cover\",\"category\",\"lead\",\"tags\",\"content\"]',	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(13,	'plugins::content-manager.explorer.update',	'application::category.category',	'[\"name\",\"articles\",\"slug\"]',	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(14,	'plugins::content-manager.explorer.update',	'application::footer.footer',	'[\"copyright\",\"links.label\",\"links.title\",\"links.url\",\"links.isInternal\",\"links.iconCode\",\"socialIcons.label\",\"socialIcons.title\",\"socialIcons.url\",\"socialIcons.isInternal\",\"socialIcons.iconCode\"]',	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(15,	'plugins::content-manager.explorer.update',	'application::tag.tag',	'[\"name\",\"articles\",\"slug\"]',	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(16,	'plugins::content-manager.explorer.delete',	'application::article.article',	NULL,	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(17,	'plugins::content-manager.explorer.delete',	'application::category.category',	NULL,	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(18,	'plugins::content-manager.explorer.delete',	'application::footer.footer',	NULL,	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(19,	'plugins::content-manager.explorer.delete',	'application::tag.tag',	NULL,	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(20,	'plugins::content-manager.explorer.delete',	'application::about.about',	NULL,	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(21,	'plugins::content-manager.explorer.publish',	'application::about.about',	NULL,	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(22,	'plugins::content-manager.explorer.publish',	'application::article.article',	NULL,	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(23,	'plugins::content-manager.explorer.publish',	'application::category.category',	NULL,	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(24,	'plugins::content-manager.explorer.publish',	'application::footer.footer',	NULL,	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(25,	'plugins::content-manager.explorer.publish',	'application::tag.tag',	NULL,	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(26,	'plugins::upload.read',	NULL,	NULL,	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(27,	'plugins::upload.assets.create',	NULL,	NULL,	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(28,	'plugins::upload.assets.update',	NULL,	NULL,	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(29,	'plugins::upload.assets.download',	NULL,	NULL,	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(30,	'plugins::upload.assets.copy-link',	NULL,	NULL,	'[]',	2,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(31,	'plugins::content-manager.explorer.create',	'application::about.about',	'[\"title\",\"content\"]',	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(32,	'plugins::content-manager.explorer.create',	'application::article.article',	'[\"title\",\"slug\",\"cover\",\"category\",\"lead\",\"tags\",\"content\"]',	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(33,	'plugins::content-manager.explorer.create',	'application::category.category',	'[\"name\",\"articles\",\"slug\"]',	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(34,	'plugins::content-manager.explorer.create',	'application::footer.footer',	'[\"copyright\",\"links.label\",\"links.title\",\"links.url\",\"links.isInternal\",\"links.iconCode\",\"socialIcons.label\",\"socialIcons.title\",\"socialIcons.url\",\"socialIcons.isInternal\",\"socialIcons.iconCode\"]',	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(35,	'plugins::content-manager.explorer.read',	'application::about.about',	'[\"title\",\"content\"]',	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(36,	'plugins::content-manager.explorer.create',	'application::tag.tag',	'[\"name\",\"articles\",\"slug\"]',	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(37,	'plugins::content-manager.explorer.read',	'application::article.article',	'[\"title\",\"slug\",\"cover\",\"category\",\"lead\",\"tags\",\"content\"]',	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(38,	'plugins::content-manager.explorer.read',	'application::category.category',	'[\"name\",\"articles\",\"slug\"]',	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(39,	'plugins::content-manager.explorer.read',	'application::footer.footer',	'[\"copyright\",\"links.label\",\"links.title\",\"links.url\",\"links.isInternal\",\"links.iconCode\",\"socialIcons.label\",\"socialIcons.title\",\"socialIcons.url\",\"socialIcons.isInternal\",\"socialIcons.iconCode\"]',	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(40,	'plugins::content-manager.explorer.read',	'application::tag.tag',	'[\"name\",\"articles\",\"slug\"]',	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(41,	'plugins::content-manager.explorer.update',	'application::about.about',	'[\"title\",\"content\"]',	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(42,	'plugins::content-manager.explorer.update',	'application::article.article',	'[\"title\",\"slug\",\"cover\",\"category\",\"lead\",\"tags\",\"content\"]',	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(43,	'plugins::content-manager.explorer.update',	'application::category.category',	'[\"name\",\"articles\",\"slug\"]',	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(44,	'plugins::content-manager.explorer.update',	'application::footer.footer',	'[\"copyright\",\"links.label\",\"links.title\",\"links.url\",\"links.isInternal\",\"links.iconCode\",\"socialIcons.label\",\"socialIcons.title\",\"socialIcons.url\",\"socialIcons.isInternal\",\"socialIcons.iconCode\"]',	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(45,	'plugins::content-manager.explorer.update',	'application::tag.tag',	'[\"name\",\"articles\",\"slug\"]',	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(46,	'plugins::content-manager.explorer.delete',	'application::about.about',	NULL,	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(47,	'plugins::content-manager.explorer.delete',	'application::article.article',	NULL,	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(48,	'plugins::content-manager.explorer.delete',	'application::category.category',	NULL,	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(49,	'plugins::content-manager.explorer.delete',	'application::footer.footer',	NULL,	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(50,	'plugins::content-manager.explorer.delete',	'application::tag.tag',	NULL,	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(51,	'plugins::upload.read',	NULL,	NULL,	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(52,	'plugins::upload.assets.create',	NULL,	NULL,	'[]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(53,	'plugins::upload.assets.update',	NULL,	NULL,	'[\"admin::is-creator\"]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(54,	'plugins::upload.assets.download',	NULL,	NULL,	'[]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(55,	'plugins::upload.assets.copy-link',	NULL,	NULL,	'[]',	3,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(56,	'plugins::content-manager.explorer.create',	'application::about.about',	'[\"title\",\"content\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(57,	'plugins::content-manager.explorer.create',	'application::article.article',	'[\"title\",\"slug\",\"cover\",\"category\",\"lead\",\"tags\",\"content\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(58,	'plugins::content-manager.explorer.create',	'application::category.category',	'[\"name\",\"articles\",\"slug\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(59,	'plugins::content-manager.explorer.create',	'application::footer.footer',	'[\"copyright\",\"links.label\",\"links.title\",\"links.url\",\"links.isInternal\",\"links.iconCode\",\"socialIcons.label\",\"socialIcons.title\",\"socialIcons.url\",\"socialIcons.isInternal\",\"socialIcons.iconCode\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(60,	'plugins::content-manager.explorer.create',	'application::tag.tag',	'[\"name\",\"articles\",\"slug\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(61,	'plugins::content-manager.explorer.create',	'plugins::users-permissions.user',	'[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(62,	'plugins::content-manager.explorer.read',	'application::about.about',	'[\"title\",\"content\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(63,	'plugins::content-manager.explorer.read',	'application::article.article',	'[\"title\",\"slug\",\"cover\",\"category\",\"lead\",\"tags\",\"content\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(64,	'plugins::content-manager.explorer.read',	'application::category.category',	'[\"name\",\"articles\",\"slug\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(65,	'plugins::content-manager.explorer.read',	'application::footer.footer',	'[\"copyright\",\"links.label\",\"links.title\",\"links.url\",\"links.isInternal\",\"links.iconCode\",\"socialIcons.label\",\"socialIcons.title\",\"socialIcons.url\",\"socialIcons.isInternal\",\"socialIcons.iconCode\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(66,	'plugins::content-manager.explorer.read',	'application::tag.tag',	'[\"name\",\"articles\",\"slug\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(67,	'plugins::content-manager.explorer.read',	'plugins::users-permissions.user',	'[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(68,	'plugins::content-manager.explorer.update',	'application::about.about',	'[\"title\",\"content\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(69,	'plugins::content-manager.explorer.update',	'application::article.article',	'[\"title\",\"slug\",\"cover\",\"category\",\"lead\",\"tags\",\"content\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(70,	'plugins::content-manager.explorer.update',	'application::category.category',	'[\"name\",\"articles\",\"slug\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(71,	'plugins::content-manager.explorer.update',	'application::footer.footer',	'[\"copyright\",\"links.label\",\"links.title\",\"links.url\",\"links.isInternal\",\"links.iconCode\",\"socialIcons.label\",\"socialIcons.title\",\"socialIcons.url\",\"socialIcons.isInternal\",\"socialIcons.iconCode\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(72,	'plugins::content-manager.explorer.update',	'application::tag.tag',	'[\"name\",\"articles\",\"slug\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(73,	'plugins::content-manager.explorer.delete',	'application::about.about',	NULL,	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(74,	'plugins::content-manager.explorer.delete',	'application::article.article',	NULL,	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(75,	'plugins::content-manager.explorer.update',	'plugins::users-permissions.user',	'[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]',	'[]',	1,	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(76,	'plugins::content-manager.explorer.delete',	'application::category.category',	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(77,	'plugins::content-manager.explorer.delete',	'application::footer.footer',	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(78,	'plugins::content-manager.explorer.delete',	'application::tag.tag',	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(79,	'plugins::content-manager.explorer.delete',	'plugins::users-permissions.user',	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(80,	'plugins::content-manager.explorer.publish',	'application::about.about',	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(81,	'plugins::content-manager.explorer.publish',	'application::category.category',	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(82,	'plugins::content-manager.explorer.publish',	'application::article.article',	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(83,	'plugins::content-manager.explorer.publish',	'application::footer.footer',	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(84,	'plugins::content-manager.explorer.publish',	'application::tag.tag',	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(85,	'plugins::content-type-builder.read',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(86,	'plugins::upload.read',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(87,	'plugins::upload.assets.create',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(88,	'plugins::upload.assets.update',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(89,	'plugins::upload.assets.download',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(90,	'plugins::upload.assets.copy-link',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(91,	'plugins::upload.settings.read',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(92,	'plugins::content-manager.single-types.configure-view',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(93,	'plugins::content-manager.collection-types.configure-view',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(94,	'plugins::content-manager.components.configure-layout',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(95,	'plugins::users-permissions.roles.create',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(96,	'plugins::users-permissions.roles.read',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(97,	'plugins::users-permissions.roles.update',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(98,	'plugins::users-permissions.roles.delete',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(99,	'plugins::users-permissions.providers.read',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(100,	'plugins::users-permissions.providers.update',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(101,	'plugins::users-permissions.email-templates.read',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(102,	'plugins::users-permissions.email-templates.update',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(103,	'plugins::users-permissions.advanced-settings.read',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(104,	'plugins::users-permissions.advanced-settings.update',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(105,	'admin::marketplace.read',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(106,	'admin::marketplace.plugins.install',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(107,	'admin::marketplace.plugins.uninstall',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(108,	'admin::webhooks.create',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(109,	'admin::webhooks.read',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(110,	'admin::webhooks.update',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(111,	'admin::webhooks.delete',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(112,	'admin::users.create',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(113,	'admin::users.read',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(114,	'admin::users.update',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(115,	'admin::users.delete',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(116,	'admin::roles.create',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(117,	'admin::roles.read',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(118,	'admin::roles.update',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02'),
(119,	'admin::roles.delete',	NULL,	NULL,	'[]',	1,	'2020-12-04 14:15:02',	'2020-12-04 14:15:02');

DROP TABLE IF EXISTS `strapi_role`;
CREATE TABLE `strapi_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_role_name_unique` (`name`),
  UNIQUE KEY `strapi_role_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `strapi_role` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
(1,	'Super Admin',	'strapi-super-admin',	'Super Admins can access and manage all features and settings.',	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(2,	'Editor',	'strapi-editor',	'Editors can manage and publish contents including those of other users.',	'2020-12-04 14:15:01',	'2020-12-04 14:15:01'),
(3,	'Author',	'strapi-author',	'Authors can manage the content they have created.',	'2020-12-04 14:15:01',	'2020-12-04 14:15:01');

DROP TABLE IF EXISTS `strapi_users_roles`;
CREATE TABLE `strapi_users_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `strapi_users_roles` (`id`, `user_id`, `role_id`) VALUES
(1,	1,	1);

DROP TABLE IF EXISTS `strapi_webhooks`;
CREATE TABLE `strapi_webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci,
  `headers` longtext COLLATE utf8mb4_unicode_ci,
  `events` longtext COLLATE utf8mb4_unicode_ci,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tags` (`id`, `name`, `slug`, `published_at`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'GoogleUpdates',	'googleupdates',	'2020-12-04 14:30:58',	1,	1,	'2020-12-04 14:30:55',	'2020-12-04 14:30:58'),
(2,	'WorkLifeBalance',	'worklifebalance',	'2020-12-04 14:31:19',	1,	1,	'2020-12-04 14:31:06',	'2020-12-04 14:31:19'),
(3,	'SEA',	'sea',	'2020-12-04 14:31:16',	1,	1,	'2020-12-04 14:31:12',	'2020-12-04 14:31:16'),
(4,	'SEO',	'seo',	'2020-12-04 14:31:25',	1,	1,	'2020-12-04 14:31:23',	'2020-12-04 14:31:25');

DROP TABLE IF EXISTS `upload_file`;
CREATE TABLE `upload_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alternativeText` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext COLLATE utf8mb4_unicode_ci,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` decimal(10,2) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `previewUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_metadata` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `upload_file` (`id`, `name`, `alternativeText`, `caption`, `width`, `height`, `formats`, `hash`, `ext`, `mime`, `size`, `url`, `previewUrl`, `provider`, `provider_metadata`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1,	'demo2.jpg',	'Lorem ipsum',	'Caption',	1280,	853,	'{\"thumbnail\":{\"name\":\"thumbnail_demo2.jpg\",\"hash\":\"thumbnail_demo2_d212515ddd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":234,\"height\":156,\"size\":7.04,\"path\":null,\"url\":\"/uploads/thumbnail_demo2_d212515ddd.jpg\"},\"large\":{\"name\":\"large_demo2.jpg\",\"hash\":\"large_demo2_d212515ddd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":1000,\"height\":666,\"size\":66.8,\"path\":null,\"url\":\"/uploads/large_demo2_d212515ddd.jpg\"},\"medium\":{\"name\":\"medium_demo2.jpg\",\"hash\":\"medium_demo2_d212515ddd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":750,\"height\":500,\"size\":40.59,\"path\":null,\"url\":\"/uploads/medium_demo2_d212515ddd.jpg\"},\"small\":{\"name\":\"small_demo2.jpg\",\"hash\":\"small_demo2_d212515ddd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":500,\"height\":333,\"size\":21.29,\"path\":null,\"url\":\"/uploads/small_demo2_d212515ddd.jpg\"}}',	'demo2_d212515ddd',	'.jpg',	'image/jpeg',	109.79,	'/uploads/demo2_d212515ddd.jpg',	NULL,	'local',	NULL,	1,	1,	'2020-12-04 14:33:27',	'2020-12-04 14:35:49'),
(2,	'demo1.jpg',	'Lorem ipsum ',	'Caption',	1280,	853,	'{\"thumbnail\":{\"name\":\"thumbnail_demo1.jpg\",\"hash\":\"thumbnail_demo1_a5edd6fb1d\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":234,\"height\":156,\"size\":6.31,\"path\":null,\"url\":\"/uploads/thumbnail_demo1_a5edd6fb1d.jpg\"},\"large\":{\"name\":\"large_demo1.jpg\",\"hash\":\"large_demo1_a5edd6fb1d\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":1000,\"height\":666,\"size\":62.5,\"path\":null,\"url\":\"/uploads/large_demo1_a5edd6fb1d.jpg\"},\"medium\":{\"name\":\"medium_demo1.jpg\",\"hash\":\"medium_demo1_a5edd6fb1d\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":750,\"height\":500,\"size\":37.45,\"path\":null,\"url\":\"/uploads/medium_demo1_a5edd6fb1d.jpg\"},\"small\":{\"name\":\"small_demo1.jpg\",\"hash\":\"small_demo1_a5edd6fb1d\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":500,\"height\":333,\"size\":19.15,\"path\":null,\"url\":\"/uploads/small_demo1_a5edd6fb1d.jpg\"}}',	'demo1_a5edd6fb1d',	'.jpg',	'image/jpeg',	105.04,	'/uploads/demo1_a5edd6fb1d.jpg',	NULL,	'local',	NULL,	1,	1,	'2020-12-04 14:33:27',	'2020-12-04 15:00:56'),
(3,	'demo0.jpg',	'Lorem Ipsum',	'Caption',	1280,	853,	'{\"thumbnail\":{\"name\":\"thumbnail_demo0.jpg\",\"hash\":\"thumbnail_demo0_9b755f3dd4\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":234,\"height\":156,\"size\":7.84,\"path\":null,\"url\":\"/uploads/thumbnail_demo0_9b755f3dd4.jpg\"},\"large\":{\"name\":\"large_demo0.jpg\",\"hash\":\"large_demo0_9b755f3dd4\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":1000,\"height\":666,\"size\":73.19,\"path\":null,\"url\":\"/uploads/large_demo0_9b755f3dd4.jpg\"},\"medium\":{\"name\":\"medium_demo0.jpg\",\"hash\":\"medium_demo0_9b755f3dd4\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":750,\"height\":500,\"size\":45.79,\"path\":null,\"url\":\"/uploads/medium_demo0_9b755f3dd4.jpg\"},\"small\":{\"name\":\"small_demo0.jpg\",\"hash\":\"small_demo0_9b755f3dd4\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":500,\"height\":333,\"size\":24.25,\"path\":null,\"url\":\"/uploads/small_demo0_9b755f3dd4.jpg\"}}',	'demo0_9b755f3dd4',	'.jpg',	'image/jpeg',	116.86,	'/uploads/demo0_9b755f3dd4.jpg',	NULL,	'local',	NULL,	1,	1,	'2020-12-04 14:33:27',	'2020-12-04 14:39:09'),
(4,	'demo4.jpg',	'',	'',	1280,	853,	'{\"thumbnail\":{\"name\":\"thumbnail_demo4.jpg\",\"hash\":\"thumbnail_demo4_1a8419e9dd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":234,\"height\":156,\"size\":8.98,\"path\":null,\"url\":\"/uploads/thumbnail_demo4_1a8419e9dd.jpg\"},\"large\":{\"name\":\"large_demo4.jpg\",\"hash\":\"large_demo4_1a8419e9dd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":1000,\"height\":666,\"size\":86.87,\"path\":null,\"url\":\"/uploads/large_demo4_1a8419e9dd.jpg\"},\"medium\":{\"name\":\"medium_demo4.jpg\",\"hash\":\"medium_demo4_1a8419e9dd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":750,\"height\":500,\"size\":52.8,\"path\":null,\"url\":\"/uploads/medium_demo4_1a8419e9dd.jpg\"},\"small\":{\"name\":\"small_demo4.jpg\",\"hash\":\"small_demo4_1a8419e9dd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":500,\"height\":333,\"size\":27.49,\"path\":null,\"url\":\"/uploads/small_demo4_1a8419e9dd.jpg\"}}',	'demo4_1a8419e9dd',	'.jpg',	'image/jpeg',	141.95,	'/uploads/demo4_1a8419e9dd.jpg',	NULL,	'local',	NULL,	1,	1,	'2020-12-04 14:33:27',	'2020-12-04 14:33:27'),
(5,	'demo3.jpg',	'Lore ipsum',	'Caption',	1600,	1067,	'{\"thumbnail\":{\"name\":\"thumbnail_demo3.jpg\",\"hash\":\"thumbnail_demo3_aa8dfb9659\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":234,\"height\":156,\"size\":4.2,\"path\":null,\"url\":\"/uploads/thumbnail_demo3_aa8dfb9659.jpg\"},\"large\":{\"name\":\"large_demo3.jpg\",\"hash\":\"large_demo3_aa8dfb9659\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":1000,\"height\":667,\"size\":38.88,\"path\":null,\"url\":\"/uploads/large_demo3_aa8dfb9659.jpg\"},\"medium\":{\"name\":\"medium_demo3.jpg\",\"hash\":\"medium_demo3_aa8dfb9659\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":750,\"height\":500,\"size\":24.15,\"path\":null,\"url\":\"/uploads/medium_demo3_aa8dfb9659.jpg\"},\"small\":{\"name\":\"small_demo3.jpg\",\"hash\":\"small_demo3_aa8dfb9659\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":500,\"height\":333,\"size\":12.9,\"path\":null,\"url\":\"/uploads/small_demo3_aa8dfb9659.jpg\"}}',	'demo3_aa8dfb9659',	'.jpg',	'image/jpeg',	77.23,	'/uploads/demo3_aa8dfb9659.jpg',	NULL,	'local',	NULL,	1,	1,	'2020-12-05 15:39:49',	'2020-12-05 15:39:49');

DROP TABLE IF EXISTS `upload_file_morph`;
CREATE TABLE `upload_file_morph` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext COLLATE utf8mb4_unicode_ci,
  `field` longtext COLLATE utf8mb4_unicode_ci,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `upload_file_morph` (`id`, `upload_file_id`, `related_id`, `related_type`, `field`, `order`) VALUES
(1,	1,	1,	'components_content_image_texts',	'image',	1),
(7,	3,	6,	'components_content_image_texts',	'image',	1),
(8,	3,	3,	'articles',	'cover',	1),
(9,	2,	4,	'articles',	'cover',	1),
(10,	2,	5,	'articles',	'cover',	1),
(11,	1,	10,	'components_content_image_texts',	'image',	1),
(12,	4,	6,	'articles',	'cover',	1),
(15,	5,	3,	'components_content_image_texts',	'image',	1),
(16,	5,	1,	'articles',	'cover',	1),
(17,	4,	2,	'articles',	'cover',	1);

DROP TABLE IF EXISTS `users-permissions_permission`;
CREATE TABLE `users-permissions_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users-permissions_permission` (`id`, `type`, `controller`, `action`, `enabled`, `policy`, `role`, `created_by`, `updated_by`) VALUES
(1,	'application',	'about',	'delete',	0,	'',	1,	NULL,	NULL),
(2,	'application',	'about',	'delete',	0,	'',	2,	NULL,	NULL),
(3,	'application',	'about',	'find',	0,	'',	1,	NULL,	NULL),
(4,	'application',	'about',	'find',	1,	'',	2,	NULL,	NULL),
(5,	'application',	'about',	'update',	0,	'',	1,	NULL,	NULL),
(6,	'application',	'about',	'update',	0,	'',	2,	NULL,	NULL),
(7,	'application',	'article',	'count',	0,	'',	1,	NULL,	NULL),
(8,	'application',	'article',	'count',	0,	'',	2,	NULL,	NULL),
(9,	'application',	'article',	'create',	0,	'',	1,	NULL,	NULL),
(10,	'application',	'article',	'create',	0,	'',	2,	NULL,	NULL),
(11,	'application',	'article',	'delete',	0,	'',	1,	NULL,	NULL),
(12,	'application',	'article',	'delete',	0,	'',	2,	NULL,	NULL),
(13,	'application',	'article',	'find',	0,	'',	1,	NULL,	NULL),
(14,	'application',	'article',	'find',	1,	'',	2,	NULL,	NULL),
(15,	'application',	'article',	'findone',	0,	'',	1,	NULL,	NULL),
(16,	'application',	'article',	'findone',	1,	'',	2,	NULL,	NULL),
(17,	'application',	'article',	'update',	0,	'',	1,	NULL,	NULL),
(18,	'application',	'article',	'update',	0,	'',	2,	NULL,	NULL),
(19,	'application',	'category',	'count',	0,	'',	1,	NULL,	NULL),
(20,	'application',	'category',	'count',	0,	'',	2,	NULL,	NULL),
(21,	'application',	'category',	'create',	0,	'',	1,	NULL,	NULL),
(22,	'application',	'category',	'create',	0,	'',	2,	NULL,	NULL),
(23,	'application',	'category',	'delete',	0,	'',	1,	NULL,	NULL),
(24,	'application',	'category',	'delete',	0,	'',	2,	NULL,	NULL),
(25,	'application',	'category',	'find',	0,	'',	1,	NULL,	NULL),
(26,	'application',	'category',	'find',	1,	'',	2,	NULL,	NULL),
(27,	'application',	'category',	'findone',	0,	'',	1,	NULL,	NULL),
(28,	'application',	'category',	'findone',	1,	'',	2,	NULL,	NULL),
(29,	'application',	'category',	'update',	0,	'',	1,	NULL,	NULL),
(30,	'application',	'category',	'update',	0,	'',	2,	NULL,	NULL),
(31,	'application',	'footer',	'delete',	0,	'',	1,	NULL,	NULL),
(32,	'application',	'footer',	'delete',	0,	'',	2,	NULL,	NULL),
(33,	'application',	'footer',	'find',	0,	'',	1,	NULL,	NULL),
(34,	'application',	'footer',	'find',	1,	'',	2,	NULL,	NULL),
(35,	'application',	'footer',	'update',	0,	'',	1,	NULL,	NULL),
(36,	'application',	'footer',	'update',	0,	'',	2,	NULL,	NULL),
(37,	'application',	'tag',	'count',	0,	'',	1,	NULL,	NULL),
(38,	'application',	'tag',	'count',	0,	'',	2,	NULL,	NULL),
(39,	'application',	'tag',	'create',	0,	'',	1,	NULL,	NULL),
(40,	'application',	'tag',	'create',	0,	'',	2,	NULL,	NULL),
(41,	'application',	'tag',	'delete',	0,	'',	1,	NULL,	NULL),
(42,	'application',	'tag',	'delete',	0,	'',	2,	NULL,	NULL),
(43,	'application',	'tag',	'find',	0,	'',	1,	NULL,	NULL),
(44,	'application',	'tag',	'find',	1,	'',	2,	NULL,	NULL),
(45,	'application',	'tag',	'findone',	0,	'',	1,	NULL,	NULL),
(46,	'application',	'tag',	'findone',	1,	'',	2,	NULL,	NULL),
(47,	'application',	'tag',	'update',	0,	'',	1,	NULL,	NULL),
(48,	'application',	'tag',	'update',	0,	'',	2,	NULL,	NULL),
(49,	'content-manager',	'components',	'findcomponent',	0,	'',	1,	NULL,	NULL),
(50,	'content-manager',	'components',	'findcomponent',	0,	'',	2,	NULL,	NULL),
(51,	'content-manager',	'components',	'listcomponents',	0,	'',	1,	NULL,	NULL),
(52,	'content-manager',	'components',	'listcomponents',	0,	'',	2,	NULL,	NULL),
(53,	'content-manager',	'components',	'updatecomponent',	0,	'',	1,	NULL,	NULL),
(54,	'content-manager',	'components',	'updatecomponent',	0,	'',	2,	NULL,	NULL),
(55,	'content-manager',	'contentmanager',	'checkuidavailability',	0,	'',	1,	NULL,	NULL),
(56,	'content-manager',	'contentmanager',	'checkuidavailability',	0,	'',	2,	NULL,	NULL),
(57,	'content-manager',	'contentmanager',	'count',	0,	'',	1,	NULL,	NULL),
(58,	'content-manager',	'contentmanager',	'count',	0,	'',	2,	NULL,	NULL),
(59,	'content-manager',	'contentmanager',	'create',	0,	'',	1,	NULL,	NULL),
(60,	'content-manager',	'contentmanager',	'create',	0,	'',	2,	NULL,	NULL),
(61,	'content-manager',	'contentmanager',	'delete',	0,	'',	1,	NULL,	NULL),
(62,	'content-manager',	'contentmanager',	'delete',	0,	'',	2,	NULL,	NULL),
(63,	'content-manager',	'contentmanager',	'deletemany',	0,	'',	1,	NULL,	NULL),
(64,	'content-manager',	'contentmanager',	'deletemany',	0,	'',	2,	NULL,	NULL),
(65,	'content-manager',	'contentmanager',	'find',	0,	'',	1,	NULL,	NULL),
(66,	'content-manager',	'contentmanager',	'find',	0,	'',	2,	NULL,	NULL),
(67,	'content-manager',	'contentmanager',	'findone',	0,	'',	1,	NULL,	NULL),
(68,	'content-manager',	'contentmanager',	'findone',	0,	'',	2,	NULL,	NULL),
(69,	'content-manager',	'contentmanager',	'findrelationlist',	0,	'',	1,	NULL,	NULL),
(70,	'content-manager',	'contentmanager',	'findrelationlist',	0,	'',	2,	NULL,	NULL),
(71,	'content-manager',	'contentmanager',	'generateuid',	0,	'',	1,	NULL,	NULL),
(72,	'content-manager',	'contentmanager',	'generateuid',	0,	'',	2,	NULL,	NULL),
(73,	'content-manager',	'contentmanager',	'publish',	0,	'',	1,	NULL,	NULL),
(74,	'content-manager',	'contentmanager',	'publish',	0,	'',	2,	NULL,	NULL),
(75,	'content-manager',	'contentmanager',	'unpublish',	0,	'',	1,	NULL,	NULL),
(76,	'content-manager',	'contentmanager',	'unpublish',	0,	'',	2,	NULL,	NULL),
(77,	'content-manager',	'contentmanager',	'update',	0,	'',	1,	NULL,	NULL),
(78,	'content-manager',	'contentmanager',	'update',	0,	'',	2,	NULL,	NULL),
(79,	'content-manager',	'contenttypes',	'findcontenttype',	0,	'',	1,	NULL,	NULL),
(80,	'content-manager',	'contenttypes',	'findcontenttype',	0,	'',	2,	NULL,	NULL),
(81,	'content-manager',	'contenttypes',	'listcontenttypes',	0,	'',	1,	NULL,	NULL),
(82,	'content-manager',	'contenttypes',	'listcontenttypes',	0,	'',	2,	NULL,	NULL),
(83,	'content-manager',	'contenttypes',	'updatecontenttype',	0,	'',	1,	NULL,	NULL),
(84,	'content-manager',	'contenttypes',	'updatecontenttype',	0,	'',	2,	NULL,	NULL),
(85,	'content-type-builder',	'builder',	'getreservednames',	0,	'',	1,	NULL,	NULL),
(86,	'content-type-builder',	'builder',	'getreservednames',	0,	'',	2,	NULL,	NULL),
(87,	'content-type-builder',	'componentcategories',	'deletecategory',	0,	'',	1,	NULL,	NULL),
(88,	'content-type-builder',	'componentcategories',	'deletecategory',	0,	'',	2,	NULL,	NULL),
(89,	'content-type-builder',	'componentcategories',	'editcategory',	0,	'',	1,	NULL,	NULL),
(90,	'content-type-builder',	'componentcategories',	'editcategory',	0,	'',	2,	NULL,	NULL),
(91,	'content-type-builder',	'components',	'createcomponent',	0,	'',	1,	NULL,	NULL),
(92,	'content-type-builder',	'components',	'createcomponent',	0,	'',	2,	NULL,	NULL),
(93,	'content-type-builder',	'components',	'deletecomponent',	0,	'',	1,	NULL,	NULL),
(94,	'content-type-builder',	'components',	'deletecomponent',	0,	'',	2,	NULL,	NULL),
(95,	'content-type-builder',	'components',	'getcomponent',	0,	'',	1,	NULL,	NULL),
(96,	'content-type-builder',	'components',	'getcomponent',	0,	'',	2,	NULL,	NULL),
(97,	'content-type-builder',	'components',	'getcomponents',	0,	'',	1,	NULL,	NULL),
(98,	'content-type-builder',	'components',	'getcomponents',	0,	'',	2,	NULL,	NULL),
(99,	'content-type-builder',	'components',	'updatecomponent',	0,	'',	1,	NULL,	NULL),
(100,	'content-type-builder',	'components',	'updatecomponent',	0,	'',	2,	NULL,	NULL),
(101,	'content-type-builder',	'connections',	'getconnections',	0,	'',	1,	NULL,	NULL),
(102,	'content-type-builder',	'connections',	'getconnections',	0,	'',	2,	NULL,	NULL),
(103,	'content-type-builder',	'contenttypes',	'createcontenttype',	0,	'',	1,	NULL,	NULL),
(104,	'content-type-builder',	'contenttypes',	'createcontenttype',	0,	'',	2,	NULL,	NULL),
(105,	'content-type-builder',	'contenttypes',	'deletecontenttype',	0,	'',	1,	NULL,	NULL),
(106,	'content-type-builder',	'contenttypes',	'deletecontenttype',	0,	'',	2,	NULL,	NULL),
(107,	'content-type-builder',	'contenttypes',	'getcontenttype',	0,	'',	1,	NULL,	NULL),
(108,	'content-type-builder',	'contenttypes',	'getcontenttype',	0,	'',	2,	NULL,	NULL),
(109,	'content-type-builder',	'contenttypes',	'getcontenttypes',	0,	'',	1,	NULL,	NULL),
(110,	'content-type-builder',	'contenttypes',	'getcontenttypes',	0,	'',	2,	NULL,	NULL),
(111,	'content-type-builder',	'contenttypes',	'updatecontenttype',	0,	'',	1,	NULL,	NULL),
(112,	'content-type-builder',	'contenttypes',	'updatecontenttype',	0,	'',	2,	NULL,	NULL),
(113,	'email',	'email',	'send',	0,	'',	1,	NULL,	NULL),
(114,	'email',	'email',	'send',	0,	'',	2,	NULL,	NULL),
(115,	'upload',	'upload',	'count',	0,	'',	1,	NULL,	NULL),
(116,	'upload',	'upload',	'count',	0,	'',	2,	NULL,	NULL),
(117,	'upload',	'upload',	'destroy',	0,	'',	1,	NULL,	NULL),
(118,	'upload',	'upload',	'destroy',	0,	'',	2,	NULL,	NULL),
(119,	'upload',	'upload',	'find',	0,	'',	1,	NULL,	NULL),
(120,	'upload',	'upload',	'find',	0,	'',	2,	NULL,	NULL),
(121,	'upload',	'upload',	'findone',	0,	'',	1,	NULL,	NULL),
(122,	'upload',	'upload',	'findone',	0,	'',	2,	NULL,	NULL),
(123,	'upload',	'upload',	'getsettings',	0,	'',	1,	NULL,	NULL),
(124,	'upload',	'upload',	'getsettings',	0,	'',	2,	NULL,	NULL),
(125,	'upload',	'upload',	'search',	0,	'',	1,	NULL,	NULL),
(126,	'upload',	'upload',	'search',	0,	'',	2,	NULL,	NULL),
(127,	'upload',	'upload',	'updatesettings',	0,	'',	1,	NULL,	NULL),
(128,	'upload',	'upload',	'updatesettings',	0,	'',	2,	NULL,	NULL),
(129,	'upload',	'upload',	'upload',	0,	'',	1,	NULL,	NULL),
(130,	'upload',	'upload',	'upload',	0,	'',	2,	NULL,	NULL),
(131,	'users-permissions',	'auth',	'callback',	0,	'',	1,	NULL,	NULL),
(132,	'users-permissions',	'auth',	'callback',	1,	'',	2,	NULL,	NULL),
(133,	'users-permissions',	'auth',	'connect',	1,	'',	1,	NULL,	NULL),
(134,	'users-permissions',	'auth',	'connect',	1,	'',	2,	NULL,	NULL),
(135,	'users-permissions',	'auth',	'emailconfirmation',	0,	'',	1,	NULL,	NULL),
(136,	'users-permissions',	'auth',	'emailconfirmation',	1,	'',	2,	NULL,	NULL),
(137,	'users-permissions',	'auth',	'forgotpassword',	0,	'',	1,	NULL,	NULL),
(138,	'users-permissions',	'auth',	'forgotpassword',	1,	'',	2,	NULL,	NULL),
(139,	'users-permissions',	'auth',	'register',	0,	'',	1,	NULL,	NULL),
(140,	'users-permissions',	'auth',	'register',	1,	'',	2,	NULL,	NULL),
(141,	'users-permissions',	'auth',	'resetpassword',	0,	'',	1,	NULL,	NULL),
(142,	'users-permissions',	'auth',	'resetpassword',	1,	'',	2,	NULL,	NULL),
(143,	'users-permissions',	'auth',	'sendemailconfirmation',	0,	'',	1,	NULL,	NULL),
(144,	'users-permissions',	'auth',	'sendemailconfirmation',	0,	'',	2,	NULL,	NULL),
(145,	'users-permissions',	'user',	'count',	0,	'',	1,	NULL,	NULL),
(146,	'users-permissions',	'user',	'count',	0,	'',	2,	NULL,	NULL),
(147,	'users-permissions',	'user',	'create',	0,	'',	1,	NULL,	NULL),
(148,	'users-permissions',	'user',	'create',	0,	'',	2,	NULL,	NULL),
(149,	'users-permissions',	'user',	'destroy',	0,	'',	1,	NULL,	NULL),
(150,	'users-permissions',	'user',	'destroy',	0,	'',	2,	NULL,	NULL),
(151,	'users-permissions',	'user',	'destroyall',	0,	'',	1,	NULL,	NULL),
(152,	'users-permissions',	'user',	'destroyall',	0,	'',	2,	NULL,	NULL),
(153,	'users-permissions',	'user',	'find',	0,	'',	1,	NULL,	NULL),
(154,	'users-permissions',	'user',	'find',	0,	'',	2,	NULL,	NULL),
(155,	'users-permissions',	'user',	'findone',	0,	'',	1,	NULL,	NULL),
(156,	'users-permissions',	'user',	'findone',	0,	'',	2,	NULL,	NULL),
(157,	'users-permissions',	'user',	'me',	1,	'',	1,	NULL,	NULL),
(158,	'users-permissions',	'user',	'me',	1,	'',	2,	NULL,	NULL),
(159,	'users-permissions',	'user',	'update',	0,	'',	1,	NULL,	NULL),
(160,	'users-permissions',	'user',	'update',	0,	'',	2,	NULL,	NULL),
(161,	'users-permissions',	'userspermissions',	'createrole',	0,	'',	1,	NULL,	NULL),
(162,	'users-permissions',	'userspermissions',	'createrole',	0,	'',	2,	NULL,	NULL),
(163,	'users-permissions',	'userspermissions',	'deleterole',	0,	'',	1,	NULL,	NULL),
(164,	'users-permissions',	'userspermissions',	'deleterole',	0,	'',	2,	NULL,	NULL),
(165,	'users-permissions',	'userspermissions',	'getadvancedsettings',	0,	'',	1,	NULL,	NULL),
(166,	'users-permissions',	'userspermissions',	'getadvancedsettings',	0,	'',	2,	NULL,	NULL),
(167,	'users-permissions',	'userspermissions',	'getemailtemplate',	0,	'',	1,	NULL,	NULL),
(168,	'users-permissions',	'userspermissions',	'getemailtemplate',	0,	'',	2,	NULL,	NULL),
(169,	'users-permissions',	'userspermissions',	'getpermissions',	0,	'',	1,	NULL,	NULL),
(170,	'users-permissions',	'userspermissions',	'getpermissions',	0,	'',	2,	NULL,	NULL),
(171,	'users-permissions',	'userspermissions',	'getpolicies',	0,	'',	1,	NULL,	NULL),
(172,	'users-permissions',	'userspermissions',	'getpolicies',	0,	'',	2,	NULL,	NULL),
(173,	'users-permissions',	'userspermissions',	'getproviders',	0,	'',	1,	NULL,	NULL),
(174,	'users-permissions',	'userspermissions',	'getproviders',	0,	'',	2,	NULL,	NULL),
(175,	'users-permissions',	'userspermissions',	'getrole',	0,	'',	1,	NULL,	NULL),
(176,	'users-permissions',	'userspermissions',	'getrole',	0,	'',	2,	NULL,	NULL),
(177,	'users-permissions',	'userspermissions',	'getroles',	0,	'',	1,	NULL,	NULL),
(178,	'users-permissions',	'userspermissions',	'getroles',	0,	'',	2,	NULL,	NULL),
(179,	'users-permissions',	'userspermissions',	'getroutes',	0,	'',	1,	NULL,	NULL),
(180,	'users-permissions',	'userspermissions',	'getroutes',	0,	'',	2,	NULL,	NULL),
(181,	'users-permissions',	'userspermissions',	'index',	0,	'',	1,	NULL,	NULL),
(182,	'users-permissions',	'userspermissions',	'index',	0,	'',	2,	NULL,	NULL),
(183,	'users-permissions',	'userspermissions',	'searchusers',	0,	'',	1,	NULL,	NULL),
(184,	'users-permissions',	'userspermissions',	'searchusers',	0,	'',	2,	NULL,	NULL),
(185,	'users-permissions',	'userspermissions',	'updateadvancedsettings',	0,	'',	1,	NULL,	NULL),
(186,	'users-permissions',	'userspermissions',	'updateemailtemplate',	0,	'',	1,	NULL,	NULL),
(187,	'users-permissions',	'userspermissions',	'updateadvancedsettings',	0,	'',	2,	NULL,	NULL),
(188,	'users-permissions',	'userspermissions',	'updateemailtemplate',	0,	'',	2,	NULL,	NULL),
(189,	'users-permissions',	'userspermissions',	'updateproviders',	0,	'',	1,	NULL,	NULL),
(190,	'users-permissions',	'userspermissions',	'updateproviders',	0,	'',	2,	NULL,	NULL),
(191,	'users-permissions',	'userspermissions',	'updaterole',	0,	'',	1,	NULL,	NULL),
(192,	'users-permissions',	'userspermissions',	'updaterole',	0,	'',	2,	NULL,	NULL);

DROP TABLE IF EXISTS `users-permissions_role`;
CREATE TABLE `users-permissions_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_role_type_unique` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users-permissions_role` (`id`, `name`, `description`, `type`, `created_by`, `updated_by`) VALUES
(1,	'Authenticated',	'Default role given to authenticated user.',	'authenticated',	NULL,	NULL),
(2,	'Public',	'Default role given to unauthenticated user.',	'public',	NULL,	NULL);

DROP TABLE IF EXISTS `users-permissions_user`;
CREATE TABLE `users-permissions_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resetPasswordToken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmationToken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_user_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 2020-12-05 17:42:02
