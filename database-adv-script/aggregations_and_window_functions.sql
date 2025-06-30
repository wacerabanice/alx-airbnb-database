-- 1. Aggregation Query:
-- Find the total number of bookings made by each user
SELECT 
    user_id,
    COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;

-- 2. Window Function Query using ROW_NUMBER:
-- Rank properties based on the total number of bookings using ROW_NUMBER
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_number_rank
FROM bookings
GROUP BY property_id;

-- 3. Window Function Query using RANK:
-- Rank properties based on the total number of bookings using RANK
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_position
FROM bookings
GROUP BY property_id;
