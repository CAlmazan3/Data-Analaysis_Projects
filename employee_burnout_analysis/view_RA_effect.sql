CREATE VIEW `RA_effect` AS
SELECT `Designation`,CAST(`Resource Allocation`AS FLOAT)`RA`,`Mental Fatigue Score`, `Burn Rate`,
CASE 
WHEN `Designation` <= 3 AND `Resource Allocation` >= 7 THEN "HIGH FOR D RANK" 
WHEN `Designation` >= 4 AND `Resource Allocation` >= 8 THEN "HIGH FOR D RANK" 
ELSE "its fine or look it over"
 
END AS `verdict`
FROM employee_burnout.table  


