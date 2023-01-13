 CREATE VIEW toy_sales.`zero` AS 
-- takes store, the product, and the amount of units in the inventory 
SELECT st.`Store_ID`, st.`Store_Name`,st.`Store_Location`, pr.`Product_ID`, pr.`Product_Name`, i.`Stock_On_Hand` 
FROM toy_sales.`inventory` AS `i` 
INNER JOIN 
toy_sales.`stores` AS `st`
ON i.`Store_ID` = st.`Store_ID` 
INNER JOIN 
toy_sales.`products` AS `pr` 
ON i.`Product_ID` = pr.`Product_ID` 
INNER JOIN 
toy_sales.`sales` AS `sa` 
ON i.`Store_ID` = sa.`Store_ID` 
WHERE `Stock_ON_Hand` = 0 
GROUP BY `Store_ID`,`Store_Name`, `Store_Location`, `Product_ID`, `Product_Name`, `Stock_On_Hand` 
ORDER BY `Store_ID` ASC, `Product_ID` ASC; 



