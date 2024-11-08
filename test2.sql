WITH UserRanks AS (
    SELECT 
        user_id, 
        user_name, 
        RANK() OVER (ORDER BY user_score DESC) as user_rank
    FROM 
        users
)
SELECT 
    user_id, 
    user_name
FROM 
    UserRanks
WHERE 
    user_rank <= 5;