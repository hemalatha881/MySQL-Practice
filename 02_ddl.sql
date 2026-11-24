
-- =====================================================
-- DDL COMMANDS - MYSQL PRACTICE
-- DDL = DATA DEFINITION LANGUAGE
-- Used to create, modify and delete table structures.
--
-- Commands covered:
-- CREATE, ALTER, RENAME, DROP, TRUNCATE
-- =====================================================


-- =====================================================
-- 1. CREATE TABLE
-- =====================================================

-- Create a table named persons
-- id          : Integer column and Primary Key
-- person_name : Stores person's name; cannot be NULL
-- birth_date  : Stores date of birth
-- phone       : Stores phone number; cannot be NULL

CREATE TABLE persons (
    id INT PRIMARY KEY,
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    phone VARCHAR(15) NOT NULL
);


-- Display all records from persons table
SELECT *
FROM persons;


-- =====================================================
-- 2. ALTER TABLE - ADD COLUMN
-- =====================================================

-- Add a new column called email
-- NOT NULL means the column cannot contain NULL values.
-- If the table already contains records, adding a NOT NULL
-- column without a DEFAULT value may fail.
-- This works normally when the table is empty.

ALTER TABLE persons
ADD email VARCHAR(30) NOT NULL;


-- Add two columns in a single ALTER TABLE statement
-- email_1 stores email information
-- age stores the person's age

ALTER TABLE persons
ADD email_1 VARCHAR(30) NOT NULL,
ADD age INT;


-- =====================================================
-- 3. ALTER TABLE - MODIFY COLUMN
-- =====================================================

-- Change the datatype or size of an existing column.
-- Here, person_name remains VARCHAR(50).
-- This example does not change its datatype or size.

ALTER TABLE persons
MODIFY person_name VARCHAR(50);


-- Change age datatype from INT to SMALLINT
-- SMALLINT uses less storage than INT.

ALTER TABLE persons
MODIFY age SMALLINT;


-- =====================================================
-- 4. ALTER TABLE - CHANGE COLUMN
-- =====================================================

-- Rename person_name to employee_name
-- CHANGE can rename a column and modify its datatype.
-- The new column datatype must be specified.

ALTER TABLE persons
CHANGE person_name employee_name VARCHAR(50);


-- =====================================================
-- 5. ALTER TABLE - RENAME COLUMN
-- =====================================================

-- Rename email_1 column to city
-- Only the column name is changed.

ALTER TABLE persons
RENAME COLUMN email_1 TO city;


-- =====================================================
-- 6. ALTER TABLE - DROP COLUMN
-- =====================================================

-- Permanently delete the phone column from persons table.

ALTER TABLE persons
DROP COLUMN phone;


-- =====================================================
-- 7. ALTER TABLE - RENAME TABLE
-- =====================================================

-- Rename the table persons to person.

ALTER TABLE persons
RENAME TO person;


-- Display all records from the renamed table
SELECT *
FROM person;


-- =====================================================
-- 8. RENAME TABLE
-- =====================================================

-- Rename person table back to persons.

RENAME TABLE person TO persons;


-- =====================================================
-- 9. ALTER TABLE - ADD PRIMARY KEY
-- =====================================================

-- Add PRIMARY KEY constraint to the id column.
-- A primary key does not allow duplicate or NULL values.
-- Note: id was already created as PRIMARY KEY above.
-- Therefore, running this query now will give an error.

ALTER TABLE persons
ADD PRIMARY KEY (id);


-- =====================================================
-- 10. ALTER TABLE - DROP PRIMARY KEY
-- =====================================================

-- Remove the primary key constraint from employees table.
-- Note: This table must exist and have a primary key.
-- Your current practice table is persons, not employees.

ALTER TABLE employees
DROP PRIMARY KEY;


-- =====================================================
-- 11. ALTER TABLE - ADD UNIQUE CONSTRAINT
-- =====================================================

-- Add a UNIQUE constraint to email.
-- UNIQUE does not allow duplicate non-NULL values.

ALTER TABLE persons
ADD CONSTRAINT unique_email UNIQUE (email);


-- =====================================================
-- 12. ALTER TABLE - DROP UNIQUE CONSTRAINT
-- =====================================================

-- Remove the UNIQUE constraint using its index name.

ALTER TABLE persons
DROP INDEX unique_email;


-- =====================================================
-- 13. DROP TABLE
-- =====================================================

-- Permanently delete the persons table.
-- Both table structure and its records are deleted.

DROP TABLE persons;


-- Trying to display records after DROP will give an error
-- because the table no longer exists.

SELECT *
FROM persons;


-- =====================================================
-- 14. TRUNCATE TABLE
-- =====================================================

-- Delete all records from the persons table.
-- The table structure remains unchanged.
-- Note: The correct spelling is persons, not perosns.
-- This query will fail if the table was already dropped above.

TRUNCATE TABLE persons;


-- =====================================================
-- END OF DDL PRACTICE
-- =====================================================
