WITH UserRankings AS (
    SELECT 
        user_id,
        user_name,
        ROW_NUMBER() OVER (ORDER BY user_score DESC) AS user_rank
    FROM 
        users
)
SELECT 
    user_id,
    user_name
FROM 
    UserRankings
WHERE 
    user_rank <= 10;    GROUP BY
        campaign_id
),
ConversionRates AS (
    SELECT
        campaign_id,
        total_clicks,
        total_conversions,
        CASE 
            WHEN total_clicks > 0 THEN (total_conversions::DECIMAL / total_clicks) * 100
            ELSE 0
        END AS conversion_rate
    FROM
        CampaignData
)
SELECT
    campaign_id,
    conversion_rate
FROM
    ConversionRates;