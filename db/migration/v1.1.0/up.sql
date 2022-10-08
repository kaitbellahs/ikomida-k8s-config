ALTER TABLE `orders` ADD `observation` CHAR(255);

ALTER TABLE `orders` DROP `active`;
ALTER TABLE `plans` ADD `productOptions` INTEGER;

CREATE TABLE
    IF NOT EXISTS `productOptionsCategories` (
        `id` CHAR(36) BINARY NOT NULL,
        `name` CHAR(100),
        `image` VARCHAR(255),
        `highlighted` TINYINT(1) DEFAULT false,
        `min` INTEGER DEFAULT 0,
        `max` INTEGER DEFAULT 0,
        `order` INTEGER,
        `productId` CHAR(36) BINARY,
        `productCategoryId` CHAR(36) BINARY,
        `contractId` CHAR(36) BINARY,
        `createdAt` DATETIME NOT NULL,
        `updatedAt` DATETIME NOT NULL,
        `deletedAt` DATETIME,
        PRIMARY KEY (`id`),
        FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (`productCategoryId`) REFERENCES `productCategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB;

CREATE TABLE
    IF NOT EXISTS `productOptions` (
        `id` CHAR(36) BINARY NOT NULL,
        `name` CHAR(100),
        `image` VARCHAR(255),
        `highlighted` TINYINT(1) DEFAULT false,
        `order` INTEGER DEFAULT 0,
        `price` INTEGER,
        `units` INTEGER,
        `productOptionsCategoryId` CHAR(36) BINARY,
        `productId` CHAR(36) BINARY,
        `productCategoryId` CHAR(36) BINARY,
        `contractId` CHAR(36) BINARY,
        `createdAt` DATETIME NOT NULL,
        `updatedAt` DATETIME NOT NULL,
        `deletedAt` DATETIME,
        PRIMARY KEY (`id`),
        FOREIGN KEY (`productOptionsCategoryId`) REFERENCES `productOptionsCategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (`productCategoryId`) REFERENCES `productCategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB;

CREATE TABLE
    IF NOT EXISTS `orderProductOptions` (
        `id` CHAR(36) BINARY NOT NULL,
        `name` CHAR(100),
        `price` INTEGER,
        `units` INTEGER,
        `orderId` CHAR(36) BINARY,
        `orderProductId` CHAR(36) BINARY,
        `productOptionId` CHAR(36) BINARY,
        `createdAt` DATETIME NOT NULL,
        `updatedAt` DATETIME NOT NULL,
        `deletedAt` DATETIME,
        PRIMARY KEY (`id`),
        FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (`orderProductId`) REFERENCES `orderProducts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (`productOptionId`) REFERENCES `productOptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB;