ALTER TABLE coupons ADD minValue INTEGER NULL;

ALTER TABLE orders
ADD
    orderType ENUM('DELIVERY', 'PICKUP', 'LOCAL') NULL;

ALTER TABLE orders ADD tip INTEGER NULL;

ALTER TABLE orders ADD `table` VARCHAR(50) NULL;

ALTER TABLE products ADD orderTypes JSON NULL;

ALTER TABLE vendorSettings ADD orderTypes JSON NULL;

ALTER TABLE vendorSettings ADD tip INTEGER NULL;

ALTER TABLE
    `orders` MODIFY COLUMN `status` enum(
        'WAITING_PAYMENT',
        'OPEN',
        'ACCEPTED',
        'WAITING_DELIVERY',
        'WAITING_PICKUP',
        'WAITING_LOCAL',
        'IN_DELIVERY',
        'IN_TABLE_DELIVERY',
        'DELIVERED',
        'IN_DISPUTE',
        'CANCELED'
    ) NULL;

ALTER TABLE coupons ADD orderTypes JSON NULL;

CREATE TABLE
    IF NOT EXISTS `contacts` (
        `id` CHAR(36) BINARY NOT NULL,
        `name` VARCHAR(50),
        `lastName` VARCHAR(100),
        `areaCode` VARCHAR(3),
        `phone` VARCHAR(20),
        `email` VARCHAR(255),
        `contractName` VARCHAR(150),
        `createdAt` DATETIME NOT NULL,
        `updatedAt` DATETIME NOT NULL,
        `deletedAt` DATETIME,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB;