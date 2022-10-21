ALTER TABLE `plans` ADD `productOptions` INTEGER;

ALTER TABLE `plans` CHANGE `name` `name` VARCHAR(50);

ALTER TABLE
    `plans` CHANGE `discountType` `discountType` ENUM('PERCENT', 'VALUE', 'NO');

ALTER TABLE `plans` CHANGE `order` `order` INTEGER;

ALTER TABLE `plans` CHANGE `price` `price` INTEGER;

ALTER TABLE `plans` CHANGE `discount` `discount` INTEGER;

ALTER TABLE `plans` CHANGE `staff` `staff` INTEGER;

ALTER TABLE
    `plans` CHANGE `pushNotifications` `pushNotifications` INTEGER;

ALTER TABLE `plans` CHANGE `categories` `categories` INTEGER;

ALTER TABLE `plans` CHANGE `products` `products` INTEGER;

ALTER TABLE `plans` CHANGE `coupons` `coupons` INTEGER;

ALTER TABLE `plans` CHANGE `orders` `orders` INTEGER;

ALTER TABLE `plans` CHANGE `billing` `billing` INTEGER;

ALTER TABLE `plans` CHANGE `support` `support` JSON;

ALTER TABLE `plans` CHANGE `details` `details` JSON;

ALTER TABLE `plans` CHANGE `highlighted` `highlighted` TINYINT(1);

ALTER TABLE `plans` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE `plans` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE `plans` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `plans` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `referrals` CHANGE `code` `code` VARCHAR(8);

ALTER TABLE
    `referrals` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `referrals` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `referrals` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `referrals` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `contracts` CHANGE `ikomidaID` `ikomidaID` VARCHAR(255);

ALTER TABLE
    `contracts` CHANGE `contractName` `contractName` VARCHAR(100);

ALTER TABLE
    `contracts` CHANGE `contractIdentity` `contractIdentity` VARCHAR(25);

ALTER TABLE `contracts` CHANGE `email` `email` VARCHAR(255);

ALTER TABLE
    `contracts` CHANGE `status` `status` ENUM(
        'ACTIVE',
        'CONFIRMED',
        'AVAILABLE',
        'CANCELED',
        'IN_DISPUTE'
    );

ALTER TABLE `contracts` CHANGE `name` `name` VARCHAR(30);

ALTER TABLE `contracts` CHANGE `lastName` `lastName` VARCHAR(50);

ALTER TABLE `contracts` CHANGE `identity` `identity` VARCHAR(20);

ALTER TABLE `contracts` CHANGE `areaCode` `areaCode` INTEGER(3);

ALTER TABLE `contracts` CHANGE `phone` `phone` VARCHAR(20);

ALTER TABLE
    `contracts` CHANGE `lastOrderCustomID` `lastOrderCustomID` INTEGER DEFAULT 0;

ALTER TABLE
    `contracts` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `contracts` CHANGE `referredById` `referredById` CHAR(36) BINARY;

ALTER TABLE
    `contracts` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `contracts` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `contracts` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `users` CHANGE `avatar` `avatar` TEXT;

ALTER TABLE
    `users` CHANGE `role` `role` ENUM(
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
    );

ALTER TABLE `users` CHANGE `name` `name` VARCHAR(30);

ALTER TABLE `users` CHANGE `lastName` `lastName` VARCHAR(50);

ALTER TABLE `users` CHANGE `email` `email` VARCHAR(255);

ALTER TABLE `users` CHANGE `identity` `identity` VARCHAR(20);

ALTER TABLE `users` CHANGE `phone` `phone` VARCHAR(20);

ALTER TABLE `users` CHANGE `areaCode` `areaCode` INTEGER(3);

ALTER TABLE `users` CHANGE `password` `password` VARCHAR(100);

ALTER TABLE `users` CHANGE `lastPasswords` `lastPasswords` JSON;

ALTER TABLE
    `users` CHANGE `passwordUpdatedAt` `passwordUpdatedAt` DATETIME;

