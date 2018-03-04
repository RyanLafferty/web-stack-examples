CREATE DATABASE IF NOT EXISTS `inventory`;

CREATE TABLE IF NOT EXISTS `product` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `quantity` INT UNSIGNED NOT NULL,
    `cost` FLOAT UNSIGNED NOT NULL,
    `price` FLOAT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
);

INSERT INTO `product` 
    (`name`, `quantity`, `cost`, `price`)
    VALUES ('Banana', '10', '0.58', '1.00');
INSERT INTO `product` 
    (`name`, `quantity`, `cost`, `price`)
    VALUES ('Apple', '15', '0.22', '0.75');
