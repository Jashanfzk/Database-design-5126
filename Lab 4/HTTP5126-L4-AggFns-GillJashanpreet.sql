-- LAB 4 AGGREGATE FUNCTIONS
-- Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 6; your query for question 1B should go on line 8...

    --  1 
    -- A
    SELECT MIN(price) FROM STOCK_ITEM;
    -- B
    SELECT MAX(inventory) FROM stock_item;
    -- C
    SELECT AVG(price) FROM stock_item;
    -- D
    SELECT SUM(inventory) FROM stock_item;

    --  2
    -- A
    SELECT role,COUNT(*)AS employee_count FROM employee GROUP BY role;
    -- B
    SELECT category, COUNT(*) AS mammals FROM stock_item WHERE category<>'piscine' GROUP BY category;
    -- C
    SELECT AVG(price) AS 'avearge price', category FROM stock_item GROUP BY inventory!=0;

    --  3
    -- A
    SELECT CATEGORY as "SPECIES", SUM(inventory) AS'in stock' FROM stock_item GROUP BY category ORDER BY "in stock" ASC;
    -- B
    SELECT category, SUM(inventory) AS total_stock, ROUND(AVG(price),2 )AS avearge_price FROM stock_item GROUP BY category Having total_stock <100;


    --  4
    -- A
    SELECT item AS Product,  CONCAT('$', price) AS Price, inventory AS "Stock Remaining", 
    category AS Species, (price * inventory) AS "Potential Earnings" FROM stock_item ORDER BY "Potential Earnings" DESC 
    LIMIT 20;