ALTER TABLE
    `users` CHANGE `updatePassword` `updatePassword` TINYINT(1) DEFAULT true;

ALTER TABLE
    `users` CHANGE `paymentMethodType` `paymentMethodType` ENUM(
        'CASH_ON_DELIVERY',
        'CREDIT_CARD_ON_DELIVERY',
        'DEBT_CARD_ON_DELIVERY',
        'CREDIT_CARD_ONLINE',
        'DEBT_CARD_ONLINE',
        'PIX_ON_DELIVERY',
        'PIX_ONLINE'
    );

ALTER TABLE `users` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `users` CHANGE `referredById` `referredById` CHAR(36) BINARY;

ALTER TABLE `users` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE `users` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `users` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE
    `addresses` CHANGE `role` `role` ENUM(
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
    );

ALTER TABLE
    `addresses` CHANGE `kind` `kind` ENUM(
        'RESIDENTIAL',
        'PROFESSIONAL',
        'OTHER'
    );

ALTER TABLE `addresses` CHANGE `postalCode` `postalCode` VARCHAR(20);

ALTER TABLE `addresses` CHANGE `street` `street` VARCHAR(255);

ALTER TABLE `addresses` CHANGE `number` `number` VARCHAR(50);

ALTER TABLE `addresses` CHANGE `complement` `complement` VARCHAR(50);

ALTER TABLE
    `addresses` CHANGE `neighborhood` `neighborhood` VARCHAR(50);

ALTER TABLE `addresses` CHANGE `city` `city` VARCHAR(50);

ALTER TABLE `addresses` CHANGE `stat` `stat` VARCHAR(2);

ALTER TABLE `addresses` CHANGE `reference` `reference` VARCHAR(255);

ALTER TABLE `addresses` CHANGE `distance` `distance` INTEGER;

ALTER TABLE `addresses` CHANGE `duration` `duration` INTEGER;

ALTER TABLE
    `addresses` CHANGE `selected` `selected` TINYINT(1) DEFAULT true;

ALTER TABLE
    `addresses` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `addresses` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `addresses` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `addresses` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `apps` CHANGE `bundleId` `bundleId` VARCHAR(255);

ALTER TABLE `apps` CHANGE `displayName` `displayName` VARCHAR(100);

ALTER TABLE `apps` CHANGE `platform` `platform` VARCHAR(10);

ALTER TABLE `apps` CHANGE `appVersion` `appVersion` VARCHAR(50);

ALTER TABLE `apps` CHANGE `fireBaseId` `fireBaseId` VARCHAR(255);

ALTER TABLE `apps` CHANGE `iOSProfileId` `iOSProfileId` VARCHAR(20);

ALTER TABLE `apps` CHANGE `storeStatus` `storeStatus` VARCHAR(50);

ALTER TABLE `apps` CHANGE `storeNote` `storeNote` TEXT;

ALTER TABLE `apps` CHANGE `storeEvidences` `storeEvidences` JSON;

ALTER TABLE `apps` CHANGE `storeVersion` `storeVersion` VARCHAR(50);

ALTER TABLE
    `apps` CHANGE `storeBuildStatus` `storeBuildStatus` VARCHAR(50);

ALTER TABLE
    `apps` CHANGE `storePublishStatus` `storePublishStatus` VARCHAR(50);

ALTER TABLE `apps` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE `apps` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE `apps` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `apps` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE
    `contractPaymentSignatures` CHANGE `gateway` `gateway` VARCHAR(50);

ALTER TABLE
    `contractPaymentSignatures` CHANGE `subscriptionID` `subscriptionID` TEXT;

ALTER TABLE
    `contractPaymentSignatures` CHANGE `status` `status` ENUM(
        'ACTIVE',
        'CONFIRMED',
        'AVAILABLE',
        'CANCELED',
        'IN_DISPUTE'
    );

ALTER TABLE
    `contractPaymentSignatures` CHANGE `cycle` `cycle` VARCHAR(20);

ALTER TABLE
    `contractPaymentSignatures` CHANGE `cardToken` `cardToken` TEXT;

