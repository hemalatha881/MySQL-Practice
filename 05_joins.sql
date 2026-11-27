
-- =====================================================
-- MYSQL PRACTICE - JOINS
-- Topic: Joining Data from Multiple Tables
--
-- JOIN types covered:
-- 1. INNER JOIN
-- 2. LEFT JOIN
-- 3. RIGHT JOIN
-- 4. FULL OUTER JOIN (concept)
-- 5. CROSS JOIN
-- 6. LEFT ANTI JOIN (using IS NULL)
-- 7. RIGHT ANTI JOIN (using IS NULL)
-- 8. LEFT SEMI JOIN (using IS NOT NULL)
-- 9. MULTIPLE TABLE JOINS
-- =====================================================


-- Select the database
USE mydatabase;


-- =====================================================
-- 1. INNER JOIN
-- =====================================================

-- INNER JOIN returns only matching records
-- from both customers and orders tables.
--
-- c = Alias for customers table
-- o = Alias for orders table
-- c.id = Customer ID
-- o.customer_id = Customer ID in orders table

SELECT *
FROM customers c
INNER JOIN orders o
    ON o.customer_id = c.id;


-- =====================================================
-- 2. LEFT JOIN (LEFT OUTER JOIN)
-- =====================================================

-- LEFT JOIN returns:
-- 1. All records from the left table (customers).
-- 2. Matching records from the right table (orders).
-- 3. If no matching order exists, order columns show NULL.

SELECT *
FROM customers c
LEFT JOIN orders o
    ON o.customer_id = c.id;


-- =====================================================
-- 3. RIGHT JOIN (RIGHT OUTER JOIN)
-- =====================================================

-- RIGHT JOIN returns:
-- 1. All records from the right table (orders).
-- 2. Matching records from the left table (customers).
-- 3. If no matching customer exists, customer columns show NULL.

SELECT *
FROM customers c
RIGHT JOIN orders o
    ON o.customer_id = c.id;


-- =====================================================
-- 4. RIGHT JOIN USING REVERSED TABLE ORDER
-- =====================================================

-- Here orders is the left table and customers is the right table.
-- RIGHT JOIN returns all records from customers
-- and matching records from orders.
--
-- This gives the same matching and unmatched customer coverage
-- as the LEFT JOIN in query number 2.

SELECT *
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.id;


-- =====================================================
-- 5. FULL OUTER JOIN - CONCEPT
-- =====================================================

-- FULL OUTER JOIN returns:
-- 1. All matching records.
-- 2. Unmatched records from the left table.
-- 3. Unmatched records from the right table.
--
-- MySQL does not directly support FULL OUTER JOIN.
-- We can achieve similar results using LEFT JOIN and
-- RIGHT JOIN with UNION.

SELECT *
FROM customers c
LEFT JOIN orders o
    ON o.customer_id = c.id

UNION

SELECT *
FROM customers c
RIGHT JOIN orders o
    ON o.customer_id = c.id;


-- =====================================================
-- 6. CROSS JOIN
-- =====================================================

-- CROSS JOIN returns every possible combination
-- of records from both tables.
--
-- If customers has 5 rows and orders has 10 rows,
-- the result will contain 5 x 10 = 50 rows.
--
-- CROSS JOIN does not require an ON condition.

SELECT *
FROM orders o
CROSS JOIN customers c;


-- =====================================================
-- 7. LEFT ANTI JOIN
-- =====================================================

-- Find customers who have NO matching orders.
--
-- LEFT JOIN returns all customers.
-- WHERE o.customer_id IS NULL filters only
-- customers without matching orders.

SELECT *
FROM customers c
LEFT JOIN orders o
    ON o.customer_id = c.id
WHERE o.customer_id IS NULL;


-- =====================================================
-- 8. RIGHT ANTI JOIN
-- =====================================================

-- Find orders that do not have a matching customer.
--
-- RIGHT JOIN returns all orders.
-- WHERE c.id IS NULL filters orders
-- without a matching customer.

SELECT *
FROM customers c
RIGHT JOIN orders o
    ON o.customer_id = c.id
WHERE c.id IS NULL;


-- =====================================================
-- 9. LEFT SEMI JOIN - USING IS NOT NULL
-- =====================================================

-- Find customers who have at least one matching order.
--
-- LEFT JOIN matches customers with orders.
-- WHERE o.customer_id IS NOT NULL keeps only
-- customers that have a matching order.
--
-- Note: If a customer has multiple orders,
-- that customer can appear multiple times.

SELECT *
FROM customers c
LEFT JOIN orders o
    ON o.customer_id = c.id
WHERE o.customer_id IS NOT NULL;


-- =====================================================
-- 10. CROSS JOIN - WITHOUT ALIAS
-- =====================================================

-- Display every possible combination of customers and orders.
-- No matching condition is applied.

SELECT *
FROM customers
CROSS JOIN orders;


-- =====================================================
-- 11. MULTIPLE TABLE JOINS - SALESDB
-- =====================================================

-- Select the SalesDB database.

USE salesdb;


-- Display all records from each table.

SELECT *
FROM orders;

SELECT *
FROM customers;

SELECT *
FROM employees;

SELECT *
FROM products;


-- =====================================================
-- 12. JOIN MULTIPLE TABLES
-- =====================================================

-- Retrieve order details along with customer,
-- product and employee information.
--
-- Tables used:
-- 1. orders
-- 2. customers
-- 3. products
-- 4. employees
--
-- LEFT JOIN keeps all orders, even if matching
-- records are missing in the other tables.
--
-- Aliases:
-- o = orders
-- c = customers
-- p = products
-- e = employees

SELECT
    o.orderid,
    o.sales,

    -- Customer details
    c.firstname AS customer_firstname,
    c.lastname AS customer_lastname,

    -- Product details
    p.product AS productname,
    p.price,

    -- Employee details
    e.firstname AS employee_firstname,
    e.lastname AS employee_lastname

FROM orders o

-- Match orders with customers
LEFT JOIN customers c
    ON o.customerid = c.customerid

-- Match orders with products
LEFT JOIN products p
    ON o.productid = p.productid

-- Match orders with employees
LEFT JOIN employees e
    ON o.salespersonid = e.employeeid;


-- =====================================================
-- END OF MYSQL JOIN PRACTICE
-- =====================================================
