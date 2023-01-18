CREATE VIEW toy_sales.`join_one` AS 

-- joins tables products, stores, and sales and put them together as one whole table 

WITH cte AS ( 
SELECT pr.`Product_Name`, pr.`Product_Category`, pr.`Product_Cost`, pr.`Product_Price`, SUM(sa.`Units`) AS total_units,
 st.`Store_Name`, st.`Store_Location`
FROM toy_sales.sales AS sa 
INNER JOIN 
toy_sales.products AS pr 
ON sa.`Product_ID` = pr. `Product_ID` 
INNER JOIN 
toy_sales.stores AS st 
ON sa.`Store_ID` = st.`Store_ID`
GROUP BY pr.`Product_Name`, pr.`Product_Category`, pr.`Product_Cost`, pr.`Product_Price`, st.`Store_Name`, st.`Store_Location`
ORDER BY `Product_Name` ASC 
) 

SELECT *, ROUND((total_units * `Product_Price`) - (total_units * `Product_Cost`), 2) AS `profit` 
FROM cte; -- generates table with profit  




