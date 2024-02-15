-- Assignment 6
-- Banda Ruthvik Rajan     CWID:50326130

USE assignmentdata;


-- 1.Aggregate Function Problem: Find maximum product quantity that was sold

SELECT p.productname, MAX(od.quantity) AS Qty
FROM orderdetails od, products p
WHERE od.productid=p.productid;

-- 2.‘Having’ Filtering Problem: Find average product discount that is greater than 0.01 for ‘Sauce’product

SELECT AVG(od.discount) AS AverageDiscount
FROM orderdetails od,products p
WHERE p.productid=od.productid AND p.productname LIKE "%Sauce%" AND (od.discount)>0.01
HAVING AVG(od.discount)>0.01;

-- 3.SQL Function Problem:Return full name, and full address for each employee

SELECT concat(e.firstname,",",e.lastname) AS FullName, e.address
FROM employees e;

-- 4.Show the total unique last names for customers

SELECT  SUBSTR(c.contactname, 1, length(c.contactname) - length(SUBSTRING_INDEX(c.contactname, ' ', -1)) - 1) as first_name,
    SUBSTRING_INDEX(c.contactname, ' ', -1) as last_name 
FROM customers c ;


-- 5.Show the product name and its total product quantity sold. Sort descending the result based ontotal product quantity sold.

SELECT (p.productname),SUM(od.quantity) AS TotalSold
FROM products p, orderdetails od
WHERE p.productid=od.productid GROUP BY p.productname ORDER BY SUM(od.quantity) DESC;

-- 6.Show customer’s contact name, and total number of orders they purchase

SELECT c.contactname, COUNT(o.orderid) AS TotalOrders
FROM customers c ,orders o
WHERE c.customerid=o.customerid GROUP BY c.customerid;

-- 7.Display the total number of shippers used for each order shipped date

SELECT o.shippeddate,COUNT(o.shipNAme)
FROM orders o 
GROUP BY o.shippeddate;

-- 8. 8.Show each order and total amount that customer pay for

SELECT c.contactname, SUM(od.unitprice*od.quantity) AS TotalAmt
FROM customers c,orders o, orderdetails od
WHERE o.customerid=c.customerid AND o.orderid=od.orderid GROUP BY o.orderid;

-- 9. Find all products that have average quantity sold is greater than average quantity sold ofproduct ‘Aniseed Syrup’

SELECT round(AVG(od.quantity),2) AS GreaterAvg,p.productname
FROM products p ,orderdetails od
WHERE p.productid=od.productid GROUP BY p.productname
HAVING AVG(od.quantity)>27.33
ORDER BY round(AVG(od.quantity),2) ;

-- 10.  Show customers total amount spent on all orders

SELECT c.contactname, SUM(od.unitprice*od.quantity) AS TotalAmt
FROM customers c,orders o, orderdetails od
WHERE o.customerid=c.customerid AND o.orderid=od.orderid GROUP BY c.customerid;






