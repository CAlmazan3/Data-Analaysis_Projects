-- takes sum of the profit of each product cateogry 
WITH `cte` AS (
SELECT `Store_Location`, `Product_Category`, SUM(`profit`) AS `total_profit` 
FROM toy_sales.join_one  
GROUP BY `Store_Location`, `Product_Category`) 

-- takes the category with the highest profit value from each location. It also returns the profit as well. 
SELECT `Store_Location`, `Product_Category`, `total_profit` 
FROM `cte` 
WHERE (`Store_Location`, `total_profit`) IN (SELECT `Store_Location`, MAX(`total_profit`) FROM `cte` GROUP BY `Store_Location`) 
ORDER BY `Store_Location` ASC; 

