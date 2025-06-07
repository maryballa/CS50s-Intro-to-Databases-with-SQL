
-- *** The Lost Letter ***
 SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses"
                WHERE "address" = '900 Somerville Avenue'
        )
        AND "to_address_id" = (
            SELECT "id" FROM "addresses"
                WHERE "address" LIKE '2 Fin%'
        )
);

--900 Somerville Avenue id = 384
--2 Finnigan Street id = 854

SELECT * FROM "addresses" WHERE "address" LIKE '2 Fin%';

-- *** The Devious Delivery ***

SELECT "id" FROM "packages"
    WHERE "from_address_id" IS NULL
    AND "contents" LIKE "%duck%";
--result 5098

SELECT "address_id" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages"
        WHERE "from_address_id" IS NULL
        AND "contents" LIKE "%duck%"
    )
    AND "action"='Drop';
--result=348

SELECT * FROM "addresses" WHERE "id" = (
    SELECT "address_id" FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages"
        WHERE "from_address_id" IS NULL
        AND "contents" LIKE "%duck%"
    )
    AND "action"='Drop'
);

-- *** The Forgotten Gift ***

SELECT * FROM "packages"
    WHERE "id" = (
        SELECT "package_id" FROM "scans"
            WHERE "address_id" = (
                SELECT "id" FROM "addresses"
                    WHERE "address"='109 Tileston Street'
            )AND "action" = 'Pick'
    )
;
--result=Flowers

SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "package_id" FROM "scans"
            WHERE "address_id" = (
                SELECT "id" FROM "addresses"
                    WHERE "address"='109 Tileston Street'
            )AND "action" = 'Pick'
    );

SELECT "name" FROM  "drivers" WHERE "id" = (
    SELECT "driver_id" FROM "scans"
        WHERE "package_id"=9523
        AND "address_id"=7432
        AND "action"='Pick'
);
