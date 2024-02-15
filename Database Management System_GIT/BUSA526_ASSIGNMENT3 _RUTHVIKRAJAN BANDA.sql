-- RUTHVIK RAJAN BANDA , CWID:50326130

-- creating a database named employee information
CREATE SCHEMA employeeinformation;

-- select the database to workwith
USE employeeinformation;

-- creating a table employee with employeeID as primary key and followed by other attributes
CREATE TABLE employee (
EmployeeID INT NOT NULL PRIMARY KEY,
Emp_FName VARCHAR(100) NOT NULL,
Emp_LName VARCHAR(100) NOT NULL);

-- creating a table job promotion with JobPromotionID as primary key & EmployeeID as foreign key
CREATE TABLE jobpromotion (
JobPromotionID INT NOT NULL PRIMARY KEY,
JobPromotionStartDate DATE,
JobPromotionEndDate DATE,
EmployeeID INT,
FOREIGN KEY (EmployeeID) REFERENCES employee(EmployeeID)
);

-- creating a table for {companyposition} with CPK of (companyposition,EmpID) & connecting EmpID to the original EmployeeTable
CREATE TABLE companyposition (
CompanyPosition VARCHAR(100) NOT NULL,
EmployeeID INT,
PRIMARY KEY (CompanyPosition,EmployeeID),
FOREIGN KEY (EmployeeID) REFERENCES employee(EmployeeID));

-- Creating a table for Associative Entity with CPK (ManagerID,EmployeeID)
CREATE TABLE manager (
ManagerID INT NOT NULL,
EmployeeID INT,
PRIMARY KEY (ManagerID,EmployeeID),
FOREIGN KEY (EmployeeID) REFERENCES employee(EmployeeID),
FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID));

INSERT INTO employee(EmployeeID,Emp_FName,Emp_LName) VALUES(101,"ABC","D");

INSERT INTO employee(EmployeeID,Emp_FName,Emp_LName) 
VALUES(102,"XYZ","W"),(103,"UVW","X"),(104,"PQR","E");

INSERT INTO companyposition(CompanyPosition,EmployeeID)
VALUES ("Jr.Executive",102),("ContractEmp",103),("Jr.Executive",104),("Sr.Executive",101);

INSERT INTO jobpromotion(JobPromotionID,JobPromotionStartDate,JobPromotionEndDate,EmployeeID)
VALUES (001,"2019-02-01","2021-12-31",101);

INSERT INTO jobpromotion(JobPromotionID,JobPromotionStartDate,JobPromotionEndDate,EmployeeID)
VALUES (002,"2020-01-01","2021-12-31",103);

INSERT INTO jobpromotion(JobPromotionID,JobPromotionStartDate,JobPromotionEndDate,EmployeeID)
VALUES (004,"2018-01-01","2020-12-31",102),(003,"2019-05-01","2021-03-15",104);

INSERT INTO employee(EmployeeID,Emp_FName,Emp_LName) 
VALUES(105,"DEF","X"),(106,"ASD","N");

INSERT INTO companyposition(CompanyPosition,EmployeeID)
VALUES ("Jr.Executive",105),("ContractEmp",106);

INSERT INTO jobpromotion(JobPromotionID,JobPromotionStartDate,JobPromotionEndDate,EmployeeID)
VALUES (005,"2017-03-01","2020-12-31",105),(006,"2019-05-01","2021-03-15",106);

INSERT INTO manager(ManagerID,EmployeeID) VALUES(101,102);

INSERT INTO manager(ManagerID,EmployeeID) VALUES(101,103),(101,104),(101,105),(101,106);

SELECT * FROM Employee;

SELECT * FROM manager;

SELECT e.Emp_FName,e.Emp_LName,cp.companyposition,e.EmployeeID
FROM companyposition cp,employee e
WHERE cp.EmployeeID = e.EmployeeID;
