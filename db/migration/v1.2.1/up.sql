ALTER TABLE `orders` ADD `change` INTEGER NULL;

ALTER TABLE `addresses` ADD `coordinates` POINT;

ALTER TABLE `products` ADD `totalQuantity` INTEGER NULL;

ALTER TABLE `products` ADD `maxQuantityPerOrder` INTEGER;

ALTER TABLE `orders` DROP `locationLatitude`;

ALTER TABLE `orders` DROP `locationLongitude`;

ALTER TABLE `orders` ADD `coordinates` POINT;