CREATE TABLE
    `orderProductOptions` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `name` char(100) DEFAULT NULL,
        `price` int DEFAULT NULL,
        `units` int DEFAULT NULL,
        `orderId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `orderProductId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `productOptionId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `orderId` (`orderId`),
        KEY `orderProductId` (`orderProductId`),
        KEY `productOptionId` (`productOptionId`),
        CONSTRAINT `orderProductOptions_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `orderProductOptions_ibfk_2` FOREIGN KEY (`orderProductId`) REFERENCES `orderProducts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `orderProductOptions_ibfk_3` FOREIGN KEY (`productOptionId`) REFERENCES `productOptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

ALTER TABLE `orders` ADD `observation` CHAR(255);

ALTER TABLE `orders` DROP `active`;

ALTER TABLE `plans` ADD `productOptions` INTEGER;

CREATE TABLE
    `productOptions` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `name` char(100) DEFAULT NULL,
        `image` varchar(255) DEFAULT NULL,
        `highlighted` tinyint(1) DEFAULT '0',
        `order` int DEFAULT '0',
        `price` int DEFAULT NULL,
        `units` int DEFAULT NULL,
        `productOptionCategoryId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `productId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `productCategoryId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `productOptionCategoryId` (`productOptionCategoryId`),
        KEY `productId` (`productId`),
        KEY `productCategoryId` (`productCategoryId`),
        KEY `contractId` (`contractId`),
        CONSTRAINT `productOptions_ibfk_1` FOREIGN KEY (`productOptionCategoryId`) REFERENCES `productOptionsCategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `productOptions_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `productOptions_ibfk_3` FOREIGN KEY (`productCategoryId`) REFERENCES `productCategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `productOptions_ibfk_4` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `productOptionsCategories` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `name` char(100) DEFAULT NULL,
        `image` varchar(255) DEFAULT NULL,
        `highlighted` tinyint(1) DEFAULT '0',
        `min` int DEFAULT '0',
        `max` int DEFAULT '0',
        `order` int DEFAULT NULL,
        `productId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `productCategoryId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `productId` (`productId`),
        KEY `productCategoryId` (`productCategoryId`),
        KEY `contractId` (`contractId`),
        CONSTRAINT `productOptionsCategories_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `productOptionsCategories_ibfk_2` FOREIGN KEY (`productCategoryId`) REFERENCES `productCategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `productOptionsCategories_ibfk_3` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

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