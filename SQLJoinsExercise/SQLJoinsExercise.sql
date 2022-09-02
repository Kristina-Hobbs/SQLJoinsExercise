
/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT P.Name as Product, C.Name as Categories 
 FROM Products AS P
 INNER JOIN categories as C
 ON C.CategoryID = P.CategoryID
 Where C.Name = 'Computers';
 
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.Name, p.Price, r.Rating from products as p
 INNER JOIN reviews as r on r.ProductID = p.ProductID
 where r.rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.lastname, SUM(sales.Quantity) AS total
FROM employees, sales
WHERE sales.employeeID = employees.employeeID
GROUP BY employees.employeeID;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT * 
FROM departments
LEFT JOIN categories
ON departments.name = categories.name;

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, SUM(s.Quantity) AS 'TOTAL SOLD', SUM(s.Quantity * s.PricePerUnit) AS 'Total Price'
FROM products AS p
INNER JOIN sales AS s
ON p.ProductID = s.ProductID
WHERE p.Name = 'Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM products AS p
INNER JOIN reviews AS r ON r.ProductID = p.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) AS TotalSold
FROM Sales AS s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID;


