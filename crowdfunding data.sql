CREATE DATABASE crowdfunding_db;
USE crowdfunding_db;
CREATE TABLE category(
	id INT PRIMARY KEY,
    name VARCHAR(100),
    parent_id INT,
    position INT
);
CREATE TABLE creator (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255),
    chosen_currency VARCHAR(10)
);
CREATE TABLE location (
    id INT PRIMARY KEY,
    displayable_name VARCHAR(255),
    type VARCHAR(50),
    name VARCHAR(100),
    state VARCHAR(50),
    country VARCHAR(10),
    localized_name VARCHAR(255)
);
CREATE TABLE projects (
    id BIGINT PRIMARY KEY,
    state VARCHAR(50),
    name VARCHAR(500),
    country VARCHAR(10),
    creator_id BIGINT,
    location_id INT,
    category_id INT,
    created_at BIGINT,
    deadline BIGINT,
    updated_at BIGINT,
    state_changed_at BIGINT,
    successful_at BIGINT NULL,
    launched_at BIGINT,
    goal DECIMAL(12,2),
    pledged DECIMAL(12,2),
    currency VARCHAR(10),
    currency_symbol VARCHAR(5),
    usd_pledged DECIMAL(12,2),
    static_usd_rate DECIMAL(10,4),
    backers_count INT,
    spotlight BOOLEAN,
    staff_pick BOOLEAN,
    blurb TEXT,
    currency_trailing_code BOOLEAN,
    disable_communication BOOLEAN
);
SHOW VARIABLES LIKE 'secure_file_priv';
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
LOAD DATA LOCAL INFILE 'C:/Users/saksh/Downloads/crowdfunding_Category.csv'
INTO TABLE category
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM category;
SELECT * FROM category LIMIT 10;

LOAD DATA LOCAL INFILE 'C:/Users/saksh/Downloads/Crowdfunding_Creator.csv'
INTO TABLE creator
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM creator;

LOAD DATA LOCAL INFILE 'C:/Users/saksh/Downloads/Crowdfunding_Location.csv'
INTO TABLE location
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM location;

LOAD DATA LOCAL INFILE 'C:/Users/saksh/Downloads/Crowdfunding_projects_1.csv'
INTO TABLE projects
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM projects;









