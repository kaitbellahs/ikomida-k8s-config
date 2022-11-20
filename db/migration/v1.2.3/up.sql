ALTER TABLE
    ikomida.vendorSettings
ADD
    orderMinValue INT DEFAULT 0 NULL;

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
        'WAITER',
        'COOKER',
        'DELIVERYMAN',
        'CLIENT',
        'RESELLER',
        'ALL'
    );

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
        'WAITER',
        'COOKER',
        'DELIVERYMAN',
        'CLIENT',
        'RESELLER',
        'ALL'
    );

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
        'WAITER',
        'COOKER',
        'DELIVERYMAN',
        'CLIENT',
        'RESELLER',
        'ALL'
    );

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
        'WAITER',
        'COOKER',
        'DELIVERYMAN',
        'CLIENT',
        'RESELLER',
        'ALL'
    );

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
        'WAITER',
        'COOKER',
        'DELIVERYMAN',
        'CLIENT',
        'RESELLER',
        'ALL'
    );