ALTER TABLE
    `contractPaymentSignatures` CHANGE `value` `value` INTEGER;

ALTER TABLE
    `contractPaymentSignatures` CHANGE `netValue` `netValue` INTEGER;

ALTER TABLE
    `contractPaymentSignatures` CHANGE `number` `number` INTEGER(6);

ALTER TABLE
    `contractPaymentSignatures` CHANGE `nextDueDate` `nextDueDate` DATETIME;

ALTER TABLE
    `contractPaymentSignatures` CHANGE `lastDueDate` `lastDueDate` DATETIME;

ALTER TABLE
    `contractPaymentSignatures` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `contractPaymentSignatures` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `contractPaymentSignatures` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE
    `contractPaymentSignatures` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE
    `contractPayments` CHANGE `gateway` `gateway` VARCHAR(50);

ALTER TABLE
    `contractPayments` CHANGE `subscriptionID` `subscriptionID` TEXT;

ALTER TABLE `contractPayments` CHANGE `paymentID` `paymentID` TEXT;

ALTER TABLE
    `contractPayments` CHANGE `status` `status` ENUM(
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
    );

ALTER TABLE `contractPayments` CHANGE `plan` `plan` VARCHAR(50);

ALTER TABLE
    `contractPayments` CHANGE `billingType` `billingType` VARCHAR(50);

ALTER TABLE
    `contractPayments` CHANGE `creditCardBrand` `creditCardBrand` VARCHAR(20);

ALTER TABLE
    `contractPayments` CHANGE `creditCardToken` `creditCardToken` TEXT;

ALTER TABLE
    `contractPayments` CHANGE `invoiceUrl` `invoiceUrl` VARCHAR(255);

ALTER TABLE
    `contractPayments` CHANGE `invoiceNumber` `invoiceNumber` VARCHAR(50);

ALTER TABLE
    `contractPayments` CHANGE `transactionReceiptUrl` `transactionReceiptUrl` VARCHAR(255);

ALTER TABLE `contractPayments` CHANGE `month` `month` INTEGER(2);

ALTER TABLE
    `contractPayments` CHANGE `creditCardNumber` `creditCardNumber` INTEGER(6);

ALTER TABLE `contractPayments` CHANGE `value` `value` INTEGER;

ALTER TABLE `contractPayments` CHANGE `netValue` `netValue` INTEGER;

ALTER TABLE `contractPayments` CHANGE `dueDate` `dueDate` DATETIME;

ALTER TABLE
    `contractPayments` CHANGE `confirmedDate` `confirmedDate` DATETIME;

ALTER TABLE
    `contractPayments` CHANGE `clientPaymentDate` `clientPaymentDate` DATETIME;

ALTER TABLE
    `contractPayments` CHANGE `nextDueDate` `nextDueDate` DATETIME;

ALTER TABLE
    `contractPayments` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `contractPayments` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `contractPayments` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE
    `contractPayments` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `coupons` CHANGE `name` `name` VARCHAR(20);

ALTER TABLE `coupons` CHANGE `value` `value` INTEGER;

ALTER TABLE `coupons` CHANGE `validity` `validity` DATETIME;

ALTER TABLE
    `coupons` CHANGE `valueType` `valueType` ENUM('PERCENT', 'VALUE', 'NO');

ALTER TABLE `coupons` CHANGE `quantity` `quantity` INTEGER;

ALTER TABLE
    `coupons` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `coupons` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `coupons` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `coupons` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `loginFails` CHANGE `ikomidaID` `ikomidaID` VARCHAR(255);

ALTER TABLE `loginFails` CHANGE `ip` `ip` VARCHAR(20);

ALTER TABLE
    `loginFails` CHANGE `role` `role` ENUM(
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
    );

ALTER TABLE `loginFails` CHANGE `phone` `phone` VARCHAR(20);

ALTER TABLE `loginFails` CHANGE `areaCode` `areaCode` INTEGER(2);

ALTER TABLE `loginFails` CHANGE `platform` `platform` VARCHAR(10);

