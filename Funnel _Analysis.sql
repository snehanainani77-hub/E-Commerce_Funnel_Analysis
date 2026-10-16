CREATE DATABASE ecommerce_funnel;
USE ecommerce_funnel;

-- 1. Create raw table
CREATE TABLE funnel_events (
    User_ID VARCHAR(30) ,
    Session_ID VARCHAR(50),
    Event VARCHAR(30),
    Timestamp DATETIME,
    Device VARCHAR(20),
    Region VARCHAR(20),
    Channel VARCHAR(30),
    Product_Category VARCHAR(30),
    Revenue DECIMAL(10,2),
    Bounce_Flag VARCHAR(10)
);

-- 2. Preview imported raw data
select count(*) as total_rows
from funnel_events;

-- 3. Checking Missing Values 
SELECT
    SUM(User_ID IS NULL) AS missing_user_ids,
    SUM(Session_ID IS NULL) AS missing_session_ids,
    SUM(Event IS NULL) AS missing_events,
    SUM(Timestamp IS NULL) AS missing_timestamps,
    SUM(Device IS NULL) AS missing_devices,
    SUM(Region IS NULL) AS missing_regions,
    SUM(Channel IS NULL) AS missing_channels,
    SUM(Product_Category IS NULL) AS missing_categories,
    SUM(Revenue IS NULL) AS missing_revenue,
    SUM(Bounce_flag IS NULL) AS missing_bounce_flag
FROM funnel_events;

-- 4. Check duplicate records
SELECT
    User_ID,
    Session_ID,
    Event,
    Timestamp,
    COUNT(*) AS duplicate_count
FROM funnel_events
GROUP BY
    User_ID,
    Session_ID,
    Event,
    Timestamp
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

-- 5. Inspecting event labels and counts
SELECT
    Event,
    COUNT(*) AS event_count
FROM funnel_events
GROUP BY Event
ORDER BY event_count DESC;

-- 6. Checking revenue validity
SELECT
    Event,
    COUNT(*) AS total_rows,
    SUM(Revenue IS NULL) AS null_revenue,
    SUM(Revenue < 0) AS negative_revenue,
    SUM(Revenue = 0) AS zero_revenue
FROM funnel_events
GROUP BY Event;

-- 7. Validating Event Labels 
SELECT
    Event,
    COUNT(*) AS event_count
FROM funnel_events
GROUP BY Event
ORDER BY Event;

-- 8. Validating Bounce_Flag
SELECT
    Bounce_Flag,
    COUNT(*) AS row_count
FROM funnel_events
GROUP BY Bounce_Flag;

-- 9. Checking Session Consistancy
SELECT
    Session_ID,
    COUNT(DISTINCT User_ID) AS user_count,
    COUNT(DISTINCT Device) AS device_count,
    COUNT(DISTINCT Region) AS region_count,
    COUNT(DISTINCT Channel) AS channel_count,
    COUNT(DISTINCT Product_Category) AS category_count
FROM funnel_events
GROUP BY Session_ID
HAVING
    COUNT(DISTINCT User_ID) > 1
    OR COUNT(DISTINCT Device) > 1
    OR COUNT(DISTINCT Region) > 1
    OR COUNT(DISTINCT Channel) > 1
    OR COUNT(DISTINCT Product_Category) > 1;
    
-- 10. Identifying Inconsistent Colunms 
SELECT
    SUM(user_count > 1) AS sessions_with_multiple_users,
    SUM(device_count > 1) AS sessions_with_multiple_devices,
    SUM(region_count > 1) AS sessions_with_multiple_regions,
    SUM(channel_count > 1) AS sessions_with_multiple_channels,
    SUM(category_count > 1) AS sessions_with_multiple_categories
FROM (
    SELECT
        Session_ID,
        COUNT(DISTINCT User_ID) AS user_count,
        COUNT(DISTINCT Device) AS device_count,
        COUNT(DISTINCT Region) AS region_count,
        COUNT(DISTINCT Channel) AS channel_count,
        COUNT(DISTINCT Product_Category) AS category_count
    FROM funnel_events
    GROUP BY Session_ID
) AS session_check;

-- 11. Calculating the overall funnel
SELECT
    Event,
    COUNT(DISTINCT Session_ID) AS sessions
FROM funnel_events
GROUP BY Event
ORDER BY FIELD(
    Event,
    'Browse',
    'Add to Cart',
    'Checkout',
    'Purchase'
);

-- 12. Calculating the Conversion Rates
-- Browse to Add to Cart
SELECT ROUND((7048.0 / 10000) * 100, 2)
AS browse_to_cart_pct;
-- Add to Cart to Checkout
SELECT ROUND((3576.0 / 7048) * 100, 2)
AS cart_to_checkout_pct;
-- Checkout to Purchase
SELECT ROUND((1115.0 / 3576) * 100, 2)
AS checkout_to_purchase_pct;

-- 13. Finding Which Channel Performs The Best
SELECT
    Channel,
    Event,
    COUNT(DISTINCT Session_ID) AS sessions
FROM funnel_events
GROUP BY Channel, Event
ORDER BY Channel, Event;

-- 14. Calculating The Purchase Conversion Rate By Channel
SELECT Channel,
    ROUND(
        COUNT(DISTINCT CASE WHEN Event = 'Purchase' 
        THEN Session_ID END) * 100.0 /
        COUNT(DISTINCT CASE WHEN Event = 'Browse' 
        THEN Session_ID END), 2) AS purchase_conversion_pct
FROM funnel_events
GROUP BY Channel
ORDER BY purchase_conversion_pct DESC;

-- 15. Revenue By Marketing Channel
SELECT Channel,
    SUM(Revenue) AS total_revenue
FROM funnel_events
WHERE Event = 'Purchase'
GROUP BY Channel
ORDER BY total_revenue DESC;

-- 16. Analyzing the Funnel Performance by Device 
SELECT Device, Event,
    COUNT(DISTINCT Session_ID) AS sessions
FROM funnel_events
GROUP BY Device, Event
ORDER BY Device, Event;

-- 17. Calculating Purchase Conversion By Device
SELECT Device,
    ROUND(COUNT(DISTINCT CASE WHEN Event = 'Purchase'
        THEN Session_ID END) * 100.0 /
        COUNT(DISTINCT CASE WHEN Event = 'Browse'
        THEN Session_ID END), 2
    ) AS conversion_rate
FROM funnel_events
GROUP BY Device;

-- 18. Region Wise Analysis
SELECT Region,Event,
    COUNT(DISTINCT Session_ID) AS sessions
FROM funnel_events
GROUP BY Region, Event
ORDER BY Region, Event;

-- 19. Calculating Purchase Conversion By Region
SELECT Region,
    ROUND(COUNT(DISTINCT CASE WHEN Event = 'Purchase'
        THEN Session_ID END) * 100.0 /
        COUNT(DISTINCT CASE WHEN Event = 'Browse'
        THEN Session_ID END), 2) AS conversion_rate
FROM funnel_events
GROUP BY Region
ORDER BY conversion_rate DESC;

-- 20. Analyzing Bounce Flag
SELECT Bounce_Flag,
    COUNT(DISTINCT Session_ID) AS sessions
FROM funnel_events
GROUP BY Bounce_Flag;

-- 21. Checking Bounce Flags Against Purchase Events
SELECT Bounce_Flag, Event,
    COUNT(DISTINCT Session_ID) AS sessions
FROM funnel_events
GROUP BY Bounce_Flag, Event
ORDER BY Bounce_Flag, Event;

SELECT
    SUM(Revenue) AS Total_Revenue
FROM funnel_events
WHERE Event = 'Purchase';
