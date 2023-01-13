-- Remove ($) signs from the data, since SQL won't be able to calculate. 
UPDATE toy_sales.products 
SET `Product_Cost` = REPLACE(`Product_Cost`, '$',''),
 `Product_Price` = REPLACE(`Product_Price`, '$',''); 
