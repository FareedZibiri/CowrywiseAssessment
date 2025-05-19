USE adashi_staging;

SELECT 
    clv.id, 
    clv.name, 
    clv.total_transactions,
    TIMESTAMPDIFF(MONTH, clv.date_joined, NOW()) AS tenure_months, -- number of months between date_joined and current time (both in timestamp format)
    ROUND((clv.total_transactions / TIMESTAMPDIFF(MONTH, clv.date_joined, NOW())) * 12 * (0.001 * clv.total_transaction_value), 2) AS estimated_clv
FROM (
    SELECT 
        u.id, 
        CONCAT(u.first_name, " ", u.last_name) AS name, 
        COUNT(s.transaction_reference) AS total_transactions, 
        SUM(s.amount) AS total_transaction_value, 
        u.date_joined
    FROM users_customuser u
    JOIN savings_savingsaccount s ON s.owner_id = u.id
    GROUP BY u.id, u.first_name, u.last_name, u.date_joined
) AS clv;
