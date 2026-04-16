-- counting Number of rows in each table -- 
SELECT COUNT(*) FROM category;
SELECT COUNT(*) FROM creator;
SELECT COUNT(*) FROM location;
SELECT COUNT(*) FROM projects;

-- Total number of projects --  
SELECT COUNT(*) AS total_projects
FROM projects;

-- Total pledged amount --
 SELECT SUM(usd_pledged) AS total_pledged_usd
FROM projects;

-- Success vs Failed projects --
 SELECT state, COUNT(*) AS project_count
FROM projects
GROUP BY state
ORDER BY project_count DESC;

-- Top 10 categories by project count -- 
SELECT c.name AS category_name,
COUNT(p.id) AS total_projects
FROM projects p
JOIN category c
ON p.category_id = c.id
GROUP BY c.name
ORDER BY total_projects DESC
LIMIT 10;

-- Projects with pledge greater than average pledge(SUBQUERY)--
SELECT name, pledged
FROM projects
WHERE pledged > (
    SELECT AVG(pledged) FROM projects
);

--  Projects by country --
SELECT country, COUNT(*) AS project_count
FROM projects
GROUP BY country
ORDER BY project_count DESC;

-- Success rate --
SELECT 
    ROUND(
        SUM(CASE WHEN state = 'successful' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS success_rate_percentage
FROM projects;

--  Average funding per project --
SELECT AVG(usd_pledged) AS avg_pledged
FROM projects;

-- WINDOW FUNCTION (Ranking) --
SELECT 
    name,
    pledged,
    RANK() OVER (ORDER BY pledged DESC) AS project_rank
FROM projects
LIMIT 10;

-- VIEW --
 CREATE VIEW vw_project_summary AS
SELECT 
    p.id,
    p.name,
    c.name AS category,
    p.pledged,
    p.goal
FROM projects p
JOIN category c 
    ON p.category_id = c.id;
-- view --
SELECT * FROM vw_project_summary LIMIT 10;

-- STORED PROCEDURE --
-- Procedure to get projects above amount --
DELIMITER $$

CREATE PROCEDURE GetHighFundedProjects(IN min_amount DECIMAL(12,2))
BEGIN
    SELECT name, pledged
    FROM projects
    WHERE pledged >= min_amount;
END $$

DELIMITER ;

-- SP --
CALL GetHighFundedProjects(10000);
 

