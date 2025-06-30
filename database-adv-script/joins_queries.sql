
-- 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT 
    bookings.booking_id,
    bookings.start_date,
    bookings.end_date,
    bookings.total_price,
    users.user_id,
    users.first_name,
    users.last_name,
    users.email
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id;


-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    properties.property_id,
    properties.name AS property_name,
    properties.location,
    reviews.review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id;
ORDER BY properties.property_id;


-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
-- Note: If your DB does not support FULL OUTER JOIN, use the UNION version instead (common for MySQL)

-- For PostgreSQL / SQL Server:
-- SELECT 
--     users.user_id,
--     users.first_name,
--     users.email,
--     bookings.booking_id,
--     bookings.start_date,
--     bookings.total_price
-- FROM users
-- FULL OUTER JOIN bookings ON users.user_id = bookings.user_id;

-- Alternative for MySQL:
SELECT 
    u.user_id,
    u.first_name,
    u.email,
    b.booking_id,
    b.start_date,
    b.total_price
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id,
    u.first_name,
    u.email,
    b.booking_id,
    b.start_date,
    b.total_price
FROM users u
RIGHT JOIN bookings b ON u.user_id = b.user_id;
