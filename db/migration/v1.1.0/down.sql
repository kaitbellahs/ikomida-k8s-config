DROP TABLE IF EXISTS `orderProductOptions`;

ALTER TABLE `orders` DROP `observation`;

ALTER TABLE `orders` ADD `active` tinyint(1) DEFAULT '1';

ALTER TABLE `plans` DROP `productOptions`;

DROP TABLE IF EXISTS `productOptions`;

DROP TABLE IF EXISTS `productOptionsCategories`;

DROP TABLE IF EXISTS `orderProductOptions`;