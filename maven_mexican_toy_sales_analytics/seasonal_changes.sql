 
 
 -- a cte that puts it in seasons (driest, shoulder, low) 
 WITH `cte` AS ( 
SELECT *, CASE 
WHEN MONTH(`date`) IN (12,1,2,3,4) THEN 'DRIEST'
WHEN MONTH(`date`) IN (7,8) THEN 'SHOULDER' 
WHEN MONTH(`date`) IN (5,6,9,10,11) THEN 'LOW' 
ELSE 'No month available' 
END AS `seasons` 
FROM toy_sales.sales 
),

-- gets the prices of the products, products name, and category
 `cte_1` AS (
SELECT pr.`Product_Name`, pr.`Product_Category`, pr.`Product_Cost`, pr.`Product_Price`, SUM(sa.`Units`) AS `total_units`, 
sa.`seasons` 
FROM `cte` AS `sa` 
INNER JOIN 
toy_sales.products `pr` 
ON sa.`Product_ID` = pr.`Product_ID` 
GROUP BY `Product_Name`, `Product_Category`, `Product_Cost`, `Product_Price`, `seasons`) 
  

-- gets the profit for each season and rounds them to the nearest hundreth 
 `cte_2` AS (
SELECT `Seasons`, ROUND((`total_units` * `Product_Price`) - (`total_units` * `Product_Cost`),2) AS `profit` 
FROM `cte_1` 
GROUP BY `Seasons`, `profit` 
ORDER BY  `profit` DESC) 

-- gets the total profit from each season 
SELECT `Seasons`, SUM(`profit`) As `total_profit` 
FROM `cte_2` 
GROUP BY `Seasons` 
ORDER BY `total_profit` DESC; 








