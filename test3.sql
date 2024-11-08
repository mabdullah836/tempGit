WITH UserRankings AS (
    SELECT 
        user_id, 
        user_name, 
        ROW_NUMBER() OVER (ORDER BY user_score DESC) AS rank
    FROM 
        users
)
SELECT 
    user_id, 
    user_name
FROM 
    UserRankings
WHERE 
    rank <= 5;