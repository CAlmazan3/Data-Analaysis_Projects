-- Gets the top ten categories 
SELECT 
    `Product_Category` , `profit`
FROM
    toy_sales.join_one
GROUP BY  `Product_Category`, `profit` 
ORDER BY `profit` DESC 
LIMIT 10 




 
