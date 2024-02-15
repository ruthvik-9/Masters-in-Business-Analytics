-- RUTHVIK RAJAN BANDA    CWID:50326130

USE assignmentdata;

-- Q1 Show employee’s first name, last name, and address

SELECT FirstName,LastName,Address FROM employees;

-- Q2 Show employee’s first name, last name, and territory that he/she serves
SELECT e.FirstName,e.LastName,t.territoryDescription
FROM Employees e , EmployeeTerritories et , territories t
WHERE e.employeeid = et.employeeid 
AND t.territoryid = et.territoryid;

-- Q3 Show order date and customers’ first name regardless they purchased order or not
SELECT o.orderdate , c.contactname
FROM customers c
LEFT JOIN orders o ON c.customerID = o.customerID ;

-- Q4 Show managers first name and lastname
SELECT DISTINCT e1.FirstName, e1.LastName 
FROM employees e1 , employees e2
WHERE e1.employeeid = e2.reportsto;

-- Q5 Show order date and its suppliers’
SELECT o.orderdate,s.companyname
FROM orders o,orderdetails od,products p,suppliers s
WHERE o.orderid = od.orderid
AND od.productid = p.productid
AND s.supplierid = p.supplierid;

-- Q6 For each order, show products’ name and total price after discount
SELECT p.ProductName,(od.unitprice*od.quantity)-((od.discount*100)/100) AS TotalPrice
FROM products p
LEFT JOIN orderdetails od ON p.productid = od.productid;


-- Q7 Show employees’ first name, last name and his/her managers’ first name, last name
SELECT e2.FirstName,e2.LastName,e1.FirstName,e1.LastName
FROM employees e1, employees e2
WHERE e1.employeeid = e2.reportsto ;

-- Q8 Show CEO’s first name and the date he/she was hired
SELECT e.FirstName,e.HireDate 
FROM employees e
WHERE e.reportsto IS NULL;

-- Q9 Show order date, customer’s name regardless they purchased order or not, and employee’s first name regardless they sold the order to the customer or not.
SELECT o.orderdate , c.contactname,e.firstname
FROM customers c
LEFT JOIN orders o ON o.customerID = c.customerID
LEFT JOIN employees e ON  o.employeeID = e.employeeID ;

    
-- Q10. Name your own query question and answer itName your own query question and answer it

-- Show products name with number of orders received and therir total amount

SELECT p.productname, od.unitprice * od.quantity AS Totals, count(od.orderid) AS TotalOrders
FROM products p
LEFT JOIN orderdetails od ON p.productid = od.productid
GROUP BY productname; 



