CREATE VIEW `work_from_home_affect` AS
    SELECT 
        `WFH Setup Available`,
        `Designation`,
        `Resource allocation`,
        AVG(`Mental Fatigue Score`) AS `avg mf`,
        AVG(`Burn Rate`) AS `avg br`
    FROM
        employee_burnout.table
    GROUP BY `WFH Setup Available` , `Designation` , `Resource allocation`
    ORDER BY AVG(`Burn Rate`) DESC


