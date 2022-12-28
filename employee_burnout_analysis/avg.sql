SELECT `Gender`, `Company Type`, `WFH Setup Available`, AVG(`Designation`) AS `avg_designation`, AVG(`Resource Allocation`) AS `avg ra`, AVG(`Mental fatigue Score`) AS `avg mf`, AVG(`Burn Rate`) as `avg br` 
FROM employee_burnout.table
GROUP BY `Gender`, `Company Type`, `WFH Setup Available`
ORDER BY `Gender`, `Company Type`, `WFH Setup Available` 

