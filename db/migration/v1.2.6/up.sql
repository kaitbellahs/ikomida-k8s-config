ALTER TABLE
    `apps` CHANGE `storeStatus` `storeStatus` ENUM(
        'PENDING',
        'DOING',
        'IN_REVIEW',
        'ATTENTION',
        'REJECTED',
        'CANCELED',
        'DONE'
    );

ALTER TABLE
    `apps` CHANGE `storeBuildStatus` `storeBuildStatus` ENUM(
        'PENDING',
        'DOING',
        'IN_REVIEW',
        'ATTENTION',
        'REJECTED',
        'CANCELED',
        'DONE'
    );

ALTER TABLE
    `apps` CHANGE `storePublishStatus` `storePublishStatus` ENUM(
        'PENDING',
        'DOING',
        'IN_REVIEW',
        'ATTENTION',
        'REJECTED',
        'CANCELED',
        'DONE'
    );