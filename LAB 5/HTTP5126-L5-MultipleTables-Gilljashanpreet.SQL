--  LAB 5 MULTIPLE TABLES

--  Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 5; your query for question 1B should go on line 7...
--  1 
-- A 
SELECT * FROM sale WHERE stock_item_id=1014;
-- B 
SELECT sale.stock_item_id,sale.date FROM sale JOIN stock_item ON 
sale.stock_item_id=stock_item.stock_item_id WHERE stock_item.stock_item_id=1014;

--  2
-- A 
SELECT * FROM sale WHERE employee_id=111;
-- B
SELECT sale.date,sale.stock_item_id,employee.first_name,employee.last_name FROM sale 
JOIN employee ON sale.employee_id = employee.employee_id
WHERE employee.employee_id = 111;

--  3
-- A
SELECT sale.date,stock_item.name FROM sale JOIN stock_item ON sale.stock_item_id= stock_item.stock_item_id
ORDER BY sale.date DESC LIMIT 5;
-- B
SELECT  sale.date,employee.last_name,employee.first_name,employee.employee_id FROM sale
JOIN employee ON employee.employee_id=sale.employee_id JOIN stock_item ON stock_item.stock_item_id ORDER BY sale.date
DESC LIMIT 5;

--  4
-- A
SELECT sale.date, stock_item.name,employee.first_name,employee.last_name FROM sale JOIN stock_item ON
sale.stock_item_id=stock_item.stock_item_id JOIN employee ON sale.employee_id=employee.employee_id
WHERE sale.date BETWEEN '2025-01-12'AND '2025-01-18';

-- B
SELECT employee.first_name ,employee.last_name, COUNT(sale.sale_id) AS total_sales 
FROM sale JOIN employee ON sale.employee_id = employee.employee_id
GROUP BY  employee.first_name, employee.last_name
ORDER BY total_sales DESC;


--  5
-- A
SELECT s.date AS Date, si.name AS Item_Name, si.price AS Price, 
       si.category AS Category, e.first_name AS First_Name
FROM sale s 
JOIN employee e ON s.employee_id = e.employee_id
JOIN stock_item si ON s.stock_item_id = si.stock_item_id
WHERE e.employee_id = (SELECT e.employee_id FROM sale s 
                   JOIN employee e ON s.employee_id = e.employee_id
                   JOIN stock_item si ON s.stock_item_id = si.stock_item_id
                   GROUP BY e.employee_id
                   ORDER BY SUM(PRICE) DESC LIMIT 1);
-- B 


--  6
-- A Manager: What is the total sales amount made by each employee for the canine category products? 
-- B
SELECT  e.first_name, e.last_name, si.category,SUM( si.price) AS total_sales
FROM sale s JOIN employee e ON s.employee_id = e.employee_id
JOIN stock_item si ON s.stock_item_id = si.stock_item_id
WHERE si.category = 'Canine' GROUP BY e.employee_id , si. category
ORDER BY  total_sales DESC;
