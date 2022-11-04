DROP TABLE IF EXISTS `orderProductOptions`;

ALTER TABLE `orders` DROP `observation`;

ALTER TABLE `orderProducts` DROP `observation`;

ALTER TABLE `orders` ADD `active` tinyint(1) DEFAULT true;

ALTER TABLE `plans` DROP `productOptions`;

DROP TABLE IF EXISTS `productOptions`;

DROP TABLE IF EXISTS `productOptionsCategories`;

DROP TABLE IF EXISTS `orderProductOptions`;