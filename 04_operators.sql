
-- =====================================================
-- MYSQL PRACTICE - FILTERING DATA
-- Topic: WHERE Clause and SQL Operators
--
-- Categories:
-- 1. Comparison Operators
-- 2. Logical Operators
-- 3. Range Operator
-- 4. Membership Operators
-- 5. Pattern Matching (LIKE)
-- =====================================================


-- =====================================================
-- 1. COMPARISON OPERATORS
-- =====================================================

-- Equal to (=)
-- Display customers who belong to Germany.

SELECT *
FROM customers
WHERE country = 'Germany';


-- Not equal to (<>)
-- Display customers who do not belong to Germany.

SELECT *
FROM customers
WHERE country <> 'Germany';


-- Not equal to (!=)
-- Another way to check values that are not equal to Germany.
-- <> and != both work in MySQL.

SELECT *
FROM customers
WHERE country != 'Germany';


-- Greater than (>)
-- Display customers whose score is greater than 500.

SELECT *
FROM customers
WHERE score > 500;


-- Less than (<)
-- Display customers whose score is less than 500.

SELECT *
FROM customers
WHERE score < 500;


-- Greater than or equal to (>=)
-- Display customers whose score is 500 or more.

SELECT *
FROM customers
WHERE score >= 500;


-- Less than or equal to (<=)
-- Display customers whose score is 500 or less.

SELECT *
FROM customers
WHERE score <= 500;


-- =====================================================
-- 2. LOGICAL OPERATORS
-- =====================================================

-- AND Operator
-- Both conditions must be TRUE.
-- Display customers who belong to USA
-- AND have a score greater than 500.

SELECT *
FROM customers
WHERE country = 'USA'
  AND score > 500;


-- OR Operator
-- At least one condition must be TRUE.
-- Display customers who belong to USA
-- OR have a score greater than 500.

SELECT *
FROM customers
WHERE country = 'USA'
   OR score > 500;


-- NOT Operator
-- Reverses the condition.
-- Display customers whose score is NOT less than 500.
-- This is equivalent to score >= 500 for non-NULL scores.

SELECT *
FROM customers
WHERE NOT score < 500;


-- =====================================================
-- 3. RANGE OPERATOR - BETWEEN
-- =====================================================

-- BETWEEN checks whether a value falls within a range.
-- Display customers whose score is between 100 and 500.
-- Both 100 and 500 are included.

SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500;


-- =====================================================
-- 4. MEMBERSHIP OPERATORS - IN AND NOT IN
-- =====================================================

-- IN Operator
-- Checks whether a value matches any value in the list.
-- Display customers from Germany or USA.

SELECT *
FROM customers
WHERE country IN ('Germany', 'USA');


-- NOT IN Operator
-- Displays customers whose country is not Germany or USA.

SELECT *
FROM customers
WHERE country NOT IN ('Germany', 'USA');


-- =====================================================
-- 5. PATTERN MATCHING - LIKE OPERATOR
-- =====================================================

-- LIKE is used to search for a specific pattern in text.
--
-- Wildcards:
-- %  = Matches zero or more characters.
-- _  = Matches exactly one character.


-- Pattern 1: Names starting with 'm'
-- m% means the name must start with m.
-- Any number of characters can follow.

SELECT *
FROM customers
WHERE first_name LIKE 'm%';


-- Pattern 2: Names ending with 'n'
-- %n means any characters can come before n.
-- The name must end with n.

SELECT *
FROM customers
WHERE first_name LIKE '%n';


-- Pattern 3: Names containing 'r'
-- %r% means any characters can appear
-- before and after the letter r.

SELECT *
FROM customers
WHERE first_name LIKE '%r%';


-- Pattern 4: Names where the third character is 'r'
-- __r% means:
-- First underscore  = Any one character
-- Second underscore = Any one character
-- r                  = Third character must be r
-- %                  = Any characters can follow

SELECT *
FROM customers
WHERE first_name LIKE '__r%';


-- =====================================================
-- END OF FILTERING DATA PRACTICE
-- =====================================================
