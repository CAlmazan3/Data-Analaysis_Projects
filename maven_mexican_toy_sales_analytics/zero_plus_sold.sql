WITH `cte` AS (
SELECT pr.`Product_ID`, pr.`Product_Name`, COUNT(sa.`Units`) AS `units_sold_in_Mexico`
FROM toy_sales.sales `sa`
INNER JOIN 
toy_sales.products `pr` 
ON sa.`Product_ID` = pr.`Product_ID` 
WHERE sa.`Product_ID` IN (1,2,3,4,5,9,11,12,13,14,15,16,21,23,28,29,31,32,33,34) 
GROUP BY  `Product_ID`, `Product_Name`) 
 ,
-- creats a table combinging with the cte, which puts the store name together, with the stock = 0. 
`cte_2` AS (
SELECT z.`Store_Name`, z.`Store_Location`, z.`Product_Name`, z.`Stock_On_Hand`, `cte`.`units_sold_in_Mexico`
FROM toy_sales.zero `z` 
INNER JOIN 
`cte` 
ON z.`Product_ID` = `cte`.`Product_ID` 
GROUP BY `Store_Name`, `Store_Location`, `Product_Name`, `Stock_On_Hand`, `units_sold_in_mexico` 
ORDER BY `Store_location` ASC, `Product_Name` ASC)

-- Counts all stores from each location that had lost sales and puts them in the same row 
 SELECT (SELECT COUNT(*) FROM `cte_2` WHERE `Store_Location` = 'Airport') AS `no_Airport`,
 (SELECT COUNT(`Store_location`)FROM `cte_2` WHERE `Store_Location` = 'Commercial') AS `no_Commercial`, 
(SElECT COUNT(`Store_Location`) FROM `cte_2` WHERE `Store_Location` = 'Downtown') AS `no_Downtown`, 
(SElECT COUNT(`Store_Location`) FROM `cte_2` WHERE `Store_Location` = 'Residential') AS `no_Residential` 





