 WITH `wfh case` AS(
SELECT *,
CASE 
WHEN `WFH Setup Available` = 'Yes' AND `Burn Rate` >= .65 THEN 'WFH with HIGH burn rate' 
WHEN `WFH Setup Available` = 'Yes' AND `Burn Rate` < .65 THEN 'WFH with LOW burn rate' 
ELSE 'no wfh setup available' 
END AS `WFH br` 
FROM employee_burnout.table 
)

SELECT `WFH br`, COUNT(`WFH br`) AS `count` 
FROM `wfh case`  
GROUP BY `WFH br` 
ORDER BY `WFH br` DESC, `count` DESC 
LIMIT 2

