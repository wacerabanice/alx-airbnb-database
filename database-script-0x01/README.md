# 🏡 Airbnb Clone – SQL Schema

- schema.sql – Full SQL script to create all necessary tables, constraints, and indexes


## 🧱 Schema Overview

### ✅ Entities:

| Entity     | Description                                 |
|------------|---------------------------------------------|
| `users`    | Stores user information (guests, hosts, admins) |
| `properties` | Listings created by hosts                  |
| `bookings` | Records of user bookings                    |
| `payments` | Payment info tied to bookings               |
| `reviews`  | Reviews left by users on properties         |
| `messages` | User-to-user messaging system               |

-----

## 🧠 Database Design Highlights

- **UUID Primary Keys** for global uniqueness
- **Foreign Key Constraints** to maintain data integrity
- **Indexes** on key lookup fields (e.g., email, property_id)
- **Role-Based User Model** (`guest`, `host`, `admin`)
- **ENUM & CHECK Constraints** for status and role validation
- **3NF Compliance** – Minimal redundancy and clean structure

## Adds Performance-Optimizing Indexes
Indexes are created on:
- users.email → Fast login lookup
- property_id in properties, bookings, reviews
- booking_id in payments
- sender_id, recipient_id in messages
  
------

## 🛠 Technologies Used

- **SQL** – PostgreSQL-flavored syntax
- **UUID** – Enabled via `uuid-ossp` extension in PostgreSQL


