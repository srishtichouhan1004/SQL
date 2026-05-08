create database MANAGEMENT;

use management;

drop table company;

create table company(companyID int primary key,
companyname varchar(45),
 street varchar(45),
 city varchar(45),
 state varchar(2),
 zip varchar(10) );
  
  
  INSERT INTO company 
(companyID, companyname, street, city, state, zip)
VALUES
(1, 'TCS', 'MG Road', 'Mumbai', 'MH', '400001'),
(2, 'Infosys', 'Electronic City', 'Bangalore', 'KA', '560100'),
(3, 'Wipro', 'Salt Lake', 'Kolkata', 'WB', '700091'),
(4, 'HCL', 'Sector 62', 'Noida', 'UP', '201301'),
(5, 'Tech Mahindra', 'Hinjewadi', 'Pune', 'MH', '411057');

  drop table contact;
  
 create table contact (contactid int primary key,
 companyid int,
 firstname varchar(45),
 lastname varchar(45),
 street varchar(45),
 city varchar(45),
 state varchar(2),
 zip varchar(10) ,
 ismain boolean,
 email varchar(45),
 phone varchar(12),
 foreign key (companyid) references company(companyid) );
 
 INSERT INTO contact
VALUES
(101, 1, 'Rahul', 'Sharma', 'MG Road', 'Mumbai', 'MH', '400001', TRUE, 'rahul@gmail.com', '9876543210'),

(102, 2, 'Priya', 'Patel', 'Electronic City', 'Bangalore', 'KA', '560100', TRUE, 'priya@gmail.com', '9876501234'),

(103, 3, 'Amit', 'Verma', 'Salt Lake', 'Kolkata', 'WB', '700091', FALSE, 'amit@gmail.com', '9876512345'),

(104, 4, 'Sneha', 'Singh', 'Sector 62', 'Noida', 'UP', '201301', TRUE, 'sneha@gmail.com', '9876523456'),

(105, 5, 'Karan', 'Mehta', 'Hinjewadi', 'Pune', 'MH', '411057', FALSE, 'karan@gmail.com', '9876534567');
 
 
  drop table employee;
 
 create table employee (employeeID int primary key,
 firstname varchar(45),
 lastname varchar(45),
 salary decimal(10,2),
 hiredate date ,
 jobtitle varchar(25),
 email varchar(45),
 phone varchar(12) );
 
 INSERT INTO employee
VALUES
(201, 'Arjun', 'Kapoor', 65000.00, '2021-06-12', 'Team Lead', 'arjun@company.com', '9123456780'),

(202, 'Neha', 'Joshi', 42000.00, '2022-09-25', 'Accountant', 'neha@company.com', '9234567891'),

(203, 'Vikas', 'Reddy', 38000.00, '2023-01-18', 'Designer', 'vikas@company.com', '9345678912'),

(204, 'Pooja', 'Nair', 47000.00, '2020-12-08', 'Consultant', 'pooja@company.com', '9456789123'),

(205, 'Rohan', 'Das', 52000.00, '2024-04-01', 'Supervisor', 'rohan@company.com', '9567891234');
 
drop table contactemployee;

 create table contactemployee  (columnemployeeid int primary key,
 contactid int,
 employeeid int,
 contactdate date,
 description varchar(100) ,
  foreign key (employeeid) references employee(employeeid) ,
  foreign key  (ContactID)  references Contact(ContactID));
 
 INSERT INTO contactemployee
VALUES
(1, 101, 201, '2025-01-10', 'Project discussion'),

(2, 102, 202, '2025-02-15', 'Salary meeting'),

(3, 103, 203, '2025-03-05', 'Design review'),

(4, 104, 204, '2025-03-20', 'HR interview'),

(5, 105, 205, '2025-04-12', 'Site inspection');

 select * from employee;

#Q4. 
 update employee
 set phone = "215-555-8800"
 where firstname="Neha" and lastname = "Joshi";
 
  select * from employee;
 
 #Q5.
 update company
 set companyname = "Urban Outfitters"
 where companyid = 2;

   select * from company;
   
   #Q6.
   delete from contactemployee
   where columnemployeeid = 1;
   
   select * from contactemployee;
   
#Q7.
SELECT concat(employee.firstname, employee.lastname)
FROM employee 
JOIN contactemployee 
ON employee.employeeid = contactemployee.employeeid
JOIN contact
ON contactemployee.contactid = contact.contactid
JOIN company 
ON contact.companyid = company.companyid
WHERE company.companyname = "wipro";

#Q8.
 
-- "%" → Represents zero, one, or multiple characters

SELECT * FROM employee
WHERE firstname LIKE 'A%';


-- "_" → Represents exactly one character.

SELECT * FROM employee
WHERE firstname LIKE '_a%';


#Q.9
/* Normalization is the process of organizing a database to reduce data redundancy,
 (duplicate data) and improve data integrity by splitting data into related tables.

 Goals of Normalization:-
 Eliminate duplicate data.
 Ensure data dependencies make logical sense.
 Make the database more efficient and easier to maintain */
 
 #Q10.
 
 /* A JOIN is used to combine rows from two or more tables based on a related column(usually a foreign key relationship) between them */
 
 #Q11.
 /* These are the three major sub-languages of SQL, each serving a different purpose:
 
 1. DDL — Data Definition Language
Used to define and manage the structure of the database (schema).

CREATE     Create a new table/database
ALTER      Modify an existing table
DROP       Delete a table/database
TRUNCATE   Remove all rows and reset the table

2. DML — Data Manipulation Language
Used to insert, update, delete, and retrieve data inside tables.

INSERT   Add new rows
UPDATE   Modify existing rows
DELETE   Remove rows

3.  DCL — Data Control Language
Used to control access and permissions on the database.

GRANT    Give privileges to a user
REVOKE   Remove privileges from a user
*/

#Q12.
/* A JOIN clause in MySQL is used to retrieve data from two or more tables by linking them together
 based on a common column (usually a primary key and foreign key relationship).
 
 In a normalized database, data is split across multiple tables to avoid redundancy. 
 JOIN helps us bring that data back together when we need to query it.
 
 Types of joins:-
 
 INNER JOIN    Only matching rows from both tables
 LEFT JOIN     All rows from left + matching from right
 RIGHT JOIN    All rows from right + matching from left
 OUTER JOIN    All rows from both tables
 */