ALTER TABLE `loginFails` CHANGE `attempts` `attempts` INTEGER;

ALTER TABLE `loginFails` CHANGE `blockWindow` `blockWindow` INTEGER;

ALTER TABLE `loginFails` CHANGE `blockDate` `blockDate` DATETIME;

ALTER TABLE
    `loginFails` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `loginFails` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `loginFails` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `loginFails` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `userCreditCards` CHANGE `token` `token` TEXT;

ALTER TABLE
    `userCreditCards` CHANGE `type` `type` ENUM(
        'CASH_ON_DELIVERY',
        'CREDIT_CARD_ON_DELIVERY',
        'DEBT_CARD_ON_DELIVERY',
        'CREDIT_CARD_ONLINE',
        'DEBT_CARD_ONLINE',
        'PIX_ON_DELIVERY',
        'PIX_ONLINE'
    );

ALTER TABLE `userCreditCards` CHANGE `brand` `brand` VARCHAR(20);

ALTER TABLE
    `userCreditCards` CHANGE `firstDigits` `firstDigits` VARCHAR(6);

ALTER TABLE
    `userCreditCards` CHANGE `lastDigits` `lastDigits` VARCHAR(4);

ALTER TABLE
    `userCreditCards` CHANGE `selected` `selected` TINYINT(1) DEFAULT true;

ALTER TABLE
    `userCreditCards` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `userCreditCards` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `userCreditCards` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE
    `userCreditCards` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `orders` ADD `observation` VARCHAR(255);

ALTER TABLE `orders` CHANGE `customID` `customID` INTEGER;

ALTER TABLE
    `orders` CHANGE `status` `status` ENUM(
        'WAITING_PAYMENT',
        'OPEN',
        'ACCEPTED',
        'WAITING_DELIVERY',
        'IN_DELIVERY',
        'DELIVERED',
        'IN_DISPUTE',
        'CANCELED'
    );

ALTER TABLE `orders` CHANGE `finishedAt` `finishedAt` DATETIME;

ALTER TABLE `orders` CHANGE `subtotal` `subtotal` INTEGER;

ALTER TABLE `orders` CHANGE `delivery` `delivery` INTEGER;

ALTER TABLE `orders` CHANGE `distance` `distance` INTEGER;

ALTER TABLE `orders` CHANGE `duration` `duration` INTEGER;

ALTER TABLE `orders` CHANGE `discount` `discount` INTEGER;

ALTER TABLE
    `orders` CHANGE `locationLatitude` `locationLatitude` VARCHAR(30);

ALTER TABLE
    `orders` CHANGE `locationLongitude` `locationLongitude` VARCHAR(30);

ALTER TABLE
    `orders` CHANGE `preparationMin` `preparationMin` INTEGER;

ALTER TABLE
    `orders` CHANGE `preparationMax` `preparationMax` INTEGER;

ALTER TABLE
    `orders` CHANGE `paymentMethodType` `paymentMethodType` ENUM(
        'CASH_ON_DELIVERY',
        'CREDIT_CARD_ON_DELIVERY',
        'DEBT_CARD_ON_DELIVERY',
        'CREDIT_CARD_ONLINE',
        'DEBT_CARD_ONLINE',
        'PIX_ON_DELIVERY',
        'PIX_ONLINE'
    );

ALTER TABLE `orders` DROP `active`;

ALTER TABLE
    `orders` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `orders` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `orders` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `productCategories` CHANGE `title` `title` VARCHAR(100);

ALTER TABLE
    `productCategories` CHANGE `description` `description` TEXT;

ALTER TABLE `productCategories` CHANGE `order` `order` INTEGER;

ALTER TABLE
    `productCategories` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `productCategories` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `productCategories` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE
    `productCategories` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `products` ADD `measure` INTEGER;

ALTER TABLE `products`
ADD
    `measureUnit` ENUM(
        'GRAM',
        'MILLILITER',
        'CENTIMETER'
    ) DEFAULT 'GRAM';

