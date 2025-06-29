BEGIN;
-- ========================
-- 1. USERS
-- ========================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('1a2v3b45b78m-1111-1a2v3b45b78m-1111-1a2v3b45b78m', 'Alice', 'Wambui', 'alice@example.com', 'hashed_pw_1', '0712345678', 'host'),
  ('2a2v3b45b78m-2222-2a2v3b45b78m-2222-2a2v3b45b78m', 'Brian', 'Otieno', 'brian@example.com', 'hashed_pw_2', '0723456789', 'guest'),
  ('3a2v3b45b78m-3333-3a2v3b45b78m-3333-3a2v3b45b78m', 'Cynthia', 'Kimani', 'cynthia@example.com', 'hashed_pw_3', '0734567890', 'guest'),
  ('4a2v3b45b78m-4444-4a2v3b45b78m-4444-4a2v3b45b78m', 'David', 'Mwangi', 'david@example.com', 'hashed_pw_4', '0745678901', 'host');

-- ========================
-- 2. PROPERTIES
-- ========================
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('aaaaaaa1-aaaa-aaaa-aaaa-9a2v3b45b78m', '6a2v3b45b78m-1111-1111-1111-6a2v3b45b78m', 'Nairobi Skyline Apartment', 'Modern apartment with city view', 'Nairobi, Kenya', 6000.00),
  ('aaaaaaa2-aaaa-aaaa-aaaa-8a2v3b45b78m', '7a2v3b45b78m-4444-4444-4444-7a2v3b45b78m', 'Mombasa Beach House', 'Cozy beach house with ocean breeze', 'Mombasa, Kenya', 9500.00);

-- ========================
-- 3. BOOKINGS
-- ========================
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('bbbbbbb1-bbbb-bbbb-bbbb-2r78jnb8095', 'aaaaaaa1-aaaa-aaaa-aaaa-2r78jnb8099', '2r76jnb8097-2222-2222-2222-2r78jnb8097', '2025-07-10', '2025-07-15', 30000.00, 'confirmed'),
  ('bbbbbbb2-bbbb-bbbb-bbbb-2r78jnb8090', 'aaaaaaa2-aaaa-aaaa-aaaa-2r78jnb8096', '2r77jnb8097-3333-3333-3333-3r78jnb8097', '2025-08-01', '2025-08-05', 38000.00, 'pending');

-- ========================
-- 4. PAYMENTS
-- ========================
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
  ('ppppppp1-pppp-pppp-pppp-2r78jnb809d7', '2r78jnby8097-bbbb-bbbb-bbbb-2r78jynb8097', 30000.00, 'credit_card');
  ('ppppppp1-pppp-pppp-pppp-2r78jnb809es7', '2r78jnbe8097-bbbb-bbbb-bbbb-2r78jtnb8097', 30000.00, 'paypal');

-- ========================
-- 5. REVIEWS
-- ========================
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
  ('rrrrrrr1-rrrr-rrrr-rrrr-2r78jnb80947', 'aaaaaaa1-aaaa-aaaa-aaaa-2r78jnb86097', '82r78jnb8097-2222-2222-2222-23r78jnb8097', 5, 'Amazing stay! The view was breathtaking and the host was great.'),
  ('rrrrrrr2-rrrr-rrrr-rrrr-2r78jnb80957', 'aaaaaaa2-aaaa-aaaa-aaaa-2r78jnb87097', '29r78jnb8097-3333-3333-3333-29r78jnb8097', 4, 'Lovely beach house, but WiFi was a bit slow.');

-- ========================
-- 6. MESSAGES
-- ========================
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
  ('2r78jnb8097-2r78j-2r78jnb-2r78jn097-2r78jnb8097', '2r78jnb38097-2222-2222-2222-2r78j5nb8097', '02r78jnb8097-1111-1111-1111-2r78jnb8e097', 'Hi Alice, is the Nairobi apartment available for next week?'),
  ('2r78jnb8097-2r78jn-2r8jnt-2r78b8097-2r78jnb8097', '2r78jnb48097-1111-1111-1111-2r78j4nb8097', '12r78jnb8097-2222-2222-2222-2r78djnb8097', 'Yes, it is available. Looking forward to hosting you!');
