WITH TopUsers AS (
    SELECT 
        user_id, 
        user_name, 
        user_score
    FROM 
        users
    ORDER BY 
        user_score DESC
    LIMIT 5
)
SELECT * FROM TopUsers;