ALTER TABLE `products` CHANGE `title` `title` VARCHAR(100);

ALTER TABLE `products` CHANGE `description` `description` TEXT;

ALTER TABLE
    `products` CHANGE `discountType` `discountType` ENUM('PERCENT', 'VALUE', 'NO');

ALTER TABLE `products` CHANGE `image` `image` VARCHAR(255);

ALTER TABLE `products` CHANGE `order` `order` INTEGER;

ALTER TABLE `products` CHANGE `serves` `serves` INTEGER;

ALTER TABLE `products` CHANGE `price` `price` INTEGER;

ALTER TABLE `products` CHANGE `discount` `discount` INTEGER;

ALTER TABLE `products` DROP `weight`;

ALTER TABLE `products` CHANGE `quantity` `quantity` INTEGER;

ALTER TABLE
    `products` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `products` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `products` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `products` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `orderProducts` ADD `observation` VARCHAR(255);

ALTER TABLE `orderProducts` CHANGE `title` `title` VARCHAR(100);

ALTER TABLE
    `orderProducts` CHANGE `discountType` `discountType` ENUM('PERCENT', 'VALUE', 'NO');

ALTER TABLE `orderProducts` CHANGE `price` `price` INTEGER;

ALTER TABLE `orderProducts` CHANGE `discount` `discount` INTEGER;

ALTER TABLE `orderProducts` CHANGE `quantity` `quantity` INTEGER;

ALTER TABLE
    `orderProducts` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `orderProducts` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `orderProducts` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE
    `phoneValidationCodes` CHANGE `role` `role` ENUM(
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
    );

ALTER TABLE `phoneValidationCodes` CHANGE `code` `code` INTEGER(4);

ALTER TABLE
    `phoneValidationCodes` CHANGE `signature` `signature` TEXT;

ALTER TABLE
    `phoneValidationCodes` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `phoneValidationCodes` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `phoneValidationCodes` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE
    `phoneValidationCodes` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE
    `vendorPNMessages` CHANGE `remoteId` `remoteId` VARCHAR(255);

ALTER TABLE `vendorPNMessages` CHANGE `title` `title` VARCHAR(100);

ALTER TABLE `vendorPNMessages` CHANGE `body` `body` VARCHAR(255);

ALTER TABLE `vendorPNMessages` CHANGE `data` `data` JSON;

ALTER TABLE `vendorPNMessages` CHANGE `sends` `sends` INTEGER;

ALTER TABLE `vendorPNMessages` CHANGE `fails` `fails` INTEGER;

ALTER TABLE `vendorPNMessages` CHANGE `opens` `opens` INTEGER;

ALTER TABLE
    `vendorPNMessages` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `vendorPNMessages` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE
    `vendorPNMessages` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `pNs` CHANGE `platform` `platform` VARCHAR(10);

ALTER TABLE `pNs` CHANGE `token` `token` VARCHAR(255);

ALTER TABLE
    `pNs` CHANGE `role` `role` ENUM(
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
    );

ALTER TABLE `pNs` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE `pNs` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE `pNs` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `pNs` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `pNMessages` CHANGE `remoteId` `remoteId` VARCHAR(255);

ALTER TABLE `pNMessages` CHANGE `title` `title` VARCHAR(100);

ALTER TABLE `pNMessages` CHANGE `body` `body` VARCHAR(255);

ALTER TABLE `pNMessages` CHANGE `data` `data` JSON;

ALTER TABLE
    `pNMessages` CHANGE `send` `send` TINYINT(1) DEFAULT true;

ALTER TABLE
    `pNMessages` CHANGE `opened` `opened` TINYINT(1) DEFAULT true;

ALTER TABLE
    `pNMessages` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `pNMessages` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `pNMessages` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `referralRevunes` CHANGE `total` `total` INTEGER;

ALTER TABLE `referralRevunes` CHANGE `revune` `revune` INTEGER;

ALTER TABLE `referralRevunes` CHANGE `bonus` `bonus` INTEGER;

