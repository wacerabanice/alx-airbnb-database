-- Creating indexes for optimization

-- Index on email in the users table (frequently used for login and lookups)
CREATE INDEX idx_users_email ON users(email);

-- Index on user_id in bookings table (frequently used in WHERE, JOIN clauses)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on property_id in bookings table (used in joins and grouping)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on property_id in reviews table (used for joins and filtering)
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Index on host_id in properties table (to optimize filtering by host)
CREATE INDEX idx_properties_host_id ON properties(host_id);

-- Index on start_date in bookings table (used in range queries or availability checks)
CREATE INDEX idx_bookings_start_date ON bookings(start_date);


