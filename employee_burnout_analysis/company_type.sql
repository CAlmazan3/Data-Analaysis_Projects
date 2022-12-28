SELECT `Company Type`, AVG(`Burn Rate`) as `avg br` 
FROM employee_burnout.table  
GROUP BY `Company Type` 
ORDER BY `Company Type`  
LIMIT 2