ALTER TABLE `referralRevunes` CHANGE `date` `date` DATETIME;

ALTER TABLE
    `referralRevunes` CHANGE `revuneDetails` `revuneDetails` JSON;

ALTER TABLE
    `referralRevunes` CHANGE `bonusDetails` `bonusDetails` JSON;

ALTER TABLE
    `referralRevunes` CHANGE `approved` `approved` TINYINT(1) DEFAULT false;

ALTER TABLE
    `referralRevunes` CHANGE `paid` `paid` TINYINT(1) DEFAULT false;

ALTER TABLE
    `referralRevunes` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `referralRevunes` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `referralRevunes` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE
    `referralRevunes` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `settings` CHANGE `name` `name` VARCHAR(50);

ALTER TABLE `settings` CHANGE `value` `value` TEXT;

ALTER TABLE
    `settings` CHANGE `type` `type` ENUM(
        'TEXT',
        'BOOL',
        'NUMBER',
        'CURRENCY',
        'LIST'
    );

ALTER TABLE
    `settings` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `settings` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `settings` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `settings` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `terms` CHANGE `name` `name` VARCHAR(100);

ALTER TABLE `terms` CHANGE `text` `text` TEXT;

ALTER TABLE
    `terms` CHANGE `type` `type` ENUM(
        'TERM_OF_USE_VENDOR',
        'TERM_OF_USE_STAFF',
        'TERM_OF_USE_RESELLER',
        'TERM_OF_USE_CLIENT',
        'PRIVACY_POLICY'
    );

ALTER TABLE `terms` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE `terms` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE `terms` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `terms` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `termHashes` CHANGE `hash` `hash` TEXT;

ALTER TABLE
    `termHashes` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `termHashes` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `termHashes` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `termHashes` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `userPIXKeys` CHANGE `name` `name` VARCHAR(30);

ALTER TABLE
    `userPIXKeys` CHANGE `type` `type` ENUM(
        'CPF',
        'CNPJ',
        'EMAIL',
        'PHONE',
        'EVP',
        'BANK_ACCOUNT'
    );

ALTER TABLE `userPIXKeys` CHANGE `key` `key` VARCHAR(255);

ALTER TABLE `userPIXKeys` CHANGE `bank` `bank` VARCHAR(50);

ALTER TABLE `userPIXKeys` CHANGE `agency` `agency` INTEGER;

ALTER TABLE `userPIXKeys` CHANGE `account` `account` INTEGER;

ALTER TABLE `userPIXKeys` CHANGE `note` `note` VARCHAR(255);

ALTER TABLE `userPIXKeys` CHANGE `status` `status` VARCHAR(50);

ALTER TABLE
    `userPIXKeys` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `userPIXKeys` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `userPIXKeys` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `userPIXKeys` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE `userInfos` CHANGE `ip` `ip` VARCHAR(20);

ALTER TABLE `userInfos` CHANGE `forwardedIp` `forwardedIp` JSON;

ALTER TABLE `userInfos` CHANGE `platform` `platform` VARCHAR(10);

ALTER TABLE `userInfos` CHANGE `deviceId` `deviceId` VARCHAR(255);

ALTER TABLE `userInfos` CHANGE `region` `region` VARCHAR(50);

ALTER TABLE `userInfos` CHANGE `subRegion` `subRegion` VARCHAR(50);

ALTER TABLE
    `userInfos` CHANGE `citylatlong` `citylatlong` VARCHAR(50);

ALTER TABLE `userInfos` CHANGE `city` `city` VARCHAR(50);

ALTER TABLE `userInfos` CHANGE `app` `app` VARCHAR(50);

ALTER TABLE
    `userInfos` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `userInfos` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `userInfos` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE
    `userPayments` CHANGE `status` `status` ENUM(
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
    );

ALTER TABLE `userPayments` CHANGE `gateway` `gateway` VARCHAR(50);

ALTER TABLE `userPayments` CHANGE `brand` `brand` VARCHAR(20);

