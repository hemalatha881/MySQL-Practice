
-- =====================================================
-- MYSQL PRACTICE - DAY 01
-- Topics: SELECT, WHERE, ORDER BY, GROUP BY,
--         HAVING, DISTINCT, LIMIT and Static Values
-- =====================================================


-- Select the database we want to work with
USE mydatabase;


-- =====================================================
-- 1. SELECT - RETRIEVE DATA
-- =====================================================

-- Display all columns and all records from customers
SELECT *
FROM customers;

-- Display all columns and all records from orders
SELECT *
FROM orders;


-- =====================================================
-- 2. SELECT SPECIFIC COLUMNS
-- =====================================================

-- Retrieve only first_name, country and score columns
SELECT
    first_name,
    country,
    score
FROM customers;


-- =====================================================
-- 3. WHERE - FILTER RECORDS
-- =====================================================

-- Display customers whose score is not equal to 0
SELECT *
FROM customers
WHERE score != 0;

-- Display customers who belong to Germany
SELECT *
FROM customers
WHERE country = 'Germany';


-- =====================================================
-- 4. ORDER BY - SORT RECORDS
-- =====================================================

-- Sort customers by score in descending order
-- DESC = Highest to lowest
SELECT *
FROM customers
ORDER BY score DESC;

-- Sort customers by country in ascending order
-- ASC = A to Z
SELECT *
FROM customers
ORDER BY country ASC;

-- Sort by score (highest first).
-- If scores are equal, sort by country (A to Z).
SELECT *
FROM customers
ORDER BY
    score DESC,
    country ASC;


-- =====================================================
-- 5. GROUP BY - GROUP SIMILAR RECORDS
-- =====================================================

-- Calculate the total score for each country
-- SUM() adds all scores within each country
SELECT
    country,
    SUM(score) AS total_score
FROM customers
GROUP BY country;

-- Calculate total score and total customers in each country
-- COUNT(id) counts the customer records in each group
SELECT
    country,
    SUM(score) AS total_score,
    COUNT(id) AS total_customers
FROM customers
GROUP BY country;


-- =====================================================
-- 6. HAVING - FILTER GROUPED RESULTS
-- =====================================================

-- Display only countries whose total score is greater than 800
-- HAVING filters the results after GROUP BY
SELECT
    country,
    SUM(score) AS total_score
FROM customers
GROUP BY country
HAVING SUM(score) > 800;


-- =====================================================
-- 7. WHERE AND HAVING TOGETHER
-- =====================================================

-- Step 1: WHERE filters individual customers with score > 400
-- Step 2: GROUP BY groups the remaining customers by country
-- Step 3: HAVING keeps countries with total score > 800
SELECT
    country,
    SUM(score) AS total_score
FROM customers
WHERE score > 400
GROUP BY country
HAVING SUM(score) > 800;


-- Calculate the average score for each country
-- Ignore customers whose score is 0
-- Display only countries with an average above 430
SELECT
    country,
    AVG(score) AS average_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430;


-- =====================================================
-- 8. DISTINCT - DISPLAY UNIQUE VALUES
-- =====================================================

-- Display each country only once
-- Duplicate country names are removed
SELECT DISTINCT country
FROM customers;


-- =====================================================
-- 9. LIMIT - RESTRICT THE NUMBER OF ROWS
-- =====================================================

-- Display only the first 3 records
SELECT *
FROM customers
LIMIT 3;

-- Display the top 3 customers with the highest scores
SELECT *
FROM customers
ORDER BY score DESC
LIMIT 3;

-- Display the first 3 customers with the lowest scores
SELECT *
FROM customers
ORDER BY score ASC
LIMIT 3;


-- =====================================================
-- 10. ORDERS TABLE PRACTICE
-- =====================================================

-- Display all records from the orders table
SELECT *
FROM orders;

-- Display orders from newest to oldest
SELECT *
FROM orders
ORDER BY order_date DESC;


-- =====================================================
-- 11. REVISITING TABLE DATA
-- =====================================================

-- Display all customer records
SELECT *
FROM customers;

-- Display all order records
SELECT *
FROM orders;


-- =====================================================
-- 12. STATIC VALUES - DISPLAY FIXED VALUES
-- =====================================================

-- Display a fixed number (213) with an alias
SELECT 213 AS static_number;

-- Display fixed text with an alias
SELECT 'HELLO' AS static_string;


-- =====================================================
-- 13. ADD A STATIC COLUMN TO TABLE RESULTS
-- =====================================================

-- Display customer name and country along with
-- a fixed value 'new customer' for every record
-- customer_type is not an actual table column;
-- it is created only in the query result.
SELECT
    first_name,
    country,
    'new customer' AS customer_type
FROM customers;


-- =====================================================
-- END OF DAY 01 MYSQL PRACTICE
-- =====================================================
