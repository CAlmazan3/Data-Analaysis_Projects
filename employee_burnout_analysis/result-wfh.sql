SELECT `WFH Setup Available`, AVG(`Burn Rate`) AS `avg br` FROM employee_burnout.table 
GROUP BY `WFH Setup Available` 
LIMIT 2