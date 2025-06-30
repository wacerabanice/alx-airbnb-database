# SQL Join Queries – Airbnb Database

This file contains SQL join queries that demonstrate the use of different types of joins in a relational Airbnb-like database system.

## 📄 File: `join_queries.sql`

### ✅ Queries Included

1. **INNER JOIN**  
   Retrieves all bookings along with the users who made those bookings.
   - Tables involved: `bookings`, `users`

2. **LEFT JOIN**  
   Retrieves all properties and their reviews, including properties that do not have any reviews.
   - Tables involved: `properties`, `reviews`

3. **FULL OUTER JOIN**  
   Retrieves all users and all bookings, even if there is no link between them.  
   - Includes a fallback using `UNION` for databases like MySQL that do not support `FULL OUTER JOIN` directly.
   - Tables involved: `users`, `bookings`

### 💡 Usage

These queries can be executed in any SQL-compatible database environment.
