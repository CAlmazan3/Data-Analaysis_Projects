WITH `cte` AS ( 
SELECT st.`Store_Name`,st.`store_city`,pr.`Product_Name`, pr.`Product_Cost`, i.`Stock_On_Hand` 
FROM toy_sales.stores `st` 
INNER JOIN 
toy_sales.inventory `i` 
ON st.`Store_ID` = i.`Store_ID` 
INNER JOIN 
toy_sales.products `pr` 
ON i.`Product_ID` = pr.`Product_ID` 
WHERE `Store_Name` LIKE '%toys%' 
GROUP BY `Store_Name`,`store_city`, `Product_Name`,`Product_Cost`, `Stock_On_Hand`
ORDER BY `Store_Name` ASC, `Product_Name` ASC)

-- calculates product_cost and the stock_on_hand to find each store's invntory value of a product
, `cte_2` AS ( 
 SELECT  `Store_Name`,`store_city`,`Product_Name`,`Product_Cost`, `Stock_On_Hand`, 
ROUND((`Product_Cost`) * (`Stock_On_Hand`),2) AS `Inventory_value` 
FROM `cte`), 
-- formula days in inventory = (avg inventory/ cost of goods sold) * period length 
-- since theres no data on the average of how much a 
`cte_3` AS (  SELECT `Store_Name`,`store_city`,ROUND(((`Stock_On_Hand`/`Inventory_value`) * 365),2)AS `days_in_inventory` 
FROM `cte_2` 
GROUP BY `Store_Name`, `Store_city`, `days_in_inventory`)   

SELECT AVG(`days_in_inventory`) AS `avg_days_in_inventory` 
FROM `cte_3`; 
