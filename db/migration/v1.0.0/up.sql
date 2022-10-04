CREATE TABLE
    `addresses` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `role` enum(
            'ADMIN',
            'MANAGER',
            'APP',
            'FINANCE',
            'ANALYTICAL',
            'MARKETING',
            'VENDOR',
            'STAFF',
            'CLIENT',
            'RESELLER',
            'ALL'
        ) DEFAULT NULL,
        `kind` enum(
            'RESIDENTIAL',
            'PROFESSIONAL',
            'OTHER'
        ) DEFAULT NULL,
        `postalCode` varchar(20) DEFAULT NULL,
        `street` varchar(255) DEFAULT NULL,
        `number` varchar(50) DEFAULT NULL,
        `complement` varchar(50) DEFAULT NULL,
        `neighborhood` varchar(50) DEFAULT NULL,
        `city` varchar(50) DEFAULT NULL,
        `stat` varchar(2) DEFAULT NULL,
        `reference` varchar(255) DEFAULT NULL,
        `distance` int DEFAULT NULL,
        `duration` int DEFAULT NULL,
        `selected` tinyint(1) DEFAULT '1',
        `active` tinyint(1) DEFAULT '1',
        `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `userId` (`userId`),
        KEY `contractId` (`contractId`),
        CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
        CONSTRAINT `addresses_ibfk_2` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `apps` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `bundleId` varchar(255) DEFAULT NULL,
        `displayName` varchar(100) DEFAULT NULL,
        `platform` varchar(10) DEFAULT NULL,
        `appVersion` varchar(50) DEFAULT NULL,
        `fireBaseId` varchar(255) DEFAULT NULL,
        `iOSProfileId` varchar(20) DEFAULT NULL,
        `storeStatus` varchar(50) DEFAULT NULL,
        `storeNote` text,
        `storeEvidences` json DEFAULT NULL,
        `storeVersion` varchar(50) DEFAULT NULL,
        `storeBuildStatus` varchar(50) DEFAULT NULL,
        `storePublishStatus` varchar(50) DEFAULT NULL,
        `active` tinyint(1) DEFAULT '1',
        `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `userId` (`userId`),
        KEY `contractId` (`contractId`),
        CONSTRAINT `apps_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
        CONSTRAINT `apps_ibfk_2` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `contractPaymentSignatures` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `gateway` varchar(50) DEFAULT NULL,
        `subscriptionID` text,
        `status` enum(
            'ACTIVE',
            'CONFIRMED',
            'AVAILABLE',
            'CANCELED',
            'IN_DISPUTE'
        ) DEFAULT NULL,
        `cycle` varchar(20) DEFAULT NULL,
        `cardToken` text,
        `value` int DEFAULT NULL,
        `netValue` int DEFAULT NULL,
        `number` int DEFAULT NULL,
        `nextDueDate` datetime DEFAULT NULL,
        `lastDueDate` datetime DEFAULT NULL,
        `active` tinyint(1) DEFAULT '1',
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `contractId` (`contractId`),
        CONSTRAINT `contractPaymentSignatures_ibfk_1` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `contractPayments` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `gateway` varchar(50) DEFAULT NULL,
        `subscriptionID` text,
        `paymentID` text,
        `status` enum(
            'PENDING',
            'CONFIRMED',
            'RECEIVED',
            'RECEIVED_IN_CASH',
            'OVERDUE',
            'REFUND_REQUESTED',
            'REFUNDED',
            'CHARGEBACK_REQUESTED',
            'CHARGEBACK_DISPUTE',
            'AWAITING_CHARGEBACK_REVERSAL',
            'DUNNING_REQUESTED',
            'DUNNING_RECEIVED',
            'AWAITING_RISK_ANALYSIS',
            'CANCELED'
        ) DEFAULT NULL,
        `plan` varchar(50) DEFAULT NULL,
        `billingType` varchar(50) DEFAULT NULL,
        `creditCardBrand` varchar(20) DEFAULT NULL,
        `creditCardToken` text,
        `invoiceUrl` varchar(255) DEFAULT NULL,
        `invoiceNumber` varchar(50) DEFAULT NULL,
        `transactionReceiptUrl` varchar(255) DEFAULT NULL,
        `month` int DEFAULT NULL,
        `creditCardNumber` int DEFAULT NULL,
        `value` int DEFAULT NULL,
        `netValue` int DEFAULT NULL,
        `dueDate` datetime DEFAULT NULL,
        `confirmedDate` datetime DEFAULT NULL,
        `clientPaymentDate` datetime DEFAULT NULL,
        `nextDueDate` datetime DEFAULT NULL,
        `active` tinyint(1) DEFAULT '1',
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `contractPaymentSignatureId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `contractId` (`contractId`),
        KEY `contractPaymentSignatureId` (`contractPaymentSignatureId`),
        CONSTRAINT `contractPayments_ibfk_1` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `contractPayments_ibfk_2` FOREIGN KEY (`contractPaymentSignatureId`) REFERENCES `contractPaymentSignatures` (`id`) ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `contracts` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `ikomidaID` varchar(255) DEFAULT NULL,
        `contractName` varchar(100) DEFAULT NULL,
        `contractIdentity` varchar(25) DEFAULT NULL,
        `email` varchar(255) DEFAULT NULL,
        `status` enum(
            'ACTIVE',
            'CONFIRMED',
            'AVAILABLE',
            'CANCELED',
            'IN_DISPUTE'
        ) DEFAULT NULL,
        `name` varchar(30) DEFAULT NULL,
        `lastName` varchar(50) DEFAULT NULL,
        `identity` varchar(20) DEFAULT NULL,
        `areaCode` int DEFAULT NULL,
        `phone` varchar(20) DEFAULT NULL,
        `lastOrderCustomID` int DEFAULT '0',
        `active` tinyint(1) DEFAULT '1',
        `planId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `referralId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `referredById` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `planId` (`planId`),
        KEY `referralId` (`referralId`),
        CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`planId`) REFERENCES `plans` (`id`) ON UPDATE CASCADE,
        CONSTRAINT `contracts_ibfk_2` FOREIGN KEY (`referralId`) REFERENCES `referrals` (`id`) ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `coupons` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `name` varchar(20) DEFAULT NULL,
        `value` int DEFAULT NULL,
        `validity` datetime DEFAULT NULL,
        `valueType` enum('PERCENT', 'VALUE', 'NO') DEFAULT NULL,
        `quantity` int DEFAULT NULL,
        `active` tinyint(1) DEFAULT '1',
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `contractId` (`contractId`),
        CONSTRAINT `coupons_ibfk_1` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `loginFails` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `ikomidaID` varchar(255) DEFAULT NULL,
        `ip` varchar(20) DEFAULT NULL,
        `role` enum(
            'ADMIN',
            'MANAGER',
            'APP',
            'FINANCE',
            'ANALYTICAL',
            'MARKETING',
            'VENDOR',
            'STAFF',
            'CLIENT',
            'RESELLER',
            'ALL'
        ) DEFAULT NULL,
        `phone` varchar(20) DEFAULT NULL,
        `areaCode` int DEFAULT NULL,
        `platform` varchar(10) DEFAULT NULL,
        `attempts` int DEFAULT NULL,
        `blockWindow` int DEFAULT NULL,
        `blockDate` datetime DEFAULT NULL,
        `active` tinyint(1) DEFAULT '1',
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `orderProducts` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `title` varchar(100) DEFAULT NULL,
        `discountType` enum('PERCENT', 'VALUE', 'NO') DEFAULT NULL,
        `price` int DEFAULT NULL,
        `discount` int DEFAULT NULL,
        `quantity` int DEFAULT NULL,
        `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `orderId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `productId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `userId` (`userId`),
        KEY `contractId` (`contractId`),
        KEY `orderId` (`orderId`),
        KEY `productId` (`productId`),
        CONSTRAINT `orderProducts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
        CONSTRAINT `orderProducts_ibfk_2` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `orderProducts_ibfk_3` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `orderProducts_ibfk_4` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `orders` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `customID` int DEFAULT NULL,
        `status` enum(
            'WAITING_PAYMENT',
            'OPEN',
            'ACCEPTED',
            'WAITING_DELIVERY',
            'IN_DELIVERY',
            'DELIVERED',
            'IN_DISPUTE',
            'CANCELED'
        ) DEFAULT NULL,
        `finishedAt` datetime DEFAULT NULL,
        `subtotal` int DEFAULT NULL,
        `delivery` int DEFAULT NULL,
        `distance` int DEFAULT NULL,
        `duration` int DEFAULT NULL,
        `discount` int DEFAULT NULL,
        `locationLatitude` varchar(30) DEFAULT NULL,
        `locationLongitude` varchar(30) DEFAULT NULL,
        `preparationMin` int DEFAULT NULL,
        `preparationMax` int DEFAULT NULL,
        `paymentMethodType` enum(
            'CASH_ON_DELIVERY',
            'CREDIT_CARD_ON_DELIVERY',
            'DEBT_CARD_ON_DELIVERY',
            'CREDIT_CARD_ONLINE',
            'DEBT_CARD_ONLINE',
            'PIX_ON_DELIVERY',
            'PIX_ONLINE'
        ) DEFAULT NULL,
        `active` tinyint(1) DEFAULT '1',
        `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `userCreditCardId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `addressId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `couponId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `userId` (`userId`),
        KEY `contractId` (`contractId`),
        KEY `userCreditCardId` (`userCreditCardId`),
        KEY `addressId` (`addressId`),
        KEY `couponId` (`couponId`),
        CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
        CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`userCreditCardId`) REFERENCES `userCreditCards` (`id`) ON UPDATE CASCADE,
        CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`addressId`) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`couponId`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `pNMessages` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `remoteId` varchar(255) DEFAULT NULL,
        `title` varchar(100) DEFAULT NULL,
        `body` varchar(255) DEFAULT NULL,
        `data` json DEFAULT NULL,
        `send` tinyint(1) DEFAULT '1',
        `opened` tinyint(1) DEFAULT '1',
        `vendorPNMessageId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `pNId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `vendorPNMessageId` (`vendorPNMessageId`),
        KEY `userId` (`userId`),
        KEY `contractId` (`contractId`),
        KEY `pNId` (`pNId`),
        CONSTRAINT `pNMessages_ibfk_1` FOREIGN KEY (`vendorPNMessageId`) REFERENCES `vendorPNMessages` (`id`) ON UPDATE CASCADE,
        CONSTRAINT `pNMessages_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
        CONSTRAINT `pNMessages_ibfk_3` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `pNMessages_ibfk_4` FOREIGN KEY (`pNId`) REFERENCES `pNs` (`id`) ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `pNs` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `platform` varchar(10) DEFAULT NULL,
        `token` varchar(255) DEFAULT NULL,
        `role` enum(
            'ADMIN',
            'MANAGER',
            'APP',
            'FINANCE',
            'ANALYTICAL',
            'MARKETING',
            'VENDOR',
            'STAFF',
            'CLIENT',
            'RESELLER',
            'ALL'
        ) DEFAULT NULL,
        `active` tinyint(1) DEFAULT '1',
        `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `userId` (`userId`),
        KEY `contractId` (`contractId`),
        CONSTRAINT `pNs_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
        CONSTRAINT `pNs_ibfk_2` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `phoneValidationCodes` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `role` enum(
            'ADMIN',
            'MANAGER',
            'APP',
            'FINANCE',
            'ANALYTICAL',
            'MARKETING',
            'VENDOR',
            'STAFF',
            'CLIENT',
            'RESELLER',
            'ALL'
        ) DEFAULT NULL,
        `code` int DEFAULT NULL,
        `signature` text,
        `active` tinyint(1) DEFAULT '1',
        `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `userId` (`userId`),
        KEY `contractId` (`contractId`),
        CONSTRAINT `phoneValidationCodes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
        CONSTRAINT `phoneValidationCodes_ibfk_2` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `plans` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `name` varchar(50) DEFAULT NULL,
        `discountType` enum('PERCENT', 'VALUE', 'NO') DEFAULT NULL,
        `order` int DEFAULT NULL,
        `price` int DEFAULT NULL,
        `discount` int DEFAULT NULL,
        `staff` int DEFAULT NULL,
        `pushNotifications` int DEFAULT NULL,
        `categories` int DEFAULT NULL,
        `products` int DEFAULT NULL,
        `coupons` int DEFAULT NULL,
        `orders` int DEFAULT NULL,
        `billing` int DEFAULT NULL,
        `support` json DEFAULT NULL,
        `details` json DEFAULT NULL,
        `highlighted` tinyint(1) DEFAULT NULL,
        `active` tinyint(1) DEFAULT '1',
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `productCategories` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `title` varchar(100) DEFAULT NULL,
        `description` text,
        `order` int DEFAULT NULL,
        `active` tinyint(1) DEFAULT '1',
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `contractId` (`contractId`),
        CONSTRAINT `productCategories_ibfk_1` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `products` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `title` varchar(100) DEFAULT NULL,
        `description` text,
        `discountType` enum('PERCENT', 'VALUE', 'NO') DEFAULT NULL,
        `image` varchar(255) DEFAULT NULL,
        `order` int DEFAULT NULL,
        `serves` int DEFAULT NULL,
        `price` int DEFAULT NULL,
        `discount` int DEFAULT NULL,
        `weight` int DEFAULT NULL,
        `quantity` int DEFAULT NULL,
        `active` tinyint(1) DEFAULT '1',
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `productCategoryId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `contractId` (`contractId`),
        KEY `productCategoryId` (`productCategoryId`),
        CONSTRAINT `products_ibfk_1` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `products_ibfk_2` FOREIGN KEY (`productCategoryId`) REFERENCES `productCategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `referralRevunes` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `total` int DEFAULT NULL,
        `revune` int DEFAULT NULL,
        `bonus` int DEFAULT NULL,
        `date` datetime DEFAULT NULL,
        `revuneDetails` json DEFAULT NULL,
        `bonusDetails` json DEFAULT NULL,
        `approved` tinyint(1) DEFAULT '0',
        `paid` tinyint(1) DEFAULT '0',
        `active` tinyint(1) DEFAULT '1',
        `referralId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `referralId` (`referralId`),
        CONSTRAINT `referralRevunes_ibfk_1` FOREIGN KEY (`referralId`) REFERENCES `referrals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `referrals` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `code` varchar(8) DEFAULT NULL,
        `active` tinyint(1) DEFAULT '1',
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `settings` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `name` varchar(50) DEFAULT NULL,
        `value` text,
        `type` enum(
            'TEXT',
            'BOOL',
            'NUMBER',
            'CURRENCY',
            'LIST'
        ) DEFAULT NULL,
        `active` tinyint(1) DEFAULT '1',
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `termHashes` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `hash` text,
        `active` tinyint(1) DEFAULT '1',
        `termId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `termId` (`termId`),
        KEY `userId` (`userId`),
        KEY `contractId` (`contractId`),
        CONSTRAINT `termHashes_ibfk_1` FOREIGN KEY (`termId`) REFERENCES `terms` (`id`) ON UPDATE CASCADE,
        CONSTRAINT `termHashes_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
        CONSTRAINT `termHashes_ibfk_3` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `terms` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `name` varchar(100) DEFAULT NULL,
        `text` text,
        `type` enum(
            'TERM_OF_USE_VENDOR',
            'TERM_OF_USE_STAFF',
            'TERM_OF_USE_RESELLER',
            'TERM_OF_USE_CLIENT',
            'PRIVACY_POLICY'
        ) DEFAULT NULL,
        `active` tinyint(1) DEFAULT '1',
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `userCreditCards` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `token` text,
        `type` enum(
            'CASH_ON_DELIVERY',
            'CREDIT_CARD_ON_DELIVERY',
            'DEBT_CARD_ON_DELIVERY',
            'CREDIT_CARD_ONLINE',
            'DEBT_CARD_ONLINE',
            'PIX_ON_DELIVERY',
            'PIX_ONLINE'
        ) DEFAULT NULL,
        `brand` varchar(20) DEFAULT NULL,
        `firstDigits` char(6) DEFAULT NULL,
        `lastDigits` char(4) DEFAULT NULL,
        `selected` tinyint(1) DEFAULT '1',
        `active` tinyint(1) DEFAULT '1',
        `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `userId` (`userId`),
        KEY `contractId` (`contractId`),
        CONSTRAINT `userCreditCards_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
        CONSTRAINT `userCreditCards_ibfk_2` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `userInfos` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `ip` varchar(20) DEFAULT NULL,
        `forwardedIp` json DEFAULT NULL,
        `platform` varchar(10) DEFAULT NULL,
        `deviceId` varchar(255) DEFAULT NULL,
        `region` varchar(50) DEFAULT NULL,
        `subRegion` varchar(50) DEFAULT NULL,
        `citylatlong` varchar(50) DEFAULT NULL,
        `city` varchar(50) DEFAULT NULL,
        `app` varchar(50) DEFAULT NULL,
        `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `userId` (`userId`),
        CONSTRAINT `userInfos_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `userPIXKeys` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `name` varchar(30) DEFAULT NULL,
        `type` enum(
            'CPF',
            'CNPJ',
            'EMAIL',
            'PHONE',
            'EVP',
            'BANK_ACCOUNT'
        ) DEFAULT NULL,
        `key` varchar(255) DEFAULT NULL,
        `bank` varchar(50) DEFAULT NULL,
        `agency` int DEFAULT NULL,
        `account` int DEFAULT NULL,
        `note` varchar(255) DEFAULT NULL,
        `status` varchar(50) DEFAULT NULL,
        `active` tinyint(1) DEFAULT '1',
        `referralRevuneId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `referralRevuneId` (`referralRevuneId`),
        KEY `userId` (`userId`),
        CONSTRAINT `userPIXKeys_ibfk_1` FOREIGN KEY (`referralRevuneId`) REFERENCES `referralRevunes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `userPIXKeys_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `userPayments` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `status` enum(
            'AUTHORIZED',
            'PAID',
            'DECLINED',
            'CANCELED',
            'ONRETURN',
            'IN_DISPUTE',
            'WAITING',
            'INANALYSE',
            'IN_CONTESTATION',
            'CHARGEBACK',
            'REFUNDED',
            'TEMPORARY_RETENTION',
            'UNKNOWN'
        ) DEFAULT NULL,
        `gateway` varchar(50) DEFAULT NULL,
        `brand` varchar(20) DEFAULT NULL,
        `firstDigits` char(6) DEFAULT NULL,
        `lastDigits` char(4) DEFAULT NULL,
        `gatewayPaymentID` text,
        `amount` int DEFAULT NULL,
        `active` tinyint(1) DEFAULT '1',
        `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `orderId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `userCreditCardId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `userId` (`userId`),
        KEY `contractId` (`contractId`),
        KEY `orderId` (`orderId`),
        KEY `userCreditCardId` (`userCreditCardId`),
        CONSTRAINT `userPayments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `userPayments_ibfk_2` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `userPayments_ibfk_3` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `userPayments_ibfk_4` FOREIGN KEY (`userCreditCardId`) REFERENCES `userCreditCards` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `users` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `avatar` text,
        `role` enum(
            'ADMIN',
            'MANAGER',
            'APP',
            'FINANCE',
            'ANALYTICAL',
            'MARKETING',
            'VENDOR',
            'STAFF',
            'CLIENT',
            'RESELLER',
            'ALL'
        ) DEFAULT NULL,
        `name` varchar(30) DEFAULT NULL,
        `lastName` varchar(50) DEFAULT NULL,
        `email` varchar(255) DEFAULT NULL,
        `identity` varchar(20) DEFAULT NULL,
        `phone` varchar(20) DEFAULT NULL,
        `areaCode` int DEFAULT NULL,
        `password` varchar(100) DEFAULT NULL,
        `lastPasswords` json DEFAULT NULL,
        `passwordUpdatedAt` datetime DEFAULT NULL,
        `updatePassword` tinyint(1) DEFAULT '1',
        `paymentMethodType` enum(
            'CASH_ON_DELIVERY',
            'CREDIT_CARD_ON_DELIVERY',
            'DEBT_CARD_ON_DELIVERY',
            'CREDIT_CARD_ONLINE',
            'DEBT_CARD_ONLINE',
            'PIX_ON_DELIVERY',
            'PIX_ONLINE'
        ) DEFAULT NULL,
        `active` tinyint(1) DEFAULT '1',
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `referralId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `referredById` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `contractId` (`contractId`),
        KEY `referralId` (`referralId`),
        CONSTRAINT `users_ibfk_1` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `users_ibfk_2` FOREIGN KEY (`referralId`) REFERENCES `referrals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `vendorPNMessages` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `remoteId` varchar(255) DEFAULT NULL,
        `title` varchar(100) DEFAULT NULL,
        `body` varchar(255) DEFAULT NULL,
        `data` json DEFAULT NULL,
        `sends` int DEFAULT NULL,
        `fails` int DEFAULT NULL,
        `opens` int DEFAULT NULL,
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `contractId` (`contractId`),
        CONSTRAINT `vendorPNMessages_ibfk_1` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `vendorPaymentGateways` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `gateway` varchar(50) DEFAULT NULL,
        `data` json DEFAULT NULL,
        `active` tinyint(1) DEFAULT '1',
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `vendorSettingsId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `contractId` (`contractId`),
        KEY `vendorSettingsId` (`vendorSettingsId`),
        CONSTRAINT `vendorPaymentGateways_ibfk_1` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `vendorPaymentGateways_ibfk_2` FOREIGN KEY (`vendorSettingsId`) REFERENCES `vendorSettings` (`id`) ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

CREATE TABLE
    `vendorSettings` (
        `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        `restaurantImage` text,
        `contractName` varchar(100) DEFAULT NULL,
        `contractIdentity` varchar(25) DEFAULT NULL,
        `email` varchar(255) DEFAULT NULL,
        `name` varchar(20) DEFAULT NULL,
        `lastName` varchar(50) DEFAULT NULL,
        `identity` varchar(20) DEFAULT NULL,
        `areaCode` int DEFAULT NULL,
        `phone` varchar(20) DEFAULT NULL,
        `businessHours` json DEFAULT NULL,
        `businessDays` json DEFAULT NULL,
        `layout` json DEFAULT NULL,
        `delivery` int DEFAULT NULL,
        `deliveryMin` int DEFAULT NULL,
        `preparationMin` int DEFAULT NULL,
        `preparationMax` int DEFAULT NULL,
        `deliveryFree` tinyint(1) DEFAULT '1',
        `active` tinyint(1) DEFAULT '1',
        `contractId` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `deletedAt` datetime DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `contractId` (`contractId`),
        CONSTRAINT `vendorSettings_ibfk_1` FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;