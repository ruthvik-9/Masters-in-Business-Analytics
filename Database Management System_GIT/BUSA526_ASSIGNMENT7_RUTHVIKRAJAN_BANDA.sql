-- Assignment 7
-- Ruthvik Rajan Banda CWID:50326130

USE assignmentdata;

-- 1.Create View to view all order info

CREATE VIEW Order_info1 AS
SELECT * FROM orders o;

SELECT*FROM Order_info1;

-- 2. Show first name, last name of employee, and indicate whetheremployee lives in California and Oregon.

SELECT e.firstname,e.lastname,
	(CASE 
    WHEN e.city='California' AND e.city="Oregon" THEN 'YES' 
    ELSE NULL 
    END) AS CAandOregon
FROM employees e;

-- 3. Create View to display orders which has more than 5 product quantity sold
CREATE VIEW prodgreaterthan5 AS
SELECT od.quantity,p.productname
FROM orderdetails od,products p
WHERE od.productid=p.productid 
HAVING (od.quantity) >5;

SELECT * FROM prodgreaterthan5;


-- 4. Create View to display info of products which has highest average quantity sold
CREATE VIEW HighAvgQtySold AS
SELECT AVG(od.quantity) AS AvgQtySold ,p.productname
FROM orderdetails od,products p
WHERE od.productid=p.productid GROUP BY p.productname ORDER BY AVG(od.quantity) DESC ;

SELECT * FROM HighAvgQtySold;

-- 5. Create View to display total numbers of customers purchased orders for each day

CREATE VIEW TotalPurchaceOnDay AS
SELECT COUNT(c.customerid),o.orderdate
FROM orders o, customers c
WHERE c.customerid=o.customerid GROUP BY c.customerid;

SELECT * FROM TotalPurchaceOnDay;

-- 6. Show info of products, and indicate whether the product is discount or not

SELECT od.orderid,p.productname,
	(CASE od.discount 
    WHEN od.discount != 0 THEN "discount"
    ELSE "NA"
    END) AS Discount
FROM orderdetails od,products p
WHERE p.productid=od.productid ;

-- 7. List customer info and indicate whether the customer purchase any order

SELECT c.contactname,
	(CASE 
    WHEN o.orderid <>0 THEN "Purchase"
    ELSE NULL
    END) AS PurchaseorNOT
FROM customers c
LEFT JOIN orders o ON c.customerid=o.customerid;

-- 8. Show employee’s first and last name, and indicate whether the employee lives in New York or Boston

SELECT e.firstname,e.lastname,
	(CASE 
    WHEN e.city='New York' OR e.city="Boston" THEN 'YES' 
    ELSE NULL 
    END) AS NYorBoston
FROM employees e;


-- 9. Create view to create total price for products with discount subtracted

CREATE VIEW TotalPriceafterDisc AS
SELECT p.ProductName,(od.unitprice*od.quantity)-((od.discount*100)/100) AS TotalPrice
FROM products p
LEFT JOIN orderdetails od ON p.productid = od.productid;

SELECT * FROM TotalPriceafterDisc;

-- 10. Show employee’s first and last name, and indicate whether the employee lives in Seattle city and country USA

SELECT e.firstname,e.lastname,
	(CASE 
    WHEN e.city='Seattle' AND e.country="USA" THEN 'YES' 
    ELSE NULL 
    END) AS SeattleUS
FROM employees e;


