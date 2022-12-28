SELECT `WFH Setup Available`, COUNT(`WFH Setup Available`)  as `count` 
FROM employee_burnout.table 
WHERE `Burn Rate` >= .65 
GROUP BY `WFH Setup Available` 
ORDER BY `count` DESC; 
 