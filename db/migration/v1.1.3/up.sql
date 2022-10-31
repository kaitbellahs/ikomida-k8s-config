ALTER TABLE coupons ADD minValue INTEGER NULL;

ALTER TABLE orders
ADD
    orderType ENUM('DELIVERY', 'PICKUP', 'LOCAL') NULL;

ALTER TABLE orders ADD tip INTEGER NULL;

ALTER TABLE products ADD orderTypes JSON NULL;

ALTER TABLE vendorSettings ADD orderTypes JSON NULL;

ALTER TABLE vendorSettings ADD tip INTEGER NULL;