USE adashi_staging;


WITH multiple_products AS (SELECT s.owner_id, CONCAT(u.first_name, " ", u.last_name) customer_name, COUNT(CASE WHEN is_regular_savings = 1 THEN 1 END) savings_count, COUNT(CASE WHEN is_a_fund = 1 THEN 1 END) investment_count,
ROUND((SUM(p.amount)/100), 2) total_deposits 
FROM users_customuser u 
JOIN savings_savingsaccount s 
ON s.owner_id = u.id
JOIN plans_plan p 
ON p.id = s.plan_id 
GROUP BY s.owner_id, customer_name
ORDER BY total_deposits DESC)

SELECT * FROM multiple_products
WHERE savings_count >= 1 AND investment_count >= 1;




