
-- =====================================================
-- MYSQL PRACTICE - DML COMMANDS
-- DML = DATA MANIPULATION LANGUAGE
--
-- Commands covered:
-- INSERT, UPDATE, DELETE
-- Also: INSERT INTO SELECT
-- =====================================================


-- =====================================================
-- 1. INSERT INTO - INSERT MULTIPLE RECORDS
-- =====================================================

-- Insert multiple customer records into the customers table.
-- Column names are mentioned explicitly.
-- NULL means no value is provided for that column.

INSERT INTO customers (id, first_name, country, score)
VALUES
    (6, 'JUNGKOOK', 'Korea', NULL),
    (7, 'Taehyung', NULL, 100);


-- Display all customer records
SELECT *
FROM customers;


-- =====================================================
-- 2. INSERT INTO - INSERT A SINGLE RECORD
-- =====================================================

-- Insert a new customer into the table.
-- Since column names are not specified,
-- values must follow the exact table column order.
-- Here the order is id, first_name, country, score.

INSERT INTO customers
VALUES
    (8, 'Jeonghan', 'Korea', 700);


-- =====================================================
-- 3. INSERT INTO - INSERT SELECTED COLUMN VALUES
-- =====================================================

-- Insert only id and first_name.
-- The remaining columns will receive their DEFAULT values
-- or NULL if they allow NULL and have no default.
-- This query assumes country and score allow NULL.

INSERT INTO customers (id, first_name)
VALUES
    (9, 'Jimin');


-- =====================================================
-- 4. SELECT - DISPLAY PERSONS TABLE
-- =====================================================

-- Display all records from the persons table.

SELECT *
FROM persons;


-- =====================================================
-- 5. SELECT STATIC VALUES
-- =====================================================

-- Retrieve customer id and first_name.
-- NULL displays an empty value.
-- 'unknown' displays fixed text.
-- These are query-result values, not actual table columns.

SELECT
    id,
    first_name,
    NULL AS birth_date,
    'unknown' AS phone
FROM customers;


-- =====================================================
-- 6. INSERT INTO SELECT - COPY DATA BETWEEN TABLES
-- =====================================================

-- Copy customer data into the persons table.
-- The SELECT statement retrieves records from customers.
-- The retrieved values are inserted into persons.
--
-- id         <- customers.id
-- person_name <- customers.first_name
-- birth_date <- NULL
-- phone      <- 'unknown'

INSERT INTO persons (id, person_name, birth_date, phone)
SELECT
    id,
    first_name,
    NULL,
    'unknown'
FROM customers;


-- Display the inserted records from persons
SELECT *
FROM persons;


-- =====================================================
-- 7. UPDATE - MODIFY EXISTING RECORDS
-- =====================================================

-- Change the score to 0 for the customer whose id is 6.
-- WHERE specifies which record should be updated.
-- Without WHERE, every customer's score would be changed.

UPDATE customers
SET score = 0
WHERE id = 6;


-- Display updated customer records
SELECT *
FROM customers;


-- =====================================================
-- 8. UPDATE - REPLACE NULL VALUES
-- =====================================================

-- Change score to 0 for all customers
-- whose score is currently NULL.
-- IS NULL is used to check for NULL values.

UPDATE customers
SET score = 0
WHERE score IS NULL;


-- =====================================================
-- 9. UPDATE - MODIFY MULTIPLE COLUMNS
-- =====================================================

-- For customer id 7:
-- Change score to 0.
-- Change country to Korea.
-- Both columns are updated in the same query.

UPDATE customers
SET
    score = 0,
    country = 'Korea'
WHERE id = 7;


-- Display customer records after updates
SELECT *
FROM customers;


-- =====================================================
-- 10. DELETE - DELETE SELECTED RECORDS
-- =====================================================

-- Delete customers whose id is greater than 5.
-- Only matching records are deleted.
-- The table structure remains unchanged.

DELETE FROM customers
WHERE id > 5;


-- Display remaining customer records
SELECT *
FROM customers;


-- =====================================================
-- 11. TRUNCATE - DELETE ALL RECORDS
-- =====================================================

-- Delete all records from persons table.
-- The table structure remains unchanged.
-- Unlike DELETE, TRUNCATE does not support WHERE.

TRUNCATE TABLE persons;


-- Display the empty persons table
SELECT *
FROM persons;


-- =====================================================
-- END OF DML PRACTICE
-- =====================================================
