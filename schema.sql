drop database test_db;
create database test_db;
use test_db;

CREATE TABLE `product_category` (
    `id` INT(20) NOT NULL,
    `name` VARCHAR(20),
    `desc` TEXT,
    `created_at` TIMESTAMP,
    `modified_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

CREATE TABLE `product_inventory` (
    `id` INT(20) NOT NULL,
    `quantity` INT(20),
    `created_at` TIMESTAMP,
    `modified_at` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

CREATE TABLE `discount` (
    `id` INT(20) NOT NULL,
    `name` VARCHAR(20),
    `desc` TEXT,
    `discount_percent` DECIMAL(20, 2),
    `active` BOOLEAN,
    `created_at` TIMESTAMP,
    `modified_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);

CREATE TABLE `product` (
    `id` INT(20) NOT NULL,
    `name` VARCHAR(20),
    `desc` TEXT,
    `SKU` varchar(20),
    `category_id` INT(20),
    `inventory_id` INT(20),
    `price` DECIMAL(20, 2), 
    `discount_id` INT(20),
    `created_at` TIMESTAMP,
    `modified_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`category_id`) REFERENCES `product_category`(`id`),
    FOREIGN KEY (`inventory_id`) REFERENCES `product_inventory`(`id`),
    FOREIGN KEY (`discount_id`) REFERENCES `discount`(`id`)
);