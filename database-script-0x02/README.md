# 📊 Airbnb Clone – Sample Data Insertion

This SQL file contains **sample data inserts** for the Airbnb Clone project. 
It populates the database with realistic records for users, properties, bookings, payments, reviews, and messages — helping developers and testers quickly simulate real-world scenarios.

---

## 📁 File: seed.sql:

### ✅ What It Does
- Inserts **4 users** (2 hosts, 2 guests) with unique phone numbers
- Adds **2 properties** listed by the hosts
- Includes **2 bookings** made by guests
- Simulates 2 **payment** for a confirmed booking
- Adds **2 user reviews** with ratings and comments
- Simulates **2 message exchanges** between a guest and a host

---

## 🔍 Sample Data Overview

| Table       | Records | Notes                                     |
|-------------|---------|-------------------------------------------|
| `users`     | 4       | Guest/host roles, unique Kenyan numbers   |
| `properties`| 2       | Apartments in Nairobi and Mombasa         |
| `bookings`  | 2       | Includes confirmed and pending statuses   |
| `payments`  | 1       | Linked to confirmed booking               |
| `reviews`   | 2       | Ratings between 4 and 5                   |
| `messages`  | 2       | Guest-host conversation example           |



