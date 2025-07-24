CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL UNIQUE,
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `type` ENUM('Primary','Secondary','Higher Education'),
    `location` VARCHAR(32),
    `founded_year` YEAR,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id`  INT AUTO_INCREMENT,
    `name` TEXT NOT NULL,
    `industry` ENUM('Technology','Education','Business'),
    `location` VARCHAR(32),
    PRIMARY KEY(`id`)
);

CREATE TABLE `people_connections` (
    `user_A_id` INT NOT NULL,
    `user_B_id` INT NOT NULL,
    FOREIGN KEY (`user_A_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`user_B_id`) REFERENCES `users`(`id`)
);

CREATE TABLE `school_connections` (
    `user_id` INT NOT NULL,
    `school_id` INT NOT NULL,
    `start_date` DATE,
    `end_date` DATE,
    `status` ENUM('earned','pursued') NOT NULL,
    `type_of_degree` VARCHAR(8) NOT NULL,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`)
);

CREATE TABLE `company_connections` (
    `user_id` INT NOT NULL,
    `company_id` INT NOT NULL,
    `start_date` DATE,
    `end_date` DATE,
    `title` VARCHAR(32),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`)
);
