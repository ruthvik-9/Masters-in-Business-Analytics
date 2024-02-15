-- Ruthvik Rajan Banda CWID:50326130
USE assignmentdata;

-- Q1.Set Membership Test Problem: Show contact of customers who never purchased any order.
SELECT c.contactname
FROM customers c
WHERE c.customerid NOT IN
		(SELECT customerid FROM orders o WHERE o.customerid=c.customerid);
 
 -- Q2 Set Comparison Test Problem: Show order that has more quantity ordered than quantity orderof product ‘Gula Malacca’.
 SELECT *
 FROM orderdetails od
 WHERE od.quantity >  ALL
		(SELECT od1.quantity FROM orderdetails od1, products p WHERE p.productid = od1.productid AND p.productname LIKE "%gula malacca%");

-- Q3 List information of shippers that were used to ship orders.
SELECT o.Shipname
FROM orders o
WHERE o.shippeddate IN
		(SELECT o1.shippeddate FROM orders o1);
        
-- Q4  List information of product that never been ordered

SELECT p.productname
FROM products p
WHERE p.productID NOT IN
		(SELECT od.productid FROM orderdetails od WHERE od.productid = p.productID);
        
-- Q5 List information of order that has discount
SELECT *
FROM orderdetails od
WHERE od.discount IN
		(SELECT discount FROM orderdetails WHERE discount >0);
        
-- Q6 Show information of customers who live in the same region with employees
SELECT c.contactname
FROM customers c
WHERE c.region IN
		(SELECT e.region FROM employees e WHERE c.region=e.region);
        
-- Q7 Show customers’ contact name who not live in ‘USA’
SELECT *
FROM customers c
WHERE c.country NOT IN
		(SELECT country FROM customers WHERE country="USA");

-- Q8  Show products that has unit price greater than unit price of product ‘Tofu’

SELECT p.productname
FROM products p
WHERE p.unitprice > ALL
		(SELECT p1.unitprice FROM products p1 WHERE  p1.productname LIKE "%tofu%");
        
-- Q9 Show employees first name who made orders        
SELECT e.firstname
FROM employees e
WHERE e.employeeid IN
		(SELECT o.employeeid FROM orders o WHERE o.employeeid=e.employeeid);
        
-- Q10 Show customers with no region
SELECT *
FROM customers c
WHERE c.customerid IN
		(SELECT c.customerid FROM customers c WHERE c.region IS NULL);
		


