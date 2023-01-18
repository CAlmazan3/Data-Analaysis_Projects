 
 
 -- a cte that puts it in seasons 
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
  

-- gets the profit and displays top ten results. 

SELECT *, ROUND((`total_units` * `Product_Price`) - (`total_units` * `Product_Cost`)) AS `profit` 
FROM `cte_1` 
ORDER BY  `profit` DESC; 









