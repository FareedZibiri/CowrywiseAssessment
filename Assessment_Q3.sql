USE adashi_staging;   

SELECT
    acc_inactivity.plan_id,
    acc_inactivity.owner_id,
    acc_inactivity.type,
    acc_inactivity.last_transaction_date,
    DATEDIFF(CURDATE(), DATE(acc_inactivity.last_transaction_date)) AS inactivity_days
FROM (
SELECT s.plan_id, p.owner_id, plan_type_id type, MAX(s.transaction_date) last_transaction_date
FROM plans_plan p
JOIN savings_savingsaccount s
ON p.id = s.plan_id
GROUP BY 1,2,3) AS acc_inactivity
WHERE  DATEDIFF(CURDATE(), DATE(acc_inactivity.last_transaction_date)) > 365;
