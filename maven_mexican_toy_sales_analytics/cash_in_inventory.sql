CREATE VIEW toy_sales.`cash_in_inventory` AS 
-- Joins tables `stores, inventory, products. 
-- Also, only collects toy stores 
WITH `cte` AS ( 
SELECT st.`Store_Name`,pr.`Product_Name`, pr.`Product_Cost`, i.`Stock_On_Hand` 
FROM toy_sales.stores `st` 
INNER JOIN 
toy_sales.inventory `i` 
ON st.`Store_ID` = i.`Store_ID` 
INNER JOIN 
toy_sales.products `pr` 
ON i.`Product_ID` = pr.`Product_ID` 
WHERE `Store_Name` LIKE '%toys%' 
GROUP BY `Store_Name`, `Product_Name`,`Product_Cost`, `Stock_On_Hand`
ORDER BY `Store_Name` ASC, `Product_Name` ASC),

-- calculates product_cost and the stock_on_hand to find each store's invntory value of a product
 `cte_2` AS 
 (SELECT  `Store_Name`,`Product_Name`,`Product_Cost`, `Stock_On_Hand`, 
ROUND((`Product_Cost`) * (`Stock_On_Hand`),2) AS `Inventory_value` 
FROM `cte`)

-- calculates the total amount of money tied up in inventory at the toy stores in row 
SELECT ROUND(SUM(`inventory_value`),2) as `total_inventory` 
 FROM `cte_2` 
LIMIT 1 

