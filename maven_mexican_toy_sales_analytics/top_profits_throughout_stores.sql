-- shows whether it's the same when store location is a factor 
SELECT  `Store_Location`, `Product_Category`, `profit`
 FROM toy_sales.join_one
 GROUP BY `Store_Location`, `Product_Category`, `profit` 
 ORDER BY `Store_location` ,`profit` DESC; 

