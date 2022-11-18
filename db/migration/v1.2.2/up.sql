ALTER TABLE
    `contractPaymentSignatures`
ADD
    `billingType` ENUM(
        'BOLETO',
        'CREDIT_CARD',
        'PIX',
        'UNDEFINED'
    ) DEFAULT 'CREDIT_CARD';

ALTER TABLE
    `contractPayments` CHANGE `billingType` `billingType` ENUM(
        'BOLETO',
        'CREDIT_CARD',
        'PIX',
        'UNDEFINED'
    ) DEFAULT 'CREDIT_CARD';

ALTER TABLE `vendorSettings`
ADD
    `billingType` ENUM(
        'BOLETO',
        'CREDIT_CARD',
        'PIX',
        'UNDEFINED'
    ) DEFAULT 'CREDIT_CARD';

ALTER TABLE `contractPayments` Add `bankSlipUrl` VARCHAR(255) NULL;