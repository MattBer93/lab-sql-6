use sakila;

-- Let's add a new table for 2020 films:

drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

-- warning 1681: Cause because of column type definitions like INT(##). In future, try declaring with just INT.

-- We have just one item for each film, and all will be placed in the new table. 
-- For 2020, the rental duration will be 3 days, with an offer price of 2.99€ and a replacement cost of 8.99€ 
-- (these are all fixed values for all movies for this year). 
-- The catalog is in a CSV file named films_2020.csv that can be found at files_for_lab folder.

show variables like 'local_infile';
set global local_infile = 1;

-- 1) Add the new films to the database
-- LOAD DATA INFILE 'films_2020.csv' 
-- INTO TABLE films_2020
-- FIELDS TERMINATED BY ',';
-- with code above, getting error message about secure-file-priv
-- Imported with the wizard

select * from films_2020;


-- 2) Update information on rental_duration, rental_rate, and replacement_cost.
update films_2020
set rental_duration = 3;

	-- Error 1175 - Safe Update active
    SET SQL_SAFE_UPDATES = 0; -- to disable, 1 to enable
    
update films_2020
set rental_rate = 2.99;

update films_2020
set replacement_cost = 8.99;

