ALTER TABLE
    `userPayments` CHANGE `firstDigits` `firstDigits` VARCHAR(6);

ALTER TABLE
    `userPayments` CHANGE `lastDigits` `lastDigits` VARCHAR(4);

ALTER TABLE
    `userPayments` CHANGE `gatewayPaymentID` `gatewayPaymentID` TEXT;

ALTER TABLE `userPayments` CHANGE `amount` `amount` INTEGER;

ALTER TABLE
    `userPayments` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `userPayments` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `userPayments` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `userPayments` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE
    `vendorSettings` CHANGE `restaurantImage` `restaurantImage` TEXT;

ALTER TABLE
    `vendorSettings` CHANGE `contractName` `contractName` VARCHAR(100);

ALTER TABLE
    `vendorSettings` CHANGE `contractIdentity` `contractIdentity` VARCHAR(25);

ALTER TABLE `vendorSettings` CHANGE `email` `email` VARCHAR(255);

ALTER TABLE `vendorSettings` CHANGE `name` `name` VARCHAR(20);

ALTER TABLE
    `vendorSettings` CHANGE `lastName` `lastName` VARCHAR(50);

ALTER TABLE
    `vendorSettings` CHANGE `identity` `identity` VARCHAR(20);

ALTER TABLE `vendorSettings` CHANGE `areaCode` `areaCode` INTEGER(3);

ALTER TABLE `vendorSettings` CHANGE `phone` `phone` VARCHAR(20);

ALTER TABLE
    `vendorSettings` CHANGE `businessHours` `businessHours` JSON;

ALTER TABLE
    `vendorSettings` CHANGE `businessDays` `businessDays` JSON;

ALTER TABLE `vendorSettings` CHANGE `layout` `layout` JSON;

ALTER TABLE `vendorSettings` CHANGE `delivery` `delivery` INTEGER;

ALTER TABLE
    `vendorSettings` CHANGE `deliveryMin` `deliveryMin` INTEGER;

ALTER TABLE
    `vendorSettings` CHANGE `preparationMin` `preparationMin` INTEGER;

ALTER TABLE
    `vendorSettings` CHANGE `preparationMax` `preparationMax` INTEGER;

ALTER TABLE
    `vendorSettings` CHANGE `deliveryFree` `deliveryFree` TINYINT(1) DEFAULT true;

ALTER TABLE
    `vendorSettings` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `vendorSettings` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `vendorSettings` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE `vendorSettings` CHANGE `deletedAt` `deletedAt` DATETIME;

ALTER TABLE
    `vendorPaymentGateways` CHANGE `gateway` `gateway` VARCHAR(50);

ALTER TABLE `vendorPaymentGateways` CHANGE `data` `data` JSON;

ALTER TABLE
    `vendorPaymentGateways` CHANGE `active` `active` TINYINT(1) DEFAULT true;

ALTER TABLE
    `vendorPaymentGateways` CHANGE `createdAt` `createdAt` DATETIME NOT NULL;

ALTER TABLE
    `vendorPaymentGateways` CHANGE `updatedAt` `updatedAt` DATETIME NOT NULL;

ALTER TABLE
    `vendorPaymentGateways` CHANGE `deletedAt` `deletedAt` DATETIME;

CREATE TABLE
    IF NOT EXISTS `productOptionsCategories` (
        `id` CHAR(36) BINARY NOT NULL,
        `name` VARCHAR(100),
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
        `name` VARCHAR(100),
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
        `name` VARCHAR(100),
        `price` INTEGER,
        `units` INTEGER,
        `orderId` CHAR(36) BINARY,
        `orderProductId` CHAR(36) BINARY,
        `productOptionId` CHAR(36) BINARY,
        `contractId` CHAR(36) BINARY,
        `createdAt` DATETIME NOT NULL,
        `updatedAt` DATETIME NOT NULL,
        `deletedAt` DATETIME,
        PRIMARY KEY (`id`),
        FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (`orderProductId`) REFERENCES `orderProducts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (`productOptionId`) REFERENCES `productOptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (`contractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB;